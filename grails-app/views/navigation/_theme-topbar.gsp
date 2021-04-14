		<!--Topbar-->
		<div class="header-main">
			<div class="top-bar no-print">
				<div class="container">
					<div class="row">
						<div class="col-xl-8 col-lg-8 col-sm-4 col-7">
							<div class="top-bar-left d-flex">
								<div class="clearfix">
									<ul class="socials">
										<li>
											<a href="https://fb.me/proprioqui" class="social-icon text-dark" href="#"><i class="fa fa-facebook"></i></a>
										</li>
										<li>
											<a class="social-icon text-dark" href="#"><i class="fa fa-instagram"></i></a>
										</li>
										<li>
											<a class="social-icon text-dark" href="#"><i class="fa fa-twitter"></i></a>
										</li>
										<li>
											<a href="https://www.linkedin.com/company/proprioqui" class="social-icon text-dark" href="#"><i class="fa fa-linkedin"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix">
									<ul class="contact border-left">
										<li class="dropdown mr-5">
											<a href="/chisiamo" class="text-dark"><span> <g:message code="site.menu.aboutus"/> </span>
											</a>
										</li>
										<li class="dropdown mr-5">
											<a href="/contatti" class="text-dark"
												data-toggle="dropdown"><span> <g:message code="site.menu.contacts"/> </span></a>
										</li>
										<li class="dropdown">
											<a href="/supporto" class="text-dark"
												data-toggle="dropdown"><span> <g:message code="site.menu.support"/> </span></a>
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
											<span><g:message code="site.menu.register"/></span></a>
									</li>
									<li>
										<a href="${createLink(controller:'login', action:'auth')}" class="text-dark"><i class="fa fa-sign-in mr-1"></i>
											<span><g:message code="site.menu.login"/></span></a>
									</li>
									</sec:ifNotLoggedIn>

									<sec:ifLoggedIn>
									<li>
										<a href="/logoff" class="text-dark"><i class="fa fa-power-off mr-1"></i>
											<span><g:message code="site.menu.logout"/></span></a>
									</li>

									<div class="simple dropdown float-right">
										<ul class="horizontalMenu-list">
											<li> 
												<a href="#" class="active"><i class="fa fa-user-circle-o mr-1"></i><span><sec:loggedInUserInfo field='username'/></span></a>

												<ul>
													<li>
														<a href="${createLink(mapping: 'profiloUtente', namespace: 'ui')}" class="dropdown-item"> 
															<i class="icon icon-user dropdown-icon"></i><g:message code="site.menu.profile"/>															 
														</a>
													</li>
													<li>
														<a href="${createLink(mapping: 'ordiniUtente', namespace: 'ui')}" class="dropdown-item"> 
															<i class="icon icon-basket dropdown-icon"></i><g:message code="site.menu.orders"/> 
														</a>
													</li>
													<li>
														<a href="${createLink(mapping: 'gruppiUtente', namespace: 'ui')}" class="dropdown-item"> 
															<i class="icon icon-share dropdown-icon"></i><g:message code="site.menu.groups"/> 
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

			<g:render template="/navigation/theme-nav" />

		</div>
		<!--/Topbar-->