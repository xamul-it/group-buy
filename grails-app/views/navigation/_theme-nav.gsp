
<div id="v-nav-app">
    <v-modal ref="registerLoginModal"></v-modal>

    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;">

        <div class="horizontal-main bg-dark-transparent clearfix" style="width: 1868px;">
            <div class="horizontal-mainwrapper container clearfix">
                <div class="desktoplogo"> <a href="/"><img src="/assets/theme/img/brand/logo1.png"
                            alt=""></a> </div>
                <div class="desktoplogo-1"> <a href="/"><img src="/assets/theme/img/brand/logo.png"
                            alt=""></a> </div>
                <!--Nav-->
                <nav class="horizontalMenu clearfix d-md-flex">
                    <div class="overlapblackbg"></div>
                    <ul class="horizontalMenu-list">

                        <li aria-haspopup="true"><a href="${createLink(controller: 'groupBuy', action: 'groupList')}">Gruppi</a></li>
                        <!-- Blog -->
                        <li aria-haspopup="true"><a href="https://www.group-buy.it/#blog"> Blog<span class="wsarrow"></span></a></li>
                        <!-- how it works -->
                        <!-- li aria-haspopup="true"><span class="horizontalMenu-click"><i
                                    class="horizontalMenu-arrow fa fa-angle-down"></i></span><a href="#"
                                class="active">Come funziona <span class="fa fa-caret-down m-0"></span></a>
                            <ul class="sub-menu">
                                <li aria-haspopup="true" class="active"><a href="#">Come funziona 1</a></li>
                                <li aria-haspopup="true"><a href="#">Come funziona 2</a></li>
                                <li aria-haspopup="true"><a href="#">Come funziona 3</a></li>
                            </ul>
                        </li -->
                    </ul>
                    <ul class="mb-0">
                        <li aria-haspopup="true" class="mt-5 d-none d-lg-block "> 
                            <sec:ifNotLoggedIn>
                                <span><a class="btn btn-orange ad-post " @click="$refs.registerLoginModal.openModal()" title="Crea il tuo gruppo d'acquisto">Crea il tuo gruppo</a></span>
							</sec:ifNotLoggedIn>
							<sec:ifLoggedIn>
								<span><a class="btn btn-orange ad-post " href="${createLink(controller: 'groupBuy', action: 'group')}/new" title="Crea il tuo gruppo d'acquisto">Crea il tuo gruppo</a></span>
                            </sec:ifLoggedIn>
                        </li>
                    </ul>
                </nav>
                <!--Nav-->
            </div>
        </div>
        
    </div>

    

</div>

<script>
    new Vue({
        el: "#v-nav-app",
        components: {
            'v-modal': VModal,
        },
    });
</script>