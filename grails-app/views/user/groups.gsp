<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>I miei gruppi</title>
    </head>
    <body>

        <div id="v-user-groups-app" vcloak>

            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'I miei gruppi']"/>
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
                                                            <th>Gruppo</th>
                                                            <th>Indirizzo</th>
                                                            <th>Info</th>
                                                            <th>&nbsp;</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <tr v-for="group in groupList">
                                                            <!-- td>
                                                                <label class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                    <span class="custom-control-label"></span>
                                                                </label>
                                                            </td -->
                                                            <td>
                                                                <div class="mt-0 mb-0">
                                                                    <div class="media-body">
                                                                        <div class="card-item-desc ml-4 p-0 mt-2 text-dark">
                                                                            <a :href="'/groupBuy/group/'+group.id"><h4 class="font-weight-semibold">{{ group.name }}</h4><p>{{ group.description }}</p></a>
                                                                            Creato: <a :href="'/groupBuy/group/'+group.id" :title="dateTime(group.creationDate)"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(group.creationDate) }} </a><br>
                                                                            <!-- a><i class="fa fa-tag mr-1"></i>order label</a -->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="mt-0 mb-0">
                                                                <a class="location" :title="addressFormat(group.deliveryAddress)"><i class="fa fa-map-marker text-muted mr-1"></i> {{ group.deliveryAddress.city }}</a> <br/> {{addressFormat(group.deliveryAddress)}}
                                                            </td>
                                                            <td>
                                                                <p><span class="label label-pill badge-info mt-2">{{ group.memberCount }} Iscritti</span></p>
                                                                <p><span class="label label-pill badge-light mt-2">{{ Math.floor(Math.random() * 10) +1 }} Ordini</span></p>
                                                            </td>
                                                            <td>
                                                                
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
            <!-- /User Dashboard -->
        
        </div>

    <g:render template="/includes/js-vuelidate-js"/>

        <script type="module">
            import * as dhm from '/assets/vue/v-common/date-helper-mixin.js';

            import * as userService from '/assets/vue/v-services/user-rest.js';
            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
            import { store } from '/assets/vue/v-store/group-store.js';

            var UserGroupsApp = new Vue({
                el: '#v-user-groups-app',
                name: 'UserGroups',
                mixins: [dhm.dateHelperMixin],
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    //userId: ${userId},
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'user.userItem',
                        'group.groupList',
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
                mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    this.fetchUser();
                    this.fetchUserGroups();
                    
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
                        'fetchGroupListAction'
                    ]),
                    async fetchUser() {
                        await this.fetchUserAction({service: userService});
                    },
                    async fetchUserGroups() {
                        await this.fetchGroupListAction({service: groupService, reload: true})
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
                },
            })        
    </script>

    </body>
</html>