        <!--Footer Section-->
		<section>
			<footer class="bg-dark-purple text-white no-print">
				<div class="footer-main">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-12">
								<h6><g:message code="site.title"/></h6>
								<hr class="deep-purple  accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<p>Un servizio gratuito che consente in modo semplice di gestire ordini da gruppi di acquisto ai negozi della propria zona.</p>
								<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum .</p>
							</div>
							<div class="col-lg-2 col-md-12">
								<h6>&nbsp;</h6>
								<hr class="deep-purple text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<ul class="list-unstyled mb-0">
									<li><a href="/chisiamo"> <g:message code="site.menu.aboutus"/> </a></li>
									<li><a href="javascript:;"> <g:message code="site.menu.contacts"/> </a></li>
									<li><a href="javascript:;"> <g:message code="site.menu.support"/> </a></li>
									<li><a href="/tos"> <g:message code="site.menu.tos"/> </a></li>
									<li><a href="/privacy"> <g:message code="site.menu.privacy"/> </a></li>
									<li><a href="/cookie"> <g:message code="site.menu.cookie"/> </a></li>
								</ul>
							</div>

							<div class="col-lg-3 col-md-12">
								<h6>Info</h6>
								<hr class="deep-purple  text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<ul class="list-unstyled mb-0">
									<li>
										<a href="#"><i class="fa fa-home mr-3 text-primary"></i>  
										Viale Umbria, 49 
										<br/>
										20135 Milano IT
										</a>
									</li>
									<li>
										<a href="mailto:${g.message(code:'site.contact.email.info')}"><i class="fa fa-envelope mr-3 text-primary"></i>
											 <g:message code="site.contact.email.info"/>
										</a>
									</li>
								</ul>
								<ul class="list-unstyled list-inline mt-3">
									<li class="list-inline-item">
										<a class="btn-floating btn-sm rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-facebook bg-facebook"></i>
										</a>
									</li>
									<li class="list-inline-item">
										<a class="btn-floating btn-sm rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-twitter bg-info"></i>
										</a>
									</li>
									<li class="list-inline-item">
										<a class="btn-floating btn-sm rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-linkedin bg-linkedin"></i>
										</a>
									</li>
								</ul>
							</div>
							<div class="col-lg-4 col-md-12">
								<h6> <g:message code="site.footer.writeus"/> </h6>
								<hr class="deep-purple  text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<div class="clearfix"></div>
								<div id="v-contact-contact-app" v-cloak>

									<v-contact-contact></v-contact-contact>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="bg-dark-purple text-white p-0">
					<div class="container">
						<div class="row d-flex">
							<div class="col-lg-12 col-sm-12 mt-3 mb-3 text-center ">
								Copyright © 2020 <a href="#" class="fs-14 text-primary">ILZ</a>. Made by <a
									href="https://www.cloudbydesign.it" target="_blank" class="fs-14 text-primary">Cloud by Design</a> Tutti i diritti riservati.
							</div>
						</div>
					</div>
				</div>
			</footer>
		</section>
		<!--Footer Section-->


		<!-- Vue Pages and Components here -->

		<script type="module">
			import VContact from '/assets/vue/v-contact/contact.vue.js';

			var app = new Vue({
				el: '#v-contact-contact-app',
				components: {
					'v-contact-contact': VContact,
				},
				data: {
				},
			})
		</script>