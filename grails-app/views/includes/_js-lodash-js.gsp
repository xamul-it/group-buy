<!-- modular methods -->
<g:if env="production">
    <script src="/assets/vue/v-jslib/lodash@4.17.20/lodash.min.js"></script>
</g:if>
<g:if env="test">
    <script src="/assets/vue/v-jslib/lodash@4.17.20/lodash.js"></script>
</g:if>
<g:if env="development">
    <script src="/assets/vue/v-jslib/lodash@4.17.20/lodash.js"></script>
</g:if>
<script>
    const { drop, every, forEach, get, isArray, map, set, isUndefined } = _;
</script>