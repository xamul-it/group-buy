<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppo di acquisto - Ordini</title>



</head>
<body>

    <!--Sliders Section-->
    <section>
        <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            <div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Gruppo di acquisto</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Sliders Section-->

    <!-- Group -->
    <section class="sptb">
        <div class="container" id="v-group-orders-app">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card overflow-hidden group-head">

                        <g:render template="/group/group-header"/>

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
                                                    <th></th>
                                                    <th>Ordine</th>
                                                    <th>Totale</th>
                                                    <th>Stato</th>
                                                    <th>&nbsp;</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="order in groupOrders">
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
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
                                                        &euro; {{ orderTotal(order.id) }}
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
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
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

    <!-- Vue Pages and Components here -->
    <!-- script src="/assets/vue/v-group-buy/group.vue.js"></script -->

    <script>

        var GroupOrdersApp = new Vue({
            el: '#v-group-orders-app',
            name: 'GroupList',
            mixins: [dateHelperMixin],
            data: {
                group: {},
                groupOrders: [],
                groupId: 0,
                orderStates: [],
                orderTotals: [],
            },
            computed: {
                show: function () {
                    return !this.edit
                },
            },
            mounted() {
                    console.log("query params", "${params}") 
                    //will execute at pageload
                    this.groupId = ${params.id?:0};
                    this.getGroup();
                    this.getGroupOrders();
            },
            methods: {
                orderState(orderId) {
                    if(!this.orderStates[orderId])
                        this.orderStates[orderId] = Math.floor(Math.random() * 4) + 1;
                    
                    //console.log("orderId", orderId, "orderState", this.orderStates[orderId], this.orderStates);
                    return this.orderStates[orderId];
                },
                orderTotal(orderId) {
                    if(!this.orderTotals[orderId])
                        this.orderTotals[orderId] = ((Math.random() * 100) + 1).toFixed(2);
                    
                    //console.log("orderId", orderId, "orderTotal", this.orderTotals[orderId], this.orderTotals);
                    return this.orderTotals[orderId];
                },
                getGroup() {
                    let url =
                        "/group/show/"+this.groupId+".json";
                    //this.showProgress = true;
                    axios
                        .get(url)
                        .then(result => {
                            console.log("result=", result ); 
                            data = result.data;
                            this.group = data;
                            //this.showProgress = false;
                        })
                        .catch(error => {
                            console.log("error", error);
                            //this.showProgress = false;
                        }).then( () => {
                            console.log("data", this.group);
                        });
                },
                getGroupOrders() {
                    let url =
                        "/order/listByGroup.json?groupId="+this.groupId;
                    //this.showProgress = true;
                    axios
                        .get(url)
                        .then(result => {
                            console.log("result=", result ); 
                            data = result.data;
                            this.groupOrders = data;
                            //this.showProgress = false;
                        })
                        .catch(error => {
                            console.log("error", error);
                            //this.showProgress = false;
                        }).then( () => {
                            console.log("data", this.groupOrders);
                        });
                },

            },
        })        
    </script>

</body>
</html>