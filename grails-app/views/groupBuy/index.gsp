<html>
<head>
    <meta name="layout" content="claylist"/>
    <title>Group-buy</title>
</head>
<body>
    <div class="app" id="v-group-buy-app">
        <!--Sliders Section-->
        <section class="theme-header">
            <div class="bannerimg cover-image bg-background" >
                <div class="header-text1 mb-0">
                    <div class="container">
                        <div class="text-left text-white">
                            <h1 class="">Mettiamo in contatto i negozi e le piccole attivit&agrave; locali che consegnano a domicilio con i gruppi di acquisto di vicinato.</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/Sliders Section-->

        <!--Shops list -->
        <section class="sptb bg-white" v-cloak>
            <div class="container">
            <v-modal ref="registerLoginModal"></v-modal>

                <div class="section-title center-block text-left">
                    <h2>Attività di vicinato</h2>
                </div>

                <div class="row">
                

                    <div v-for="(supplier, index) in supplierList" class="col-lg-4 col-md-6 col-xl-3">
                        <div class="card overflow-hidden">
                            <div class="item-card9-img">
                                <div class="arrow-ribbon bg-info">{{ supplier.category.name }}</div>
                                <div class="item-card9-imgs"> <a :href="'./supplier/'+supplier.id+'/'+encodeURI(supplier.name)"></a> <img
                                        :src="'/assets/theme/img/categories/supplier/category-'+supplier.category.id+'.jpg'" alt="img" class="cover-image"> </div>
                                <!-- div class="item-card9-icons"> <a href="#" class="item-card9-icons1 wishlist"> <i
                                            class="fa fa fa-heart-o"></i></a> </div -->
                            </div>
                            <div class="card-body">
                                <div class="item-card9 text-dark">
                                <em>Categoria:</em> <a :href="'./supplier/'+supplier.id+'/'+encodeURI(supplier.name)"> {{ supplier.category.name }}</a>
                                    <a :href="'./supplier/'+supplier.id+'/'+encodeURI(supplier.name)" class="text-dark mt-2">
                                        <h4 class="font-weight-semibold mt-1">{{ supplier.name }} </h4>
                                    </a>
                                    <!-- p class="text-dark">{{ supplier.description }}</p -->
                                    <div class="item-card9-desc"> <a target="_blank" :href="'https://www.openstreetmap.org/?mlat='+supplier.shippingAddress.lat+'&mlon='+supplier.shippingAddress.lon+'#map=19/'+supplier.shippingAddress.lat+'/'+supplier.shippingAddress.lon" class="mr-4"><span class=""><i
                                                    class="fa fa-map-marker text-muted mr-1"></i> {{ supplier.shippingAddress.address1 }} {{ supplier.shippingAddress.city }}</span></a> 
                                                    <!-- a href="#"
                                            class=""><span class=""><i class="fa fa-calendar-o text-muted mr-1"></i>
                                                Nov-15-2019</span></a-->
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="item-card9-footer d-flex">
                                    <div class="item-card9-cost">
                                        <sec:ifLoggedIn>
                                            <a :href="'./groupBuy/supplier/'+supplier.id+'/order'" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Ordina ora</a>
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


                    <!-- div class="col-lg-4 col-md-6 col-xl-3">
                        <div class="card mb-0">
                            <div class="power-ribbon power-ribbon-top-left text-warning"><span class="bg-warning"><i
                                        class="fa fa-bolt"></i></span></div>
                            <div class="item-card2-img"> <a href="classified.html"></a> <img
                                    src="../assets//images/products/products/f3.jpg" alt="img" class="cover-image">
                            </div>
                            <div class="item-card2-icons"> <a href="#" class="item-card2-icons-l bg-primary"> <i
                                        class="fa fa-cutlery"></i></a> <a href="#"
                                    class="item-card2-icons-r bg-secondary"><i class="fa fa fa-heart-o"></i></a>
                            </div>
                            <div class="card-body pb-0">
                                <div class="item-card2">
                                    <div class="item-card2-desc">
                                        <div class="item-card2-text"> <a href="classified.html" class="text-dark">
                                                <h4 class="mb-0">Somik Restaurant</h4>
                                            </a> </div>
                                        <div class="d-flex pb-0 pt-0"> <a href="">
                                                <p class="pb-0 pt-0 mb-2 mt-2"><i
                                                        class="fa fa-map-marker text-danger mr-2"></i>Florida, Uk
                                                </p>
                                            </a> <span class="ml-3 pb-0 pt-0 mb-2 mt-2">$200.00</span> </div>
                                        <p class="">Ut enim ad minima veniam, quis int nostrum exercitationem </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="item-card2-footer">
                                    <div class="item-card2-footer-u">
                                        <div class="row d-flex"> <span
                                                class="review_score mr-2 badge badge-primary">4.0/5</span>
                                            <div class="rating-stars d-inline-flex"> <input type="number"
                                                    readonly="readonly" class="rating-value star"
                                                    name="rating-stars-value" value="3">
                                                <div class="rating-stars-container">
                                                    <div class="rating-star sm is--active"> <i
                                                            class="fa fa-star"></i> </div>
                                                    <div class="rating-star sm is--active"> <i
                                                            class="fa fa-star"></i> </div>
                                                    <div class="rating-star sm is--active"> <i
                                                            class="fa fa-star"></i> </div>
                                                    <div class="rating-star sm"> <i class="fa fa-star"></i> </div>
                                                    <div class="rating-star sm"> <i class="fa fa-star"></i> </div>
                                                </div> (5 Reviews)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div -->

                </div>
            </div>
        </section>
        <!--/Shops list -->

        <!-- What -->
        <section class="sptb">
            <div class="container">
                
                <div class="text-justify">
                    <h2 class="mb-4">Cos'&egrave; Group-buy?</h2>
                    <h4 class="leading-normal"> PER AVVICINARE I NEGOZI AI CLIENTI MANTENENDO LE DISTANZE </h4>
                    <p class="leading-normal">
                        Cerchiamo di mantenere vivo il commercio al dettaglio in un periodo in cui il commercio elettronico rischia di distruggere il tessuto commerciale al dettaglio e il legame umano che si crea tra negoziante e cliente.
                    </p>
                    <p class="leading-normal">
                        Offriamo un servizio gratuito che consente in modo semplice di gestire ordini ai negozi della propria zona. Gli ordini possono essere individuali o di gruppo, ad esempio un condominio. Nel caso di ordini di gruppo il punto di consegna deve essere unico, in questo modo il negoziante è agevolato nella gestione del ordine di un gruppo di acquisto.
                    </p>
                    <p class="leading-normal">
                        Non si tratta di un sistema di e-commerce, ma solo di un sistema che agevola la relazione tra negoziante e cliente in un era sempre più digitale. Sta al negoziante e al cliente mettersi d’accordo sulle modalità di pagamento e anche sulla modalità di consegna. Può essere ad esempio agevole ritirare la merce direttamente al punto vendita quando è pronta. 
                    </p>
                </div>

            </div>
        </section>
        <!-- /What -->

        <!-- How -->
        <section class="sptb bg-white">
            <div class="container">
                <div class="section-title center-block text-center">
                    <h2>Come funziona?</h2>
                    <p>In tre semplici passi, effettua gli acquisti di gruppo presso le attività di vicinato.</p>
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
                                        <p class="text-muted mb-0">Iscriviti a Group-buy bastano pochi secondi.</p>
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
                                        <h4 class="font-weight-semibold mb-2">Scegli il gruppo</h4>
                                        <p class="text-muted mb-0">Partecipa ad un gruppo o crea il tuo e invita amici.</p>
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
                                        <h4 class="font-weight-semibold mb-2">Acquista online</h4>
                                        <p class="text-muted mb-0">Prepara i tuoi ordini e, insieme al gruppo acquista presso il negozio preferito.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- /How -->

        <!-- CTA -->
        <section>
            <div class="cover-image sptb bg-background-color" style="background: rgba(0, 0, 0, 0) repeat scroll center center;">
                <div class="content-text mb-0">
                    <div class="container">
                        <div class="text-center text-white ">
                            <h2 class="mb-2 display-5">Sei pronto ad acquistare online dai tuoi negozi di vicinato preferiti?</h2>
                            <!-- p>Text message.</p -->
                            <div class="mt-5"> <a href="/register/register" class="btn btn-primary btn-pill">Iscriviti ora</a> </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /CTA-->

        <!-- Why -->
        <section class="sptb">
            <div class="container">
                <div class="section-title center-block text-center">
                    <h2>Perch&eacute; scegliere Group-buy?</h2>
                    <p>Mauris ut cursus nunc. Morbi eleifend, ligula at consectetur vehicula</p>
                </div>
                <div class="row ">
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-success mb-3"> <i
                                            class="fa fa-bullhorn  text-white"></i> </div>
                                    <h3>Motivo uno</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-primary mb-3"> <i
                                            class="fa fa-heart  text-white"></i> </div>
                                    <h3>Motivo due</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
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
                                            class="fa fa-bookmark  text-white"></i> </div>
                                    <h3>Motivo tre</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card mb-lg-0">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-warning mb-3"> <i
                                            class="fa fa-line-chart   text-white"></i> </div>
                                    <h3>Motivo quattro</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card mb-lg-0 mb-md-0">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-danger mb-3"> <i
                                            class="fa fa-handshake-o   text-white"></i> </div>
                                    <h3>Motivo cinque</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 features">
                        <div class="card mb-0">
                            <div class="card-body text-center">
                                <div class="feature">
                                    <div class="fa-stack fa-lg  fea-icon bg-info mb-3"> <i class="fa fa-phone  text-white"></i>
                                    </div>
                                    <h3>Motivo sei</h3>
                                    <p>our being able to do what we like best, every pleasure is to be welcomed and every pain.
                                    </p>
                                </div>
                            </div>
                        </div>
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