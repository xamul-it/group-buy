

        <div id="v-cookie-law-app">
			<cookie-law theme="claylist"
                        message="Noi e alcuni partner selezionati utilizziamo cookie o tecnologie simili. Puoi acconsentire all'utilizzo di tali tecnologie chiudendo questa informativa, proseguendo la navigazione di questa pagina, interagendo con un link o un pulsante al di fuori di questa informativa o continuando a navigare in altro modo."
                        button-text="Accetto"
                        button-accept-class="btn btn-green br-tr-3"
                        button-link="/privacy"
                        button-link-text="Scopri di più"
                        button-class="btn btn-outline-info br-tr-3"
                        :button-decline="true"
                        button-decline-text="Rifiuto"
                        :button-link-new-tab="true"
                        button-decline-class="btn btn-yellow br-tr-3"
                        storage-type="cookies"
                        :cookie-options="{samesite: 'None', secure: true}"
                        v-on:accept="acceptCoockie()"/>
		</div>

        <link rel="stylesheet" href="/assets/vue/v-jslib/vue-cookie-law/style.css">
        <script type="module">
            // Import vue-cookie-law
            import CookieLaw from '/assets/vue/v-jslib/vue-cookie-law/cookie-law.vue.js'

			var app = new Vue({
				el: '#v-cookie-law-app',
				components: {
					'cookie-law': CookieLaw,
				},
                methods: {
                    acceptCoockie() {
                        consentAnalyticsGranted()
                    },
                }
			})
		</script>