<html>
<head>
	<meta name="layout" content="claylist"/>
    <title>${message(code:'spring.security.ui.forgotPassword.title')}</title>
	<%
		//See: https://github.com/grails-plugins/grails-spring-security-ui/blob/master/plugin/grails-app/taglib/grails/plugin/springsecurity/ui/SecurityUiTagLib.groovy
		pageScope.s2uiBeanType = 'forgotPasswordCommand'
		pageScope.s2uiBean = pageScope['forgotPasswordCommand']

		usernameError = forgotPasswordCommand?.errors['username']!=null ? true : false
		usernameErrorNotFound = forgotPasswordCommand?.errors['username']?.codes.find{s -> s.contains('notFound')}!=null ? true : false
		usernameErrorNoEmail = forgotPasswordCommand?.errors['username']?.codes.find{s -> s.contains('noEmail')}!=null ? true : false
	%>
</head>
<body>

	<div id="v-register-forgot-password-app" vcloak>

		<!--Sliders Section-->
		<g:render template="/common/theme-header" model="['headerTitle':message(code:'spring.security.ui.forgotPassword.title')]"/>
		<!--/Sliders Section-->

		<!--ForgotPassword-Section-->
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
												<g:message code='spring.security.ui.forgotPassword.sent'/>	
											</p>
											<br/>
										</g:if>
										<g:else>
										<!-- Vue -->
											<v-register-forgot-password
												:urls="{
														'loginAuthUrl':'<g:createLink controller="login" action="auth" />',
														}"
												:input-params="{
														'forgotPasswordDescription':'${message(code:'spring.security.ui.forgotPassword.description', encodeAs:'JavaScript')}',
														'loginUsername':'${message(code:'spring.security.ui.login.username')}',
														'forgotPasswordSubmit':'${message(code:'spring.security.ui.forgotPassword.submit')}',
														'loginforgotPassword':'${message(code:'spring.security.ui.login.forgotPassword')}',
														'loginRegister':'${message(code:'spring.security.ui.login.register')}',
														'usernameParameter':'${securityConfig.apf.usernameParameter}', 
												}"
												:errors="{
														'usernameError':${usernameError},
														'usernameErrorNotFound':${usernameErrorNotFound},
														'usernameErrorNoEmail':${usernameErrorNoEmail},
												}"
												:input-fields="{
														'username':'${forgotPasswordCommand.username}',
														'synchronizerToken':'<gb:synchronizerToken/>',
														'synchronizerUri':'${request.forwardURI}',
												}"
												>
											</v-register-forgot-password>
										<!-- /Vue -->
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
		<!--/ForgotPassword-Section-->
		
	</div>

    <g:render template="/includes/js-vuelidate-js"/>

    <!-- Vue Pages and Components here -->
    <script src="/assets/vue/v-register/forgot-password.vue.js"></script>

    <script>
        Vue.use(window.vuelidate.default);

        var app = new Vue({
            el: '#v-register-forgot-password-app',
            components: {
                'v-register-forgot-password': VRegisterForgotPassword,
            },
            data: {
            },
        })        
    </script>

</body>
</html>
