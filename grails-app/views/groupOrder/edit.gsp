<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Ordine</title>
    </head>
    <body>
        <sec:ifLoggedIn>
            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Ordine']"/>
            <!--/Sliders Section-->

            <!-- Order -->
            <g:render template="order" />
            <!-- /Order -->

            <g:render template="order-vue"/>

        </sec:ifLoggedIn>
    </body>
</html>