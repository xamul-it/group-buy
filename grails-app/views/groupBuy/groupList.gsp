<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppi di acquisto</title>

	<!-- vuex store -->
	<script type="module" src="/assets/vue/v-store/store.js"></script>
	<!-- actions -->
	<script type="module" src="/assets/vue/v-store/actions.js"></script>
	<!-- alerts -->
	<script type="module" src="/assets/vue/v-services/toast.js"></script>
	<!-- vue form validation -->
	<script src="/assets/vue/v-jslib/vuelidate@0.7.5/vuelidate.min.js"></script>
	<script src="/assets/vue/v-jslib/vuelidate@0.7.5/validators.min.js"></script>
	<!-- date time helpers -->
	<script src="/assets/vue/v-jslib/moment@2.28.0/moment.js"></script>
    <script src="/assets/vue/v-jslib/moment@2.28.0/locale/it.js"></script>

</head>
<body>

	<!--Sliders Section-->
	<g:render template="/search/group-search" />
    <!--/Sliders Section-->

    <!--Group listing-->
		<section class="sptb">
			<div class="container" id="v-groups-app">
				<v-modal ref="registerLoginModal"></v-modal>
				<div class="row">

					<!--Group lists-->
					<div class="col-xl-12 col-lg-12 col-md-12">
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
													<select name="sort" v-model="sortOrder" class="form-control select-sm w-70">
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
																	:href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id +'?edit=true'"> <i class="fa fa fa-group"></i></a>
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
                                                <!-- pre>{{ group }}</pre -->
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
	<script type="module" src="/assets/vue/v-services/group-rest.js"></script>

    <script type="module">
		import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as locationService from '/assets/vue/v-services/location.js';
		import * as toastService from '/assets/vue/v-services/toast.js';
		
		import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
		import { store } from '/assets/vue/v-store/store.js';
		
		moment.locale('it');

        var app = new Vue({
			el: '#v-groups-app',
			components: {
				'v-modal': VModal,
			},
			store,
            data: {
				sortOrder: '',
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
					'error',
					'success',
                    'debug',
				]),
                groupsCount() {
                    if(_.isArray(this.groupList))
                        return _.size(this.groupList);
                    else
                        return 0;
                },
                groupsTotal() {
                    return this.total;
				},
			},
			watch: {
                sortOrder: async function (sortOrder) {
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
					this.fetchGroupList(true);
				},
				search: function(search) {
					console.log("search watcher", search);

					this.fetchGroupList(true);

					this.search = false;
				}
            },
            mounted() {
				this.debug = ${isDebug};
				//will execute at pageload
				this.fetchGroupList(true);
				this.infiniteScroll();
            },
            methods: {
				...Vuex.mapActions([
					'fetchGroupListAction',
					'subscription',
					'fetchCoordinatesAction'
                ]),
				async fetchGroupList(/*boolean*/ reload = false) {
					this.fetchGroupListAction({service: groupService, reload: reload})
				},
				async subscribe(groupId, groupIndex) {
					console.log("Subscribe to "+groupId+" at index "+groupIndex);
					this.subscription({service: groupService, groupId: groupId, groupIndex: groupIndex, subscribe: true})
				},
				async unsubscribe(groupId, groupIndex) {
					console.log("Unsubscribe from "+groupId+" at index "+groupIndex);
					this.subscription({service: groupService, groupId: groupId, groupIndex: groupIndex, subscribe: false})
				},
                infiniteScroll() {
                    window.onscroll = () => {
                        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight >= document.body.scrollHeight;
					   
                        if (bottomOfWindow && _.size(this.groupList) < this.total) {
                            this.offset += this.max;
                            this.fetchGroupList(false);
						}
						
                    };
				},
				timeFromNow(date) {
        		    return moment(date).fromNow();
                },
                dateTime(date) {
        		    return moment(date).format('D MMMM YYYY, h:mm');
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
				}

            },
        })        
    </script>

</body>
</html>