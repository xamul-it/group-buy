        <!--Footer Section-->
		<section>
			<footer class="bg-dark-purple text-white no-print">
				<div class="footer-main">
					<div class="container">
						<div class="row">
							<div class="col-lg-3 col-md-12">
								<p>
									Siamo un servizio gratuito che ti permette di gestire, in modo semplice e diretto, ordini di <a href="/gruppi">gruppo</a> da negozi e produttori della tua zona.
									Comprare insieme permette di sostenere i piccoli <a href="/negozi">negozianti</a>, ottenere sconti e promozioni e fare acquisti pensati e organizzati.
									<!-- br/>
									Pensiamo che comprare insieme, è meglio. -->
								</p>
								<p>
									Scopri tutti i <a href="/negozi">negozi</a> presenti sul nostro sito, se hai un attività di fiducia che credi possa essere interessato a essere incluso sul portale scrivici, lo inseriremo.
									<br/>
									Se sei hai un'attività commerciale e vuoi essere inserito sul nostro portale, scrivici.
									</p>
							</div>
							<div class="col-lg-2 col-md-12">
								<h6><g:message code="site.title"/></h6>
								<hr class="deep-purple  accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<ul class="list-unstyled mb-0">
									<li><a href="/"> <g:message code="site.menu.home"/> </a></li>

                                	<li><a href="${createLink(mapping: 'negozi', namespace: 'ui')}"> <g:message code="site.menu.suppliers"/> </a></li>
 									<li><a href="${createLink(mapping: 'gruppi', namespace: 'ui')}"> <g:message code="site.menu.groups"/> </a></li>

									<li><a href="/chisiamo"> <g:message code="site.menu.aboutus"/> </a></li>
									<li><a href="/faq"> <g:message code="site.menu.faq"/> </a></li>

									<li><a href="/tos"> <g:message code="site.menu.tos"/> </a></li>
									<li><a href="/privacy"> <g:message code="site.menu.privacy"/> </a></li>
									<li><a href="/cookie"> <g:message code="site.menu.cookie"/> </a></li>
								</ul>
							</div>

							<div class="col-lg-3 col-md-12">
								<h6>Contatti</h6>
								<hr class="deep-purple  text-primary accent-2 mb-4 mt-0 d-inline-block mx-auto">
								<ul class="list-unstyled mb-0">
									<li>
										<i class="fa fa-home mr-3 text-primary"></i>  
										Viale Umbria, 49 
										<br/>
										20135 Milano IT
									</li>
									<li>
										<a href="mailto:${g.message(code:'site.contact.email.info')}"><i class="fa fa-envelope mr-3 text-primary"></i>
											 <g:message code="site.contact.email.info"/>
										</a>
									</li>
								</ul>
								<ul class="list-unstyled list-inline mt-3">
									<li class="list-inline-item">
										<a href="https://fb.me/proprioqui" target="_blank" class="rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-facebook mr-3 text-primary"></i>
										</a>
									</li>
									<li class="list-inline-item">
										<a href="https://www.instagram.com/proprioqui/" target="_blank" class="rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-instagram mr-3 text-primary"></i>
										</a>
									</li>
									<li class="list-inline-item">
										<a href="https://twitter.com/proprio_qui" target="_blank" class="rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-twitter mr-3 text-primary"></i>
										</a>
									</li>
									<li class="list-inline-item">
										<a href="https://www.linkedin.com/company/proprioqui" target="_blank" class="rgba-white-slight mx-1 waves-effect waves-light">
											<i class="fa fa-linkedin mr-3 text-primary"></i>
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
								
									<g:if test="${request.getRequestURI().equals('/')}">
										<a href="https://www.vecteezy.com/free-vector/web">Web Vectors by Vecteezy</a>
									</g:if>

							</div>
						</div>
					</div>
				</div>
			</footer>
		</section>
		<!--Footer Section-->

		<g:render template="/includes/cookie-law"/>

		<!-- Vue Pages and Components here -->

		<script type="module">
			import VContact from '/assets/vue/v-contact/contact.vue.js';

			var app = new Vue({
				el: '#v-contact-contact-app',
				components: {
					'v-contact-contact': VContact,
				},
			})
		</script>