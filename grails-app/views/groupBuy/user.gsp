<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Profilo utente</title>
    </head>
    <body>

        <div id="v-user-app" vcloak>

            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Profilo utente']"/>
            <!--/Sliders Section-->

            <!-- User Dashboard -->
            <section class="sptb">
                <div class="container">

                    <div class="row">
                        <div class="col-xl-3 col-lg-12 col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Dashboard</h3>
                                </div>
                                <div class="card-body text-center item-user border-bottom">
                                    <div class="profile-pic">
                                        <div class="profile-pic-img"> <span class="bg-success dots" data-toggle="tooltip"
                                                data-placement="top" title="" data-original-title="online"></span> <img
                                                src="../../assets/theme/img/faces/user-placeholder.jpg" class="brround" alt="user"> 
                                            </div>
                                            <div class="text-dark">
                                                <h4 v-if="userItem" class="mt-3 mb-0 font-weight-semibold">{{userItem.username}}</h4>
                                            </div>
                                    </div>
                                </div>

                                <g:render template="/navigation/theme-user-side-nav" />

                            </div>

                        </div>

                        <div class="col-xl-9 col-lg-12 col-md-12">
                            <div class="card mb-0">
                                <div class="card-header">
                                    <h3 class="card-title">Gestisci il tuo profilo</h3>
                                </div>
                                <div class="card-body">
                                    <div v-if="userItem" class="row">

                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group"> 
                                                <label class="form-label">Nome utente</label> 
                                                <input type="text" class="form-control" placeholder="Nome" v-model="userItem.username">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group"> 
                                                <label class="form-label">E-mail</label> 
                                                <input type="email" class="form-control" placeholder="Nome" v-model="userItem.email">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-footer"> <button type="submit" class="btn btn-primary" v-on:click="saveUser">Aggiorna profilo</button>
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
            import * as userService from '/assets/vue/v-services/user-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/user-store.js';

            Vue.use(window.vuelidate.default);

            var UserApp = new Vue({
                el: '#v-user-app',
                name: 'User',
                mixins: [],
                store,
                data: {
                    //userId: ${userId},
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'user.userItem',
                        'error',
                        'success',
                        'debug',
                        'loading',
                    ]),
                    isDebug: function () {
                        return this.debug
                    },
                },
                mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    this.fetchUser();
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
                        'saveUserAction'
                    ]),
                    async fetchUser() {
                        await this.fetchUserAction({service: userService});
                    },
                    async saveUser() {
                        this.saveUserAction({service: userService, userId: this.userItem.userId, userItem: this.userItem});
                    },
                },
            })        
    </script>

    </body>
</html>