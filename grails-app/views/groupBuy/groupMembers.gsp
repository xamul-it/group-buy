<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppo di acquisto</title>

    <!-- vuex store -->
    <script type="module" src="/assets/vue/v-store/group-store.js"></script>
    <!-- actions -->
    <script type="module" src="/assets/vue/v-store/group-actions.js"></script>
    <!-- alerts -->
    <script type="module" src="/assets/vue/v-services/toast.js"></script>
    <!-- date time helpers -->
    <script src="/assets/vue/v-jslib/moment@2.28.0/moment.js"></script>
    <script src="/assets/vue/v-jslib/moment@2.28.0/locale/it.js"></script>

</head>
<body>

    <!--Sliders Section-->
    <g:render template="/common/theme-header" model="['headerTitle':'Gruppo di acquisto']"/>
    <!--/Sliders Section-->

    <!-- Group -->
    <section class="sptb">
        <div class="container" id="v-group-members-app">
        
            <div class="row">
                <div class="col-lg-12">

                    <div class="card group-head">

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

                                            <table class="table card-table table-bordered table-hover table-vcenter text-nowrap">
                                                <tbody>
                                                    <tr>
                                                        <th></th>
                                                        <th>Nome</th>
                                                        <th>Status</th>
                                                        <th>Iscritto da</th>
                                                        <th></th>
                                                    </tr>
                                                    <tr v-for="member in groupMembers">
                                                        <td class=""><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="#" class="text-dark">{{ member.username }}</a></td>
                                                        
                                                        <td><a href="#" class="badge badge-success">Active</a></td>

                                                        <td>{{ dateSimple(new Date()) }}</td>
                                                        <td>
                                                            <a href="#" class="btn btn-purple btn-sm text-white"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Jason Porter</a></td>
                                                        <td><a href="#" class="badge badge-danger">Blocked</a></td>
                                                        <td>December-01-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Teresa Wood</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-29-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Mary Butler</a></td>
                                                        <td><a href="#" class="badge badge-info">Paused</a></td>
                                                        <td>November-29-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Janice Lane</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-25-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Anthony Miller</a></td>
                                                        <td><a href="#" class="badge badge-info">Pasused</a></td>
                                                        <td>November-24-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Denise Elliott</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-21-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
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
    <script type="module" src="/assets/vue/v-services/group-rest.js"></script>
    <script type="module" src="/assets/vue/v-services/toast.js"></script>

    <script type="module">
        import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
        import { store } from '/assets/vue/v-store/group-store.js';

        //Moment.js
        moment.locale('it');

        var app = new Vue({
            el: '#v-group-members-app',
            components: {
                'v-modal': VModal,
            },
            store,
            data: {
                groupId: ${groupId},
            },
            computed: {
                //all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
                    'group.groupMembers',
                    'group.groupItem',
                    'loading',
                    'error',
                    'success',
                    'debug',
                ]),
            },
            mounted() {
                this.debug = ${isDebug};
                //will execute at pageload
                if(this.groupId>0)
                    this.fetchGroup();
                this.fetchGroupMembers();
            },
            watch: {
                error: function (message) {
                    toastService.alertDanger(message)
                },
                success: function (message) {
                    toastService.alertSuccess(message)
                }
            },
            methods: {
                ...Vuex.mapActions([
                    'fetchGroupAction',
                    'fetchGroupMembersAction'
                ]),
                async fetchGroup() {
                    this.fetchGroupAction({service: groupService, groupId: this.groupId});
                },
                timeFromNow(date) {
        		    return moment(date).fromNow();
                },
                dateTime(date) {
        		    return moment(date).format('D MMMM YYYY, h:mm');
                },
                dateSimple(date) {
        		    return moment(date).format('D MMMM YYYY');
                },
                async fetchGroupMembers() {
                    this.fetchGroupMembersAction({service: groupService, groupId: this.groupId })
                },
            },
        })        
    </script>

</body>
</html>