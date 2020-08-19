//vuelidate
const { required, minLength } = window.validators
// import { required, minLength } from 'vuelidate/lib/validators'

//lodash
const { drop, every, forEach, get, isArray, map, set } = _
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VRegisterForgotPassword = Vue.component("VRegisterForgotPassword", {
    template: `
        <div class="vue-template">
            <slot v-bind:$v="$v" v-bind:$props="$props">
            </slot>

            <form action="/register/forgotPassword" 
                class="card-body"
                tabindex="500"
                method="post" 
                name="forgotPasswordForm" 
                id="forgotPasswordForm"
                autocomplete="off"
                >
                <!-- 
                //@submit.prevent="onSubmit" -->

                <h3 class="pb-2">{{inputParams.forgotPasswordDescription}}</h3>

                <div class="username">
                    <input :name="inputParams.usernameParameter"
                        type="text" 
                        required="required"
                        @input="$v.username.$touch()"
                        v-model="username"
                        >
                        <label>{{inputParams.loginUsername}}</label>
                </div>
                <!-- pre>{{$v.username}}</pre -->

                <div class="submit">
                    <input type="submit" :disabled="$v.$invalid" class="btn btn-primary btn-block" :value="inputParams.forgotPasswordSubmit" id="loginButton_submit">
                </div>
                <div class="text-center text-dark mb-0"> Forget it, <a :href="urls.loginAuthUrl">send me backto the sign in</a>.</div>

            </form>

            <!-- pre>{{$v}}</pre -->

        </div>`,

    props: {
        inputParams: {
            required: true
        },
        urls: {
            required: true
        },
    },

    data() {
        return {
            username: '',
            params: [],
        };
    },

    validations: {
        username: {
            required,
            minLength: minLength(3)
        },
    },

    created() {
        
        if (isArray(this.inputParams)) {
            this.params = map(this.inputParams, (item) => {
                return {
                    key: item,
                    label: item
                };
            });
        } else {
            this.params = map(this.inputParams, (label, key) => {
                return {
                    key: key,
                    label: label
                };
            });
        }
        
    },
    methods: {
        onSubmit (e) {
            console.log(e)
            //submit form
        },
        rememberMeToggle (e) {
            console.log(e)
        }
    }
});