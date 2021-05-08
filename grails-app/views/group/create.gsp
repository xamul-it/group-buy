<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title><g:message code="group.title"/></title>
    </head>
    <body>

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':message(code:'group.title')]"/>
        <!--/Sliders Section-->

        <!-- Group -->
        <section class="sptb">
            <div class="container" id="v-group-edit-app" v-cloak>

                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="card overflow-hidden group-head">

                            <g:render template="/group/group-subheader"/>

                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">

                        <div class="card mb-0">
                            <div class="card-body">
                                <div class="border-0">
                                    <div v-if="groupItem" class="tab-content">

                                        <!-- Edit -->
                                        <g:render template="group-edit-form" />
                                        <!-- /Edit -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Group -->

        <g:render template="group-edit-vue" />

    </body>
</html>