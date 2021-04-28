<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Supporto</title>
    </head>
    <body>
        <div>
            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Supporto']"/>
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
                                                <p class="lead">
                                                    Abbiamo predisposto una pagina con <a href="/faq">le domande frequenti</a>,
                                                    se non trovi la risposta che cerchi puoi contattarci compilando la form che trovi qui sotto.
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