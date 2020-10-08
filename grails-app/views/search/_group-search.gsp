    <!--Sliders Section-->
    <section class="theme-header">
        <div class="bannerimg cover-image bg-background sptb-1" >

            <div class="header-text1 mb-0">
                <div class="container" id="v-group-search-app">

                    <div class="row">
                        <div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
                            <div class="search-background bg-transparent">

                                <div class="form row no-gutters ">

                                    <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" id="search-text" 
                                            placeholder="Nome gruppo o Keyword"
                                            v-model="searchQuery"
                                            @input="$v.searchQuery.$touch()">
                                            
                                            <pre v-if="isDebug">{{ $v.searchQuery }}</pre>

                                    </div>

                                    <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-md-0" id="address" 
                                            placeholder="Luogo"
                                            v-model="searchAddressString"
                                            @input="$v.searchAddressString.$touch()">
                                        <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione">
                                            <i v-if="!locationLoading" class="fa fa-map-marker location-gps mr-1"></i>
                                            <i v-if="locationLoading" class="fa fa-spinner fa-spin location-gps mr-1"></i>
                                        </span> 
                                        
                                        <pre v-if="isDebug">{{ $v.searchAddressString }}</pre>

                                    </div>

                                    <div class="form-group col-xl-2 col-lg-2 col-md-12 mb-0 bg-white">

                                        <v-select 
                                            :clearable="false"
                                            append-to-body
                                            placeholder="Categorie" 
                                            :options="groupCategories"
                                            :reduce="name => name.id"
                                            label="name"
                                            v-model="searchCategoryId">
                                                <template #open-indicator>
                                                    <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                                                </template>
                                        </v-select>

                                        <!-- select class="form-control select2-show-search  border-bottom-0" v-model="searchCategoryId">
                                            <optgroup label="Categorie">
                                                <option v-if="searchCategoryId<=0" :value="searchCategoryId" disabled selected hidden>Categorie</option>
                                                <option value="0">Tutte le categorie</option>
                                                <option v-for="category in groupCategories" :value="category.id">{{category.name}}</option>
                                            </optgroup>
                                        </select -->

                                    </div>

                                    <div class="col-xl-1 col-lg-1 col-md-12 mb-0">
                                        <button class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0"
                                            @click="searchGroups"
                                            :disabled="$v.$invalid" 
                                            :title="$v.$invalid?'Inserire un testo o un indirizzo':'Cerca'" 
                                            ><i class="fa fa-search" aria-hidden="true"></i></button>
                                    </div>
                                    
                                    <div v-if="$v.$anyDirty" class="col-xl-1 col-lg-1 col-md-12 mb-0">
                                        <button class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0"
                                            @click="resetSearch"
                                            title="Annulla ricerca" 
                                            ><i class="fa fa-times-circle" aria-hidden="true"></i></button>
                                    </div>

                                </div><!-- .form .row .no-gutters -->

                                

                                <pre v-if="isDebug">{{ $v }}</pre>
                            </div><!-- .search-background .bg-transparent -->

                            

                        </div>
                    </div>
            
                </div>
            </div><!-- /header-text -->
            

        </div>
    </section>
    <!--/Sliders Section-->

    <!-- Vue Pages and Components here -->
    <script type="module" src="/assets/vue/v-services/location.js"></script>
    <script type="module" src="/assets/vue/v-services/categories-rest.js"></script>

    <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
    <script type="module">
        import * as locationService from '/assets/vue/v-services/location.js';
        import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
        import { store } from '/assets/vue/v-store/group-store.js';

        //vue-select
        // Set the components prop default to return our fresh components 
        VueSelect.VueSelect.props.components.default = () => ({
            Deselect: null,
        });
        Vue.component('v-select', VueSelect.VueSelect);

        //vuelidate
        Vue.use(window.vuelidate.default);
        const { required,requiredIf, requiredUnless, minLength, helpers } = window.validators;

        //https://github.com/vuelidate/vuelidate/issues/486#issuecomment-500549486
        const validateIf = (prop, validator) =>
            helpers.withParams({ type: 'validatedIf', prop }, function(value, parentVm) {
                return helpers.ref(prop, this, parentVm) ? validator(value) : true
            })
        const validateUnless = (prop, validator) =>
            helpers.withParams({ type: 'validateUnless', prop }, function(value, parentVm) {
                return !helpers.ref(prop, this, parentVm) ? validator(value) : true
            })

        var app = new Vue({
            el: '#v-group-search-app',
            name: 'GroupSearch',
            store,
            data: { /*using vuex store*/ 
                locationLoading: false
            },
            computed: {
                //all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
					'search.searchQuery',
                    'search.searchAddress',
                    'search.searchAddressString',
                    'search.searchCategoryId',
                    'search.searchLatitude',
                    'search.searchLongitude',
                    'group.groupCategories',
                    'search.search',
                    'loading',
                    'error',
                    'success',
                    'debug',
                    'geolocationSupported',
                ]),
                isDebug: function () {
                    return this.debug
                },
            },
            validations: {
                searchQuery: {
                    required: validateUnless('searchAddressString', required),
                    minLength: minLength(3),
                },
                searchAddressString:  {
                    required: validateUnless('searchQuery', required),
                    minLength: minLength(2),
                },
            },
            watch: {
                searchAddress: function (address) {
                    this.searchAddressString = '';
                    this.searchAddressString += address.road ? address.road:'';
                    this.searchAddressString += address.house_number ? ' '+address.house_number:'';
                    this.searchAddressString += this.searchAddressString.length>0?', ':'';
                    this.searchAddressString += address.postcode ? address.postcode:'';
                    this.searchAddressString += address.village ? ' '+address.village:'';
                    this.searchAddressString += address.city ? ' '+address.city:'';
                    this.searchAddressString += this.searchAddressString.length>0?', ':'';
                    this.searchAddressString += address.country ? address.country:'';
                    //trigger vuelidate touch
                    this.$v.searchAddressString.$touch()
                },
                categories: function(cats) {
                    if(this.debug)
                        console.log("categories loaded",this.groupCategories, cats)
                },
                //error: in page
                //success: in page
            },
            mounted() {
                //will execute at pageload
                this.groupCategories = [{id:0, name:"Tutte le categorie"}]
                this.fetchGroupCategories();
            },
            methods: {
                ...Vuex.mapActions([
                    'fetchGroupCategoriesAction',
                    'fetchAddressAction',
                    'fetchCoordinatesAction',
                ]),
                aaa() {
                    alert('aaa');
                },
                async fetchGroupCategories(/*boolean*/ reload = false) {
					this.fetchGroupCategoriesAction({service: categoriesService, reload: reload})
				},
                async fetchAddress() {
                    this.locationLoading = true
                    await this.fetchAddressAction({service: locationService})
                    this.locationLoading = false
                },
                async searchGroups() {
                    console.log("searchGroups", this.search);

                    if(!_.isUndefined(this.searchAddressString) && this.searchAddressString != "") {
                        //get coordinates for searchAddressString
                        await this.fetchCoordinatesAction({service: locationService, addressString: this.searchAddressString});
                    }

                    // toggle serch
                    this.search = true;
                },
                resetSearch() {
                    this.searchQuery = ""
                    this.searchAddress = {}
                    this.searchAddressString = ""
                    this.searchCategoryId = 0
                    this.searchLatitude = 0.0
                    this.searchLongitude = 0.0
                    this.search = false

                    //https://github.com/vuelidate/vuelidate/issues/132#issuecomment-660859862
                    this.$nextTick(() => { this.$v.$reset() })

                    this.search = true
                },
            },
        })        
    </script>