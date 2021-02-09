<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Profilo utente</title>
    </head>
    <body>

        <div id="v-user-app" v-cloak>

            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Profilo utente']"/>
            <!--/Sliders Section-->

            <!-- User Dashboard -->
            <section class="sptb">
                <div class="container">

                    <div class="row">
                        <div class="col-xl-3 col-lg-12 col-md-12">
                            
                            <g:render template="user-side" />

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
                                                <input class="form-control"
                                                        readonly="readonly"
                                                        type="text" 
                                                        placeholder="Nome" 
                                                        v-model="userItem.username">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-6">
                                            <div class="form-group"> 
                                                <label class="form-label">E-mail</label> 
                                                <input class="form-control"
                                                        type="email" 
                                                        placeholder="Email" 
                                                        v-model="userItem.email"
                                                        autocomplete="off"
                                                        @focus="$v.userItem.email.$touch()">

                                                <p class="input-alert" v-if="!$v.userItem.email.email && $v.userItem.email.$error">Si prega di fornire un indirizzo e-mail valido.</p>
                                                <p class="input-alert" v-if="!$v.userItem.email.required && $v.userItem.email.$error">Questo campo non deve essere vuoto.</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="card-footer"> 
                                    <button type="submit" class="btn btn-primary" @click="saveUser">Aggiorna profilo</button>
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
            import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

            import * as userService from '/assets/vue/v-services/user-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/user-store.js';

            Vue.use(window.vuelidate.default);
            const { required, minLength, maxLength, email, sameAs, not } = window.validators;

            var UserApp = new Vue({
                el: '#v-user-app',
                name: 'User',
                mixins: [ah.alertHelperMixin],
                store,
                data: {
                    //userId: ${userId},
                },
                validations: {
                    userItem: {
                        username: {
                            required,
                            minLength: minLength(5),
                            maxLength: maxLength(64),
                        },
                        email:  {
                            required,
                            email,
                        },
                        password: {
                            required,
                            minLength: minLength(8),
                            maxLength: maxLength(64),
                            isNotSameAsUsername: not(sameAs("username")),
                            isNotSameAsEmail: not(sameAs("email")),
                        },
                        password2: {
                            sameAs: sameAs((vm) => {
                                return vm.password;
                            }),
                        },
                    },
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
                    error: function (error) {
                        toastService.alertDanger(this.fetchError(error))
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                    userItem: function(newUserItem, oldUserItem) {
                        //this.$v.userItem.$touch()
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
                        this.saveUserAction({service: userService, userId: this.userItem.id, userItem: this.userItem});
                    },
                },
            })        
    </script>

    </body>
</html>