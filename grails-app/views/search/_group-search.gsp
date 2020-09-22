<!--Sliders Section-->
    <section>
        <div class=" cover-image sptb-1 bg-background" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >

            <div class="header-text1 mb-0">
                <div class="container" id="v-group-search-app">
                    <div class="row">
                        <div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
                            <div class="search-background bg-transparent">
                                <div class="form row no-gutters ">
                                    <div class="form-group  col-xl-4 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" id="search-text" v-model="searchQuery" placeholder="Nome gruppo o Keyword">
                                    </div>
                                    <div class="form-group  col-xl-3 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-md-0" id="address" v-model="searchAddressString" placeholder="Luogo">
                                        <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione"><i class="fa fa-map-marker location-gps mr-1"></i> </span> </div>
                                    <div class="form-group col-xl-3 col-lg-3 col-md-12 select2-lg  mb-0 bg-white">

                                        <select class="form-control select2-show-search  border-bottom-0" v-model="searchCategoryId">
                                            <optgroup label="Categorie">
                                                <option v-if="searchCategoryId<=0" :value="searchCategoryId" disabled selected hidden>Categorie</option>
                                                <option v-for="category in groupCategories" :value="category.id">{{category.name}}</option>
                                            </optgroup>
                                        </select>

                                    </div>
                                    <div class="col-xl-2 col-lg-3 col-md-12 mb-0">
                                        <button @click="fetchCoordinates" class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0">Cerca</button>
                                    </div>
                                </div>
                            </div>
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
    <script type="module" src="/assets/vue/v-services/toast.js"></script>

    <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
    <script type="module">
        import * as locationService from '/assets/vue/v-services/location.js';
        import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
        import { store } from '/assets/vue/v-store/store.js';

        var app = new Vue({
            el: '#v-group-search-app',
            store,
            data: { /*using vuex store*/ },
            computed: {
                //all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
					'search.searchQuery',
                    'search.searchAddress',
                    'search.searchAddressString',
                    'search.searchCategoryId',
                    'group.groupCategories',
                    'loading',
                    'error',
                    'success',
                    'debug',
                    'geolocationSupported',
				]),
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
                },
                categories: function(cats) {
                    if(this.debug)
                        console.log("categories loaded",this.groupCategories, cats)
                },
                error: function (message) {
                    toastService.alertDanger(message)
                },
                success: function (message) {
                    toastService.alertSuccess(message)
                }
            },
            mounted() {
                this.debug = true;
                //will execute at pageload
                this.fetchCategoriesAction({service: categoriesService});
            },
            methods: {
                ...Vuex.mapActions([
                    'fetchCategoriesAction',
                    'fetchAddressAction',
                    'fetchCoordinatesAction',
                ]),
                async fetchAddress() {
                    this.fetchAddressAction({service: locationService})
                },
                async fetchCoordinates() {
                    this.fetchCoordinatesAction({service: locationService, addressString: this.searchAddressString})
                },

            },
        })        
    </script>