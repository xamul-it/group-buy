        <!--Footer Section-->
		<section>
			<footer class="bg-dark-purple text-white no-print">
				<div class="footer-main">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-12">
								<h6>Group buy</h6>
								<hr class="deep-purple  accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<p>Un servizio gratuito che consente in modo semplice di gestire ordini da gruppi di acquisto ai negozi della propria zona.</p>
								<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum .</p>
							</div>
							<div class="col-lg-2 col-md-12">
								<h6>&nbsp;</h6>
								<hr class="deep-purple text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<ul class="list-unstyled mb-0">
									<li><a href="/chisiamo">Chi siamo</a></li>
									<li><a href="javascript:;">Contatti</a></li>
									<li><a href="javascript:;">Supporto</a></li>
									<li><a href="/tos">Termini di Servizio</a></li>
									<li><a href="/privacy">Regole della Privacy</a></li>
									<li><a href="/cookie">Uso dei Cookie</a></li>
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
										<a href="#"><i class="fa fa-envelope mr-3 text-primary"></i>
											info@group-buy.it</a></li>
									<li>
										<a href="#"><i class="fa fa-phone mr-3 text-primary"></i> + 01 234 567 88</a>
									</li>
									<!-- li>
										<a href="#"><i class="fa fa-print mr-3 text-primary"></i> + 01 234 567 89</a>
									</li -->
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
								<h6>Scrivici</h6>
								<hr class="deep-purple  text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<div class="clearfix"></div>
								<div id="v-contact-contact-app" v-cloak>

									<v-contact-contact></v-contact-contact>
									<!-- v-contact-contact :contact-service="contactService"></v-contact-contact -->

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