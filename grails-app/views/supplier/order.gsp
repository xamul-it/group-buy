<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Nuovo ordine</title>

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

                                        <div class="col-sm-12 col-md-12">

                                            <div class="list-group"> 
                                                <label class="form-label text-dark">Seleziona gruppo</label>

                                                <div v-for="group in groupList" @click="selectGroup(group.id)" :class="{ active: isGroupSelected(group.id) }" class="list-group-item list-group-item-action flex-column align-items-start">
                                                    <div class="d-flex w-100 justify-content-between">
                                                        <h5 class="mb-1">{{ group.name }}</h5>
                                                        <small><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(group.creationDate) }} </small>
                                                    </div>
                                                    <p class="mb-1">{{ group.description }}</p>
                                                    <small>
                                                        <i class="fa fa-map-marker text-muted mr-1"></i> {{addressFormat(group.deliveryAddress)}}
                                                    </small>
                                                </div>
        
                                            </div>

                                        </div>

                                        <div class="col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label class="form-label text-dark">Descrizione</label>
                                                <input type="text" 
                                                    class="form-control"
                                                    placeholder="Inserisci una breve descrizione dell'ordine"
                                                    v-model="orderItem.description">
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
        
            <g:render template="/includes/js-vue-select-js"/>
            <g:render template="/includes/js-vuelidate-js"/>

            <script type="module">
                import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';
                import * as dhm from '/assets/vue/v-common/date-helper-mixin.js';

                import * as groupService from '/assets/vue/v-services/group-rest.js';
                import * as orderService from '/assets/vue/v-services/order-rest.js';
                import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
                import * as userService from '/assets/vue/v-services/user-rest.js';
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
                    mixins: [ah.alertHelperMixin,dhm.dateHelperMixin],
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
                            'user.userItem',
                            'user.userId',
                            'group.groupList',
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
                        await this.fetchUser();
                        this.userId = this.userItem.id;
                        await this.fetchUserGroups()
                        this.createEmptyOrder()
                        this.$watch('orderItem', (orderItem) => {
                            console.log("watch orderItem", orderItem, this.orderItem)
                            location.href = "/groupBuy/group/"+this.orderItem.group.id+"/order/edit/" + this.orderItem.id
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
                            'fetchUserAction',
                            'fetchSupplierAction',
                            'fetchGroupListAction',
                            'saveOrderAction',
                        ]),
                        async fetchUser() {
                            await this.fetchUserAction({service: userService});
                        },
                        async fetchUserGroups() {
                            await this.fetchGroupListAction({service: groupService, reload: true})
                        },
                        async fetchSupplier() {
                            await this.fetchSupplierAction({service: supplierService, supplierId: this.supplierId});
                        },
                        async createEmptyOrder() {
                            this.orderItem = {
                                description: "Ordine per "+this.supplierItem.name,
                                group: {id: 0 },
                                supplier: {id: this.supplierItem.id},
                                orderDate: new Date(),
                                orderVoice: [],
                            }
                        },
                        async saveOrder() {
                            await this.saveOrderAction({service: orderService, groupId: this.orderItem.group.id, orderId: this.orderId, orderItem: this.orderItem});
                        },
                        addressFormat(deliveryAddress) {
                            let formattedAddress = '';

                            formattedAddress = '';
                            formattedAddress += deliveryAddress.address1 ? deliveryAddress.address1:'';
                            formattedAddress += deliveryAddress.address2 ? ' '+deliveryAddress.address2:'';
                            formattedAddress += formattedAddress.length>0?', ':'';
                            formattedAddress += deliveryAddress.postalCode ? deliveryAddress.postalCode:'';
                            formattedAddress += deliveryAddress.city ? ' '+deliveryAddress.city:'';
                            formattedAddress += formattedAddress.length>0?', ':'';
                            formattedAddress += deliveryAddress.countryCode ? deliveryAddress.countryCode:'';
                            
                            return formattedAddress
                        },
                        selectGroup(id) {
                            if (!_.isUndefined(id) && !isNaN(id) && id > 0) 
                                this.orderItem.group.id = id
                        },
                        isGroupSelected(id) {
                            if (!_.isUndefined(id) && !isNaN(id) && id > 0) 
                                return this.orderItem.group.id == id
                        }
                    }
                });

            </script>
        </sec:ifLoggedIn>
    </body>
</html>