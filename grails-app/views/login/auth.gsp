<!DOCTYPE html>
<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
    <head>
        <meta name="layout" content="angular"/>
    </head>

    <body id="ng-app" ng-app="ui.fatturasprint.main" ng-controller="FsDashboardController">
        <div id="fullscreen_bg" class="fullscreen_bg  w-50 p-3"/>
            <s2ui:form type='login' focus='username'>
                <h1 class="form-signin-heading text-muted">
                    <g:message code='spring.security.ui.login.signin'/>
                </h1>
                <input name="${securityConfig.apf.usernameParameter}" type="text" class="form-control"
                       placeholder="Username" required="" autofocus=""/>
                <input name="${securityConfig.apf.passwordParameter}" type="password" class="form-control"
                       placeholder="Password" required=""/>


                    <div class="row col-sm-4 form-group">
                        <input type="checkbox" name="${securityConfig.rememberMe.parameter}"
                               id="remember_me" checked="checked"/>
                        <label for='remember_me'>
                            <g:message code='spring.security.ui.login.rememberme'/>
                        </label>
                    </div>
                <div class="row col-sm-4 form-group">
                    <span class="forgot-link">
                        <g:link controller='register' action='forgotPassword'>
                            <g:message code='spring.security.ui.login.forgotPassword'/>
                        </g:link>
                    </span>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <s2ui:linkButton class="btn btn-lg btn-primary btn-block" elementId='register'
                                         controller='register'
                                         messageCode='spring.security.ui.login.register'/>
                    </div>
                    <div class="col-sm-4">
                        <s2ui:submitButton class="btn btn-lg btn-primary btn-block"
                                           elementId='loginButton' messageCode='spring.security.ui.login.login'/>
                    </div>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign In
                </button>
            </s2ui:form>
        </div>
    </body>
</html>