<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Nuovo ordine</title>

        <g:render template="/includes/js-vue-select-js"/>

    </head>
    <body>
        <div id="v-order-create-app" v-cloak>
            <vue-title prefix="Group Buy" :title="pageTitle"/></vue-title>

            <sec:ifLoggedIn>
            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'{{ pageTitle }}']"/>
            <!--/Sliders Section-->

            <!-- Order -->
            <section class="sptb">
                <div class="container">
                    <v-modal ref="registerLoginModal"></v-modal>
                    
                    <div v-if="orderItem" class="row">

                        <div class="col-lg-12">

                            <div class="card mb-0">
                                <div class="card-header"> 
                                    <h3 class="card-title">Nuovo ordine</h3> 
                                </div>
                                <div class="card-body">
                                    
                                    <div class="row "> 

                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label class="form-label text-dark">Descrizione</label>
                                                <input type="text" 
                                                    class="form-control"
                                                    placeholder="Inserisci una breve descrizione dell'ordine"
                                                    v-model="orderItem.description">
                                                
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <div class="form-label">Gruppo</div>
                                                <div class="row gutters-xs"> 
                                                    <div class="col-3">
                                                        <label class="custom-control custom-radio">
                                                            <input type="radio" class="custom-control-input" name="example-radios" value="option1" checked=""> 
                                                            <span class="custom-control-label">Gruppo 1</span> 
                                                        </label> 
                                                    </div>
                                                    <div class="col-3">
                                                    <label class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" name="example-radios" value="option2"> 
                                                        <span class="custom-control-label">Gruppo 2</span> 
                                                    </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <pre v-if="isDebug">{{ $v }}</pre>
                                </div>

                                <div class="card-footer text-right">
                                    <button type="button" class="btn btn-secondary mr-2" onclick="javascript:window.history.back();"><i class="fa fa-times-circle"></i> Annulla</button> 
                                    <button type="submit" class="btn btn-primary mr-2" v-on:click="saveOrder" :disabled="$v.$invalid"><i class="fa fa-cart-arrow-down"></i> Crea</button> 
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </section>
            <!-- /Order -->
        </div>
            <g:render template="/includes/js-vuelidate-js"/>

            <script type="module">
                import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

                import * as groupService from '/assets/vue/v-services/group-rest.js';
                import * as orderService from '/assets/vue/v-services/order-rest.js';
                import * as orderVoiceService from '/assets/vue/v-services/order-voice-rest.js';
                import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
                import * as toastService from '/assets/vue/v-services/toast.js';

                import VueTitle from '/assets/vue/v-common/title.vue.js'
                import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
                import { store } from '/assets/vue/v-store/order-store.js';

                //vuelidate
                Vue.use(window.vuelidate.default);
                const { required,requiredIf, requiredUnless, minLength, minValue, helpers } = window.validators;

                var OrderCreateApp = new Vue({
                    el: '#v-order-create-app',
                    name: 'OrderCreate',
                    mixins: [ah.alertHelperMixin],
                    components: {
                        'v-modal': VModal,
                        'vue-title': VueTitle,
                    },
                    store,
                    data: {
                        pageTitle: 'Nuovo ordine',
                        supplierId: ${supplierId},
                        orderId: 0,
                    },
                    computed: {
                        //all needed data fields from vuex store
                        //mapped with vuex-map-fields
                        ...mapFields([
                            'supplier.supplierItem',
                            'order.orderItem',
                            'order.suppliers',
                            'loading',
                            'error',
                            'success',
                            'debug',
                        ]),
                        isDebug: function () {
                            return this.debug
                        },
                    },
                    validations: {
                        orderItem: {
                            description: {
                                required,
                                minLength: minLength(5),
                            },
                            group: {
                                id:  {
                                    required,
                                    minValue: minValue(1),
                                },
                            },
                        },
                    },
                    //https://stackoverflow.com/a/53513789
                    async mounted() {
                        this.debug = ${isDebug};
                        //will execute at pageload
                        await this.fetchSupplier()
                        this.createEmptyOrder()
                        this.$watch('orderItem', (orderItem) => {
                            console.log("watch orderItem", orderItem, this.orderItem)
                            location.href = "/groupBuy/group/"+this.groupItem.id+"/order/edit/" + this.orderItem.id
                        });
                    },
                    watch: {
                        supplierItem: function(supplierItem) {
                            this.pageTitle += ' per '+supplierItem.name
                        },
                        error: function (error) {
                            toastService.alertDanger(this.fetchError(error))
                        },
                        success: function (message) {
                            toastService.alertSuccess(message)
                        },
                    },
                    methods: {
                        ...Vuex.mapActions([
                            'fetchSupplierAction',
                            'saveOrderAction',
                            'saveOrderVoiceAction',
                        ]),
                        async fetchGroups(search) {
                            console.log('fetchGroups',search)
                            //this.fetchGroupsAction({service: supplierService, q: search})
                        },
                        async fetchSupplier() {
                            await this.fetchSupplierAction({service: supplierService, supplierId: this.supplierId});
                        },
                        async createEmptyOrder() {
                            this.orderItem = {
                                description: '',
                                group: {id: 0 },
                                supplier: {id: this.supplierItem.id},
                                orderDate: new Date(),
                                orderVoice: [],
                            }
                        },
                        async saveOrder() {
                            let order = await this.saveOrderAction({service: orderService, groupId: this.groupId, orderId: this.orderId, orderItem: this.orderItem});
                            //if (this.debug)
                                console.log("saveOrder", order)
                            
                            if (!_.isUndefined(order))
                                this.orderItem = order

                            //Dev
                                this.$set(this.orderItem, 'id', 13)

                        },
                        onSearch(search, loading) {
                            loading(true);
                            this.search(loading, search, this);
                        },
                        search: _.debounce(async (loading, search, vm) => {
                                    await vm.fetchSuppliers(search)
                                    loading(false)
                                }, 350)
                    }
                });

            </script>
        </sec:ifLoggedIn>
    </body>
</html>