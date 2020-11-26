<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppo di acquisto - Iscritti</title>

    <!-- vuex store -->
    <script type="module" src="/assets/vue/v-store/group-store.js"></script>
    <!-- actions -->
    <script type="module" src="/assets/vue/v-store/group-actions.js"></script>
    <!-- alerts -->
    <script type="module" src="/assets/vue/v-services/toast.js"></script>
    <!-- vue form validation -->
	<script src="/assets/vue/v-jslib/vuelidate@0.7.5/vuelidate.min.js"></script>
	<script src="/assets/vue/v-jslib/vuelidate@0.7.5/validators.min.js"></script>

</head>
<body>

    <!--Sliders Section-->
    <g:render template="/common/theme-header" model="['headerTitle':'Iscritti al gruppo']"/>
    <!--/Sliders Section-->

    <!-- Group -->
    <section class="sptb">
        <div class="container" id="v-group-members-app" v-cloak>
            <v-modal ref="memberInviteModal" :click-to-close="false">
                <template v-slot:header>
                    <h5 class="modal-title"> <i class="fa fa-user-plus mr-1"></i> Invita a partecipare </h5>
                </template>
                <template v-slot:body>
                    <form>
                        <p>
                            Inserisci l'indirizzo e-mail del destinatario per inviare l'invito. 
                        </p> 
                        <div class="form-group">
                            <input type="text" class="form-control" id="recipient-name" placeholder="Email"
                                v-model="newMemberEmail"
                                @input="$v.newMemberEmail.$touch()">

                                <!-- alerts -->
                                <div v-if="!$v.newMemberEmail.email && $v.newMemberEmail.minLength" class="alert alert-danger" role="alert">
                                    Inseirisci un indirizzo email corretto.
                                </div>
                                <pre v-if="isDebug">{{ $v.newMemberEmail }}</pre>

                                <div class="form-group">
                                    <label for="message-text" class="form-control-label">Messagggio:</label> 
                                    <textarea v-model="newMemberMessage" class="form-control" id="message-text"></textarea>
                                </div>
                                
                        </div>
                    </form>
                </template>
                <template v-slot:footer>
                    <a type="button" :class="{disabled:$v.$invalid}"
                        class="btn btn-primary text-white"
                        @click="inviteToGroup()"
                        :title="$v.$invalid?'Inserisci un indirizzo email':'Invia'">Invia</a> 
					<a type="button" class="btn btn-secondary" @click="$refs.memberInviteModal.closeModal()">Annulla</a> 
                </template>
            </v-modal>
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

                    <div class="panel panel-primary">
                        <div>
                            <div class="user-tabs mb-4">
                                <sec:ifLoggedIn>
                                    <gb:ifGroupOwner groupId="${groupId}">			
                                    <!-- Filtri --> 
                                    <ul class="nav panel-tabs">
                                        <li class=""><a @click="groupStatusId = -1" class="btn" :class="{ 'active btn-orange': groupStatusId == -1 }">Tutti</a></li>
                                        <li><a @click="groupStatusId = 0" class="btn" :class="{ 'active btn-orange text-white': groupStatusId == 0 }">Attivi</a></li>
                                        <li><a @click="groupStatusId = 1" class="btn" :class="{ 'active btn-orange text-white': groupStatusId == 1 }">In sospeso</a></li> 
                                    </ul>
                                    </gb:ifGroupOwner>
                                </sec:ifLoggedIn>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <div class="border-0">
                                <div class="tab-content">

                                    <div class="tab-pane userprof-tab active" id="tab-7">

                                        <div class="mail-option"> 
                                            <sec:ifLoggedIn>
												<div v-if="groupItem.administrator || groupItem.member" class="btn-group"> <a @click="$refs.memberInviteModal.openModal()" class="btn btn-outline-primary" aria-expanded="false"> <i class="fa fa-user-plus"></i> Invita </a> </div>
                            				</sec:ifLoggedIn>
                                            <ul class="unstyled inbox-pagination text-dark">
                                                <li> <span>1-{{membersCount}} di {{membersTotal}}</span> </li> 
                                                <!-- li> <a class="np-btn" href="#"><i class="fa fa-angle-right pagination-right"></i></a> </li --> 
                                            </ul> 
                                        </div>

                                        <div class="table-responsive border-top">

                                            <table v-if="groupMembers" class="table card-table table-bordered table-hover table-vcenter text-nowrap">
                                                <tbody>
                                                    <tr>
                                                        <th></th>
                                                        <th>Nome</th>
                                                        <!-- th>Ruolo</th -->
                                                        <sec:ifLoggedIn>
                                                            <th>Stato</th>
                                                        </sec:ifLoggedIn>
                                                        <!-- th>Ordini</th -->
                                                        <th>Iscritto da</th>
                                                        <sec:ifLoggedIn>
                                                            <th></th>
                                                        </sec:ifLoggedIn>
                                                    </tr>
                                                    <tr v-for="(member, index) in groupMembers">
                                                        <td class="">
                                                            <span v-if="member.image" class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span>
                                                            <span v-else class="avatar avatar-md brround cover-image mr-3 h-100">
                                                                {{ initial(member.username) }}
                                                                <span class="avatar-status " :class="memberStatusBgClass(member.status)"></span>
                                                            </span>
                                                        </td>

                                                        <td>
                                                            <span class="text-dark">{{ member.username }}</span>
                                                        </td>
                                                        
                                                        <!-- td>
                                                            <span class="text-dark">...</span>
                                                        </td -->

                                                        <sec:ifLoggedIn>
                                                            <td>
                                                                <span :class="memberStatusTextClass(member.status)">{{ memberStatus(member.status) }}</span>
                                                            </td>
                                                        </sec:ifLoggedIn>

                                                        <!-- td> # </td -->

                                                        <td>{{ dateSimple(member.subscriptionDate) }}</td>

                                                        <sec:ifLoggedIn>
                                                        <td>
                                                            <gb:ifGroupOwner groupId="${groupId}">
                                                                <a v-if="member.status!=0" class="btn btn-success btn-sm text-white" title="Attiva"><i class="fa fa-check"></i></a>
                                                                <a v-if="member.status!=2 && member.status!=3 && member.status!=1" class="btn btn-primary btn-sm text-white" title="Sospendi"><i class="fa fa-clock-o"></i></a>
                                                                <a v-if="member.status!=3" class="btn btn-info btn-sm text-white" title="Cancella"><i class="fa fa-times"></i></a>
                                                            </gb:ifGroupOwner>
                                                        </td>
                                                        </sec:ifLoggedIn>
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
                    :total="membersTotal"
                    :per-page="2"
                    :current-page="currentPage"
                    @pagechanged="onPageChange"
                    />

                </div>
            </div>
        </div>
    </section>
    <!-- /Group -->

    <section class="sptb bg-white border-top"> 
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-xl-6 col-md-12">
                    <div class="sub-newsletter"> 
                        <h3 class="mb-2"><i class="fa fa-paper-plane-o mr-2"></i> Subscribe To Our Newsletter</h3> <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor</p></div> </div> <div class="col-lg-5 col-xl-6 col-md-12"> <div class="input-group sub-input mt-1"> <input type="text" class="form-control input-lg " placeholder="Enter your Email"> <div class="input-group-append "> <button type="button" class="btn btn-primary btn-lg br-tr-3  br-br-3"> Subscribe </button> </div> 
                    </div> 
                </div>
            </div> 
        </div>
    </section>
    
    <!-- Vue Pages and Components here -->
    <script type="module" src="/assets/vue/v-services/group-rest.js"></script>
    <script type="module" src="/assets/vue/v-services/toast.js"></script>

    <script type="module" src="/assets/vue/v-group/group-member-status-mixin.js"></script>

    <script src="/assets/vue/v-common/pagination.vue.js"></script>

    <script type="module">
        import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
        import * as gms from '/assets/vue/v-group/group-member-status-mixin.js';

        import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
        import { store } from '/assets/vue/v-store/group-store.js';

        //vuelidate
        Vue.use(window.vuelidate.default);
        const { required, minLength, email } = window.validators;

        var GroupMembersApp = new Vue({
            el: '#v-group-members-app',
            name: "GroupMembers",
            mixins: [dh.dateHelperMixin, gms.groupMemberStatusMixin],
            components: {
                'v-modal': VModal,
                'pagination': VPagination,
            },
            store,
            data: {
                groupId: ${groupId},
                groupStatusId: 0,
                currentPage: 1,
                newMemberEmail: '',
                newMemberMessage: 'Partecipa al gruppo d\'acquisto',
            },
            validations: {
                newMemberEmail: {
                    required,
                    email,
                    minLength: minLength(3),
                },
            },
            computed: {
                //all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
                    'group.groupItem',
                    'group.groupMembers',
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
                membersCount() {
                    if(_.isArray(this.groupMembers))
                        return _.size(this.groupMembers);
                    else
                        return -1;
                },
                membersTotal() {
                    return this.total;
                },
                isDebug: function () {
                    return this.debug
                },
            },
            async mounted() {
                this.debug = ${isDebug};
                //will execute at pageload
                this.max=2
                if(this.groupId>0) {
                    await this.fetchGroup()
                    this.fetchGroupMembers(this.groupStatusId);
                }
            },
            watch: {
                currentPage: function(newPage, oldPage) {
                    if(newPage > oldPage)
                        this.offset = this.max * oldPage
                    else if(newPage < oldPage)
                        this.offset = this.max * (newPage -1)

                    this.fetchGroupMembers(this.groupStatusId)
                },
                groupStatusId: async function(newId, oldId) {
                    if(newId != oldId) {
                        await this.fetchGroupMembers(this.groupStatusId)
                        this.currentPage = 1
                    }
                },
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
                    'fetchGroupMembersAction',
                    'inviteToGroupAction'
                ]),
                async inviteToGroup() {
                    await this.inviteToGroupAction({service: groupService, groupId: this.groupId, invite: { email: this.newMemberEmail, inviteText: this.newMemberMessage }})
                    this.$refs.memberInviteModal.closeModal()
                    this.newMemberEmail = ''
                    this.newMemberMessage = 'Partecipa al gruppo d\'acquisto'
                },
                inviteNewMember() {
                    this.success = "Invito inviato a "+ this.newMemberEmail
                    this.newMemberEmail = ''
                    this.$refs.memberInviteModal.closeModal()
                },
                async fetchGroup() {
                    this.fetchGroupAction({service: groupService, groupId: this.groupId});
                },
                async fetchGroupMembers(groupStatusId = -1) {
                    await this.fetchGroupMembersAction({service: groupService, groupId: this.groupId, groupStatusId })
                },
                initial(string, numChars = 2) {
                    return string.substring(0, numChars).toUpperCase();
                },
                onPageChange(page) {
                    console.log(page)
                    this.currentPage = page;
                },
            },
        })        
    </script>

</body>
</html>