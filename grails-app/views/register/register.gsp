<html>
    <head>
        <!--meta name="layout" content="${layoutRegister}"/-->
        <meta name="layout" content="angular"/>
        <s2ui:title messageCode='spring.security.ui.register.title'/>
        <s2ui:stylesheet src='spring-security-ui-register.css'/>
    </head>
    <body>
        <div class="row col-md-4 col-md-offset-4">

            <h1 class="form-signin-heading text-muted">
                <g:message code='spring.security.ui.login.register'/>
            </h1>
            <br/>
            <s2ui:form type='register' focus='username'>
                <s2ui:form beanName='registerCommand'>
                    <g:if test='${emailSent}'>
                        <div class="row">
                            <p class="alert alert-success">
                                <g:message code='spring.security.ui.register.sent'/>
                            </p>
                        </div>
                    </g:if>
                    <g:else>

                        <table class="table">
                            <tbody>
                                <s2ui:textFieldRow name='username' size='40' labelCodeDefault='Username'/>
                                <s2ui:textFieldRow name='email' size='40' labelCodeDefault='E-mail'/>
                                <s2ui:passwordFieldRow name='password' size='40' labelCodeDefault='Password'/>
                                <s2ui:passwordFieldRow name='password2' size='40' labelCodeDefault='Password (again)'/>
                            </tbody>
                        </table>

                        <div class="row form-group">
                        <button class="btn btn-lg btn-primary btn-block" type="submit">
                            <g:message code='spring.security.ui.register.submit'/>
                        </button>
                        </div>
                        <!--
                        s2ui:submitButton elementId='submit' messageCode='spring.security.ui.register.submit'/
                        -->
                    </g:else>
                </s2ui:form>
            </s2ui:form>
            <asset:javascript src='spring-security-ui-register.js'/>
            <s2ui:showFlash/>
            <s2ui:deferredScripts/>
        </div>
    </body>
</html>
