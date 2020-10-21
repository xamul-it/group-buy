<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Ordini del gruppo di acquisto</title>

</head>
<body>

    <!--Sliders Section-->
    <g:render template="/common/theme-header" model="['headerTitle':'Ordini del gruppo di acquisto']"/>
    <!--/Sliders Section-->

    <!-- Group -->
    <section class="sptb">
        <div class="container" id="v-group-orders-app">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card overflow-hidden group-head">

                        <g:render template="/group/group-header"/>

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

                    <div class="card mb-0">
                        <div class="card-body">
                            <div class="border-0">
                                <div class="tab-content">

                                    <div class="tab-pane userprof-tab active" id="tab-7">
                                        <div class="table-responsive border-top">
                                            <table class="table table-bordered table-hover mb-0 text-nowrap">
                                            <thead>
                                                <tr>
                                                    <!-- th></th -->
                                                    <th>Ordine</th>
                                                    <th>Totale</th>
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
                                                                    <a :href="'#'+order.id" class="text-dark"><h4 class="font-weight-semibold">{{ order.description }}</h4></a>
                                                                    <a :href="'#'+order.id" :title="dateTime(order.orderDate)"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(order.orderDate) }} </a><br>
                                                                    <a><i class="fa fa-tag mr-1"></i>order label</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="font-weight-semibold fs-16">
                                                        &euro; <!-- {{ orderTotal(order.id) }} -->
                                                    </td>
                                                    <td>
                                                        
                                                        <a v-if="orderState(order.id)==1" href="#" class="badge badge-primary">Da inviare</a>
                                                        <a v-else-if="orderState(order.id)==2" href="#" class="badge badge-warning">In corso</a>
                                                        <a v-else-if="orderState(order.id)==3" href="#" class="badge badge-success">Consegnato</a>
                                                        <a v-else-if="orderState(order.id)==4" href="#" class="badge badge-danger">Non accettato</a>
                                                        
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip"><i class="fa fa-cart-plus"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip"><i class="fa fa-eye"></i></a>
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
                </div>
            </div>
        </div>
    </section>

    <!-- /Group -->

    <script type="module">
        import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
        import * as gms from '/assets/vue/v-group/group-member-status-mixin.js';

        import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as orderService from '/assets/vue/v-services/order-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
        import { store } from '/assets/vue/v-store/order-store.js';

        var GroupOrdersApp = new Vue({
            el: '#v-group-orders-app',
            name: 'GroupOrders',
            mixins: [dh.dateHelperMixin],
            components: {
                'v-modal': VModal,
            },
            store,
            data: {
                groupId: ${groupId},
                orderStates: [],
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
                isDebug: function () {
                    return this.debug
                },
            },
            async mounted() {
                this.debug = ${isDebug};
                //will execute at pageload
                this.max=4
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
                    await this.fetchOrderListAction({service: orderService, groupId: this.groupId})
                },
                orderState(orderId) {
                    if(!this.orderStates[orderId])
                        this.orderStates[orderId] = Math.floor(Math.random() * 4) + 1;
                    
                    //console.log("orderId", orderId, "orderState", this.orderStates[orderId], this.orderStates);
                    return this.orderStates[orderId];
                },
            },
        })        
    </script>

</body>
</html>