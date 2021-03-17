//require vuelidate
//require lodash

import * as contactService from "/assets/vue/v-services/contact.js";
import * as toastService from "/assets/vue/v-services/toast.js";

var VContact = Vue.component("VContact", {
  template: `
        <div class="vue-template">

                <div class="input-group w-70 mb-1">
                    <input class="form-control br-tl-3  br-bl-3 "
                        type="text"
                        placeholder="Email"
                        required="required"
                        @input="$v.emailAddress.$touch()"
                        v-model="emailAddress"
                        >
                </div>
                <div class="input-group w-70 mb-1" v-if="$v.emailAddress.$error">
                    <p class="input-alert" v-if="!$v.emailAddress.email">Si prega di fornire un indirizzo e-mail valido.</p>
                    <p class="input-alert" v-if="!$v.emailAddress.required">Questo campo non deve essere vuoto.</p>
                </div>
                <!-- pre>{{$v.emailAddress}}</pre -->

                <div class="input-group w-70 mb-1">
                    <textarea rows="3" class="form-control"
                        placeholder="Messaggio"
                        required="required"
                        @input="$v.messageText.$touch()"
                        v-model="messageText"></textarea>
                </div>
                <div class="input-group w-70 mb-1" v-if="$v.messageText.$error">
                    <p class="input-alert" v-if="!$v.messageText.minLength">Si prega di inserire almeno {{ $v.messageText.$params.minLength.min }} caratteri.</p>
                    <p class="input-alert" v-if="!$v.messageText.required">Si prega di inserire un messaggio.</p>
                </div>
                <!-- pre>{{$v.messageText}}</pre -->

                <div class="input-group w-70 mb-1" @click.prevent="togglePrivacy($event)"> 
                  <label class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" name="privacy" id="privacy" checked="checked" v-model="privacy">
                    <span class="custom-control-label">Consenso privacy</span>
                  </label>

                </div>

                <div class="input-group w-70 submit">
                    <button @click="contact()" type="button" :disabled="$v.$invalid || busy" class="btn btn-primary br-tr-3  br-br-3"> Invia </button>
                </div>

            <!-- pre>{{$v}}</pre -->

        </div>`,

  props: {},

  data() {
    return {
      emailAddress: "",
      messageText: "",
      privacy: false,
      error: null,
      success: null,
      busy: false,
    };
  },
  watch: {
    error: function (message) {
      toastService.alertDanger(message);
    },
    success: function (message) {
      toastService.alertSuccess(message);
    },
  },
  validations: {
    emailAddress: {
      required,
      minLength: minLength(3),
      email,
    },
    messageText: {
      required,
      minLength: minLength(8),
    },
    privacy: {
      accepted: (val) => val === true,
    },
  },
  created() {},
  methods: {
    togglePrivacy(e) {
      this.privacy = !this.privacy;
    },
    resetForm() {
      this.emailAddress = "";
      this.messageText = "";
      this.privacy = false;
      this.$nextTick(() => {
        this.$v.$reset();
      });
    },
    async contact() {
      try {
        this.busy = true;
        let r = await contactService.sendContact({
          emailAddress: this.emailAddress,
          messageText: this.messageText,
          privacy: this.privacy,
        });
        this.success = r.message;
        this.resetForm();
      } catch (error) {
        this.error = error;
      } finally {
        this.busy = false;
      }
    },
  },
});

export default VContact;
