<html>
    <head>
        <meta name="layout" content="${layoutRegister}"/>
        <s2ui:title messageCode='spring.security.ui.forgotPassword.title'/>
    </head>
    <body>
        <div class="row col-md-4 col-md-offset-4">
            <s2ui:form type='forgotPassword' focus='username' width='50%'>
                <h1 class="form-signin-heading text-muted">
                    <g:message code='spring.security.ui.login.forgotPassword'/>
                </h1>
                <s2ui:form beanName='forgotPasswordCommand' useToken="true">
                    <g:if test='${emailSent}'>
                        <div class="row">
                            <p class="alert alert-success">
                        <g:message code='spring.security.ui.forgotPassword.sent'/>
                            </p>
                        </div>
                    </g:if>

                    <g:else>
                        <div class="row">
                            <p class="lead">
                                <g:message code='spring.security.ui.forgotPassword.description'/>
                            </p>
                        </div>
                        <div class="row form-group">
                            <input name="${securityConfig.apf.usernameParameter}" type="text" class="form-control"
                                   placeholder="Username" required="" autofocus=""/>
<!--
                            <table>
                                <s2ui:textFieldRow name='username' size='25' labelCodeDefault='Username'/>
                            </table> -->
                        </div>
                        <div class="row form-group">
                            <button class="btn btn-lg btn-primary btn-block" type="submit">
                                Password dimenticata
                            </button>

 <!--                           <s2ui:submitButton elementId='submit'
                                               messageCode='spring.security.ui.forgotPassword.submit'/>
                                               -->
                        </div>
                    </g:else>
                </s2ui:form>
            </s2ui:form>
        </div>
        <asset:javascript src='spring-security-ui-register.js'/>
        <s2ui:showFlash/>
        <s2ui:deferredScripts/>
    </body>
</html>
