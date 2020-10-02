<link rel="stylesheet" href="/assets/vue/v-jslib/leaflet@1.7.1/leaflet.css" />

<!--
<script type="module" src="/assets/vue/v-jslib/leaflet@1.7.1/leaflet-src.esm.js"></script>
<script type="module" src="/assets/vue/v-jslib/vue2-leaflet@2.5.2/vue2-leaflet.min.js"></script>
-->

<script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>

<!-- Vue Pages and Components here -->
<script type="module" src="/assets/vue/v-services/group-rest.js"></script>
<script type="module" src="/assets/vue/v-services/categories-rest.js"></script>
<script type="module" src="/assets/vue/v-services/location.js"></script>

<!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
<script type="module">
    import * as groupService from '/assets/vue/v-services/group-rest.js';
    import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
    import * as locationService from '/assets/vue/v-services/location.js';
    import * as toastService from '/assets/vue/v-services/toast.js';
    
    import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
    import { store } from '/assets/vue/v-store/group-store.js';
    //import { VueSelect.VueSelect } from '/assets/vue/v-jslib/vue-select@3.10.8/vue-select.js';

    //vue-select
    // Set the components prop default to return our fresh components 
    VueSelect.VueSelect.props.components.default = () => ({
        Deselect: null,
        OpenIndicator: {
            render: createElement => createElement(
                                        'span', 
                                        {
                                            class: {'select2-selection__arrow': true}
                                        },
                                        [
                                            createElement('b', {
                                                attrs: {
                                                    role: 'presentation',
                                                }
                                            })
                                        ],
                                        ),
        },
    });
    Vue.component('v-select', VueSelect.VueSelect);

    //vuelidate
    Vue.use(window.vuelidate.default);
    const { required, minLength, minValue } = window.validators;
    //Moment.js
    moment.locale('it');

    var app = new Vue({
        el: '#v-group-edit-app',
        name: 'GroupEdit',
        components: {
            'v-modal': VModal,
            //Leaflet
            'l-map': window.Vue2Leaflet.LMap,
            'l-tile-layer': window.Vue2Leaflet.LTileLayer,
            'l-marker': window.Vue2Leaflet.LMarker,
            'l-tooltip': window.Vue2Leaflet.LTooltip,
        },
        store,
        data: {
            groupId: ${groupId},
            locationLoading: false,
            locationFetching: false,
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
            showMap: false,
        },
        validations: {
            groupItem: {
                name: {
                    required,
                    minLength: minLength(3),
                },
                description:  {
                    required,
                },
                deliveryAddress:{
                    address1: {
                        required,
                    },
                    city: {
                        required,
                        minLength: minLength(2),
                    },
                    postalCode: {
                        required,
                        minLength: minLength(3),
                    },
                    district: {
                        required,
                        minLength: minLength(2),
                    },
                },
                category: {
                    id: {
                        required,
                        minValue: minValue(1),
                    }
                }
            },
        },
        computed: {
            //all needed data fields from vuex store
            //mapped with vuex-map-fields
            ...mapFields([
                'group.groupItem',
                'group.groupCategories',
                'loading',
                'error',
                'success',
                'debug',
                'geolocationSupported',
            ]),
            ...mapFields({
                currentAddress: 'search.searchAddress',
            }),
            center: function () { 
                return L.latLng(this.groupItem.deliveryAddress.lat, this.groupItem.deliveryAddress.lon)
            },
            markerLatLng: function() {
                return this.center
            },
            isDebug: function () {
                return this.debug
            },
        },
        mounted() {
            this.debug = ${isDebug};
            //will execute at pageload
            if(this.groupId>0)
                this.fetchGroup();
            else
                this.createEmptyGroup();
            this.fetchGroupCategoriesAction({service: categoriesService});
        },
        watch: {
            currentAddress: function(currentAddress) {
                this.groupItem.deliveryAddress.address1 = currentAddress.road +' '+ (currentAddress.house_number? currentAddress.house_number : '');
                this.groupItem.deliveryAddress.city = currentAddress.village ? currentAddress.village : currentAddress.city;
                this.groupItem.deliveryAddress.postalCode = currentAddress.postcode;
                this.groupItem.deliveryAddress.district = currentAddress.county;
                this.groupItem.deliveryAddress.countryCode = currentAddress.country_code;

                this.groupItem.deliveryAddress.lat = currentAddress.latitude;
                this.groupItem.deliveryAddress.lon = currentAddress.longitude;

                //Change detection caveat in create
                //https://vuejs.org/v2/guide/reactivity.html#Change-Detection-Caveats
                if(this.groupId == 0) {
                    //https://vuejs.org/v2/api/#vm-forceUpdate
                    this.$forceUpdate()
                }
            },
            error: function (error) {
                toastService.alertDanger(this.fetchError(error))
            },
            success: function (message) {
                toastService.alertSuccess(message)
            }
        },
        methods: {
            ...Vuex.mapActions([
                'fetchGroupAction',
                'fetchGroupCategoriesAction',
                'fetchAddressAction',
                'saveGroupAction',
                'fetchGroupCoordinatesAction',
            ]),
            async fetchGroup() {
                this.fetchGroupAction({service: groupService, groupId: this.groupId});
            },
            createEmptyGroup() {
                this.groupItem = {
                    category: {
                        id: 0,
                        name: 'Scegli la categoria',
                    },
                    deliveryAddress: {
                        address1: null,
                        address2: null,
                        city: null,
                        postalCode: null,
                        district: null,
                        countryCode: null,
                        lat: null,
                        lon: null,
                    },
                    publicGroup: false
                }
            },
            async fetchAddress() {
                this.locationLoading = true
                await this.fetchAddressAction({service: locationService})
                this.locationLoading = false
            },
            async fetchCoordinates() {
                this.locationFetching = true
                let addressString = this.groupItem.deliveryAddress.address1
                if(this.groupItem.deliveryAddress.address2) 
                    addressString += ' '+this.groupItem.deliveryAddress.address2
                if(this.groupItem.deliveryAddress.city)
                    addressString += ', '+ this.groupItem.deliveryAddress.city
                if(this.groupItem.deliveryAddress.postalCode)
                    addressString += ' '+ this.groupItem.deliveryAddress.postalCode
                if(this.groupItem.deliveryAddress.district)
                    addressString += ', '+ this.groupItem.deliveryAddress.district
                if(this.groupItem.deliveryAddress.countryCode)
                    addressString += ', '+ this.groupItem.deliveryAddress.countryCode
                await this.fetchGroupCoordinatesAction({service: locationService, addressString: addressString})
                this.locationFetching = false
                this.showMap = true
            },
            async saveGroup() {
                this.saveGroupAction({service: groupService, groupId: this.groupId, groupItem: this.groupItem});
            },
            fetchError(error) {
                let errorData = null
                if(error.response) {
                    errorData = error.response.data
                }
                let errorMessage = ''
                if(errorData) {
                    console.log('errorData',errorData)
                    if(errorData.errors) {
                        errorMessage = _.reduce(errorData.errors, function(message, e) {
                            if(message != "")
                                return message +'<br/>\n'+ e.message;
                            else
                                return e.message;
                        }, '');
                    }

                } else {
                    errorMessage = error
                }
                return errorMessage
            }
        },
    })        
</script>