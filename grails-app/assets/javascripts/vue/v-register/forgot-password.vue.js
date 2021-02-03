//vuelidate
const { required, minLength, maxLength } = window.validators;
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set, isUndefined } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VRegisterForgotPassword = Vue.component("VRegisterForgotPassword", {
  template: `
        <div class="vue-template">

            <form action="/register/forgotPassword" 
                class="card-body"
                tabindex="500"
                method="post" 
                name="forgotPasswordForm" 
                id="forgotPasswordForm"
                autocomplete="off"
                >
                <input type="hidden" name="SYNCHRONIZER_TOKEN" :value="inputFields.synchronizerToken" id="SYNCHRONIZER_TOKEN" />
					      <input type="hidden" name="SYNCHRONIZER_URI" :value="inputFields.synchronizerUri" id="SYNCHRONIZER_URI" />

                <h3 class="pb-2">{{inputParams.forgotPasswordDescription}}</h3>

                <div class="username">
                    <input :name="inputParams.usernameParameter"
                        type="text" 
                        required="required"
                        readonly="readonly"
                        @focus="onFieldFocus"
                        @input="$v.username.$touch()"
                        v-model="username"
                        >
                        <label>{{inputParams.loginUsername}}</label>

                        <p class="input-alert" v-if="errors.usernameErrorNotFound">Nessun utente &egrave; stato trovato con questo nome utente.</p>
                        <p class="input-alert" v-if="errors.usernameErrorNoEmail">Non abbiamo nessuna email registrata per il tuo account.</p>

                </div>
                <!-- pre>{{$v.username}}</pre -->

                <div class="submit">
                    <input type="submit" :disabled="$v.$invalid" class="btn btn-primary btn-block" :value="inputParams.forgotPasswordSubmit" id="loginButton_submit">
                </div>
                <div class="text-center text-dark mb-0"> Annulla, <a :href="urls.loginAuthUrl">torna al Log in</a>.</div>

            </form>

            <!-- pre>{{$v}}</pre -->

        </div>`,

  props: {
    inputParams: {
      required: true,
    },
    errors: {
      required: true,
    },
    inputFields: {
      required: true,
    },
    urls: {
      required: true,
    },
  },

  data() {
    return {
      username: "",
      params: [],
    };
  },

  validations: {
    username: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(64),
    },
  },

  created() {
    if (isArray(this.inputParams)) {
      this.params = map(this.inputParams, (item) => {
        return {
          key: item,
          label: item,
        };
      });
    } else {
      this.params = map(this.inputParams, (label, key) => {
        return {
          key: key,
          label: label,
        };
      });
    }
    if(!isUndefined(this.inputFields)){
      if(!isUndefined(this.inputFields.username) && this.inputFields.username != "") {
        this.username = this.inputFields.username
      }
    }
  },
  methods: {
    onFieldFocus(e){
      e.target.removeAttribute('readonly')
    },
  },
});
