<!--Sliders Section-->
    <section>
        <div class=" cover-image sptb-1 bg-background" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            
            <!-- div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Gruppi di acquisto</h1>
                    </div>
                </div>
            </div -->

            <div class="header-text1 mb-0">
                <div class="container" id="v-group-search-app">
                    <div class="row">
                        <div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
                            <div class="search-background bg-transparent">
                                <div class="form row no-gutters ">
                                    <div class="form-group  col-xl-4 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" id="search-text" v-model="searchText" placeholder="Nome gruppo o Keyword">
                                    </div>
                                    <div class="form-group  col-xl-3 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-md-0" id="address" v-model="addressString" placeholder="Luogo">
                                        <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione"><i class="fa fa-map-marker location-gps mr-1"></i> </span>										</div>
                                    <div class="form-group col-xl-3 col-lg-3 col-md-12 select2-lg  mb-0 bg-white">
                                        <select class="form-control select2-show-search  border-bottom-0" data-placeholder="Select Category">
                                            <optgroup label="Categories">
                                                <option>Categoria</option>
                                                <option value="1">Alimentari</option>
                                                <option value="2">Abbigliamento</option>
                                                <option value="3">Casa</option>
                                                <option value="4">Elettronica</option>
                                                <option value="5">Fai da te</option>
                                                <option value="6">Animali</option>
                                                <option value="7">Sport</option>
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

    <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
    <script type="module">
        import * as locationService from '/assets/vue/v-services/location.js';

        var app = new Vue({
            el: '#v-group-search-app',
            data: {
                searchText: '',
                addressString: '',
                latitude: 0,
                longitude: 0,
                category: '',
                address: {},
                error: null,
                geolocationSupported: 'geolocation' in navigator,
                loading: false,
            },
            computed: {
                
            },
            watch: {
                address: function (address) {
                    this.addressString = '';
                    this.addressString += address.road ? address.road:'';
                    this.addressString += address.house_number ? ' '+address.house_number:'';
                    this.addressString += this.addressString.length>0?', ':'';
                    this.addressString += address.postcode ? address.postcode:'';
                    this.addressString += address.village ? ' '+address.village:'';
                    this.addressString += this.addressString.length>0?', ':'';
                    this.addressString += address.country ? address.country:'';
                }
            },
            mounted() {
                //will execute at pageload
            },
            methods: {
                async fetchAddress() {
                    try {
                        this.setLoadingState();
                        this.address = await locationService.currentAddress();
                        // Reset the loading state after fetching the address.
                        this.loading = false;
                        console.log("Address", _.toString(_.valuesIn(this.address)), this.address );
                    } catch (error) {
                        console.log("error", error);
                        this.setErrorState(error);
                    }
                },
                setErrorState(error) {
                    this.error = error;
                    this.loading = false;
                },
                setLoadingState() {
                    this.error = null;
                    this.loading = true;
                },
                async fetchCoordinates() {
                    try {
                        this.setLoadingState();
                        let coords = await locationService.coordinatesByAddress(this.addressString);
                        this.latitude = coords.latitude;
                        this.longitude = coords.longitude;
                        // Reset the loading state after fetching coordinates.
                        this.loading = false;
                        console.log("Coordinates", coords );
                    } catch (error) {
                        console.log("error", error);
                        this.setErrorState(error);
                    }
                },

            },
        })        
    </script>
