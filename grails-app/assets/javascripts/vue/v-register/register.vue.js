//vuelidate
const { required, email, minLength, sameAs, not } = window.validators;
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VRegisterRegister = Vue.component("VRegisterRegister", {
  template: `
        <div class="vue-template">
            <slot v-bind:$v="$v" v-bind:$props="$props">
            </slot>

            <form action="/register/register" 
                class="card-body"
                method="post" 
                name="loginForm" 
                id="loginForm"
                autocomplete="off"
                >

                <h3 class="pb-2">{{inputParams.registerHeader}}</h3>

                <div class="username">
                    <input :name="inputParams.usernameParameter"
                        :id="inputParams.usernameParameter"
                        type="text"
                        value="" 
                        required="required"
                        @blur="$v.username.$touch()"
                        v-model="username">
                        <label>{{inputParams.loginUsername}}</label>
                        <!-- alerts -->
                        <p class="input-alert" v-if="!$v.username.minLength && $v.username.$error">Please insert at least {{ $v.username.$params.minLength.min }} characters.</p>
                        <p class="input-alert" v-if="!$v.username.required && $v.username.$error">This field must not be empty.</p>
                        <p class="input-alert" v-if="false && $v.username.$error">The username is taken.</p>
                        
                </div>
                <!-- pre>{{$v.username}}</pre -->
                
                <div class="email">
                    <input :name="inputParams.emailParameter"
                        :id="inputParams.emailParameter"
                        type="email" 
                        required="required"
                        @input="$v.email.$touch()"
                        v-model="email"
                        >
                        <label>{{inputParams.registerEmail}}</label>
                        <!-- alerts -->
                        <p class="input-alert" v-if="!$v.email.email && $v.email.$error">Please provide a valid email address.</p>
                        <p class="input-alert" v-if="!$v.email.required && $v.email.$error">This field must not be empty.</p>
                </div>
                <!-- pre>{{$v.email}}</pre-->

                <div class="password">
                    <input :name="inputParams.passwordParameter"
                        :id="inputParams.passwordParameter"
                        type="password"
                        required="required"
                        @input="$v.password.$touch()"
                        v-model="password">
                        <label>{{inputParams.loginPassword}}</label>
                        <password v-model="password" :strength-meter-only="true"/>
                        <!-- alerts -->
                        <p class="input-alert" v-if="!$v.password.minLength && $v.password.$error">Please insert at least {{ $v.password.$params.minLength.min }} characters.</p>
                        <p class="input-alert" v-if="!$v.password.required && $v.password.$error">This field must not be empty.</p>
                        <p class="input-alert" v-if="!$v.password.isNotSameAsEmail && $v.password.$error">Password cannot be the same as the E-Mail.</p>
                        <p class="input-alert" v-if="!$v.password.isNotSameAsUsername && $v.password.$error">Password cannot be the same as the Username.</p>
                </div>
                <!-- pre>{{$v.password}}</pre -->
                
                <div class="password2">
                    <input :name="inputParams.passwordAgainParameter"
                        type="password"
                        required="required"
                        @input="$v.password2.$touch()"
                        v-model="password2">
                        <label>{{inputParams.loginPassword}}</label>
                </div>
                <!-- pre>{{$v.password2}}</pre -->
                <p class="input-alert" v-if="!$v.password2.sameAs && $v.password2.$error">Please insert the same password.</p>

                <div class="submit">
                    <input type="submit" :disabled="$v.$invalid" class="btn btn-primary btn-block" :value="inputParams.registerSubmit" id="loginButton_submit">
                </div>
                <p class="text-dark mb-0">Already have an account?<a :href="urls.loginUrl" class="text-primary ml-1">Sign In</a></p>

            </form>

            <!-- pre>{{$v}}</pre -->

        </div>`,

  props: {
    inputParams: {
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
      params: [],
    };
  },

  validations: {
    username: {
      required,
      minLength: minLength(5),
    },
    email: {
      required,
      email,
      /*unique: value => {
              if(value === '')
                return true //not my job
              return new Promise((resolve, reject) => {
                setTimeout(() => {
                  resolve(value !== 'test@test.it')
                } , 1000)
              })*/
      /*
                return axios.get('/users.json?newEmail=' + value )
                  .then(res => {
                    console.log(res)
                    //fetch info from res.data and return boolean
                    Object.keys(res.data).length === 0
                  })
                */
      //}
    },
    password: {
      required,
      minLength: minLength(8),
      isNotSameAsUsername: not(sameAs("username")),
      isNotSameAsEmail: not(sameAs("email")),
      //passwordComplexity
    },
    password2: {
      sameAs: sameAs((vm) => {
        return vm.password;
      }),
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
  },
  methods: {
    onSubmit(e) {
      console.log(e);
      //submit form
    },
    rememberMeToggle(e) {
      console.log(e);
    },
  },
});
