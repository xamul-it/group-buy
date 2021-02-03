//vuelidate
const { required, email, minLength, maxLength, sameAs, not } = window.validators;
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set, isUndefined } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VRegisterRegister = Vue.component("VRegisterRegister", {
  template: `
        <div class="vue-template">

            <form action="/register/register" 
                class="card-body"
                method="post" 
                name="registerForm" 
                id="registerForm"
                autocomplete="off"
                >

                <h3 class="pb-2">{{inputParams.registerHeader}}</h3>

                <div class="username">
                    <input :name="inputParams.usernameParameter"
                        :id="inputParams.usernameParameter"
                        type="text"
                        required="required"
                        readonly="readonly"
                        @focus="onFieldFocus"
                        @blur="$v.username.$touch()"
                        v-model="username"
                        autocomplete="off">
                        <label>{{inputParams.loginUsername}}</label>
                        <!-- alerts -->
                        <p class="input-alert" v-if="!$v.username.minLength && $v.username.$error">Si prega di inserire almeno {{ $v.username.$params.minLength.min }} caratteri.</p>
                        <p class="input-alert" v-if="!$v.username.required && $v.username.$error">Questo campo non deve essere vuoto.</p>
                        <p class="input-alert" v-if="errors.usernameErrorUnique">Il nome utente non &egrave disponibile.</p>

                </div>
                <!-- pre>{{$v.username}}</pre -->
                
                <div class="email">
                    <input :name="inputParams.emailParameter"
                        :id="inputParams.emailParameter"
                        type="email" 
                        required="required"
                        readonly="readonly"
                        @focus="onFieldFocus"
                        @input="$v.email.$touch()"
                        v-model="email"
                        autocomplete="off">
                        <label>{{inputParams.registerEmail}}</label>
                        <!-- alerts -->
                        <p class="input-alert" v-if="errors.emailError || !$v.email.email && $v.email.$error">Si prega di fornire un indirizzo e-mail valido.</p>
                        <p class="input-alert" v-if="!errors.emailError && !$v.email.required && $v.email.$error">Questo campo non deve essere vuoto.</p>

                </div>
                <!-- pre>{{$v.email}}</pre-->

                <div class="password">
                    <input :name="inputParams.passwordParameter"
                        :id="inputParams.passwordParameter"
                        type="password"
                        required="required"
                        readonly="readonly"
                        @focus="onFieldFocus"
                        @input="$v.password.$touch()"
                        v-model="password"
                        autocomplete="off">
                        <label>{{inputParams.loginPassword}}</label>
                        <password v-model="password" :strength-meter-only="true"/>
                        <!-- alerts -->
                        <p class="input-alert" v-if="!errors.passwordError && !$v.password.minLength && $v.password.$error">Si prega di inserire almeno {{ $v.password.$params.minLength.min }} caratteri.</p>
                        <p class="input-alert" v-if="!errors.passwordError && !$v.password.maxLength && $v.password.$error">Si prega di non inserire pi&ugrave; di {{ $v.password.$params.maxLength.max }} caratteri.</p>

                        <p class="input-alert" v-if="!errors.passwordError && !$v.password.required && $v.password.$error">Questo campo non deve essere vuoto.</p>
                        <p class="input-alert" v-if="!errors.passwordError && !$v.password.isNotSameAsEmail && $v.password.$error">La password non pu&ograve; essere uguale all'e-mail.</p>
                        <p class="input-alert" v-if="!errors.passwordError && !$v.password.isNotSameAsUsername && $v.password.$error">La password non pu&ograve; essere uguale al nome utente.</p>

                        <p class="input-alert" v-if="errors.passwordError">La password deve avere almeno una lettera, un numero e un carattere speciale: !@#$%^&amp;</p>
                </div>
                <!-- pre>{{$v.password}}</pre -->
                
                <div class="password2">
                    <input :name="inputParams.passwordAgainParameter"
                        type="password"
                        required="required"
                        readonly="readonly"
                        @focus="onFieldFocus"
                        @input="$v.password2.$touch()"
                        v-model="password2"
                        autocomplete="off">
                        <label>{{inputParams.loginPassword}}</label>
                </div>
                <!-- pre>{{$v.password2}}</pre -->
                <p class="input-alert" v-if="!$v.password2.sameAs && $v.password2.$error">Si prega di inserire la stessa password.</p>

                <div class="tos" @click="toggleTos($event)"> 
                  
                  <label class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" :name="tos" id="tos" checked="checked" v-model="tos">
                    <span class="custom-control-label">Ho letto e accetto i <a href="/groupBuy/tos" target="_blank">termini di servizio</a>.</span>
                  </label>

                </div>

                <div class="privacy" @click="togglePrivacy($event)"> 
                  
                  <label class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" :name="privacy" id="privacy" checked="checked" v-model="privacy">
                    <span class="custom-control-label">Acconsento al trattamento dei dati secondo l'<a href="/groupBuy/privacy" target="_blank">informativa privacy</a>.</span>
                  </label>

                </div>

                <div class="submit">
                    <input type="submit" :disabled="$v.$invalid" class="btn btn-primary btn-block" :value="inputParams.registerSubmit" id="loginButton_submit">
                </div>
                <p class="text-dark mb-0">Gi&agrave; registrato?<a :href="urls.loginUrl" class="text-primary ml-1">Log In</a></p>

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
      email: "",
      password: "",
      password2: "",
      tos: false,
      privacy: false,
      params: [],
      fields: [],
    };
  },

  validations: {
    username: {
      required,
      minLength: minLength(5),
      maxLength: maxLength(64),
    },
    email: {
      required,
      email,
    },
    password: {
      required,
      minLength: minLength(8),
      maxLength: maxLength(64),
      isNotSameAsUsername: not(sameAs("username")),
      isNotSameAsEmail: not(sameAs("email")),
    },
    password2: {
      sameAs: sameAs((vm) => {
        return vm.password;
      }),
    },
    tos: {
      accepted: val => val === true
    },
    privacy: {
      accepted: val => val === true
    }
    //https://lobotuerto.com/blog/how-to-validate-a-required-boolean-with-vuelidate/
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
      if(!isUndefined(this.inputFields.email) && this.inputFields.email != "") {
        this.email = this.inputFields.email
      }
    }
  },
  methods: {
    onFieldFocus(e){
      e.target.removeAttribute('readonly')
    },
    toggleTos(e) {
      this.tos = !this.tos;
    },
    togglePrivacy(e) {
      this.privacy = !this.privacy;
    },
  },
});
