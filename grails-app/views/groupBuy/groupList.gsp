<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppi di acquisto</title>

	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.js"></script>
	<script src="https://unpkg.com/lodash@4.17.19/lodash.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/locale/it.js"></script>

</head>
<body>

	<!--Sliders Section-->
	<g:render template="/search/group-search" />
    <!--/Sliders Section-->

    <!--Group listing-->
		<section class="sptb">
			<div class="container" id="v-groups-app">
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
														<option value="bigger">Più grande</option>
														<option value="smaller">Più piccolo</option>
													</select>
												</div>
											</div>
										</div>
									</div>
                                    <!-- list -->
									<div class="tab-content">
										<div class="tab-pane active" id="tab-11">
                                            <!-- /list item -->
											<div v-for="group in groups" class="card overflow-hidden">
												<div class="d-md-flex">
													<div class="item-card9-img">
														<div class="arrow-ribbon bg-primary">Gruppo speciale</div>
														<div class="item-card9-imgs">
															<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id"></a>
															<img src="/assets/claylist/images/products/h4.png" alt="img" class="cover-image">
														</div>
														<div class="item-card9-icons">
															<a href="#favorite" class="item-card9-icons1 wishlist"> <i class="fa fa fa-heart-o"></i></a>
														</div>
													</div>
													<div class="card border-0 mb-0">
														<div class="card-body ">
															<div class="item-card9">
																<a href="#categoria">Categoria</a>
																<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id" class="text-dark"><h4 class="font-weight-semibold mt-1">{{ group.name }}</h4></a>
																<p class="mb-0 leading-tight text-dark">{{ group.description }}</p>
																<a :href="'${createLink(controller: 'groupBuy', action: 'group')}/' + group.id" title="Creato"><i class="fa fa-clock-o mr-1"></i> {{ timeFromNow(group.creationDate) }} </a>
															</div>
														</div>
														<div class="card-footer pt-4 pb-4">
															<div class="item-card2-footer d-sm-flex">
																<div class="rating-stars d-inline-flex">
																	<input type="number" readonly="readonly" class="rating-value star" name="rating-stars-value"  value="3">
																	<div class="rating-stars-container">
																		<div class="rating-star sm">
																			<i class="fa fa-star"></i>
																		</div>
																		<div class="rating-star sm">
																			<i class="fa fa-star"></i>
																		</div>
																		<div class="rating-star sm">
																			<i class="fa fa-star"></i>
																		</div>
																		<div class="rating-star sm">
																			<i class="fa fa-star"></i>
																		</div>
																		<div class="rating-star sm">
																			<i class="fa fa-star"></i>
																		</div>
																	</div> (000 reviews)
																</div>
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

								<!-- div class="center-block text-center">
									<ul class="pagination mb-5">
										<li class="page-item page-prev disabled">
											<a class="page-link" href="#" tabindex="-1">Precedente</a>
										</li>
										<li class="page-item active"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item page-next">
											<a class="page-link" href="#">Successivo</a>
										</li>
									</ul>
								</div -->

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
		
		moment.locale('it');

        var app = new Vue({
            el: '#v-groups-app',
            data: {
                groups: [],
                total: 0,
                max: 4, //The maximum number to list
                offset: 0, //The offset from the first result to list from
                sort: '', //The property name to sort by
				order: '', //How to order the list, either "desc" or "asc"
				sortOrder: '',
				//https://docs.grails.org/latest/ref/Domain Classes/list.html
				error: null,
                loading: false,
            },
            computed: {
                groupsCount() {
                    if(_.isArray(this.groups))
                        return _.size(this.groups);
                    else
                        return 0;
                },
                groupsTotal() {
                    if(this.total > 0)
                        return this.total;
                    else if(_.isArray(this.groups))
                        return _.size(this.groups);
                    else
                        return 0;
                },
			},
			watch: {
                sortOrder: function (sortOrder) {
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
							//TODO
							break;
						case 'bigger':
							//TODO
							break;
						case 'smaller':
							//TODO
							break;
						default:
							this.sort = '';
							this.order = '';
					}
					//reset offset
					this.offset=0
					this.fetchGroupList(true);
				},
            },
            mounted() {
				//will execute at pageload
				this.fetchGroupList();
				this.infiniteScroll();
            },
            methods: {
				async fetchGroupList(/*boolean*/ reload = false) {
                    try {
                        this.setLoadingState();
						let { data, headers } = await groupService.list(this.max,this.offset,this.sort,this.order);
						if(reload)
							this.groups = data;
						else
							this.groups = _.concat(this.groups, data);
						
						this.total = headers['x-pagination-total'];
                        // Reset the loading state after fetching groups.
                        this.loading = false;
                    } catch (error) {
                        console.log("catch error", error);
                        this.setErrorState(error);
                    } finally {
                        console.log("finally vue data", this.$data);
                    }
				},
				setErrorState(error) {
                    this.error = error;
                    this.loading = false;
                },
                setLoadingState() {
                    this.error = null;
                    this.loading = true;
                },
                infiniteScroll() {
                    window.onscroll = () => {
                        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight >= document.body.scrollHeight;
					   
                        if (bottomOfWindow && _.size(this.groups) < this.total) {
                            this.offset += this.max;
                            this.fetchGroupList();
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