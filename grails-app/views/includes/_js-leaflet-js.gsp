<!-- maps -->
<link rel="stylesheet" href="/assets/vue/v-jslib/leaflet@1.7.1/leaflet.css" />
<g:if env="production">
    <script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>
</g:if>
<g:if env="test">
    <script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>
</g:if>
<g:if env="development">
    <script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
    <script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>
</g:if>
<%/*
    <script type="module" src="/assets/vue/v-jslib/leaflet@1.7.1/leaflet-src.esm.js"></script>
    <script type="module" src="/assets/vue/v-jslib/vue2-leaflet@2.5.2/vue2-leaflet.min.js"></script>
*/%>