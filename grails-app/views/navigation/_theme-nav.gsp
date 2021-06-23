        <!--/Main Nav-->
        <div id="v-nav-app">
            <v-modal ref="registerLoginModal"></v-modal>

            <!--Mobile Nav-->
            <div class="horizontal-header clearfix ">
                <div class="container"> 
                    <nav role="navigation">
                        <div id="menuToggle">
                        <!--A fake / hidden checkbox is used as click reciever,so you can use the :checked selector on it.-->
                            <input type="checkbox" />
                            <!--Some spans to act as a hamburger.-->
                                <span></span>
                                <span></span>
                                <span></span>
                                    <ul id="menu">
                                        <sec:ifNotLoggedIn>
                                            <a @click="$refs.registerLoginModal.openModal()" class="btn btn-blue" title=""> <li> <g:message code="site.menu.cta.createGroup"/> </li> </a>
                                        </sec:ifNotLoggedIn>
                                        <sec:ifLoggedIn>
                                            <a href="${createLink(mapping: 'nuovoGruppo', namespace: 'ui')}" class="btn btn-blue" title=""> <li> <g:message code="site.menu.cta.createGroup"/> </li> </a>
                                        </sec:ifLoggedIn>
                                        <a href="${createLink(mapping: 'gruppi', namespace: 'ui')}" class="" title="${g.message(code:'site.menu.groups')}"><li>Gruppi</li></a>
                                        <a href="${createLink(mapping: 'negozi', namespace: 'ui')}" class="" title="${g.message(code:'site.menu.suppliers')}"><li>Negozi</li></a>
                                        <sec:ifLoggedIn>
                                            <a href="${createLink(mapping: 'ordiniUtente', namespace: 'ui')}" > <li> <g:message code="site.menu.orders"/> </li></a>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <li><a @click="$refs.registerLoginModal.openModal()" > <li> <g:message code="site.menu.orders"/> </li> </a>
                                        </sec:ifNotLoggedIn>
                                        <a href="/chisiamo" class="" title=""><li> <g:message code="site.menu.aboutus"/> </li></a> 
                                        <a href="/contatti" class="" title=""><li> <g:message code="site.menu.contacts"/> </li></a>
                                        <a href="/supporto" class="" title=""><li> <g:message code="site.menu.support"/> </li></a>    
                                    </ul>
                        </div>
                    </nav>

                    <span class="smllogo"><img src="/assets/theme/img/brand/logo.png" alt="${g.message(code:'site.title')}" width="180"></span>
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
                                <sec:ifLoggedIn>
                                    <li><a href="${createLink(mapping: 'ordiniUtente', namespace: 'ui')}" > <g:message code="site.menu.orders"/> </a></li>
                                </sec:ifLoggedIn>
                                <sec:ifNotLoggedIn>
                                    <li><a @click="$refs.registerLoginModal.openModal()" > <g:message code="site.menu.orders"/> </a></li>
                                </sec:ifNotLoggedIn>
                            </ul>
                            <ul class="mb-0">
                                <li aria-haspopup="true" class="mt-5 d-none d-lg-block "> 
                                    <sec:ifNotLoggedIn>
                                        <span><a class="btn btn-blue" @click="$refs.registerLoginModal.openModal()"> <g:message code="site.menu.cta.createGroup"/> </a></span>
                                    </sec:ifNotLoggedIn>
                                    <sec:ifLoggedIn>
                                        <span><a class="btn btn-blue" href="${createLink(mapping: 'nuovoGruppo', namespace: 'ui')}"> <g:message code="site.menu.cta.createGroup"/> </a></span>
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