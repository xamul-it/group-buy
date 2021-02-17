<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>I miei ordini</title>
    </head>
    <body>

        <div id="v-user-orders-app" v-cloak>

            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'I miei ordini']"/>
            <!--/Sliders Section-->

            <!-- User Dashboard -->
            <section class="sptb">
                <div class="container">

                    <div class="row">
                        <div class="col-xl-3 col-lg-12 col-md-12">
                            
                            <g:render template="user-side" />

                        </div>

                        <div class="col-xl-9 col-lg-8 col-md-12">

                            <div class="card mb-0">
                                <div class="card-body">
                                    <div class="border-0">
                                        <div class="tab-content">

                                            <div class="tab-pane userprof-tab active">
                                                <div class="table-responsive border-top">
                                                    <table class="table table-bordered table-hover mb-0 text-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <!-- th></th -->
                                                            <th>Ordine</th>
                                                            <!-- th>Totale</th -->
                                                            <th>Stato</th>
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <tr v-for="order in orderList">
                                                            <!-- td>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                    <span class="custom-control-label"></span>
                                                                </label>
                                                            </td -->
                                                            <td>
                                                                <div class="media mt-0 mb-0">
                                                                    <div class="media-body">
                                                                        <div class="card-item-desc ml-4 p-0 mt-2">
                                                                            <a :href="'/groupBuy/group/'+order.groupId+'/order/edit/'+order.id" class="text-dark"><h4 class="font-weight-semibold">{{ order.description }}</h4></a>
                                                                            <a :href="'/groupBuy/group/'+order.groupId+'/order/edit/'+order.id" :title="dateTime(order.orderDate)"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(order.orderDate) }} </a><br>
                                                                            <!-- a><i class="fa fa-tag mr-1"></i>order label</a -->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <!-- td class="font-weight-semibold fs-16">
                                                                &euro; <!-- {{ orderTotal(order.id) }} -- >
                                                            </td -->
                                                            <td>

                                                                <span class="badge " :class="orderStatusBadgeClass(order.status.id)">{{ order.status.value }}</span>
                                                                <!-- badge-primary -->
                                                                
                                                            </td>
                                                            <td>
                                                                <a v-if="canEdit(order.status.id)" :href="'/groupBuy/group/'+order.groupId+'/order/edit/'+order.id" class="btn btn-success btn-sm text-white" title="Gestisci"><i class="fa fa-pencil"></i></a>
                                                                <a v-if="canEdit(order.status.id)" :href="'#'" class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                                <a v-if="canEdit(order.status.id)" :href="'/groupBuy/group/'+order.groupId+'/order/edit/'+order.id" class="btn btn-primary btn-sm text-white" title="Aggiungi voci"><i class="fa fa-cart-plus"></i></a>
                                                                <!-- a class="btn btn-primary btn-sm text-white" data-toggle="tooltip"><i class="fa fa-eye"></i></a -->
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <pagination
                            :total="ordersTotal"
                            :per-page="max"
                            :current-page="currentPage"
                            :disable-pagination="loading"
                            @pagechanged="onPageChange"
                            />
                            
                        </div>
                    </div>
                </div>
            </section>
            <!-- /User Dashboard -->
        
        </div>

    <g:render template="/includes/js-vuelidate-js"/>

        <script type="module">
            import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
            import * as ph from '/assets/vue/v-common/pagination-helper-mixin.js';
            import * as os from '/assets/vue/v-order/order-status-mixin.js';

            import VPagination from '/assets/vue/v-common/pagination.vue.js';
            import * as userService from '/assets/vue/v-services/user-rest.js';
            import * as orderService from '/assets/vue/v-services/order-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
            import { store } from '/assets/vue/v-store/order-store.js';

            var UserOrdersApp = new Vue({
                el: '#v-user-orders-app',
                name: 'UserOrders',
                mixins: [dh.dateHelperMixin,ph.paginationHelperMixin,os.orderStatusMixin],
                components: {
                    'v-modal': VModal,
                    'pagination': VPagination,
                },
                store,
                data: {
                    //userId: ${userId},
                    currentPage: 1,
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'user.userItem',
                        'order.orderList',
                        'pagination.total',
                        'pagination.offset',
                        'pagination.max',
                        'sort.sort',
                        'sort.order',
                        'loading',
                        'error',
                        'success',
                        'debug',
                    ]),
                    ordersTotal() {
                        return this.total;
                    },
                    isDebug: function () {
                        return this.debug
                    },
                },
                mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    this.max=8
                    this.fetchUser();
                    this.fetchUserOrdes();
                    
                },
                watch: {
                    error: function (message) {
                        toastService.alertDanger(message)
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                    userItem: function(newUserItem, oldUserItem) {
                        if(this.isDebug)
                            console.log('userItem',newUserItem, oldUserItem)
                    }
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchUserAction',
                        'fetchOrderListAction'
                    ]),
                    async fetchUser() {
                        await this.fetchUserAction({service: userService});
                    },
                    async fetchUserOrdes() {
                        await this.fetchOrderListAction({service: orderService, reload: true});
                    },
                    async loadPage() {
                        await this.fetchUserOrdes()
                    },
                },
            })        
    </script>

    </body>
</html>