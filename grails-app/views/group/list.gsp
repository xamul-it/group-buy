<html>
<head>
	<meta name="layout" content="claylist"/>
    <title><g:message code="group.list.title"/></title>
</head>
<body>

	<div class="app" id="v-groups-app" v-cloak>

		<!--Sliders Section-->
		<section class="theme-header">
			<div class="cover-image bg-background sptb-1 bg-azzurro" >

				<div class="header-text1 slide-header-text mt-0 mb-0">
				
					<div class="container">

						<div class="row">
							<div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
								<div class="search-background bg-transparent">

									<div class="text-center mb-6">
										<h1 class="mb-1 d-none d-md-block">
											Più spendi meno spendi. Ecco i gruppi a cui unirsi per acquistare in compagnia. Scopri le offerte e le novità  

											<%/*Trova gruppi di acquisto in zona e partecipa 
											<br/> o crea il tuo adesso. */%>
										</h1>
									</div>
									
									<vue-lb-search-form ref="lbSearchForm"
										:options="groupCategories"
										label="name"
										select-placeholder="Categorie"
										keyword-placeholder="Nome gruppo o Keyword"
										address-placeholder="Luogo / indirizzo"
										default-address="Piazza del Duomo, 20122, Milano"
										use-position-text="Usa la mia posizione"
										search-enabled-text="Cerca"
										search-disabled-text="Inserire una keyword o un indirizzo"
										reset-search-text="Annulla ricerca"
										:is-debug="isDebug"
										@search="searchGroups"
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

		<!--Group listing-->
			<section class="sptb">
				<div class="container">
					<v-modal ref="registerLoginModal"></v-modal>
					
					<div class="row">

						<div v-if="groupsCount==0 && !groupListLoaded" class="col-xl-12 col-lg-12 col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="jumbotron">
										<h1 class="display-3">Dove sei?</h1>
										<p class="lead">Inserisci il tuo indirizzo o posizione per vedere i gruppi nelle vicinanze.</p>
										<p class="lead m-0"> <a @click="$refs.lbSearchForm.search(true)" class="btn btn-primary btn-lg text-white" role="button">Cerca nelle vicinanze</a> </p>
									</div>
								</div>
							</div>
						</div>

						<div v-if="groupsCount==0 && groupListLoaded" class="col-xl-12 col-lg-12 col-md-12">
							<div class="card">
								<div class="card-body">
									<div class="jumbotron">
										<h1 class="display-3">Ops!</h1>
										<p class="lead">Nessun gruppo trovato, prova una nuova ricerca.</p>
										<p class="lead m-0"> <a @click="$refs.lbSearchForm.resetSearch()" class="btn btn-primary btn-lg text-white" role="button">Annulla ricerca</a> </p>
									</div>
								</div>
							</div>
						</div>
					
						<!--Group filters toolbar -->
						<div v-if="groupsCount>0" class="col-xl-12 col-lg-12 col-md-12">
							
							<div class=" mb-0">
								<div class="">
									<div class="bg-white p-5 item2-gl-nav d-flex">
										<h6 class="mb-0 mt-2"> 1 - {{groupsCount}} di {{ groupsTotal }}</h6>
										<div class="nav item2-gl-menu ml-auto"></div>
										<div class="d-flex">
											<label class="mr-2 mt-1 mb-sm-1" style="white-space: nowrap;"><g:message code="list.orderBy"/>:</label>
											<select name="sort" 
												class="form-control select-sm w-70"
												v-model="sortOrder"
												:disabled="searchDirty">
												<option value="newest"><g:message code="list.newest"/></option>
												<option value="oldest"><g:message code="list.oldest"/></option>
												<option value="nearest"><g:message code="list.nearest"/></option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--/Group filters toolbar -->

					</div>

					<div class="row">
						<!--Group lists-->
						<div v-if="groupsCount>0" class="col-xl-9 col-lg-8 col-md-12">
							<div class=" mb-lg-0">
								<div class="">
									<div class="item2-gl ">
										
										<!-- list -->
										<div class="tab-content">
											<div class="tab-pane active" id="tab-11">
												<!-- /list item -->
												<div v-for="(group, index) in groupList" class="card overflow-hidden">
													<div class="d-md-flex">
														<div class="item-card9-img">
															<div class="arrow-ribbon bg-primary">{{ group.category.name }}</div>
															<div class="item-card9-imgs">
																<a :href="'/gruppo/' + group.id"></a>
																<img :src="'/assets/theme/img/categories/category-'+group.category.id+'.jpg'" :alt="group.category.name" :title="group.category.name" class="cover-image">
															</div>
															<div class="item-card9-icons">
																<sec:ifNotLoggedIn>
																	<a class="item-card9-icons1 subscription" style="cursor:pointer" title="${g.message(code:'group.action.favourite')}" @click="$refs.registerLoginModal.openModal()"> <i class="fa fa fa-heart-o"></i></a>
																</sec:ifNotLoggedIn>
																<sec:ifLoggedIn>
																	<a v-if="group.administrator" class="item-card9-icons1 ownership" title="${g.message(code:'group.action.admin')}" :href="'/gruppo/' + group.id +'/modifica'"> <i class="fa fa fa-group"></i></a>
																	<a v-else v-on="!group.member ? { click:()=>subscribe(group.id, index) }:{ click:()=>null }" class="item-card9-icons1 subscription" :class="{active: group.member}" style="cursor:pointer" :title="group.member ? '${g.message(code:'group.action.myFavourite')}' :'${g.message(code:'group.action.favourite')}'"> <i class="fa fa fa-heart-o"></i></a>
																</sec:ifLoggedIn>

															</div>
														</div>
														<div class="card border-0 mb-0">
															<div class="card-body ">
																<div class="item-card9">
																	<a :href="'/gruppo/' + group.id" class="text-dark"><h4 class="font-weight-semibold mt-1">{{ group.name }}</h4></a>
																	<p class="mb-0 leading-tight text-dark">{{ group.description }}</p>
																</div>
															</div>
															<div class="card-footer pt-4 pb-4">
																<div class="item-card2-footer d-sm-flex">

																	<a :href="'/gruppo/' + group.id" title="Creato"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(group.creationDate) }} </a>

																	<div class="ml-auto">
																		<a class="location" :title="addressFormat(group.deliveryAddress)"><i class="fa fa-map-marker text-muted mr-1"></i> {{ group.deliveryAddress.city }}</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- /list item -->
												
											</div>
											
										</div>


										
										
									</div>

								</div>
							</div>
						</div>
						<!--/Group lists-->
						
						<div v-if="groupsCount>0" class="col-xl-3 col-lg-4 col-md-12">

							<div class="item2-gl ">
								<div class="tab-content">

									<div class="card"> 
										<div class="card-body"> 
											<div class="row group-actions">
													<sec:ifLoggedIn>
														<g:render template="/buttons/new-order" model="[:]"/>
													</sec:ifLoggedIn>
													<sec:ifNotLoggedIn>
														<div class="col-md-12 form-group">
															<g:render template="/buttons/new-order-modal" model="[:]"/>
														</div>
													</sec:ifNotLoggedIn>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--Group Listing-->

			<!-- CTA -->
			<sec:ifNotLoggedIn>
				<section>
					<div class="cover-image sptb bg-background-color" style="background: rgba(0, 0, 0, 0) repeat scroll center center;">
						<div class="content-text mb-0">
							<div class="container">
								<div class="text-center text-white ">
									<h2 class="mb-2 display-5">Sei pronto ad acquistare online dai tuoi negozi di vicinato preferiti?</h2>
									<div class="mt-5"> <a href="/register/register" class="btn btn-primary btn-pill">Iscriviti ora</a> </div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</sec:ifNotLoggedIn>
			<!-- /CTA-->
			
	</div>

	<g:render template="/includes/js-vue-select-js"/>

    <script type="module">
		import * as dh from '/assets/vue/v-common/date-helper-mixin.js';
		import * as ah from '/assets/vue/v-common/address-helper-mixin.js';

		import * as groupService from '/assets/vue/v-services/group-rest.js';
		import * as categoriesService from '/assets/vue/v-services/common/read-only-resource-rest.js';
		categoriesService.setResourceEndpoint("groupCategories");
		categoriesService.set404Message("Nessuna categoria trovata");

        import * as locationService from '/assets/vue/v-services/location.js';
		import * as toastService from '/assets/vue/v-services/toast.js';
		
		import VueLBSearchForm from '/assets/vue/v-common/location-based-search-form.vue.js'
		import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
		import { store } from '/assets/vue/v-store/group-store.js';
		
        var GroupListApp = new Vue({
			el: '#v-groups-app',
			name: 'GroupList',
			mixins: [dh.dateHelperMixin,ah.addressHelperMixin],
			components: {
				'v-modal': VModal,
				'vue-lb-search-form': VueLBSearchForm,
			},
			store,
            data: {
				sortOrder: '',
				groupListLoading: false,
				groupListLoaded: false,
			},
            computed: {
				//all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
					'group.groupCategories',
					'group.groupList',
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
                groupsCount() {
					console.log('groupsCount', this.groupList)
                    if(_.isArray(this.groupList))
                        return _.size(this.groupList);
                    else
                        return -1;
                },
                groupsTotal() {
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
								this.$refs.lbSearchForm.search(true);
								break;
							default:
								this.sort = '';
								this.order = '';
						}
						//reset offset
						this.offset = 0;
						this.fetchGroupList(true)
					}
				},
				search: function(search) {
					//Trigger search action
					if(search) {
						if(this.searchDirty)
							this.searchDirty = false
						this.fetchGroupList(true);
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
				this.groupCategories = [{id:0, name:"Tutte le categorie"}]
                this.fetchGroupCategories();

				await this.$refs.lbSearchForm.search(true);
				//TODO test infinite scroll				
				this.infiniteScroll();
            },
            methods: {
				...Vuex.mapActions([
					'fetchGroupCategoriesAction',
					'fetchGroupListAction',
					'fetchCoordinatesAction',
					'subscriptionAction',
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
				async fetchGroupCategories(/*boolean*/ reload = false) {
					this.fetchGroupCategoriesAction({service: categoriesService, reload: reload})
				},
				async searchGroups() {
					await this.fetchGroupList(true);
				},
				async fetchGroupList(/*boolean*/ reload = false) {
					try {
						await this.fetchGroupListAction({service: groupService, reload: reload})
					} catch (error) {
						console.log("fetchGroupList", error)
					} finally {
						this.groupListLoaded = true
					}
				},
				async subscribe(groupId, groupIndex) {
					console.log("Subscribe to "+groupId+" at index "+groupIndex);
					await this.subscriptionAction({service: groupService, groupId: groupId, groupIndex: groupIndex, subscribe: true, mode: 'list'})
				},
				async unsubscribe(groupId, groupIndex) {
					console.log("Unsubscribe from "+groupId+" at index "+groupIndex);
					await this.subscriptionAction({service: groupService, groupId: groupId, groupIndex: groupIndex, subscribe: false, mode: 'list'})
				},
                infiniteScroll() {
                    window.onscroll = () => {
                        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight >= document.body.scrollHeight;
					   
					    if(!this.searchDirty) {
							if (bottomOfWindow && _.size(this.groupList) < this.total) {
								this.offset += this.max;
								this.fetchGroupList(false);
							}
						}
						
                    };
				},
            },
        })        
    </script>

</body>
</html>