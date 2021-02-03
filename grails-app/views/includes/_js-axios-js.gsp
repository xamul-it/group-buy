<!-- network -->
<g:if env="production">
    <script src="/assets/vue/v-jslib/axios@0.21.0/axios.min.js"></script>
</g:if>
<g:if env="test">
    <script src="/assets/vue/v-jslib/axios@0.21.0/axios.js"></script>
</g:if>
<g:if env="development">
    <script src="/assets/vue/v-jslib/axios@0.21.0/axios.js"></script>
</g:if>