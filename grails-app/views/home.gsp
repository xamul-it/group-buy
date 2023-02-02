<html>
<head>
    <meta name="layout" content="claylist-home"/>
    <title><g:message code="site.title"/></title>
</head>
<body>
    <div class="app" id="v-group-buy-app">
        <!--Sliders Section-->
        <section class="theme-header">
            <div class="bannerimg cover-image bg-background slide-uno">
                <div class="header-text1 mb-0">
                    <div class="container">
                        <div class="text-left">
                            <%/*
                            <h1 class="">La spesa sotto casa</h1>
                            <h1 class="">da <a href="${createLink(mapping: 'negozi', namespace: 'ui')}" class="">negozianti e produttori</a> di fiducia</h1>
                            <h2>Acquisti individuali e di <a href="${createLink(mapping: 'gruppi', namespace: 'ui')}" class="">gruppo</a></h2>
                            */%>
                            <div class="row" style="padding: 0px 0px 0px;">

                                <div class="col-lg-4 col-md-12">
                                    
                                    <div class="card widgets-cards" style="padding: 10px 0px; border: 0px solid transparent; background-color: transparent; box-shadow: none;">
                                        <div class="d-flex">
                                            <a href="${createLink(mapping: 'negozi', namespace: 'ui')}">
                                                <div class="widgets-cards-icons">
                                                    <div class="wrp icon-circle bg-success">
                                                        <i class="fa fa-shopping-cart icons"></i>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="${createLink(mapping: 'negozi', namespace: 'ui')}">
                                                <div class="widgets-cards-data">
                                                    <div class="wrp text-wrapper" style="font-size: 1.15rem;">
                                                        <h2>Acquista</h2>
                                                        <p class="text-muted mt-1 mb-0">nel tuo negozio preferito</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="col-lg-4 col-md-12">
                                    
                                    <div class="card widgets-cards" style="padding: 10px 0px; border: 0px solid transparent; background-color: transparent; box-shadow: none;">
                                        <div class="d-flex">
                                            <a href="${createLink(mapping: 'gruppi', namespace: 'ui')}">
                                                <div class="widgets-cards-icons">
                                                    <div class="wrp icon-circle bg-success">
                                                        <i class="fa fa-users icons"></i>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="${createLink(mapping: 'gruppi', namespace: 'ui')}">
                                                <div class="widgets-cards-data">
                                                    <div class="wrp text-wrapper" style="font-size: 1.15rem;">
                                                        <h2>Crea</h2>
                                                        <p class="text-muted mt-1 mb-0">il tuo gruppo di acquisto</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/Sliders Section-->

        <!-- What -->
        <section class="sptb bg-azzurro">
            <div class="container">
                
                <div class="text-center">
                    <!-- h2 class="mb-4">Proprioqui</h2 -->
                    <!-- h4 class="leading-normal"> Accorciamo le distanze </h4 -->

                    <p class="lead">
                        La nostra rete crede nel valore dei rapporti umani, nella qualità e nella prossimità.</br>
			Proprioqui mette al centro la relazione tra cliente e venditore, la fiducia reciproca.</br>
			Torniamo alla stretta di mano.
                    </p>
                    <p class="lead">
                        Sosteniamo realtà locali che nel loro piccolo fanno la differenza ogni giorno.</br>
			Offriamo un servizio intuitivo e gratuito, che permette al cliente di gestire comodamente gli ordini, e al negozio di attivare un percorso virtuoso di crescita.
                    </p>

                    <p class="leading-normal">
                        <strong>Nato a Milano, presto in altre realtà.</strong>
                    </p>

                </div>

            </div>
        </section>
        <!-- /What -->

        <!--Shops list -->
        <section class="sptb" v-cloak>
            <div class="container">
            <v-modal ref="registerLoginModal"></v-modal>

                <div class="section-title center-block text-left">
                    <h2>I negozi</h2>
                </div>

                <div class="row">
                
                    <div v-for="(supplier, index) in supplierList" class="col-lg-4 col-md-6 col-xl-3">
                        <div class="card overflow-hidden">
                            <div class="item-card9-img">
                                <div class="arrow-ribbon bg-info">{{ supplier.category.name }}</div>
                                <div class="item-card9-imgs"> <a :href="'/negozio/'+supplier.id+'/'+encodeURI(supplier.name)"></a> <img
                                        :src="'/assets/theme/img/categories/supplier/category-'+supplier.category.id+'.jpg'" alt="img" class="cover-image"> </div>
                            </div>
                            <div class="card-body">
                                <div class="item-card9 text-dark">
                                    <a :href="'/negozio/'+supplier.id+'/'+encodeURI(supplier.name)" class="text-dark mt-2">
                                        <h4 class="font-weight-semibold mt-1">{{ supplier.name }} </h4>
                                    </a>
                                    <div class="item-card9-desc"> <a target="_blank" :href="'https://www.openstreetmap.org/?mlat='+supplier.shippingAddress.lat+'&mlon='+supplier.shippingAddress.lon+'#map=19/'+supplier.shippingAddress.lat+'/'+supplier.shippingAddress.lon" class="mr-4"><span class=""><i
                                                    class="fa fa-map-marker text-muted mr-1"></i> {{ supplier.shippingAddress.address1 }} {{ supplier.shippingAddress.city }}</span></a> 
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="item-card9-footer d-flex">
                                    <div class="item-card9-cost">
                                        <sec:ifLoggedIn>
                                            <a :href="'/negozio/'+supplier.id+'/ordine'" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Ordina ora</a>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                            <button @click="$refs.registerLoginModal.openModal()" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Ordina ora</button>
                                        </sec:ifNotLoggedIn>
                                        
                                    </div>
                                    <div class="ml-auto">
                                        <!--div class="rating-stars block"> <input type="number" readonly="readonly"
                                                class="rating-value star" name="rating-stars-value" value="3">
                                            <div class="rating-stars-container">
                                                <div class="rating-star sm is--active"> <i class="fa fa-star"></i> </div>
                                                <div class="rating-star sm is--active"> <i class="fa fa-star"></i> </div>
                                                <div class="rating-star sm is--active"> <i class="fa fa-star"></i> </div>
                                                <div class="rating-star sm"> <i class="fa fa-star"></i> </div>
                                                <div class="rating-star sm"> <i class="fa fa-star"></i> </div>
                                            </div>
                                        </div -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!--/Shops list -->

        <!-- Examples -->
        <section class="sptb">
            <div class="container">
                <div class="section-title center-block text-center">
                    <h2> Cosa è possibile comprare? </h2>
                </div>
                <div class="row ">
                    
                    <div class="col-lg-4 col-md-12">
                        <div class="card card-aside">
                            <div class="card-body ">
                                <div class="card-item d-flex">
                                    <div class="fa-stack fa-lg fea-icon mb-3"> <i
                                            class="mdi mdi-bicycle-electric"></i> </div>
                                    <div class="ml-4">
                                        <h6 class="font-weight-bold mt-2">L'utlimo modello di E-Bike</h6>
                                        Trova un gruppo di persone interessate ad acquistare una e-bike e andate tutti insieme dal negoziante.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12">
                        <div class="card card-aside">
                            <div class="card-body ">
                                <div class="card-item d-flex">
                                    <div class="fa-stack fa-lg fea-icon mb-3"> <i
                                            class="mdi mdi-office-building-marker-outline"></i> </div>
                                    <div class="ml-4">
                                        <h6 class="font-weight-bold mt-2">La spesa di tutti i giorni</h6>
                                         Fai la spesa di tutti i giorni, con il tuo condominio o un gruppo di amici e con la famiglia.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-12">
                        <div class="card card-aside">
                            <div class="card-body ">
                                <div class="card-item d-flex">
                                    <div class="fa-stack fa-lg fea-icon mb-3"> <i
                                            class="mdi mdi-bottle-wine-outline"></i> </div>
                                    <div class="ml-4">
                                        <h6 class="font-weight-bold mt-2">Un prodotto tipico</h6>
                                         Dal parmigiano alle arance, dalle mozzarelle all’olio. Siamo italiani, i sapori e i profumi non ci mancano!
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- /Question -->
        
        <section class="sptb bg-azzurro">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-md-12">
                        <div class="card widgets-cards">
                            <div class="card-body d-flex">
                                <div class="widgets-cards-icons">
                                    <div class="wrp icon-circle bg-success"> <i class="mdi mdi-shopping icons"></i> </div>
                                </div>
                                <div class="widgets-cards-data">
                                    <div class="wrp text-wrapper">
                                        <p>Voglio acquistare</p>
                                        <p class="text-muted mt-1 mb-0">
                                            <ul>
                                                <li>Siete una famiglia numerosa, un condominio, un gruppo di amici? Ottimizziamo i vostri acquisti a km 0 con un unico indirizzo di consegna.</li>
                                                <li>Oppure potete fare la spesa solo per voi.</li>
                                            </ul>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-12">
                        <div class="card widgets-cards">
                            <div class="card-body d-flex">
                                <div class="widgets-cards-icons">
                                    <div class="wrp icon-circle bg-success"> <i class="mdi mdi-store fa-2x icons"></i> </div>
                                </div>
                                <div class="widgets-cards-data">
                                    <div class="wrp text-wrapper">
                                        <p>Voglio vendere </p>
                                        <p class="text-muted mt-1 mb-0">
                                            Se avete un’attività, proprioqui.it offre la possibilità di vendere di più e meglio in modo etico, coinvolgendo le comunità di quartiere. 
                                            <br/>
                                            Otterrete diversi vantaggi:
                                            <ul>
                                                <li>Potrete raggiungere persone che non conoscete e che non erano vostre clienti  ma che potranno diventarlo</li>
                                                <li>Avrete un solo punto di consegna, deciso da voi, meno lavoro e più guadagno</li>
                                                <li>Grazie agli acquisti di gruppo venderete di più e venderete meglio</li>
                                            </ul>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                
                <div class="center-block text-center">
                    <p class="lead">
                        <strong>A voi la scelta, secondo le vostre necessità!</strong>
                    </p>
                </div>

            </div>
        </section>

        <!-- How -->
        <section class="sptb">
            <div class="container">

                <div class="section-title center-block text-center">
                    <h2> Sei pronto? </h2>
                    <h4 class="leading-normal"> Ora tocca a te! </h4>
                </div>

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-lg-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about"> <i
                                            class="fa fa-user-plus fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <h4 class="font-weight-semibold mb-2">Registrati</h4>
                                        <p class="text-muted mb-0">Bastano pochi secondi.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-lg-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about"> <i
                                            class="fa fa-users fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <h4 class="font-weight-semibold mb-2">Partecipa</h4>
                                        <p class="text-muted mb-0">Entra in un gruppo o costruiscine uno invitando amici.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-sm-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about">
                                        <i class="fa  fa-shopping-cart fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <h4 class="font-weight-semibold mb-2">Acquista</h4>
                                        <p class="text-muted mb-0">Crea ordini e con il tuo gruppo accordati per il ritiro</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>

        <section class="sptb bg-azzurro">
            <div class="container">

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-lg-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about"> <i
                                            class="fa fa-newspaper-o fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <!-- h4 class="font-weight-semibold mb-2">Informa</h4 -->
                                        <p class="text-muted mb-0">Informa i tuoi clienti di essere entrato nel circuito ProprioQui</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-lg-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about"> <i
                                            class="fa fa-percent fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <!-- h4 class="font-weight-semibold mb-2">Pensa</h4 -->
                                        <p class="text-muted mb-0">Pensa alle offerte da riservare loro</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="">
                            <div class="mb-sm-0 mb-4">
                                <div class="service-card text-center">
                                    <div class="bg-purple-transparent box-shadow icon-service text-indigo about">
                                        <i class="fa fa-users fa-4x"></i>
                                    </div>
                                    <div class="servic-data mt-3">
                                        <!-- h4 class="font-weight-semibold mb-2">Attiva</h4 -->
                                        <p class="text-muted mb-0">Attiva un gruppo d’acquisto sul tuo negozio o attività. Tutti sono interessati a comprare con sconti o offerte! </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <!-- /How -->

        <!-- Why -->
        <section class="sptb">
            <div class="container">
                <div class="section-title center-block text-center">
                    <h2> Perché acquistare da ProprioQui? </h2>
                </div>
                <div class="row ">

                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-success mb-3"> <i
                                            class="mdi mdi-store-outline text-white"></i> </div>
                                    <p>
                                        Perché potrai scegliere di acquistare dal tuo negozio preferito e farlo conoscere ad amici e colleghi 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-primary mb-3" style="padding-top: 5px;"> <i
                                            class="mdi mdi-sofa-single-outline text-white"></i> </div>
                                    <p>
                                        Perché con gli acquisti in gruppo otterrai interessanti vantaggi e sconti. Più spendi meno spendi
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-secondary mb-3"> <i
                                            class="mdi mdi-medal-outline text-white"></i> </div>
                                    <p>
                                         Perché, anche con un gesto semplice come fare la spesa, potrai fare la differenza.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row ">

                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-warning mb-3" style="padding-top: 5px;"> <i
                                            class="mdi mdi-pasta text-white"></i> </div>
                                    <p>
                                        Perché potrai portare i sapori di regioni d’Italia lontane anche nella tua città
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-danger mb-3" style="padding-top: 6px;"> <i
                                            class="mdi mdi-label-percent-outline text-white"></i> </div>
                                    <p>
                                        Grazie agli sconti riservati a chi acquista in gruppo potrai arrivare a prodotti che diversamente non acquisteresti 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-info mb-3" style="padding-top: 6px;"> <i
                                            class="mdi mdi-trending-up text-white"></i> </div>
                                    <p>
                                         Se sei un negoziante, entrando a far parte di ProprioQui, potrai raggiungere persone diverse, vicino a casa, ma anche lontane
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 col-lg-12 features">
                        <a href="/faq" class="btn btn-white btn-block">Domande frequenti</a>
                    </div>

                </div>
            </div>
        </section>
        <!-- /Why -->

    </div>

        <script type="module">
		import * as ah from '/assets/vue/v-common/address-helper-mixin.js';

		import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
		import * as supplierCategoriesService from '/assets/vue/v-services/common/read-only-resource-rest.js';
		supplierCategoriesService.setResourceEndpoint("supplierCategories");
		supplierCategoriesService.set404Message("Nessuna categoria trovata");

		import * as toastService from '/assets/vue/v-services/toast.js';
		
		import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
		import { store } from '/assets/vue/v-store/supplier-store.js';
        
        const wait = (ms) => new Promise((res) => setTimeout(res, ms));

        var GroupBuyApp = new Vue({
			el: '#v-group-buy-app',
			name: 'GroupBuy',
			mixins: [ah.addressHelperMixin],
			components: {
				'v-modal': VModal,
			},
			store,
            data: {
				sortOrder: '',
				supplierListLoading: false,
				supplierListLoaded: false,
			},
            computed: {
				//all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
					'supplier.supplierCategories',
					'supplier.supplierList',
					'pagination.total',
					'pagination.offset',
					'pagination.max',
					'sort.sort',
					'sort.order',
					'search.searchQuery',
                    'search.searchAddressString',
                    'search.searchCategoryId',
                    'search.searchLatitude',
                    'search.searchLongitude',
                    'search.search',
                    'search.searchDirty',
                    'search.reset',
					'loading',
					'error',
					'success',
					'debug',
					'geolocationSupported',
				]),
				isDebug: function () {
                    return this.debug
                },
                suppliersCount() {
                    if(_.isArray(this.supplierList))
                        return _.size(this.supplierList);
                    else
                        return -1;
                },
                suppliersTotal() {
                    return this.total;
				},
			},
			watch: {
				error: function (message) {
					toastService.alertDanger(message)
				},
				success: function (message) {
					toastService.alertSuccess(message)
				}
            },
            async mounted() {
				this.debug = ${isDebug};
                //will execute at pageload
                this.max = 4;
                this.fetchSupplierList(true)
                //TODO random base search query (fe/be?)
                this.scrollThroughSupplierList()
			},
            methods: {
				...Vuex.mapActions([
					'fetchSupplierListAction',
				]),
				async fetchSupplierList(/*boolean*/ reload = true) {
					try {
						await this.fetchSupplierListAction({service: supplierService, reload: reload})
					} catch (error) {
						console.log("fetchSupplierList",error)
					} finally {
						this.supplierListLoaded = true
					}
                },
                async scrollThroughSupplierList() {
                    let timeout = 8000
                    let step = 0
                    await wait(timeout/2)
                    while(step <= 8) {
                        await wait(timeout += step * 400);
                        console.log("timeout", step, timeout);
                        step++;
                        if(step == 8) {
                            await wait(timeout)
                            timeout = 5000
                            step = 0
                        }

                        await this.fetchSupplierListPage(step);
                    }
                },
                async fetchSupplierListPage(step = 0) {
                    this.offset = step * this.max
                    await this.fetchSupplierList(true)
                }

            },
        })        
    </script>

</body>
</html>
