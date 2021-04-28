<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Benvenuto</title>
    </head>
    <body>

        <div id="v-user-app" v-cloak>

            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Benvenuto']"/>
            <!--/Sliders Section-->

            <!-- User Dashboard -->
            <section class="sptb">
                <div class="container">

                    <div class="row">
                        <div class="col-xl-3 col-lg-12 col-md-12">
                            
                            <g:render template="user-side" />

                        </div>

                        <div class="col-xl-9 col-lg-12 col-md-12">

                                <div class="card">
                                    <div class="card-body">

                                        <div class="jumbotron">
                                            <h1>Benvenuto in Proprioqui</h1>
                                            <p class="lead">
                                                Il luogo in cui fare la spesa in gruppo sotto casa, o dai negozi e produttori di fiducia.
                                                <br/>
                                                Un servizio gratuito e facile, che permetterà a chi compra di gestire l’ordine secondo le proprie esigenze.
                                                <br/>
                                                E a chi vende di inserirsi in un circuito virtuoso che li porterà lontano, grazie al passa parola dei i clienti.  
                                            </p>
                                            <!-- p class="lead m-0"> 
                                                <a href="#" class="btn btn-primary btn-lg text-white" role="button">Inizia subito</a>
                                            </p -->
                                        </div>

                                    </div>

                                </div>

                                <div class="card">
                                    <!-- div class="card-header">
                                        <h3 class="card-title">Gestisci il tuo profilo</h3>
                                    </div -->
                                    <!-- div class="card-body">
                                        
                                    </div -->
                                    <div class="card-footer"> 
                                        <a href="/negozi" class="btn btn-secondary">Trova negozi vicino a te</a>
                                        <a href="/gruppi" class="btn btn-blue" >Partecipa ai gruppi</a>
                                        <a href="/gruppo/nuovo" class="btn btn-cyan" >Crea il tuo gruppo</a>
                                    </div>

                                </div>
                                
                        </div>
                    </div>
                </div>
            </section>
            <!--/User Dashboard -->
        
        </div>
        
        <script type="module">
            import * as ah from '/assets/vue/v-common/alert-helper-mixin.js';

            import * as userService from '/assets/vue/v-services/user-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';

            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/user-store.js';

            //require vuelidate

            var UserApp = new Vue({
                el: '#v-user-app',
                name: 'User',
                mixins: [ah.alertHelperMixin],
                components: {
			    },
                store,
                data: {
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
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchUserAction',
                    ]),
                    async fetchUser() {
                        await this.fetchUserAction({service: userService});
                    },
                },
            })        
    </script>

    </body>
</html>