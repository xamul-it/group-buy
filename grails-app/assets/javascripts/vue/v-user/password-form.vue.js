//vuelidate
Vue.use(window.vuelidate.default);
const {
  required,
  email,
  minLength,
  maxLength,
  sameAs,
  not,
} = window.validators;
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set, isUndefined } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

Vue.component("password", Password);

var VueUserPasswordForm = Vue.component("VueUserPasswordForm", {
  template: `
        <div class="vue-template">

            <div class="card mb-0">
                <div class="card-header">
                    <h3 class="card-title">Gestisci password</h3>
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-sm-6 col-md-6">
                            <div class="form-group"> 
                                <label class="form-label">Password attuale</label> 
                                <input class="form-control"
                                        type="password"
                                        autocomplete="off"
                                        v-model="password"
                                        @input="$v.password.$touch()">

                                <!-- alerts -->
                                <p class="input-alert" v-if="!$v.password.minLength && $v.password.$error">Si prega di inserire almeno {{ $v.password.$params.minLength.min }} caratteri.</p>
                                <p class="input-alert" v-if="!$v.password.maxLength && $v.password.$error">Si prega di non inserire pi&ugrave; di {{ $v.password.$params.maxLength.max }} caratteri.</p>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-6">
                        </div>

                        <div class="col-sm-6 col-md-6">
                            <div class="form-group"> 
                                <label class="form-label">Nuova password</label> 
                                <input class="form-control"
                                        type="password"
                                        autocomplete="off"
                                        v-model="password_new"
                                        @input="$v.password_new.$touch()">


                            </div>
                            <password v-model="password_new" :strength-meter-only="true"/>

                            <!-- alerts -->
                            <p class="input-alert" v-if="!$v.password_new.minLength && $v.password_new.$error">Si prega di inserire almeno {{ $v.password_new.$params.minLength.min }} caratteri.</p>
                            <p class="input-alert" v-if="!$v.password_new.maxLength && $v.password_new.$error">Si prega di non inserire pi&ugrave; di {{ $v.password_new.$params.maxLength.max }} caratteri.</p>

                            <p class="input-alert" v-if="!$v.password_new.required && $v.password_new.$error">Questo campo non deve essere vuoto.</p>
                            <p class="input-alert" v-if="!$v.password_new.isNotSameAsEmail && $v.password_new.$error">La password non pu&ograve; essere uguale all'e-mail.</p>
                            <p class="input-alert" v-if="!$v.password_new.isNotSameAsUsername && $v.password_new.$error">La password non pu&ograve; essere uguale al nome utente.</p>

                            <p class="input-alert" v-if="$v.password_new.$error && $v.password_new.required && $v.password_new.minLength && $v.password_new.maxLength && !$v.password_new.containsLetter">La password deve avere almeno una lettera</p>
                            <p class="input-alert" v-if="$v.password_new.$error && $v.password_new.required && $v.password_new.minLength && $v.password_new.maxLength && !$v.password_new.containsNumber">La password deve avere almeno un numero</p>
                            <p class="input-alert" v-if="$v.password_new.$error && $v.password_new.required && $v.password_new.minLength && $v.password_new.maxLength && !$v.password_new.containsSpecial">La password deve avere almeno un carattere speciale: !@#$%^&amp;</p>
                        </div>

                        <div class="col-sm-6 col-md-6">
                            <div class="form-group"> 
                                <label class="form-label">Nuova password (ripeti)</label> 
                                <input class="form-control"
                                        type="password"
                                        autocomplete="off"
                                        v-model="password_new2"
                                        @input="$v.password_new2.$touch()">

                                <!-- alerts -->
                                <p class="input-alert" v-if="!$v.password_new2.sameAs && $v.password_new2.$error">Si prega di inserire la stessa password.</p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card-footer"> 
                    <button class="btn btn-primary" 
                      type="submit"
                      :disabled="$v.$invalid" 
                      @click="update">Aggiorna password</button>

                    <button class="btn btn-secondary"
                        :disabled="!$v.$anyDirty"
                        @click="reset"
                        >Annulla</button>

                </div>
            </div>

            <pre v-if="isDebug">{{$v}}</pre>

        </div>`,

  props: {
    username: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    isDebug: {
      type: Boolean,
      required: false,
      default: false,
    },
  },

  data() {
    return {
      password: "",
      password_new: "",
      password_new2: "",
    };
  },

  validations: {
    password: {
      required,
      minLength: minLength(8),
      maxLength: maxLength(64),
    },
    password_new: {
      required,
      minLength: minLength(8),
      maxLength: maxLength(64),
      isNotSameAsUsername: not(sameAs("username")),
      isNotSameAsEmail: not(sameAs("email")),
      containsLetter: function (value) {
        return /[A-Za-z]/.test(value);
      },
      containsNumber: function (value) {
        return /[0-9]/.test(value);
      },
      containsSpecial: function (value) {
        return /[!@#$%^&]/.test(value); //#?!@$%^&*-
      },
      //https://stackoverflow.com/questions/61176720/how-to-validate-password-with-vuelidate
    },
    password_new2: {
      sameAs: sameAs((vm) => {
        return vm.password_new;
      }),
    },
  },
  mounted() {},
  created() {},
  watch: {
    password: function (newPassword) {
      if (!_.isUndefined(newPassword) && newPassword != "") {
        this.$emit("password-changed", this.password);
      }
    },
    password_new: function (newPassword_new) {
      if (!_.isUndefined(newPassword_new) && newPassword_new != "") {
        this.$emit("password_new-changed", this.password_new);
      }
    },
  },
  computed: {},
  methods: {
    update() {
      this.$emit("update-password");
    },
    reset() {
      //reset fields
      this.password = "";
      this.password_new = "";
      this.password_new2 = "";
      //reset validation
      this.$nextTick(() => {
        this.$v.$reset();
      });
    },
  },
});

export default VueUserPasswordForm;
