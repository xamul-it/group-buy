<html>
<head>
	<meta name="layout" content="claylist"/>
	<title>${message(code:'spring.security.ui.register.title')}</title>
	<%
		//See: https://github.com/grails-plugins/grails-spring-security-ui/blob/master/plugin/grails-app/taglib/grails/plugin/springsecurity/ui/SecurityUiTagLib.groovy
		pageScope.s2uiBeanType = 'registerCommand'
		pageScope.s2uiBean = pageScope['registerCommand']

		usernameError = registerCommand?.errors['username']!=null ? true : false
		usernameErrorUnique = registerCommand?.errors['username']?.codes.find{s -> s.contains('unique')}!=null ? true : false
		emailError = registerCommand?.errors['email']!=null ? true : false
		passwordError = registerCommand?.errors['password']!=null ? true : false
	%>
</head>
<body>
	
	<div id="v-login-auth-app" vcloak>

		<!--Sliders Section-->
		<g:render template="/common/theme-header" model="['headerTitle':message(code:'spring.security.ui.register.title')]"/>
		<!--/Sliders Section-->

		<!--Register-Section-->
		<section class="sptb">
			<div class="container customerpage">
				<div class="row">
					<div class="col-lg-5 col-xl-4 col-md-6 d-block mx-auto">
						<div class="row">
							<div class="col-xl-12 col-md-12 col-md-12 register-right">

								<div class="single-page  w-100  p-0">
									<div class="wrapper wrapper2">
										<g:if test='${emailSent}'>
											<br/>
											<p class="text-dark mb-0">
												<g:message code='spring.security.ui.register.sent'/>
											</p>
											<br/>
										</g:if>
										<g:else>
											<v-register-register
												:urls="{
														'registerUrl':'<g:createLink controller="register" action="register" />',
														'loginUrl':'<g:createLink controller="login" action="auth" />'
														}"
												:input-params="{
															'registerHeader':'${message(code:'spring.security.ui.register.header')}',
															'loginUsername':'${message(code:'spring.security.ui.login.username')}',
															'registerEmail':'E-mail',
															'loginPassword':'${message(code:'spring.security.ui.login.password')}',
															'registerPasswordAgain':'${message(code:'spring.security.ui.login.password')} (again)',
															'registerSubmit':'${message(code:'spring.security.ui.register.submit')}',
															'loginforgotPassword':'${message(code:'spring.security.ui.login.forgotPassword')}',
															'loginRegister':'${message(code:'spring.security.ui.login.register')}',
															'usernameParameter':'${securityConfig.apf.usernameParameter}',
															'emailParameter':'email',
															'passwordParameter':'${securityConfig.apf.passwordParameter}',
															'passwordAgainParameter':'password2',
															}"
												:errors="{
														'usernameError':${usernameError},
														'usernameErrorUnique':${usernameErrorUnique},
														'emailError':${emailError},
														'passwordError':${passwordError},
												}"
												:input-fields="{
													'username':'${registerCommand.username}',
													'email':'${registerCommand.email}',
												}"
												>
											</v-register-register>
										</g:else>

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
		<!--/Register-Section-->

	</div>

	<g:render template="/includes/js-vuelidate-js"/>

	<script src="https://cdn.jsdelivr.net/npm/zxcvbn@4.4.2/dist/zxcvbn.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue-password-strength-meter@1.7.2/dist/vue-password-strength-meter.js"></script>

    <!-- Vue Pages and Components here -->
    <script src="/assets/vue/v-register/register.vue.js"></script>

    <script>
        Vue.use(window.vuelidate.default);

		Vue.component('password', Password);

        var app = new Vue({
            el: '#v-login-auth-app',
            components: {
				'register-register': VRegisterRegister,
            },
            data: {
            },
        })
    </script>

</body>
</html>
