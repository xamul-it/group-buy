<html>
<!-- TODO i18n -->
    <head>
        <meta name="layout" content="claylist"/>
        <title>Gruppo di acquisto</title>

        <!-- vuex store -->
	    <script type="module" src="/assets/vue/v-store/group-store.js"></script>
	    <!-- actions -->
	    <script type="module" src="/assets/vue/v-store/group-actions.js"></script>
        <!-- alerts -->
        <script type="module" src="/assets/vue/v-services/toast.js"></script>
        <!-- date time helpers -->
        <script src="/assets/vue/v-jslib/moment@2.28.0/moment.js"></script>
        <script src="/assets/vue/v-jslib/moment@2.28.0/locale/it.js"></script>
        <!-- vue form validation -->
	    <script src="/assets/vue/v-jslib/vuelidate@0.7.5/vuelidate.min.js"></script>
	    <script src="/assets/vue/v-jslib/vuelidate@0.7.5/validators.min.js"></script>
        <!-- vue-select -->
        <script type="module" src="/assets/vue/v-jslib/vue-select@3.10.8/vue-select.js"></script>
        <link rel="stylesheet" href="/assets/vue/v-jslib/vue-select@3.10.8/vue-select.css">

    </head>
    <body>

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Gruppo di acquisto']"/>
        <!--/Sliders Section-->

        <!-- Group -->
        <section class="sptb">
            <div class="container" id="v-group-edit-app">

                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="card overflow-hidden group-head">

                            <g:render template="/group/group-header"/>

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