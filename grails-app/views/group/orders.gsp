<html>
<head>
	<meta name="layout" content="claylist"/>
    <title>Ordini del gruppo di acquisto</title>

</head>
<body>

    <!--Sliders Section-->
    <g:render template="/common/theme-header" model="['headerTitle':'Ordini del gruppo di acquisto']"/>
    <!--/Sliders Section-->

    <!-- Group orders -->
    <section class="sptb">
        <div class="container" id="v-group-orders-app" v-cloak>
            <div class="row">
                <div class="col-lg-12">

                    <div class="card overflow-hidden group-head">

                        <g:render template="/group/group-subheader"/>

                        <div class="card-footer">
                            <div class="wideget-user-tab">
                                <div class="tab-menu-heading">
                                    <div class="tabs-menu1">
                                        <g:render template="/navigation/theme-group-nav" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="row">

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
                                                                    <a :href="'/gruppo/'+order.groupId+'/ordine/'+order.id" class="text-dark"><h4 class="font-weight-semibold">{{ order.description }}</h4></a>
                                                                    <a :href="'/gruppo/'+order.groupId+'/ordine/'+order.id" :title="dateTime(order.orderDate)"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(order.orderDate) }} </a><br>
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
                                                        <a v-if="canEdit(order.status.id)" :href="'/gruppo/'+order.groupId+'/ordine/'+order.id+'/modifica'" class="btn btn-success btn-sm text-white" title="Gestisci"><i class="fa fa-pencil"></i></a>
                                                        <a v-if="canEdit(order.status.id)" :href="'#'" class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a v-if="canEdit(order.status.id)" :href="'/gruppo/'+order.groupId+'/ordine/'+order.id+'/modifica'" class="btn btn-primary btn-sm text-white" title="Aggiungi voci"><i class="fa fa-cart-plus"></i></a>
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

                <div class="col-xl-3 col-lg-4 col-md-12">

                        <div class="card"> 
                            <div class="card-body"> 
                                
                                <div class="row group-actions" v-if="groupItem">
                                        <sec:ifLoggedIn>
                                            <div class="col-md-12 form-group">
                                                <g:render template="/buttons/new-order" model="[:]"/>
                                            </div>
                                        </sec:ifLoggedIn>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- /Group orders -->

    <script type="module">
        import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
        import * as ph from '/assets/vue/v-common/pagination-helper-mixin.js';
        import * as os from '/assets/vue/v-order/order-status-mixin.js';

        import VPagination from '/assets/vue/v-common/pagination.vue.js';
        import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as orderService from '/assets/vue/v-services/order-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
        import { store } from '/assets/vue/v-store/order-store.js';

        var GroupOrdersApp = new Vue({
            el: '#v-group-orders-app',
            name: 'GroupOrders',
            mixins: [dh.dateHelperMixin,ph.paginationHelperMixin,os.orderStatusMixin],
            components: {
                'v-modal': VModal,
                'pagination': VPagination,
            },
            store,
            data: {
                groupId: ${groupId},
                currentPage: 1,
            },
            computed: {
                //all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
                    'group.groupItem',
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
            async mounted() {
                this.debug = ${isDebug};
                //will execute at pageload
                this.max=8
                if(this.groupId>0) {
                    await this.fetchGroup()
                    this.fetchGroupOrders();
                }
            },
            methods: {
                ...Vuex.mapActions([
                    'fetchGroupAction',
                    'fetchOrderListAction',
                ]),
                async fetchGroup() {
                    this.fetchGroupAction({service: groupService, groupId: this.groupId});
                },
                async fetchGroupOrders() {
                    await this.fetchOrderListAction({service: orderService, groupId: this.groupId, reload: true})
                },
                async loadPage() {
                    await this.fetchGroupOrders()
                },
            },
        })        
    </script>

</body>
</html>