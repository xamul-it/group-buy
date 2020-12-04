<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Gruppo di acquisto</title>

    </head>
    <body>
        <div class="app" id="v-supplier-app" v-cloak>

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'{{ supplierItem.name }}']"/>
        <!--/Sliders Section-->

        <!-- Supplier -->
        <section class="sptb">
            <div class="container">
                <v-modal ref="registerLoginModal"></v-modal>

                <div class="row">

                    <div class="col-xl-9 col-lg-8 col-md-12">

                        <div class="card mb-0">
                            <div class="card-body">
                                <div class="border-0">
                                    <div class="tab-content">

                                        <!-- Show -->
                                        <div class="tab-pane active" id="tab-5">
                                            <pre v-if="isDebug">{{ supplierItem }}</pre>
                                            
                                            <div class="profile-log-switch">
                                                
                                                <div v-if="supplierItem" class="row text-dark">
                                                    <div class="col-xl-11 col-lg-10 col-md-12 media-heading">
                                                        <h3 class="card-title mb-3 font-weight-bold">
                                                            {{ supplierItem.name }}
                                                        </h3>
                                                        <p></p>
                                                        <p v-if="supplierItem" class="mb-0">{{ supplierItem.description }}</p>
                                                        <p></p>
                                                    </div>
                                                    <div class="col-xl-1 col-lg-2 col-md-12">
                                                        <!-- a href="#ordini" >
                                                            <h3 class="card-title mb-3 font-weight-bold">
                                                                <span class="label label-pill badge-info mt-2">{{ supplierItem.orderCount }} Ordini</span>
                                                            </h3>
                                                        </a -->
                                                    </div>
                                                </div>
                                                <div v-if="supplierItem" class="row text-dark">
                                                    <div v-if="supplierItem.shippingAddress" class="col-md-12">
                                                        <p>
                                                            <span class="font-weight-semibold"><!-- i class="fa fa-phone mr-1"></i --><i class="fa fa-clock-o mr-1"></i></span> {{ supplierItem.deliveryInfo.bookTimes }} <br/>
                                                            <span class="font-weight-semibold"><i class="fa fa-truck mr-1"></i><!-- i class="fa fa-clock-o mr-1"></i --></span> {{ supplierItem.deliveryInfo.deliveryTimes }} <br/>
                                                            <span class="font-weight-semibold"><!-- i class="fa fa-truck mr-1"></i --><i class="fa fa-percent mr-1"></i></span> {{ supplierItem.deliveryInfo.deliveryFee }} <br/>
                                                            <span class="font-weight-semibold"><!-- i class="fa fa-calculator mr-1"></i --><i class="fa fa-money mr-1"></i></span> {{ supplierItem.deliveryInfo.paymentInfo }} <br/>

                                                        </p>
                                                    </div>
                                                </div>
                                                <div v-if="supplierItem"  class="row text-dark">
                                                    <div v-if="supplierItem.shippingAddress" class="col-md-12">
                                                        <div class="media-heading">
                                                            <h3 class="card-title mb-3 font-weight-bold">Indirizzo</h3>
                                                        </div>
                                                        <p></p>
                                                        <p class="mb-0">
                                                            {{ supplierItem.shippingAddress.address1 }}
                                                            {{ supplierItem.shippingAddress.address2 }}
                                                        </p>
                                                        <p class="mb-0">
                                                            {{ supplierItem.shippingAddress.postalCode }} {{ supplierItem.shippingAddress.city }}
                                                        </p>
                                                        <p></p>
                                                    </div>
                                                </div>
        
                                            </div>
                                        </div>
                                        <!-- /Show -->

                                        <l-map
                                        v-if="showMap"
                                        :zoom="16"
                                        :center="center"
                                        :options="{ zoomSnap: 0.5 }"
                                        style="height: 400px"
                                        >
                                            <l-marker :lat-lng="markerLatLng">
                                                <l-tooltip :options="{ permanent: true, interactive: true }">
                                                    {{ supplierItem.name }}
                                                </l-tooltip>
                                            </l-marker>
                                            <l-tile-layer
                                            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                                            :attribution="attribution"
                                            />
                                        </l-map>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-12">

                        <div class="card"> 
                            <div class="card-body">
                                <div class="row group-actions">
                                        <sec:ifLoggedIn>
                                            <div class="col-md-12 form-group">
                                                <a class="btn btn-outline-primary btn-block btn-lg" :href="'./'+supplierId+'/order'"><i class="fa fa-shopping-cart"></i> Nuovo ordine </a>
                                            </div>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <div class="col-md-12 form-group">
                                                <button class="btn btn-outline-primary btn-block btn-lg" @click="$refs.registerLoginModal.openModal()"><i class="fa fa-shopping-cart"></i> Nuovo ordine </button>
                                            </div>
                                        </sec:ifNotLoggedIn>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <!-- /Supplier -->

    </div><!-- /app -->

        <!-- link rel="stylesheet" href="//unpkg.com/leaflet/dist/leaflet.css" /-->
        <link rel="stylesheet" href="/assets/vue/v-jslib/leaflet@1.7.1/leaflet.css" />

        <script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
        <script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>

        <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
        <script type="module">
            import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
    
            import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/supplier-store.js';

            var SupplierApp = new Vue({
                el: '#v-supplier-app',
                name: 'Supplier',
                mixins: [dh.dateHelperMixin],
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
                    attribution:
                        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    showMap: false,
                    supplierId: ${supplierId},
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'supplier.supplierItem',
                        'error',
                        'success',
                        'debug',
                        'loading',
                    ]),
                    center: function () { 
                        return L.latLng(this.supplierItem.shippingAddress.lat, this.supplierItem.shippingAddress.lon)
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
                    if(this.supplierId>0)
                        this.fetchSupplier();
                },
                watch: {
                    error: function (message) {
                        toastService.alertDanger(message)
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                    supplierItem: function(newSupplierItem, oldSupplierItem) {
                        if(this.isDebug)
                            console.log('supplierItem',newSupplierItem, oldSupplierItem)
                        if(oldSupplierItem == null)
                            this.showMap = true
                    }
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchSupplierAction',
                    ]),
                    async fetchSupplier() {
                        await this.fetchSupplierAction({service: supplierService, supplierId: this.supplierId});
                    },
                },
            })        
        </script>

    </body>
</html>