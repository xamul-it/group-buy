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
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />

	<!-- Title -->
	<title><g:message code="site.title"/> - <g:layoutTitle default="" /></title>

	<!-- Bootstrap Css -->
	<asset:stylesheet src="bootstrap-4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <!-- link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" -->

	<!-- Dashboard Css -->
    <asset:stylesheet src="claylist/css/dashboard.css" rel="stylesheet" />
	<asset:stylesheet src="claylist/css/admin-custom.css" rel="stylesheet" />

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

	<!-- Vue Css -->
    <asset:stylesheet src="theme/css/vue.css"/>

	<!-- Bbox Css -->
    <asset:stylesheet src="theme/css/gb-style.css"/>

	<!-- JavaScript libs -->
	<g:render template="/includes/js-lodash-js"/>
	<g:render template="/includes/js-moment-js"/>
	<g:render template="/includes/js-axios-js"/>
	<g:render template="/includes/js-vue2-js"/>
	<!-- vue alerts -->
	<script src="/assets/vue/v-jslib/vue-toasted@1.1.28/vue-toasted.min.js"></script>
	<g:render template="/includes/js-vuex-js"/>
	
	<!-- Vue common Components -->
	<script src="/assets/vue/v-common/modal.js"></script>
	<script type="module" src="/assets/vue/v-common/date-helper-mixin.js"></script>
    <g:layoutHead/>

</head>
<body class="${pageProperty(name:'body.class')}">
	
    <div class="horizontalMenucontainer">

        <g:layoutBody/>

    </div>

</body>
</html>
