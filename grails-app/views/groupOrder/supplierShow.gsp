<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Ordine</title>

        <!-- alerts -->
        <script type="module" src="/assets/vue/v-services/toast.js"></script>

    </head>
    <body>
        <g:set var="isSupplier" value="${true}" scope="page" />

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Ordine']"/>
        <!--/Sliders Section-->

        <!-- Order -->
        <g:render template="order"/>
        <!-- /Order -->

        <g:render template="order-vue"/>

    </body>
</html>