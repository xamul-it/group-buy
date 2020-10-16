<!doctype html>
<html>
    <head>
        <title>Pagina Non Trovata</title>
        <meta name="layout" content="claylist-min"/>
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>

    <body class="construction-image">

        <!-- Page -->
		<div class="page page-h">
			<div class="page-content z-index-10">
				<div class="container text-center">
					<div class="display-1 text-white mb-5">404</div>
					<h1 class="h2 text-white  mb-3">Page Not Found</h1>
					<p class="h4 font-weight-normal mb-7 leading-normal text-white">Oops!!!! hai provato ad accedere ad una pagina che non è disponibile (${request.forwardURI}). torna alla Home</p>
					<a class="btn btn-warning" href="/">
						torna alla Home
					</a>
				</div>
			</div>
		</div>
		<!-- End Page -->

    </body>
</html>
