
<div id="v-sticky-app">

    <div id="sticky-wrapper" v-sticky sticky-offset="10" sticky-side="top" on-stick="onStick" class="sticky-wrapper" style="height: 88px;">

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
                        <li aria-haspopup="true"><a href="${createLink(controller: 'groupBuy', action: 'suppliers')}">Attivit&aacute;</a></li>
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
                        <li aria-haspopup="true" class="mt-5 d-none d-lg-block "> <span><a
                                    class="btn btn-orange ad-post " href="#cta" title="Crea il tuo gruppo d'acquisto">Crea il tuo gruppo</a></span>
                        </li>
                    </ul>
                </nav>
                <!--Nav-->
            </div>
        </div>
        
    </div>

</div>

<!-- script type="module" src="https://cdn.jsdelivr.net/npm/vue-sticky-directive@0.0.10/vue-sticky-directive.js"></script -->

<!-- script type="module">    
    import Sticky from 'https://cdn.jsdelivr.net/npm/vue-sticky-directive@0.0.10/vue-sticky-directive.js';
    
    Vue.directive('Sticky', Sticky);

    new Vue({
        el: '#v-sticky-app',
        data() {
            return {
                text: 'Text',
            }
        },
        mounted() {
            
        },
        /*directives: {
            Sticky
        },*/
         watch: {
            
        },
        methods: {
            onStick(data) {
                console.log(data);
            },
        }
    })
</script -->