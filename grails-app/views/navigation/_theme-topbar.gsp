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

									<!-- li class="dropdown"> <a href="#" class="text-dark" data-toggle="dropdown"><i
												class="fa fa-home mr-1"></i><span> My Dashboard</span></a>
										<div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow"> <a
												href="mydash.html" class="dropdown-item"> <i
													class="dropdown-icon icon icon-user"></i> My Profile </a> <a
												class="dropdown-item" href="#"> <i
													class="dropdown-icon icon icon-speech"></i> Inbox </a> <a
												class="dropdown-item" href="#"> <i
													class="dropdown-icon icon icon-bell"></i> Notifications </a> <a
												href="mydash.html" class="dropdown-item"> <i
													class="dropdown-icon  icon icon-settings"></i> Account Settings </a>
											<a class="dropdown-item" href="#"> <i
													class="dropdown-icon icon icon-power"></i> Log out </a> </div>
									</li -->

									<div class="simple dropdown float-right">
											<ul class="horizontalMenu-list">
												<li> 
													<a href="#" class="active"><i class="fa fa-home mr-1"></i><span> My Dashboard</span></a>

													<ul>

														<li><a href="/profilo" class="dropdown-item"> 
																<i class="dropdown-icon icon icon-user"></i>Profilo 
															</a>
														</li>

														<li><a class="dropdown-item" href="/preferenze"> 
																<i class="dropdown-icon icon icon-settings"></i> Preferenze
															</a>
														</li>

														<li><a class="dropdown-item" href="/vertina"> 
																<i class="dropdown-icon icon icon-speech"></i> Vetrina 
															</a>
														</li>
														<li><a class="dropdown-item" href="/groupBuy/pricelist"> 
																<i class="dropdown-icon icon icon-speech"></i> Listino 
															</a>
														</li>

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