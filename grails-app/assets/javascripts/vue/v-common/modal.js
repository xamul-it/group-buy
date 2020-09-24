var VModal = Vue.component("VModal", {
  template: `
        <transition name="modal-fade">

		<div v-if="showModal" class="modal show" role="dialog" style="display: block;" aria-modal="true" @click.passive="closeModal()"> 
		
			<div class="modal-dialog" role="document">
				<div class="modal-content"> 
					<div class="modal-header">
						<slot name="header">
							<h5 class="modal-title"> <i class="fa fa-exclamation-triangle mr-1"></i> Login richiesto</h5>
						</slot>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="closeModal()"> <span aria-hidden="true">×</span> </button> 
					</div> 
					<div class="modal-body">
						<slot name="body">
							<p>
								Per compiere questa operazione devi prima effettuare <a href="/login/auth">login</a>. 
								<br/>Se non sei ancora iscritto <a href="/register/register">registrati</a> ora.
							</p> 
						</slot>
					</div> 
					<div class="modal-footer">
						<slot name="footer">
							<a type="button" class="btn btn-primary" href="/login/auth">Login</a> 
							<a type="button" class="btn btn-secondary" href="/register/register">Registazione</a> 
						</slot>
					</div>

				</div> 
			</div>

		</div>

      </transition>`,
  name: "VModal",
  data() {
    return {
      showModal: false,
    };
  },
  methods: {
    closeModal() {
      this.showModal = false;
      document.querySelector("body").classList.remove("overflow-hidden");
    },
    openModal() {
      this.showModal = true;
      document.querySelector("body").classList.add("overflow-hidden");
    },
  },
});
