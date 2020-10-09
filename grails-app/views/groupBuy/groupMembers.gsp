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

                    <div class="panel panel-primary">
                        <div>
                            <div class="user-tabs mb-4">
                            
                                <!-- Filtri --> 
                                <ul class="nav panel-tabs"> 
                                    <li class=""><a href="#tab1" class="active btn-orange" data-toggle="tab">Tutti (52)</a></li>
                                    <li><a href="#tab2" data-toggle="tab" class="text-dark">Attivi (22)</a></li>
                                    <li><a href="#tab3" data-toggle="tab" class="text-dark">In sospeso (20)</a></li> 
                                </ul> 

                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="border-0">
                                <div class="tab-content">

                                    <div class="tab-pane userprof-tab active" id="tab-7">

                                        <div class="mail-option"> 
                                            <!--
                                            <div class="chk-all"> <div class="btn-group"> <a data-toggle="dropdown" href="#" class="btn mini all" aria-expanded="false"> Bulk Actions <i class="fa fa-angle-down "></i> </a> <ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 24px, 0px); top: 0px; left: 0px; will-change: transform;"> <li><a href="#">Bulk Action</a></li> <li><a href="#">Edit</a></li> <li><a href="#">Move to Trash</a></li> </ul> </div> </div> 
                                            -->                                        
                                            <div class="btn-group hidden-phone"> <a href="#" class="btn btn-outline-primary" aria-expanded="false"> <i class="fa fa-user-plus"></i> Invita </a> </div>
                                            <!-- div class="btn-group hidden-phone"> <a href="#" class="btn" aria-expanded="false"> Filter </a> </div --> 
                                            
                                            <ul class="unstyled inbox-pagination text-dark"> <li><span>1-10 of 52 membri</span></li> <li> <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a> </li> </ul> 

                                        </div>

                                        <div class="table-responsive border-top">

                                            <table v-if="groupMembers" class="table card-table table-bordered table-hover table-vcenter text-nowrap">
                                                <tbody>
                                                    <tr>
                                                        <th></th>
                                                        <th>Nome</th>
                                                        <th>Ruolo</th>
                                                        <th>Status</th>
                                                        <th>Ordini</th>
                                                        <th>Iscritto da</th>
                                                        <th></th>
                                                    </tr>
                                                    <tr v-for="(member, index) in groupMembers">
                                                        <td class="">
                                                            <span v-if="member.image" class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span>
                                                            <span v-else class="avatar avatar-md brround cover-image mr-3 h-100">
                                                                {{ initial(member.username) }}
                                                                <span class="avatar-status "></span>
                                                                <!-- bg-yellow bg-green bg-red -->
                                                            </span>
                                                        </td>

                                                        <td>
                                                            <span class="text-dark">{{ member.username }}</span>
                                                        </td>
                                                        
                                                        <td>
                                                            <span v-if="index === 0" class="text-dark">Amministratore</span>
                                                            <span v-else class="text-dark">Membro</span>
                                                        </td>

                                                        <td>
                                                            <span v-if="index % 2 === 0" class="text-success">Attivo</span>
                                                            <span v-else class="text-warning">In attesa</span>
                                                        </td>

                                                        <!-- td>
                                                            <span v-if="index % 2 === 0" class="badge badge-success">Attivo</span>
                                                            <span v-else class="badge badge-warning">In attesa</span>
                                                        </td -->

                                                        <td> 10 </td>

                                                        <td>{{ dateSimple(member.subscriptionDate) }}</td>

                                                        <td>
                                                            <a class="btn btn-purple btn-sm text-white" title="scrivi"><i class="fa fa-envelope"></i></a>
                                                            <gb:ifGroupOwner groupId="${groupId}">
                                                                <a class="btn btn-danger btn-sm text-white" title="elimina"><i class="fa fa-trash-o"></i></a>
                                                            </gb:ifGroupOwner>
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

                    <ul class="pagination mb-5"> <li class="page-item page-prev disabled"> <a class="page-link" href="#" tabindex="-1">Prev</a> </li> <li class="page-item active"><a class="page-link" href="#">1</a></li> <li class="page-item"><a class="page-link" href="#">2</a></li> <li class="page-item"><a class="page-link" href="#">3</a></li> <li class="page-item"><a class="page-link" href="#">4</a></li> <li class="page-item"><a class="page-link" href="#">5</a></li> <li class="page-item page-next"> <a class="page-link" href="#">Next</a> </li> </ul>

                </div>
            </div>
        </div>
    </section>
    <!-- /Group -->

    <section class="sptb bg-white border-top"> <div class="container"> <div class="row"> <div class="col-lg-7 col-xl-6 col-md-12"> <div class="sub-newsletter"> <h3 class="mb-2"><i class="fa fa-paper-plane-o mr-2"></i> Subscribe To Our Newsletter</h3> <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p></div> </div> <div class="col-lg-5 col-xl-6 col-md-12"> <div class="input-group sub-input mt-1"> <input type="text" class="form-control input-lg " placeholder="Enter your Email"> <div class="input-group-append "> <button type="button" class="btn btn-primary btn-lg br-tr-3  br-br-3"> Subscribe </button> </div> </div> </div> </div> </div> </section>
    
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
                async fetchGroupMembers() {
                    this.fetchGroupMembersAction({service: groupService, groupId: this.groupId })
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
                initial(string, numChars = 2) {
                    return string.substring(0, numChars).toUpperCase();
                },
            },
        })        
    </script>

</body>
</html>