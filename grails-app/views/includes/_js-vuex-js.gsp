<!-- vuex app state management -->
<g:if env="production">
    <script type="module" src="/assets/vue/v-jslib/vuex@3.5.1/vuex.min.js"></script>
    <!-- script type="module" src="/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.min.js"></script -->
</g:if>
<g:if env="test">
    <script type="module" src="/assets/vue/v-jslib/vuex@3.5.1/vuex.js"></script>
    <!-- script type="module" src="/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js" ></script -->
</g:if>
<g:if env="development">
    <script type="module" src="/assets/vue/v-jslib/vuex@3.5.1/vuex.js"></script>
    <!-- script type="module" src="/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js" ></script -->
</g:if>

