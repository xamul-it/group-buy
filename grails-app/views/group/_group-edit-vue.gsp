<g:render template="/includes/js-leaflet-js"/>
<g:render template="/includes/js-vue-select-js"/>

<!-- Vue Pages and Components here -->

<!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
<script type="module">

    import * as groupService from '/assets/vue/v-services/group-rest.js';
    import * as categoriesService from '/assets/vue/v-services/common/read-only-resource-rest.js';
	categoriesService.setResourceEndpoint("groupCategories");
	categoriesService.set404Message("Nessuna categoria trovata");

    import * as locationService from '/assets/vue/v-services/location.js';
    import * as toastService from '/assets/vue/v-services/toast.js';
    
    import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
    import { store } from '/assets/vue/v-store/group-store.js';

    //vue-select
    //Set the components prop default to return our fresh components 
    VueSelect.VueSelect.props.components.default = () => ({
        Deselect: null,
    });
    Vue.component('v-select', VueSelect.VueSelect);

    //require vuelidate
    //require Moment.js
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
            saveButtonKey: 1,
            groupId: ${groupId},
            locationLoading: false,
            locationFetching: false,
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
            showMap: false,
            socialYouTubeUrlPrefix: 'channel',
            socialLinkedInUrlPrefix: 'in'
        },
        validations: {
            groupItem: {
                name: {
                    required,
                    minLength: minLength(2),
                },
                description:  {
                    required,
                    minLength: minLength(5),
                },
                deliveryAddress:{
                    address1: {
                        required,
                        minLength: minLength(2),
                    },
                    address2: {
                        minLength: minLength(2),
                    },
                    city: {
                        required,
                        minLength: minLength(5),
                    },
                    postalCode: {
                        required,
                        minLength: minLength(5),
                        maxLength: maxLength(5),
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
                },
                facebook: {
                        minLength: minLength(5),
                },
                twitter: {
                        minLength: minLength(5),
                },
                youtube: {
                        minLength: minLength(5),
                },
                linkedin: {
                        minLength: minLength(5),
                },
                instagram: {
                        minLength: minLength(5),
                },
                whatsapp: {
                        minLength: minLength(5),
                },
                skype: {
                        minLength: minLength(5),
                },
                slack: {
                        minLength: minLength(5),
                },
                snapchat: {
                        minLength: minLength(5),
                },
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
            youtube: {
                get: function() {
                    if(this.groupItem.youtube)
                        return this.groupItem.youtube.substring(this.groupItem.youtube.lastIndexOf('/') + 1)
                    else
                        return ''
                },
                set: function(newValue) {
                    this.groupItem.youtube = this.socialYouTubeUrlPrefix +'/' + newValue
                }
            },
            linkedin: {
                get: function() {
                    if(this.groupItem.linkedin)
                        return this.groupItem.linkedin.substring(this.groupItem.linkedin.lastIndexOf('/') + 1)
                    else
                        return ''
                },
                set: function(newValue) {
                    this.groupItem.linkedin = this.socialLinkedInUrlPrefix +'/' + newValue
                }
            },
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
        //https://stackoverflow.com/a/53513789
        async mounted() {
            this.debug = ${isDebug};
            //will execute at pageload
            if(this.groupId>0) {
                await this.fetchGroup();
                this.socialUrlPrefixes();
            } else {
                this.createEmptyGroup();
            }
            this.fetchGroupCategoriesAction({service: categoriesService});
            this.$watch('groupItem', (groupItem) => {
                //console.log("watch groupItem", groupItem, this.groupItem)
                if(this.groupItem.id > 0)
                    location.href = "/gruppo/"+this.groupItem.id
            });
        },
        watch: {
            socialYouTubeUrlPrefix: function(prefix) {
                if(this.youtube) {
                    this.youtube = this.youtube
                }
            },
            socialLinkedInUrlPrefix: function(prefix) {
                if(this.linkedin) {
                    this.linkedin = this.linkedin
                }
            },
            currentAddress: function(currentAddress) {
                this.groupItem.deliveryAddress.address1 = currentAddress.road +' '+ (currentAddress.house_number? currentAddress.house_number : '');
                this.groupItem.deliveryAddress.city = currentAddress.village ? currentAddress.village : currentAddress.city;
                this.groupItem.deliveryAddress.postalCode = currentAddress.postcode;
                this.groupItem.deliveryAddress.district = currentAddress.county;
                this.groupItem.deliveryAddress.countryCode = currentAddress.country_code;

                this.groupItem.deliveryAddress.lat = currentAddress.latitude;
                this.groupItem.deliveryAddress.lon = currentAddress.longitude;

                this.updateNow()
            },
            error: function (error) {
                toastService.alertDanger(this.fetchError(error))
                this.saveButtonKey+=1 //https://stackoverflow.com/questions/56041297/re-enable-button-click-once-after-clicking
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
            updateNow: function() {
                //Change detection caveat in create
                //https://vuejs.org/v2/guide/reactivity.html#Change-Detection-Caveats
                if(this.groupId == 0) {
                    //https://vuejs.org/v2/api/#vm-forceUpdate
                    this.$forceUpdate()
                }
            },
            socialUrlPrefixes() {
                if(this.groupItem.linkedin)
                    this.socialLinkedInUrlPrefix = this.groupItem.linkedin.substring(0, this.groupItem.linkedin.lastIndexOf('/'))
                if(this.groupItem.youtube)
                    this.socialYouTubeUrlPrefix = this.groupItem.youtube.substring(0, this.groupItem.youtube.lastIndexOf('/'))
            },
            async fetchGroup() {
                await this.fetchGroupAction({service: groupService, groupId: this.groupId});
            },
            createEmptyGroup() {
                this.groupItem = {
                    id: 0,
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
                    linkedin: '',
                    youtube: '',
                    publicGroup: false,
                }
            },
            async fetchAddress() {
                try{
                    this.locationLoading = true
                    await this.fetchAddressAction({service: locationService})
                    this.showMap = true
                } catch (error) {
                    console.log(error);
                } finally {
                    this.locationLoading = false
                }
            },
            async fetchCoordinates() {
                try{
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
                    this.showMap = true
                } catch (error) {
                    console.log(error);
                } finally {
                    this.locationFetching = false
                }

            },
            async saveGroup() {
                if(!this.groupItem.deliveryAddress.lat && !this.groupItem.deliveryAddress.lon)
                    this.fetchCoordinates()
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
                    } else {
                        return error
                    }

                } else {
                    errorMessage = error
                }
                return errorMessage
            }
        },
    })        
</script>