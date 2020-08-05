<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="claylist"/>
	<s2ui:title messageCode='spring.security.ui.login.title'/>
	<asset:stylesheet src='spring-security-ui-auth.css'/>
</head>
<body>

    <g:render template="/navigation/theme-topbar" />

	<g:render template="/navigation/theme-nav" />

    <!--Sliders Section-->
    <section>
        <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            <div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Login</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Sliders Section-->

    <!--Login-Section-->
    <section class="sptb">
        <div class="container customerpage">
            <div class="row">
                <div class="col-lg-5 col-xl-4 col-md-6 d-block mx-auto">
                    <div class="row">
                        <div class="col-xl-12 col-md-12 col-md-12 register-right">
                            <ul class="nav nav-tabs nav-justified mb-5 p-2 border" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active m-1" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link m-1" id="profile-tab" data-toggle="tab" href="${createLink(controller:'register', action:'register')}" role="tab" aria-controls="profile" aria-selected="false">Register</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="single-page  w-100  p-0">
                                        <div class="wrapper wrapper2">
                                            <s2ui:form type='login' focus='username' id="login" class="card-body" tabindex="500">
                                            <!-- form id="login" class="card-body" tabindex="500" -->
                                                <h3 class="pb-2"><g:message code='spring.security.ui.login.signin'/></h3>
                                                <!--h3 class="pb-2">Login</h3-->

                                                <div class="mail">
                                                    <input type="text" name="${securityConfig.apf.usernameParameter}" id="username" />
                                                    <!-- input type="email" name="mail" -->
                                                    <label><g:message code='spring.security.ui.login.username'/></label>
                                                    <!-- label>Mail or Username</label -->
                                                </div>
                                                <div class="passwd">
                                                    <input type="password" name="${securityConfig.apf.passwordParameter}" id="password" />
                                                    <!-- input type="password" name="password" -->
                                                    <label><g:message code='spring.security.ui.login.password'/></label>
                                                    <!-- label>Password</label -->
                                                </div>
                                                <div class="rememberme">
                                                    <div class="custom-controls-stacked d-md-flex">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked" value="checkbox">
                                                            <span class="custom-control-label"><g:message code='spring.security.ui.login.rememberme'/></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="submit">
                                                    <!-- a class="btn btn-primary btn-block" href="index.html">Login</a -->
                                                    <!-- s2ui:submitButton class='btn btn-primary btn-block' elementId='loginButton' messageCode='spring.security.ui.login.login'/ -->
                                                    <input type="submit" value="${message(code:'spring.security.ui.login.login')}" id="loginButton_submit" class="btn btn-primary btn-block">
                                                    
                                                </div>
                                                <p class="mb-2"><g:link controller='register' action='forgotPassword'><g:message code='spring.security.ui.login.forgotPassword'/></g:link></p>
                                                <!-- p class="mb-2"><a href="forgot.html" >Forgot Password</a></p -->
                                                <p class="text-dark mb-0"><g:link controller='register' action='register'><g:message code='spring.security.ui.login.register'/></g:link></p>
                                                <!-- p class="text-dark mb-0">Don't have account?<a href="register.html" class="text-primary ml-1">Sign UP</a></p -->

                                            <!-- /form -->
                                            </s2ui:form>
                                            <hr class="divider">
                                            <div class="pt-3 pb-3">
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
                                            </div>                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                    <div class="single-page w-100  p-0">
                                        <div class="wrapper wrapper2">
                                            <form id="Register" class="card-body" tabindex="500">
                                                <h3 class="pb-1">Register</h3>
                                                <div class="name">
                                                    <input type="text" name="name">
                                                    <label>Name</label>
                                                </div>
                                                <div class="mail">
                                                    <input type="email" name="mail">
                                                    <label>Mail or Username</label>
                                                </div>
                                                <div class="passwd">
                                                    <input type="password" name="password">
                                                    <label>Password</label>
                                                </div>

                                                
                                                <div class="submit">
                                                    <a class="btn btn-primary btn-block" href="index.html">Register</a>
                                                </div>
                                                <p class="text-dark mb-0">Already have an account?<a href="login.html" class="text-primary ml-1">Sign In</a></p>
                                            </form>
                                            <hr class="divider">
                                            <div class="pt-3 pb-3">
                                                <div class="text-center">
                                                    <div class="btn-group mt-2 mb-2">
                                                        <a href="https://www.facebook.com/" class="btn btn-icon  brround">
                                                            <span class="fa fa-facebook"></span>
                                                        </a>
                                                    </div>
                                                    <div class="btn-group mt-2 mb-2">
                                                        <a href="https://www.google.com/gmail/" class="btn btn-icon brround">
                                                            <span class="fa fa-google"></span>
                                                        </a>
                                                    </div>
                                                    <div class="btn-group mt-2 mb-2">
                                                        <a href="https://twitter.com/" class="btn btn-icon brround">
                                                            <span class="fa fa-twitter"></span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
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
    <!--/Login-Section-->

</body>
</html>
