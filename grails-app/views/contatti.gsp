<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Contatti</title>
    </head>
    <body>
        <div>
            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Contatti']"/>
            <!--/Sliders Section-->

            <div id="app" v-cloak>

                <!-- Supporto -->
                <section class="sptb">
                    <div class="container">

                        <div class="row">

                            <div class="col-xl-12 col-lg-12 col-md-12">

                                    <div class="card">
                                        <div class="card-body">

                                            <div class="jumbotron">
                                                <!-- h1>Supporto</h1 -->
                                                <p class="lead">
                                                    Puoi contattarci compilando la form che trovi qui sotto.
                                                    Ti chiediamo un po' di pazienza, risponderemo appena possibile.
                                                    
                                                </p>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="card">
                                        <div class="card-body">

                                            <v-contact-contact :wide="true"></v-contact-contact>

                                        </div>

                                    </div>
                                    
                            </div>
                        </div>     

                    </div>
                </section>
                <!-- /Supporto -->

            </div>

        </div>

        <script type="module">
			import VContact from '/assets/vue/v-contact/contact.vue.js';

			var app = new Vue({
				el: '#app',
				components: {
					'v-contact-contact': VContact,
				},
				data: {
				},
			})
		</script>

    </body>
</html>