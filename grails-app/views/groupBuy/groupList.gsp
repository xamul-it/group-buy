<html>
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppi di acquisto</title>
</head>
<body>

	<!--Sliders Section-->
	<g:render template="/search/group-search" />
    <!--/Sliders Section-->

    <!--Group listing-->
		<section class="sptb">
			<div class="container" id="v-groups-app" v-cloak>
				<v-modal ref="registerLoginModal"></v-modal>
				<div class="row">
					<div v-if="groupsCount==0 && groupListLoaded" class="col-md-12 col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="jumbotron">
									<h1 class="display-3">Ops!</h1>
									<p class="lead">Nessun gruppo trovato, prova una nuova ricerca.</p>
									<p class="lead m-0"> <a @click="resetSearch()" class="btn btn-primary btn-lg text-white" role="button">Annulla ricerca</a> </p>
								</div>
							</div>
						</div>
					</div>

					<!--Group lists-->
					<div v-if="groupsCount>0" class="col-xl-12 col-lg-12 col-md-12">
						<div class=" mb-lg-0">
							<div class="">
								<div class="item2-gl ">
                                    <!-- filters toolbar-->
									<div class=" mb-0">
										<div class="">
											<div class="bg-white p-5 item2-gl-nav d-flex">
												<h6 class="mb-0 mt-2"> 1 - {{groupsCount}} di {{ groupsTotal }}</h6>
                                                <div class="nav item2-gl-menu ml-auto"></div>
												<!-- ul class="nav item2-gl-menu ml-auto">
													<li class=""><a href="#tab-11" class="active show" data-toggle="tab" title="List style"><i class="fa fa-list"></i></a></li>
													<li><a href="#tab-12" data-toggle="tab" class="" title="Grid"><i class="fa fa-th"></i></a></li>
												</ul -->
												<div class="d-flex">
													<label class="mr-2 mt-1 mb-sm-1" style="white-space: nowrap;">Ordina per:</label>
													<select name="sort" 
														class="form-control select-sm w-70"
														v-model="sortOrder"
														:disabled="searchDirty">
														<option value="newest">Più recente</option>
														<option value="oldest">Più vecchio</option>
														<option value="nearest">Più vicino</option>
													</select>
												</div>
											</div>
										</div>
									</div>
                                    <!-- list -->
									<div class="tab-content">
										<div class="tab-pane active" id="tab-11">
                                            <!-- /list item -->
											<div v-for="(group, index) in groupList" class="card overflow-hidden">
												<div class="d-md-flex">
													<div class="item-card9-img">
														<div class="arrow-ribbon bg-primary">{{ group.category.name }}</div>
														<div class="item-card9-imgs">
															<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id"></a>
															<img :src="'/assets/theme/img/categories/category-'+group.category.id+'.jpg'" :alt="group.category.name" :title="group.category.name" class="cover-image">
														</div>
														<div class="item-card9-icons">
															<sec:ifNotLoggedIn>
																<a class="item-card9-icons1 subscription" style="cursor:pointer" @click="$refs.registerLoginModal.openModal()"> <i class="fa fa fa-heart-o"></i></a>
															</sec:ifNotLoggedIn>
															<sec:ifLoggedIn>
																<a v-if="group.administrator" class="item-card9-icons1 ownership" title="Amministra gruppo"
																	:href="'${createLink(controller: 'groupBuy', action: 'groupEdit')}/' + group.id"> <i class="fa fa fa-group"></i></a>
																<a v-else v-on="!group.member ? { click:()=>subscribe(group.id, index) }:{ click:()=>unsubscribe(group.id, index) }" class="item-card9-icons1 subscription" :class="{active: group.member}" style="cursor:pointer"> <i class="fa fa fa-heart-o"></i></a>
                            								</sec:ifLoggedIn>

														</div>
													</div>
													<div class="card border-0 mb-0">
														<div class="card-body ">
															<div class="item-card9">
																<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id" class="text-dark"><h4 class="font-weight-semibold mt-1">{{ group.name }}</h4></a>
																<p class="mb-0 leading-tight text-dark">{{ group.description }}</p>
															</div>
														</div>
														<div class="card-footer pt-4 pb-4">
															<div class="item-card2-footer d-sm-flex">

																<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id" title="Creato"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(group.creationDate) }} </a>

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
                    
				</div>
			</div>
		</section>
		<!--Group Listing-->

	<!-- Vue Pages and Components here -->

    <script type="module">
		import * as dh from '/assets/vue/v-common/date-helper-mixin.js';

		import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as locationService from '/assets/vue/v-services/location.js';
		import * as toastService from '/assets/vue/v-services/toast.js';
		
		import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
		import { store } from '/assets/vue/v-store/group-store.js';
		
        var GroupListApp = new Vue({
			el: '#v-groups-app',
			name: 'GroupList',
			mixins: [dh.dateHelperMixin],
			components: {
				'v-modal': VModal,
			},
			store,
            data: {
				sortOrder: '',
				groupListLoaded: false,
			},
            computed: {
				//all needed data fields from vuex store
                //mapped with vuex-map-fields
                ...mapFields([
					'group.groupList',
					'pagination.total',
					'pagination.offset',
					'pagination.max',
					'sort.sort',
					'sort.order',
					'search.search',
					'search.searchDirty',
					'search.reset',
					'loading',
					'error',
					'success',
                    'debug',
				]),
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
								await this.fetchCoordinatesAction({service: locationService});
								//TODO
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
				await this.fetchGroupList(true);
				this.groupListLoaded = true
				this.infiniteScroll();
            },
            methods: {
				...Vuex.mapActions([
					'fetchGroupListAction',
					'subscriptionAction',
					'fetchCoordinatesAction',
                ]),
				async fetchGroupList(/*boolean*/ reload = false) {
					await this.fetchGroupListAction({service: groupService, reload: reload})
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
				resetSearch() {
					this.reset = true
                },
            },
        })        
    </script>

</body>
</html>