<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Ordine</title>

        <!-- alerts -->
        <script type="module" src="/assets/vue/v-services/toast.js"></script>

    </head>
    <body>
        <sec:ifLoggedIn>
        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Ordine']"/>
        <!--/Sliders Section-->

        <!-- Order -->
        <section class="sptb">
            <div class="container" id="v-order-edit-app" v-cloak>
                <v-modal ref="registerLoginModal"></v-modal>
                
                <div v-if="orderItem" class="row">

                    <div class="col-xl-9 col-lg-8 col-md-12">

                        <div class="card mb-0">
                            <div class="card-header"> 
                                <h3 class="card-title">#ORDINE-{{ orderItem.id }}</h3> 
                                <div class="card-options">
                                    <button type="button" class="btn btn-sm btn-danger mr-2"><i class="fa fa-trash-o"></i> Azione tre</button> 
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="row "> 
                                    <div v-if="orderItem.supplier" class="col-lg-6 "> 
                                        <p class="h3">{{ orderItem.supplier.name }}</p>
                                        <p>{{ orderItem.supplier.description }}</p>
                                        <address v-if="orderItem.supplier.contactInfo"> {{ orderItem.supplier.contactInfo.email }} <br> {{ orderItem.supplier.contactInfo.phone }}<br> {{ orderItem.supplier.contactInfo.mobile }}</address> 
                                    </div>
                                        
                                    <!-- div class="col-lg-6 text-right"> 
                                        <p class="h3">Invoice To</p>
                                        <address> Street Address<br>State, City<br>Region, Postal Code<br>ctr@example.com </address>
                                    </div -->
                                </div>

                                <div class=" text-dark"> 
                                    <p class="mb-1 mt-5"><span class="font-weight-semibold">Data :</span> {{ orderItem.orderDate }} </p>
                                    <p><span class="font-weight-semibold">Data consegna :</span> 15th July 2021</p>
                                </div>

                                <div v-if="orderItem.orderVoice" class="table-responsive push"> 
                                    <table class="table table-bordered table-hover text-nowrap">
                                        <tbody>
                                            <tr>
                                                <th class="text-center "></th>
                                                <th>Elenco Voci</th>
                                                <th class="text-center">Qantità</th>
                                                <th class="text-right">Prezzo</th>
                                            </tr>
                                            
                                            <tr v-for="v in orderItem.orderVoice">
                                                <td class="text-center">{{ v.id }}</td>
                                                <td>
                                                    <p class="font-w600 mb-1">Voce:</p>
                                                    <div class="text-muted">{{ v.description }} </div>
                                                </td>
                                                <td class="text-center">1</td>
                                                <td class="text-right">$X,X00.00</td>
                                            </tr>

                                            <tr>
                                                <td colspan="3" class="font-w600 text-right">Subtotal</td><td class="text-right">$XX,000.00</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="font-w600 text-right">Vat Rate</td><td class="text-right">20%</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="font-w600 text-right">Vat Due</td><td class="text-right">$X,000.00</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" class="font-weight-semibold text-uppercase text-right">Total Due</td><td class="font-weight-semibold text-right">$30,000.00</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="text-right">
                                                    <button type="button" class="btn btn-pink"><i class="icon icon-wallet"></i> Paga</button>
                                                    <button type="button" class="btn btn-info" onclick="javascript:window.print();"><i class="icon icon-printer"></i> Stampa Ordine</button> 
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-12">

                        <div class="card"> 
                            <div class="card-body"> 
                               
                                <div class="row group-actions">
                                    <div class="col-md-12 form-group" >
                                        <button  type="button" class="btn btn-primary btn-block btn-lg" v-on:click="">  <i class="fa fa-handshake-o"></i> Azione uno </button>
                                        <button type="button" class="btn btn-secondary btn-block btn-lg" v-on:click=""> <i class="fa fa-envelope-open-o"></i> Azione due </button>
                                    </div>
                                    
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <!-- /Group -->

        <script type="module">
            import * as orderService from '/assets/vue/v-services/order-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/order-store.js';

            var OrderEditApp = new Vue({
                el: '#v-order-edit-app',
                name: 'OrderEdit',
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    groupId: ${groupId},
                    orderId: ${orderId},
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'order.orderItem',
                        'loading',
                        'error',
                        'success',
                        'debug',
                    ]),
                },
                //https://stackoverflow.com/a/53513789
                async mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    if(this.groupId>0) {
                        await this.fetchOrder();
                    } else {
                        this.createEmptyOrder();
                    }
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchOrderAction',
                    ]),
                    async fetchOrder() {
                        await this.fetchOrderAction({service: orderService, groupId: this.groupId, orderId: this.orderId});
                    },
                }
            });
        </script>
    </sec:ifLoggedIn>
    </body>
</html>