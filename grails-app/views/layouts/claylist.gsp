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
	<link rel="icon" href="favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

	<!-- Title -->
	<title>Group Buy - <g:layoutTitle default="" /></title>

    <!-- Bbox Css -->
    <asset:stylesheet src="theme/css/style.css"/>

	<!-- Vue Css -->
    <asset:stylesheet src="theme/css/vue.css"/>

	<!-- Bootstrap Css -->
	<!-- link href="../../assets/plugins/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" / -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- Dashboard Css -->
    <asset:stylesheet src="claylist/css/dashboard.css" rel="stylesheet" />

	<!-- Font-awesome  Css -->
    <asset:stylesheet src="claylist/css/icons.css" rel="stylesheet" />

	<!--Horizontal Menu-->
    <asset:stylesheet src="theme/plugins/Horizontal2/Horizontal-menu/dropdown-effects/fade-down.css"/>
    <asset:stylesheet src="theme/plugins/Horizontal2/Horizontal-menu/horizontal.css"/>

	<!--Select2 Plugin -->
	<!-- link href="../../assets/plugins/select2/select2.min.css" rel="stylesheet" / -->

	<!-- Cookie css -->
	<!-- link href="../../assets/plugins/cookie/cookie.css" rel="stylesheet" -->

	<!-- Owl Theme css-->
	<!-- link href="../../assets/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" / -->

	<!-- Custom scroll bar css-->
	<!-- link href="../../assets/plugins/scroll-bar/jquery.mCustomScrollbar.css" rel="stylesheet" / -->

	<!-- COLOR-SKINS -->
    <asset:stylesheet src="claylist/webslidemenu/color-skins/color3.css" id="theme" rel="stylesheet" type="text/css" media="all" />

	<!-- helper -->
	<script src="/assets/vue/v-jslib/lodash@4.17.20/lodash.min.js"></script>
	<!-- network -->
    <script src="/assets/vue/v-jslib/axios@0.20.0/axios.min.js"></script>
	<!-- vue -->
	<script src="/assets/vue/v-jslib/vue@2.6.12/vue.js"></script>
	<!-- vue alerts -->
	<script src="/assets/vue/v-jslib/vue-toasted@1.1.28/vue-toasted.min.js"></script>
	<!-- vuex app state management -->
	<script type="module" src="/assets/vue/v-jslib/vuex@3.5.1/vuex.min.js"></script>
	<script type="module" src="/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js"></script>

    <g:layoutHead/>
</head>
<body>
    <div class="horizontalMenucontainer">

		<g:render template="/navigation/theme-topbar" />

		<g:render template="/navigation/theme-nav" />

        <g:layoutBody/>

        <g:render template="/navigation/theme-footer" />

		<!-- Back to top -->
		<a href="#top" id="back-to-top"><i class="fa fa-rocket"></i></a>

    </div>
</body>
</html>

