<<<<<<< HEAD
<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Nuovo ordine</title>
    </head>
    <body>
        <sec:ifLoggedIn>
        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Nuovo ordine']"/>
        <!--/Sliders Section-->

        <!-- Order -->
        <section class="sptb">
            <div class="container" id="v-order-create-app" v-cloak>
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
                                            <label class="form-label text-dark">Fornitore</label>
                                            <v-select 
                                                :clearable="false" 
                                                label="name"
                                                :reduce="name => name.id"
                                                :filterable="false"
                                                :options="suppliers"
                                                @search="onSearch"
                                                v-model="orderItem.supplier.id"
                                                >
                                                
                                                <template slot="no-options">
                                                    nessun risultato, scrivi per cercare
                                                </template>
                                                <template #open-indicator>
                                                    <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                                                </template>
                                            </v-select>
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
        <!-- /Group -->

        <g:render template="/includes/js-vue-select-js"/>
        <g:render template="/includes/js-vuelidate-js"/>

        <script type="module">
            import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as orderService from '/assets/vue/v-services/order-rest.js';
            import * as orderVoiceService from '/assets/vue/v-services/order-voice-rest.js';
            import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
            import { store } from '/assets/vue/v-store/order-store.js';

            //vue-select
            // Set the components prop default to return our fresh components 
            VueSelect.VueSelect.props.components.default = () => ({
                Deselect: null,
            });
            Vue.component('v-select', VueSelect.VueSelect);

            //vuelidate
            Vue.use(window.vuelidate.default);
            const { required,requiredIf, requiredUnless, minLength, minValue, helpers } = window.validators;

            var OrderCreateApp = new Vue({
                el: '#v-order-create-app',
                name: 'OrderCreate',
                mixins: [ah.alertHelperMixin],
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    groupId: ${groupId},
                    orderId: 0,
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'group.groupItem',
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
                        supplier: {
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
                    await this.fetchGroup()
                    this.createEmptyOrder()
                    this.$watch('orderItem', (orderItem) => {
                        console.log("watch orderItem", orderItem, this.orderItem)
                        location.href = "/groupBuy/group/"+this.groupItem.id+"/order/edit/" + this.orderItem.id
                    });
                },
                watch: {
                    error: function (error) {
                        toastService.alertDanger(this.fetchError(error))
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchGroupAction',
                        'fetchSuppliersAction',
                        'saveOrderAction',
                        'saveOrderVoiceAction',
                    ]),
                    async fetchSuppliers(search) {
                        console.log('fetchSuppliers',search)
                        this.fetchSuppliersAction({service: supplierService, q: search})
                    },
                    async fetchGroup() {
                        await this.fetchGroupAction({service: groupService, groupId: this.groupId})
                    },
                    async createEmptyOrder() {
                        this.orderItem = {
                            description: '',
                            group: {id: this.groupItem.id },
                            supplier: {id: 0},
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
=======
<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Nuovo ordine</title>
    </head>
    <body>
        <sec:ifLoggedIn>
        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Nuovo ordine']"/>
        <!--/Sliders Section-->

        <!-- Order -->
        <section class="sptb">
            <div class="container" id="v-order-create-app" v-cloak>
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
                                            <label class="form-label text-dark">Fornitore</label>
                                            <v-select 
                                                :clearable="false" 
                                                label="name"
                                                :reduce="name => name.id"
                                                :filterable="false"
                                                :options="suppliers"
                                                @search="onSearch"
                                                v-model="orderItem.supplier.id"
                                                >
                                                
                                                <template slot="no-options">
                                                    nessun risultato, scrivi per cercare
                                                </template>
                                                <template #open-indicator>
                                                    <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                                                </template>
                                            </v-select>
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
        <!-- /Group -->

        <g:render template="/includes/js-vue-select-js"/>
        <g:render template="/includes/js-vuelidate-js"/>

        <script type="module">
            import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as orderService from '/assets/vue/v-services/order-rest.js';
            import * as orderVoiceService from '/assets/vue/v-services/order-voice-rest.js';
            import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
            import { store } from '/assets/vue/v-store/order-store.js';

            //vue-select
            // Set the components prop default to return our fresh components 
            VueSelect.VueSelect.props.components.default = () => ({
                Deselect: null,
            });
            Vue.component('v-select', VueSelect.VueSelect);

            //vuelidate
            Vue.use(window.vuelidate.default);
            const { required,requiredIf, requiredUnless, minLength, minValue, helpers } = window.validators;

            var OrderCreateApp = new Vue({
                el: '#v-order-create-app',
                name: 'OrderCreate',
                mixins: [ah.alertHelperMixin],
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    groupId: ${groupId},
                    orderId: 0,
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'group.groupItem',
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
                        supplier: {
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
                    await this.fetchGroup()
                    this.createEmptyOrder()
                    this.$watch('orderItem', (orderItem) => {
                        console.log("watch orderItem", orderItem, this.orderItem)
                        location.href = "/groupBuy/group/"+this.groupItem.id+"/order/edit/" + this.orderItem.id
                    });
                },
                watch: {
                    error: function (error) {
                        toastService.alertDanger(this.fetchError(error))
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchGroupAction',
                        'fetchSuppliersAction',
                        'saveOrderAction',
                    ]),
                    async fetchSuppliers(search) {
                        console.log('fetchSuppliers',search)
                        this.fetchSuppliersAction({service: supplierService, q: search})
                    },
                    async fetchGroup() {
                        await this.fetchGroupAction({service: groupService, groupId: this.groupId})
                    },
                    async createEmptyOrder() {
                        this.orderItem = {
                            description: '',
                            group: {id: this.groupItem.id },
                            supplier: {id: 0},
                            orderDate: new Date(),
                            orderVoice: [],
                        }
                    },
                    async saveOrder() {
                        await this.saveOrderAction({service: orderService, groupId: this.groupId, orderId: this.orderId, orderItem: this.orderItem});
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
>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
</html>