        <!--/Main Nav-->
        <div id="v-nav-app">
            <v-modal ref="registerLoginModal"></v-modal>

            <!--Mobile Nav-->
            <div class="horizontal-header clearfix ">
                <div class="container"> 
                    <a href="${createLink(controller: 'group', action: 'list')}" class=" mobile-nav-icon-button mobile-nav-icon-button-left" title="Gruppi"><i class="zmdi zmdi-accounts"></i></a>
                    <span class="smllogo"><img src="/assets/theme/img/brand/logo.png" alt="Group-buy" width="120"></span>
                    <a href="${createLink(controller: 'supplier', action: 'list')}" class=" mobile-nav-icon-button mobile-nav-icon-button-right" title="Attività"><i class="zmdi zmdi-store"></i></a>
                    <span class="smllogo"><img src="/assets/theme/img/brand/logo.png" alt="Group-buy" width="120"></span>
                    <a href="${createLink(controller: 'user', action: 'orders')}" class=" mobile-nav-icon-button mobile-nav-icon-button-right" title="Gruppi"><i class="zmdi zmdi-store"></i></a>
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

                                <li><a href="${createLink(controller: 'group', action: 'list')}">Gruppi</a></li>
                                <li><a href="${createLink(controller: 'supplier', action: 'list')}">Attivit&agrave;</a></li>
                                <li><a href="${createLink(controller: 'user', action: 'orders')}" >I miei ordini</a></li>

                                <!-- Blog -->
                                <!-- li><a href="https://www.group-buy.it/#blog"> Blog<span class="wsarrow"></span></a></li -->
                            </ul>
                            <ul class="mb-0">
                                <li aria-haspopup="true" class="mt-5 d-none d-lg-block "> 
                                    <sec:ifNotLoggedIn>
                                        <span><a class="btn btn-orange" @click="$refs.registerLoginModal.openModal()" title="Crea il tuo gruppo d'acquisto">Crea il tuo gruppo</a></span>
                                    </sec:ifNotLoggedIn>
                                    <sec:ifLoggedIn>
                                        <span><a class="btn btn-orange" href="${createLink(controller: 'groupBuy', action: 'groupCreate')}" title="Crea il tuo gruppo d'acquisto">Crea il tuo gruppo</a></span>
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