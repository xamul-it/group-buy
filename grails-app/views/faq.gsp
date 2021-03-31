<html>
    <head>
        <meta name="layout" content="claylist"/>
        <title>Domande frequenti</title>
    </head>
    <body>
        <div>
            <!--Sliders Section-->
            <g:render template="/common/theme-header" model="['headerTitle':'Domande frequenti']"/>
            <!--/Sliders Section-->

<style>
.v-collapse-content {
  max-height: 0;
  transition: max-height 0.3s ease-out;
  overflow: hidden;
  padding: 0;
}

.v-collapse-content-end {
  transition: max-height 0.3s ease-in;
  max-height: 500px;
}

</style>
<div id="app">

            <!-- Faq -->
            <section class="sptb">
                <div class="container">
                    <div class="panel-group1">

                    <v-collapse-group :onlyOneActive="false">

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper :active="true">
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Non ho un gruppo d’acquisto ma mi piacerebbe unirmi a qualcuno, posso farlo?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Certo. Scopri i gruppi già presenti e unisciti a loro.
                                        <br/>
                                        Se hai un negozio di fiducia da cui acquistare, crea il tuo gruppo 
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Non ho un gruppo d’acquisto ma mi piacerebbe effettuare acquisti su ProprioOui, posso farlo?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Sì, puoi effettuare acquisti anche individualmente
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Il gruppo deve necessariamente avere un indirizzo?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Sì, ogni gruppo deve avere un indirizzo di consegna, così che i negozianti possano consegnare la merce in un solo luogo.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Dove è disponibile il servizio?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Per ora solo a Milano città, ma stiamo lavorando per aggiungere altri comuni, torna a trovarci per verificare.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Non trovo il mio negozio di fiducia, posso aggiungerlo?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Certamente, inviaci le informazioni per poterlo inserire nel nostro elenco.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>



                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Sono un negoziante, come posso partecipare?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Inviaci la tua candidatura e sarai inserito nel nostro sito.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Sono un negoziante, vorrei aggiornare la mia scheda, come posso farlo?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Scrivici e inviaci le informazioni, ti ricontatteremo al più presto.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Quali tipologie di attività sono presenti?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        ProprioQui si rivolge principalmente a negozianti, produttori e attività di vicinato che effettuano consegne o spedizioni a domicilio.
                                        <br/>
                                        Ecco qualche esempio: Alimentari, Minimarket, Enoteche, Pasticcerie, Profumerie, Erboristerie, Edicole, Cartolerie, Produttori diretti, Aziende agricole, Negozi di Sport, Ciclisti. 
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Gestite la consegna / spedizione?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        No la consegna è gestita direttamente da negozianti o produttori.
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle">Quali sistemi di pagamento sono disponibili?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        Ogni negoziante indicherà nella scheda informativa o nella conferma d’ordine il metodo di pagamento preferito
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>

                        <%/*
                        <div class="panel panel-default mb-4 border p-0">
                            <v-collapse-wrapper>
                                <div class="panel-heading1" v-collapse-toggle>
                                    <h4 class="panel-title1"> 
                                        <a class="accordion-toggle"> ?</a> </h4>
                                </div>
                                <div class="panel-collapse show" v-collapse-content>
                                    <div class="panel-body bg-white text-dark">
                                        <p>
                                        
                                        </p>
                                    </div>
                                </div>
                            </v-collapse-wrapper>
                        </div>
                        */%>

                    </v-collapse-group>
                        
                        
                        

                    </div>
                </div>
            </section>
            <!-- /Faq -->

        </div>

        </div>

        <script type="module">
            // Import vue2-collapse
            import VueCollapse from '/assets/vue/v-jslib/vue-collapse/index.js'

            // Loading the plugin into the Vue.
            Vue.use(VueCollapse)

            const app = new Vue({
                el: '#app',
                data: {},
                methods: {},
                computed: {}
            });
        </script>

    </body>
</html>