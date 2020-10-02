		<!--Topbar-->
		<div class="header-main">
			<div class="top-bar">
				<div class="container">
					<div class="row">
						<div class="col-xl-8 col-lg-8 col-sm-4 col-7">
							<div class="top-bar-left d-flex">
								<div class="clearfix">
									<ul class="socials">
										<li>
											<a class="social-icon text-dark" href="#"><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a class="social-icon text-dark" href="#"><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a class="social-icon text-dark" href="#"><i class="fa fa-linkedin"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix">
									<ul class="contact border-left">
										<li class="dropdown mr-5">
											<a href="https://www.group-buy.it/?page_id=50" class="text-dark" data-toggle="dropdown"><span>Chi siamo</span>
											</a>
										</li>
										<li class="dropdown mr-5">
											<a href="https://www.group-buy.it" class="text-dark"
												data-toggle="dropdown"><span>Contatti</span></a>
										</li>
										<li class="dropdown">
											<a href="https://www.group-buy.it/" class="text-dark"
												data-toggle="dropdown"><span>Supporto</span></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-4 col-sm-8 col-5">
							<div class="top-bar-right">
								<ul class="custom">
									
									<sec:ifNotLoggedIn>
									<li>
										<a href="${createLink(controller:'register', action:'register')}" class="text-dark"><i class="fa fa-user mr-1"></i>
											<span>Registrazione</span></a>
									</li>
									<li>
										<a href="${createLink(controller:'login', action:'auth')}" class="text-dark"><i class="fa fa-sign-in mr-1"></i>
											<span>Login</span></a>
									</li>
									</sec:ifNotLoggedIn>

									<sec:ifLoggedIn>
									<li>
										<a href="/logoff" class="text-dark"><i class="fa fa-power-off mr-1"></i>
											<span>Logout</span></a>
									</li>

									<div class="simple dropdown float-right">
										<ul class="horizontalMenu-list">
											<li> 
												<a href="#" class="active"><i class="fa fa-user-circle-o mr-1"></i><span><sec:loggedInUserInfo field='username'/></span></a>

												<ul>
													<li>
														<a href="${createLink(controller: 'groupBuy', action: 'userProfile')}" class="dropdown-item"> 
															<i class="fa fa-address-card-o dropdown-icon"></i>Profilo 
														</a>
													</li>
													<!-- li>
														<a href="${createLink(controller: 'groupBuy', action: 'userSettings')}" class="dropdown-item"> 
															<i class="dropdown-icon icon icon-settings"></i> Preferenze
														</a>
													</li -->
												</ul>

											</li>
										</ul>
									</div>
									
									</sec:ifLoggedIn>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/Topbar-->