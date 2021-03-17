<!doctype html>
<html>
    <head>
        <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
        <meta name="layout" content="claylist-min">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body class="construction-image">
        <g:if env="development">
            <g:if test="${Throwable.isInstance(exception)}">
                <g:renderException exception="${exception}" />
            </g:if>
            <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
                <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}" />
            </g:elseif>
            <g:else>
                <ul class="errors">
                    <li>An error has occurred</li>
                    <li>Exception: ${exception}</li>
                    <li>Message: ${message}</li>
                    <li>Path: ${path}</li>
                </ul>
            </g:else>
        </g:if>
        <g:else>
            <!-- Page -->
            <div class="page page-h">
                <div class="page-content z-index-10">
                    <div class="container text-center">
                        <div class="display-1 text-white mb-5">500</div>
                        <h1 class="h2 text-white  mb-3">An error has occurred</h1>
                        <p class="h4 font-weight-normal mb-7 leading-normal text-white">Oops!!!! Abbiamo riscontrato un errore.</p>
                        <a class="btn btn-warning" href="/">
                            torna alla Home
                        </a>
                    </div>
                </div>
            </div>
            <!-- End Page -->
        </g:else>
    </body>
</html>
