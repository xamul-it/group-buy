//vuelidate
const { required, minLength } = window.validators;
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set, isUndefined } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VLoginAuth = Vue.component("VLoginAuth", {
  template: `
        <div class="vue-template">
            <slot v-bind:$v="$v" v-bind:$props="$props">
            </slot>

            <form action="/login/authenticate" 
                class="card-body"
                tabindex="500"
                method="post" 
                name="loginForm" 
                id="loginForm"
                autocomplete="off"
                >

                <h3 class="pb-2">{{inputParams.loginSignin}}</h3>

                <div class="username">
                    <input :name="inputParams.usernameParameter"
                        type="text" 
                        required="required"
                        @input="$v.username.$touch()"
                        v-model="username"
                        v-focus>
                        <label>{{inputParams.loginUsername}}</label>

                        <p class="input-alert" v-if="errors.loginMessage">{{ errors.loginMessageText }}</p>
                        <p class="input-alert" v-if="errors.loginError">{{ errors.loginErrorText }}</p>
                </div>
                <!-- pre>{{$v.username}}</pre -->
            
                <div class="password">
                    <input :name="inputParams.passwordParameter"
                        type="password"
                        required="required"
                        @input="$v.password.$touch()"
                        v-model="password">
                        <label>{{inputParams.loginPassword}}</label>
                </div>
                <!-- pre>{{$v.password}}</pre -->

                <div class="remember-me" @click="toggleRememberMe($event)"> 
                  
                  <label class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" :name="inputParams.rememberMeParameter" id="remember_me" checked="checked" v-model="rememberMe">
                    <span class="custom-control-label">{{inputParams.loginRememberMe}}</span>
                  </label>

                </div>

                <div class="submit">
                    <input type="submit" :disabled="$v.$invalid" class="btn btn-primary btn-block" :value="inputParams.loginLogin" id="loginButton_submit">
                </div>

                <p class="mb-2">
                    <a :href="urls.forgotPasswordUrl">{{inputParams.loginforgotPassword}}</a>
                </p>
                <p class="text-dark mb-0">
                    <a :href="urls.registerUrl" class="text-primary ml-1">{{inputParams.loginRegister}}</a>
                </p>
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
      password: "",
      rememberMe: false,
      params: [],
    };
  },

  validations: {
    username: {
      required,
      minLength: minLength(3),
    },
    password: {
      required,
      minLength: minLength(3),
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
    toggleRememberMe(e) {
      this.rememberMe = !this.rememberMe;
    },
  },
});
