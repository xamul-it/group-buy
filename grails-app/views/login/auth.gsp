<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="claylist"/>
    <title>${message(code:'spring.security.ui.login.title')}</title>
</head>
<body>

    <!--Sliders Section-->
    <g:render template="/common/theme-header" model="['headerTitle':message(code:'spring.security.ui.login.title')]"/>
    <!--/Sliders Section-->

    <!--Login-Section-->
    <section class="sptb">
        <div class="container customerpage">
            <div class="row">
                <div class="col-lg-5 col-xl-4 col-md-6 d-block mx-auto">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-md-12 register-right">
                            
                            <div class="single-page  w-100  p-0">
                                <div class="wrapper wrapper2" id="v-login-auth-app">

                                <!-- Vue -->
                                    <!-- style="background-color:#ffcccc" -->
                                    <v-login-auth 
                                        :urls="{
                                                'registerUrl':'<g:createLink controller="register" action="register" />',
                                                'forgotPasswordUrl':'<g:createLink controller="register" action="forgotPassword" />'
                                                }"
                                        :input-params="{
                                                    'loginSignin':'${message(code:'spring.security.ui.login.signin')}',
                                                    'loginUsername':'${message(code:'spring.security.ui.login.username')}',
                                                    'loginPassword':'${message(code:'spring.security.ui.login.password')}',
                                                    'loginRememberMe':'${message(code:'spring.security.ui.login.rememberme')}',
                                                    'loginLogin':'${message(code:'spring.security.ui.login.login')}',
                                                    'loginforgotPassword':'${message(code:'spring.security.ui.login.forgotPassword')}',
                                                    'loginRegister':'${message(code:'spring.security.ui.login.register')}',
                                                    'usernameParameter':'${securityConfig.apf.usernameParameter}', 
                                                    'passwordParameter':'${securityConfig.apf.passwordParameter}',
                                                    'rememberMeParameter':'${securityConfig.rememberMe.parameter}'
                                                    }"
                                        v-slot:default="sp">
                                    </v-login-auth>
                                <!-- /Vue -->

                                    <!-- hr class="divider" -->
									<%/* div class="pt-3 pb-3">
										<div class="text-center">
											<div class="btn-group mt-2 mb-2">
												<a href="https://www.facebook.com/" class="btn btn-icon brround">
													<span class="fa fa-facebook"></span>
												</a>
											</div>
											<div class="btn-group mt-2 mb-2">
												<a href="https://www.google.com/gmail/" class="btn btn-icon brround">
													<span class="fa fa-google"></span>
												</a>
											</div>
											<div class="btn-group mt-2 mb-2">
												<a href="https://twitter.com/" class="btn  btn-icon brround">
													<span class="fa fa-twitter"></span>
												</a>
											</div>
										</div>
									</div */%>                                            
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Login-Section-->

    <g:render template="/includes/js-vuelidate-js"/>

    <!-- Vue Pages and Components here -->
    <script src="/assets/vue/v-login/auth.vue.js"></script>

    <script>
        Vue.use(window.vuelidate.default);
        
        // Register a global custom directive called `v-focus`
        Vue.directive('focus', {
            // When the bound element is inserted into the DOM...
            inserted: function (el) {
                // Focus the element
                el.focus()
            }
        })

        var app = new Vue({
            el: '#v-login-auth-app',
            components: {
                'v-login-auth': VLoginAuth,
            },
            data: {
            },
        })        
    </script>

</body>
</html>
