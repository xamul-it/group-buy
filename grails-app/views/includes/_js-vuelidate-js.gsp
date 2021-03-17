<!-- vue form validation -->
<g:if env="production">
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/vuelidate.min.js"></script>
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/validators.min.js"></script>
</g:if>
<g:if env="test">
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/vuelidate.min.js"></script>
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/validators.min.js"></script>
</g:if>
<g:if env="development">
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/vuelidate.min.js"></script>
    <script src="/assets/vue/v-jslib/vuelidate@0.7.6/validators.min.js"></script>
</g:if>
<script>
    Vue.use(window.vuelidate.default);
    const { required, requiredIf, requiredUnless, email, minLength, maxLength, minValue, sameAs, not, helpers, } = window.validators;
</script>
