<!DOCTYPE html>
<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
    <meta name="layout" content="angular"/>
</head>

<body>
    <s2ui:form type='login' focus='username'>
        <div class="col-md-4 col-md-offset-4">
        <h1 class="form-signin-heading text-muted">
            <g:message code='spring.security.ui.login.signin'/>
        </h1>
        <div class="row  form-group">
        <input name="${securityConfig.apf.usernameParameter}" type="text" class="form-control"
               placeholder="Username" required="" autofocus=""/>
        </div>
        <div class="row  form-group">
        <input name="${securityConfig.apf.passwordParameter}" type="password" class="form-control"
               placeholder="Password" required=""/>
        </div>
        <div class="row">
            <div class="col-sm-4 form-group">
                <input type="checkbox" name="${securityConfig.rememberMe.parameter}"
                       id="remember_me" checked="checked"/>
                <label for='remember_me'>
                    <g:message code='spring.security.ui.login.rememberme'/>
                </label>
            </div>
            <div class="col-sm-4 ">
                    <g:link controller='register' action='forgotPassword'>
                        <g:message code='spring.security.ui.login.forgotPassword'/>
                    </g:link>
            </div>
            <div class="col-sm-4">
                <g:link elementId='register' controller='register'>
                    <g:message code='spring.security.ui.login.register'/>
                </g:link>
            </div>
        </div>
        <div class="row">
       <!-- <div class="col-sm-4">
                <s2ui:submitButton class="btn btn-lg btn-primary btn-block"
                                   elementId='loginButton' messageCode='spring.security.ui.login.login'/>
            </div>
        </div> -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">
            Sign In
        </button>
        </div>
        </div>
    </s2ui:form>
</body>
</html>