<!doctype html>

<html class="no-js" lang="en">

<head>
	<!-- META DATA -->
	<meta charset="UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<link rel="icon" href="/assets/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="/assets/favicon.ico" />
	<link rel="apple-touch-icon" sizes="180x180" href="/assets/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/assets/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/assets/favicon-16x16.png">

	<!-- Title -->
	<title><g:message code="site.title"/> - <g:layoutTitle default="" /></title>

	<!-- Bootstrap Css -->
	<asset:stylesheet src="bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />

	<!-- Dashboard Css -->
    <asset:stylesheet src="claylist/css/dashboard.css" rel="stylesheet" />
	<asset:stylesheet src="claylist/css/admin-custom.css" rel="stylesheet" />

	<!-- Font-awesome  Css -->
    <asset:stylesheet src="claylist/css/icons.css" rel="stylesheet" />

	<!--Horizontal Menu-->
    <asset:stylesheet src="theme/plugins/Horizontal2/Horizontal-menu/dropdown-effects/fade-down.css"/>
    <asset:stylesheet src="theme/plugins/Horizontal2/Horizontal-menu/horizontal.css"/>

	<!-- COLOR-SKINS -->
    <asset:stylesheet src="theme/css/gb-color.css" id="theme" rel="stylesheet" type="text/css" media="all" />

	<!-- Vue Css -->
    <asset:stylesheet src="theme/css/vue.css"/>

	<!-- Bbox Css -->
    <asset:stylesheet src="theme/css/gb-style.css"/>

	<!-- gtag -->
	<g:render template="/includes/gtag"/>

	<!-- JavaScript libs -->
	<g:render template="/includes/js-lodash-js"/>
	<g:render template="/includes/js-moment-js"/>
	<g:render template="/includes/js-axios-js"/>
	<g:render template="/includes/js-vue2-js"/>
	<g:render template="/includes/js-vuelidate-js"/>
	<!-- vue alerts -->
	<script src="/assets/vue/v-jslib/vue-toasted@1.1.28/vue-toasted.min.js"></script>
	<g:render template="/includes/js-vuex-js"/>
	
	<!-- Vue common Components -->
	<script src="/assets/vue/v-common/modal.js"></script>
	<script type="module" src="/assets/vue/v-common/date-helper-mixin.js"></script>
	<!-- template for the modal component -->
    <script type="text/x-template" id="modal-template">
      
	</script>
    <g:layoutHead/>

</head>
<body>
	
    <div class="horizontalMenucontainer">

		<g:render template="/navigation/home-topbar" />

        <g:layoutBody/>

        <g:render template="/navigation/theme-footer" />

		<!-- Back to top -->
		<a href="#top" id="back-to-top"><i class="fa fa-rocket"></i></a>

    </div>

</body>
</html>