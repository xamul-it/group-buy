<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppi di acquisto</title>
</head>
<body>

    <g:render template="/navigation/theme-topbar" />

	<g:render template="/navigation/theme-nav" />

    <!--Sliders Section-->
    <section>
        <div class=" cover-image sptb-1 bg-background" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            
            <!-- div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Gruppi di acquisto</h1>
                    </div>
                </div>
            </div -->

            <div class="header-text1 mb-0">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-9 col-lg-12 col-md-12 d-block mx-auto">
                            <div class="search-background bg-transparent">
                                <div class="form row no-gutters ">
                                    <div class="form-group  col-xl-4 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" id="text4" placeholder="Nome gruppo o Keyword">
                                    </div>
                                    <div class="form-group  col-xl-3 col-lg-3 col-md-12 mb-0 bg-white">
                                        <input type="text" class="form-control input-lg br-md-0" id="text5" placeholder="Luogo">
                                        <span><i class="fa fa-map-marker location-gps mr-1"></i> </span>										</div>
                                    <div class="form-group col-xl-3 col-lg-3 col-md-12 select2-lg  mb-0 bg-white">
                                        <select class="form-control select2-show-search  border-bottom-0" data-placeholder="Select Category">
                                            <optgroup label="Categories">
                                                <option>Categoria</option>
                                                <option value="1">Private</option>
                                                <option value="2">Software</option>
                                                <option value="3">Banking</option>
                                                <option value="4">Finaces</option>
                                                <option value="5">Corporate</option>
                                                <option value="6">Driver</option>
                                                <option value="7">Sales</option>
                                            </optgroup>
                                        </select>
                                    </div>
                                    <div class="col-xl-2 col-lg-3 col-md-12 mb-0">
                                        <a href="#" class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0">Cerca</a>
                                    </div>
                                </div>
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
													<select name="item" class="form-control select-sm w-70">
														<option value="1">Più recente</option>
														<option value="2">Più vecchio</option>
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
																<a href="classified.html">Categoria</a>
																<a href="classified.html" class="text-dark"><h4 class="font-weight-semibold mt-1">{{ group.name }}</h4></a>
																<p class="mb-0 leading-tight text-dark">{{ group.description }}</p>
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
																	<a href="#" class="location"><i class="fa fa-map-marker text-muted mr-1"></i> {{ group.deliveryAddress.city }}</a>
																</div>
															</div>
														</div>
													</div>
												</div>
                                                <!-- pre>{{ group }}</pre -->
											</div>
                                            <!-- /list item -->
											
										</div>
										
                                        <!-- div class="tab-pane" id="tab-12">
											<div class="row">
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="item-card9-img">
															<div class="arrow-ribbon bg-primary">Rent</div>
															<div class="item-card9-imgs">
																<a href="classified.html"></a>
																<img src="../../assets/images/products/h4.png" alt="img" class="cover-image">
															</div>
															<div class="item-card9-icons">
																<a href="#" class="item-card9-icons1 wishlist"> <i class="fa fa fa-heart-o"></i></a>
															</div>
														</div>
														<div class="card-body">
															<div class="item-card9">
																<a href="classified.html">RealEstate</a>
																<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">2BK flat </h4></a>
																<p>Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																<div class="item-card9-desc">
																	<a href="#" class="mr-4"><span class=""><i class="fa fa-map-marker text-muted mr-1"></i> USA</span></a>
																	<a href="#" class=""><span class=""><i class="fa fa-calendar-o text-muted mr-1"></i> Nov-15-2019</span></a>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card9-footer d-flex">
																<div class="item-card9-cost">
																	<h4 class="text-dark font-weight-semibold mb-0 mt-0">$263.99</h4>
																</div>
																<div class="ml-auto">
																	<div class="rating-stars block">
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
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="ribbon ribbon-top-left text-danger"><span class="bg-danger">featured</span></div>
														<div class="item-card9-img">
															<div class="item-card9-imgs">
																<a href="classified.html"></a>
																<img src="../../assets/images/products/j2.png" alt="img" class="cover-image">
															</div>
															<div class="item-card9-icons">
																<a href="#" class="item-card9-icons1 wishlist active"> <i class="fa fa fa-heart-o"></i></a>
															</div>
														</div>
														<div class="card-body">
															<div class="item-card9">
																<a href="classified.html">Jobs</a>
																<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">Horbica Consulting</h4></a>
																<p>Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																<div class="item-card9-desc">
																	<a href="#" class="mr-4"><span class=""><i class="fa fa-map-marker text-muted mr-1"></i> UK</span></a>
																	<a href="#" class=""><span class=""><i class="fa fa-calendar-o text-muted mr-1"></i> Dec-05-2018</span></a>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card9-footer d-flex">
																<div class="item-card9-cost">
																	<h4 class="text-dark font-weight-semibold mb-0 mt-0">$745.00</h4>
																</div>
																<div class="ml-auto">
																	<div class="rating-stars block">
																		<input type="number" readonly="readonly" class="rating-value star" name="rating-stars-value"  value="2">
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
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="ribbon ribbon-top-left text-primary"><span class="bg-primary">featured</span></div>
														<div class="item-card9-img">
															<div class="item-card9-imgs">
																<a href="classified.html"></a>
																<img src="../../assets/images/products/pe1.png" alt="img" class="cover-image">
															</div>
															<div class="item-card9-icons">
																<a href="#" class="item-card9-icons1 wishlist"> <i class="fa fa fa-heart-o"></i></a>
															</div>
														</div>
														<div class="card-body">
															<div class="item-card9">
																<a href="classified.html">Animals</a>
																<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">kenco petcenter</h4></a>
																<p>Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																<div class="item-card9-desc">
																	<a href="#" class="mr-4"><span class=""><i class="fa fa-map-marker text-muted mr-1"></i> UK</span></a>
																	<a href="#" class=""><span class=""><i class="fa fa-calendar-o text-muted mr-1"></i> Nov-25-2018</span></a>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card9-footer d-flex">
																<div class="item-card9-cost">
																	<h4 class="text-dark font-weight-semibold mb-0 mt-0">$149.00</h4>
																</div>
																<div class="ml-auto">
																	<div class="rating-stars block">
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
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="item-card2-img">
															<div class="arrow-ribbon bg-primary">$185</div>
															<a href="classified.html"></a>
															<img src="../../assets/images/products/b3.png" alt="img" class="cover-image">
														</div>
														<div class="item-card2-icons">
															<a href="#" class="item-card9-icons1 wishlist active"> <i class="fa fa fa-heart-o"></i></a>
														</div>
														<div class="card-body">
															<div class="item-card2">
																<div class="item-card2-desc">
																	<a href="classified.html">Beauty & Spa</a>
																	<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">Gozer Beauty & Spa</h4></a>
																	<p class="mb-0">Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card2-footer">
																<a href="#" class="location"><i class="fa fa-map-marker text-muted mr-1"></i> Los Angles</a>
																<div class="rating-stars item-card2-rating d-inline-flex">
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
																	</div>(145 reviews)
																</div>

															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="item-card2-img">
															<div class="arrow-ribbon bg-primary">$158</div>
															<a href="classified.html"></a>
															<img src="../../assets/images/products/f4.png" alt="img" class="cover-image">
														</div>
														<div class="item-card2-icons">
															<a href="#" class="item-card9-icons1 wishlist"> <i class="fa fa fa-heart-o"></i></a>
														</div>
														<div class="card-body">
															<div class="item-card2">
																<div class="item-card2-desc">
																	<a href="classified.html">Restaurant</a>
																	<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">GilkonStar Hotel</h4></a>
																	<p class="mb-0">Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card2-footer">
																<a href="#" class="location"><i class="fa fa-map-marker text-muted mr-1"></i> Los Angles</a>
																<div class="rating-stars item-card2-rating d-inline-flex">
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
																	</div>(145 reviews)
																</div>

															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-6 col-md-12 col-xl-4">
													<div class="card overflow-hidden">
														<div class="item-card2-img">
															<div class="arrow-ribbon bg-primary">$172</div>
															<a href="classified.html"></a>
															<img src="../.. /assets/images/products/v1.png" alt="img" class="cover-image">
														</div>
														<div class="item-card2-icons">
															<a href="#" class="item-card9-icons1 wishlist"> <i class="fa fa fa-heart-o"></i></a>
														</div>
														<div class="card-body">
															<div class="item-card2">
																<div class="item-card2-desc">
																	<a href="classified.html">Vehicles</a>
																	<a href="classified.html" class="text-dark mt-2"><h4 class="font-weight-semibold mt-1">Seep Automobiles</h4></a>
																	<p class="mb-0">Ut enim ad minima veniamq nostrum exerci ullam orisin suscipit laboriosam</p>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="item-card2-footer">
																<a href="#" class="location"><i class="fa fa-map-marker text-muted mr-1"></i> San Francisco</a>
																<div class="rating-stars item-card2-rating d-inline-flex">
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
																	</div>(46 reviews)
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
										</div -->

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

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.js"></script>

    <script src="https://unpkg.com/lodash@4.17.19/lodash.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.js"></script>

    <!-- Vue Pages and Components here -->
    <!-- script src="/assets/vue/v-group-buy/group.vue.js"></script -->

    <script>
        var app = new Vue({
            el: '#v-groups-app',
            data: {
                groups: [],
                total: 0,
                max: 4, //The maximum number to list
                offset: 0, //The offset from the first result to list from
                sort: '', //The property name to sort by
                order: '' //How to order the list, either "desc" or "asc"
                //https://docs.grails.org/latest/ref/Domain Classes/list.html
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
            mounted() {
                    //will execute at pageload
                    this.loadGroupList() 

                    this.infiniteScroll();
            },
            methods: {
                loadGroupList() {
                    let url =
                        "/group.json"+"?"+"max="+this.max+"&"+"offset="+this.offset;
                    //this.showProgress = true;
                    axios
                        .get(url)
                        .then(result => {
                            console.log("result=", result ); 
                            console.log("headers=", result.headers ); 
                            //TODO get X-Pagination-Total header
                            //https://github.com/axios/axios#response-schema
                            data = result.data;
                            this.groups = _.concat(this.groups, data)
                            //this.showProgress = false;
                        })
                        .catch(error => {
                            console.log("error", error);
                            //this.showProgress = false;
                        }).then( () => {
                            console.log("data", this.$data);
                        });
                },
                
                infiniteScroll() {
                    console.log('scroll')
                    window.onscroll = () => {
                        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight >= document.body.scrollHeight;
                       
                        if (bottomOfWindow) {
                            this.offset += this.max;
                            this.loadGroupList();
                            //TODO stop loading when _size(this.groups) >= X-Pagination-Total
                        }
                    };
                },

            },
        })        
    </script>

</body>
</html>