<html>
<head>
	<meta name="layout" content="claylist"/>
    <title>Attività commerciali</title>
</head>
<body>

	<div class="app" id="v-suppliers-app" v-cloak>

		<!--Sliders Section-->
		<section class="theme-header">
			<div class="bannerimg cover-image bg-background sptb-1" >

				<div class="header-text1 mb-0">
				
					<div class="container">

						<div class="row">
							<div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
								<div class="search-background bg-transparent">

									<vue-lb-search-form ref="lbSearchForm"
										:options="supplierCategories"
										label="name"
										select-placeholder="Categorie"
										keyword-placeholder="Nome negozio o Keyword"
										address-placeholder="Luogo / indirizzo"
										use-position-text="Usa la mia posizione"
										search-enabled-text="Cerca"
										search-disabled-text="Inserire una keyword o un indirizzo"
										reset-search-text="Annulla ricerca"
										:is-debug="isDebug"
										@search="searchSuppliers"
										@keyword-changed="keywordChanged"
										@address-changed="addressChanged"
										@select-changed="categoryChanged"
										@dirty-changed="dirtyChanged"
										@latitude-changed="latitudeChanged"
										@longitude-changed="longitudeChanged"
										@error="handleError"
										>
									</vue-search-form>

								</div>

							</div>
						</div>
				
					</div>
				</div><!-- /header-text --> 

			</div>
		</section>
		<!--/Sliders Section-->

    	<!--Supplier listing-->
		<section class="sptb">
			<div class="container">
				<v-modal ref="registerLoginModal"></v-modal>
				<div class="row">

					<div v-if="suppliersCount==0 && !supplierListLoaded" class="col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="jumbotron">
									<h1 class="display-3">Dove sei?</h1>
									<p class="lead">Inserisci il tuo indirizzo o posizione per vedere le attività nelle vicinanze.</p>
									<p class="lead m-0"> <a @click="$refs.lbSearchForm.search(true)" class="btn btn-primary btn-lg text-white" role="button">Cerca nelle vicinanze</a> </p>
								</div>
							</div>
						</div>
					</div>

					<div v-if="suppliersCount==0 && supplierListLoaded" class="col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="jumbotron">
									<h1 class="display-3">Ops!</h1>
									<p class="lead">Nessuna attività trovata, prova una nuova ricerca.</p>
									<p class="lead m-0"> <a @click="$refs.lbSearchForm.resetSearch()" class="btn btn-primary btn-lg text-white" role="button">Annulla ricerca</a> </p>
								</div>
							</div>
						</div>
					</div>

					<!--Supplier lists-->
					<div v-if="suppliersCount>0" class="col-xl-12 col-lg-12 col-md-12">
						<div class=" mb-lg-0">
							<div class="">
								<div class="item2-gl ">
                                    <!-- filters toolbar-->
									<div class=" mb-0">
										<div class="">
											<div class="bg-white p-5 item2-gl-nav d-flex">
												<h6 class="mb-0 mt-2"> 1 - {{suppliersCount}} di {{ suppliersTotal }}</h6>
                                                <div class="nav item2-gl-menu ml-auto"></div>
												<%/*!-- ul class="nav item2-gl-menu ml-auto">
													<li class=""><a href="#tab-11" class="active show" data-toggle="tab" title="List style"><i class="fa fa-list"></i></a></li>
													<li><a href="#tab-12" data-toggle="tab" class="" title="Grid"><i class="fa fa-th"></i></a></li>
												</ul --*/%>
												<%/*!-- div class="d-flex">
													<label class="mr-2 mt-1 mb-sm-1" style="white-space: nowrap;">Ordina per:</label>
													<select name="sort" 
														class="form-control select-sm w-70"
														v-model="sortOrder"
														:disabled="searchDirty">
														<option value="newest">Più recente</option>
														<option value="oldest">Più vecchio</option>
														<option value="nearest">Più vicino</option>
													</select>
												</div --*/%>
											</div>
										</div>
									</div>
                                    <!-- list -->
									<div class="tab-content">
										<div class="tab-pane active" id="tab-12">
											<div class="row">

												<div v-for="(supplier, index) in supplierList" class="col-lg-4 col-md-6 col-xl-3">
													<div class="card overflow-hidden">
														<div class="item-card9-img">
															<div class="arrow-ribbon bg-info">{{ supplier.category.name }}</div>
															<div class="item-card9-imgs"> <a :href="'./supplier/'+supplier.id"></a> <img
																	:src="'/assets/theme/img/categories/supplier/category-'+supplier.category.id+'.jpg'" alt="img" class="cover-image"> </div>
															<!-- div class="item-card9-icons"> <a href="#" class="item-card9-icons1 wishlist"> <i
																		class="fa fa fa-heart-o"></i></a> </div -->
														</div>
														<div class="card-body">
															<div class="item-card9 text-dark">
															<em>Categoria:</em> <a :href="'./supplier/'+supplier.id"> {{ supplier.category.name }}</a>
																<a :href="'./supplier/'+supplier.id" class="text-dark mt-2">
																	<h4 class="font-weight-semibold mt-1">{{ supplier.name }} </h4>
																</a>
																<!-- p class="text-dark">{{ supplier.description }}</p -->
																<div class="item-card9-desc"> <a href="#" class="mr-4"><span class=""><i
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
																		<a :href="'./supplier/'+supplier.id+'/order'" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Ordina ora</a>
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

									</div>
								</div>

							</div>
						</div>
					</div>
					<!--/Supplier lists-->
                    
				</div>
			</div>
		</section>
		<!--Supplier Listing-->
	</div>

	<g:render template="/includes/js-vuelidate-js"/>
	<g:render template="/includes/js-vue-select-js"/>

    <script type="module">
		import * as dh from '/assets/vue/v-common/date-helper-mixin.js';

		import * as supplierService from '/assets/vue/v-services/supplier-rest.js';
		import * as supplierCategoriesService from '/assets/vue/v-services/common/read-only-resource-rest.js';
		supplierCategoriesService.setResourceEndpoint("supplierCategories");
		supplierCategoriesService.set404Message("Nessuna categoria trovata");

        import * as locationService from '/assets/vue/v-services/location.js';
		import * as toastService from '/assets/vue/v-services/toast.js';
		
		import VueLBSearchForm from '/assets/vue/v-common/location-based-search-form.vue.js'
		import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
		import { store } from '/assets/vue/v-store/supplier-store.js';
		
        var SupplierListApp = new Vue({
			el: '#v-suppliers-app',
			name: 'SupplierList',
			mixins: [dh.dateHelperMixin],
			components: {
				'v-modal': VModal,
				'vue-lb-search-form': VueLBSearchForm,
			},
			store,
            data: {
				sortOrder: '',
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
					console.log('suppliersCount', this.supplierList)
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
                sortOrder: async function (sortOrder) {
					if(!this.searchDirty) {
						switch(sortOrder) {
							case 'newest':
								this.sort = 'creationDate';
								this.order = 'desc';
								break;
							case 'oldest':
								this.sort = 'creationDate';
								this.order = 'asc';
								break;
							case 'nearest':
								this.sort = 'nearest';
								await this.fetchCoordinatesAction({service: locationService});
								//TODO
								break;
							default:
								this.sort = '';
								this.order = '';
						}
						//reset offset
						this.offset = 0;
						this.fetchSupplierList(true)
					}
				},
				search: function(search) {
					//Trigger search action
					if(search) {
						if(this.searchDirty)
							this.searchDirty = false
						this.fetchSupplierList(true);
					}
					this.search = false
				},
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
				this.supplierCategories = [{id:0, name:"Tutte le categorie"}]
                this.fetchSupplierCategories();

				//TODO ask for position

				//await this.fetchSupplierList(true);
				//this.supplierListLoaded = true
				//this.infiniteScroll();
			},
            methods: {
				...Vuex.mapActions([
					'fetchSupplierCategoriesAction',
					'fetchSupplierListAction',
					'fetchCoordinatesAction',
				]),
				keywordChanged(newKeyword) {
					this.searchQuery = newKeyword;
				},
				addressChanged(newAddress) {
					console.log("addressChanged", newAddress)
					this.searchAddressString = newAddress;
				},
				categoryChanged(newCategory) {
					this.searchCategoryId = newCategory;
				},
				latitudeChanged(newLatitude) {
					this.searchLatitude = newLatitude;
				},
				longitudeChanged(newLongitude) {
					this.searchLongitude = newLongitude;
				},
				dirtyChanged(newDirtyState) {
					console.log("dirtyChanged", newDirtyState)
				},
				handleError(errorMessage) {
					this.error = errorMessage;
				},
				async fetchSupplierCategories() {
					this.fetchSupplierCategoriesAction({service: supplierCategoriesService})
				},
				async searchSuppliers() {
                    //if(this.isDebug)
                        console.log("searchSuppliers");
					/*
                    if(!_.isUndefined(this.searchAddressString) && this.searchAddressString != "") {
                        //get coordinates for searchAddressString
                        await this.fetchCoordinatesAction({service: locationService, addressString: this.searchAddressString});
                    }

                    // toggle serch
					this.search = true;
					*/
					await this.fetchSupplierList(true);
					this.supplierListLoaded = true
					//this.infiniteScroll();
                },
				async fetchSupplierList(/*boolean*/ reload = false) {
					await this.fetchSupplierListAction({service: supplierService, reload: reload})
				},
                infiniteScroll() {
                    window.onscroll = () => {
                        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight >= document.body.scrollHeight;
					   
					    if(!this.searchDirty) {
							if (bottomOfWindow && _.size(this.supplierList) < this.total) {
								this.offset += this.max;
								this.fetchSupplierList(false);
							}
						}
						
                    };
				},
				addressFormat(deliveryAddress) {
					let formattedAddress = '';

					formattedAddress = '';
                    formattedAddress += deliveryAddress.address1 ? deliveryAddress.address1:'';
                    formattedAddress += deliveryAddress.address2 ? ' '+deliveryAddress.address2:'';
                    formattedAddress += formattedAddress.length>0?', ':'';
                    formattedAddress += deliveryAddress.postalCode ? deliveryAddress.postalCode:'';
                    formattedAddress += deliveryAddress.city ? ' '+deliveryAddress.city:'';
                    formattedAddress += formattedAddress.length>0?', ':'';
					formattedAddress += deliveryAddress.countryCode ? deliveryAddress.countryCode:'';
					
					return formattedAddress
				},
            },
        })        
    </script>

</body>
</html>