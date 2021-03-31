        <!--/Main Nav-->
        <div id="v-nav-app">
            <v-modal ref="registerLoginModal"></v-modal>

            <!--Mobile Nav-->
            <div class="horizontal-header clearfix ">
                <div class="container"> 
                    <a href="${createLink(mapping: 'gruppi', namespace: 'ui')}" class=" mobile-nav-icon-button mobile-nav-icon-button-left" title="${g.message(code:'site.menu.groups')}"><i class="zmdi zmdi-accounts"></i></a>
                    <span class="smllogo"><img src="/assets/theme/img/brand/logo.png" alt="${g.message(code:'site.title')}" width="120"></span>
                    <a href="${createLink(mapping: 'negozi', namespace: 'ui')}" class=" mobile-nav-icon-button mobile-nav-icon-button-right" title="${g.message(code:'site.menu.suppliers')}"><i class="zmdi zmdi-store"></i></a>
                </div>
            </div>
            <!--/Mobile Nav-->

            <!--Desktop Nav-->
            <div id="sticky-wrapper" class="sticky-wrapper no-print" style="height: 88px;">

                <div class="horizontal-main bg-dark-transparent clearfix">
                    <div class="horizontal-mainwrapper container clearfix">
                        <div class="desktoplogo"> <a href="/"><img src="/assets/theme/img/brand/logo1.png" alt=""></a> </div>
                        <div class="desktoplogo-1"> <a href="/"><img src="/assets/theme/img/brand/logo.png" alt=""></a> </div>
                        <!--Nav-->
                        <nav class="horizontalMenu clearfix d-md-flex">
                            <div class="overlapblackbg"></div>
                            <ul class="horizontalMenu-list">

                                <li><a href="${createLink(mapping: 'gruppi', namespace: 'ui')}"> <g:message code="site.menu.groups"/> </a></li>
                                <li><a href="${createLink(mapping: 'negozi', namespace: 'ui')}"> <g:message code="site.menu.suppliers"/> </a></li>
                                <li><a href="${createLink(mapping: 'ordiniUtente', namespace: 'ui')}" > <g:message code="site.menu.orders"/> </a></li>

                            </ul>
                            <ul class="mb-0">
                                <li aria-haspopup="true" class="mt-5 d-none d-lg-block "> 
                                    <sec:ifNotLoggedIn>
                                        <span><a class="btn btn-orange" @click="$refs.registerLoginModal.openModal()"> <g:message code="site.menu.cta.createGroup"/> </a></span>
                                    </sec:ifNotLoggedIn>
                                    <sec:ifLoggedIn>
                                        <span><a class="btn btn-orange" href="${createLink(mapping: 'nuovoGruppo', namespace: 'ui')}"> <g:message code="site.menu.cta.createGroup"/> </a></span>
                                    </sec:ifLoggedIn>
                                </li>
                            </ul>
                        </nav>
                        <!--Nav-->
                    </div>
                </div>
                
            </div>
            <!--/Desktop Nav-->

        </div>

        <script>
            new Vue({
                el: "#v-nav-app",
                name: 'Nav',
                components: {
                    'v-modal': VModal,
                },
            });
        </script>
        <!--/Main Nav-->