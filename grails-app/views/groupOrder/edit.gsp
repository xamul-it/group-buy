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
                                    <button type="button" class="btn btn-sm btn-info mr-2" onclick="javascript:window.print();"><i class="icon icon-printer"></i> Stampa Ordine</button> 
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="row "> 
                                    <div v-if="orderItem.supplier" class="col-lg-6 "> 
                                        <p class="h3">{{ orderItem.supplier.name }}</p>
                                        <p>{{ orderItem.supplier.description }}</p>
                                        <address v-if="orderItem.supplier.contactInfo"> {{ orderItem.supplier.contactInfo.email }} <br> {{ orderItem.supplier.contactInfo.phone }}<br> {{ orderItem.supplier.contactInfo.mobile }}</address> 
                                    </div>
                                        
                                    <div v-if="orderItem.group" class="col-lg-6 text-right"> 
                                        <p>Consegna in:</p>
                                        <address v-if="orderItem.group.deliveryAddress"><a target="_blank" :href="'https://www.openstreetmap.org?mlat='+orderItem.group.deliveryAddress.lat+'&mlon='+orderItem.group.deliveryAddress.lon+'#map=17/'+orderItem.group.deliveryAddress.lat+'/'+orderItem.group.deliveryAddress.lon"> {{ orderItem.group.deliveryAddress.address1 }} <br>{{ orderItem.group.deliveryAddress.postalCode }}, {{ orderItem.group.deliveryAddress.city }}</a></address>
                                    </div>
                                </div>

                                <div class=" text-dark"> 
                                    <p class="mb-1 mt-5"><span class="font-weight-semibold">Data :</span> {{ orderItem.orderDate }} </p>
                                    <p><span class="font-weight-semibold">Data consegna :</span> 15th July 2021</p>
                                </div>

                                <div v-if="orderItem.voices" class="table-responsive push"> 
                                    <table class="table table-bordered table-hover text-nowrap">
                                        <tbody>
                                            <tr>
                                                <th class="text-center "></th>
                                                <th>Elenco Voci</th>
                                                <th class="text-center">Quantità</th>
                                                <th class="text-right"></th>
                                            </tr>
                                            
                                            <tr v-for="(v, i) in orderItem.voices">
                                                <td class="text-center">{{ v.id }}</td>
                                                <td>
                                                    <p v-if="!isEditVoice(i)" class="font-w600 mb-1">Voce:</p>
                                                    <div v-if="!isEditVoice(i)" class="text-muted">{{ v.description }} </div>
                                                    <input v-else type="text" v-model="editVoice.description" class="form-control text-center h-5" placeholder="Descrizione voce">
                                                </td>
                                                <td class="text-center">
                                                    <span v-if="!isEditVoice(i)">{{ v.quantityRequested }}</span>
                                                    <input v-else type="number" min="1" v-model="editVoice.quantityRequested" class="form-control text-center h-5" placeholder="1">
                                                </td>
                                                <td class="text-right"> 
                                                    <a v-if="v.isOwner && !isEditVoice(i)" @click="deleteVoice(v.id, i)" class="btn btn-danger btn-sm text-white" title="Elimina"><i class="fa fa-trash-o"></i></a>
                                                    <a v-if="v.isOwner && !isEditVoice(i)" @click="editVoiceNum(i)" class="btn btn-info btn-sm text-white" title="Modifica"><i class="fa fa-pencil"></i></a>
                                                    
                                                    <a v-if="v.isOwner && isEditVoice(i)" @click="resetEditVoice()" class="btn btn-secondary btn-sm text-white" title="Annulla"><i class="fa fa-times"></i></a>
                                                    <a v-if="v.isOwner && isEditVoice(i)" @click="updateVoice(v.id, i)" class="btn btn-primary btn-sm text-white" title="Salva"><i class="fa fa-check"></i></a>  
    
                                                </td>
                                            </tr>

                                            <tr v-if="addVoice">
                                                <td class="text-center"></td>
                                                <td>
                                                    <input type="text" v-model="editVoice.description" class="form-control text-center h-5" placeholder="Descrizione voce">
                                                </td>
                                                <td class="text-center">
                                                    <input type="number" min="1" v-model="editVoice.quantityRequested" class="form-control text-center h-5" placeholder="1">
                                                </td>
                                                <td class="text-right">
                                                    <a @click="addVoice = !addVoice" class="btn btn-secondary btn-sm text-white" title="Annulla"><i class="fa fa-times"></i></a>
                                                    <a @click="saveVoice()" class="btn btn-primary btn-sm text-white" title="Salva"><i class="fa fa-check"></i></a>  
                                                </td>
                                            </tr>

                                            <!-- tr>
                                                <td colspan="3" class="font-weight-semibold text-uppercase text-right">Totale</td><td class="font-weight-semibold text-right">&euro;X,000.00</td>
                                            </tr -->

                                            <tr>
                                                <td colspan="4" class="text-right"> 
                                                    <button :disabled="addVoice" @click="addVoice = !addVoice" type="button" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Aggiungi</button>                                                     
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>

                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-12 no-print">

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
            import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

            import * as orderVoiceService from '/assets/vue/v-services/order-voice-rest.js';
            import * as orderService from '/assets/vue/v-services/order-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/order-store.js';

            var OrderEditApp = new Vue({
                el: '#v-order-edit-app',
                name: 'OrderEdit',
                mixins: [ah.alertHelperMixin],
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    groupId: ${groupId},
                    orderId: ${orderId},
                    addVoice: false,
                    editVoice: {
                        i: -1,
                        id: -1,
                        description: '',
                        quantityRequested: 1,
                        order: ${orderId},
                    }
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'group.groupItem',
                        'order.orderItem',
                        'loading',
                        'error',
                        'success',
                        'debug',
                    ]),
                    
                },
                watch: {
                    error: function (error) {
                        toastService.alertDanger(this.fetchError(error))
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    }
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
                        'saveOrderVoiceAction',
                    ]),
                    async fetchOrder() {
                        await this.fetchOrderAction({service: orderService, groupId: this.groupId, orderId: this.orderId});
                    },
                    isEditVoice(i) {
                        return this.editVoice.i == i
                    },
                    editVoiceNum(i) {
                        this.addVoice = false
                        this.editVoice.i = i
                        this.editVoice.id = this.orderItem.voices[i].id
                        this.editVoice.description = this.orderItem.voices[i].description
                        this.editVoice.quantityRequested = this.orderItem.voices[i].quantityRequested 
                    },
                    resetEditVoice() {
                        this.editVoice = {
                            i: -1,
                            id: -1,
                            description: '',
                            quantityRequested: 1,
                            order: this.orderId,
                        }
                        this.addVoice = false
                    },
                    async saveVoice() {
                        console.log("saveVoice", this.editVoice )
                        let saveVoice = await this.saveOrderVoiceAction({service: orderVoiceService, groupId: this.groupId, orderId: this.orderId, orderVoiceId: 0, orderVoiceItem: this.editVoice})
                        this.orderItem.voices.push(saveVoice)
                        this.resetEditVoice()
                    },
                    async updateVoice(orderVoiceId, i) {
                        console.log("updateVoice",orderVoiceId, this.editVoice )
                        let updatedVoice = await this.saveOrderVoiceAction({service: orderVoiceService, groupId: this.groupId, orderId: this.orderId, orderVoiceId: orderVoiceId, orderVoiceItem: this.editVoice})
                        this.orderItem.voices[i] = updatedVoice
                        this.resetEditVoice()
                    },
                    async deleteVoice(orderVoiceId, i) {
                        console.log("deleteVoice",orderVoiceId, i)
                    }

                    
                }
            });
        </script>
    </sec:ifLoggedIn>
    </body>
</html>