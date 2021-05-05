<!-- Global site tag (gtag.js) - Google Analytics -->
<g:if env="production">
    <!-- https://developers.google.com/gtagjs/devguide/consent -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-166691191-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}

      gtag('consent', 'default', {
        'ad_storage': 'denied',
        'analytics_storage': 'denied'
        'wait_for_update': 500
      });
      gtag('set', 'ads_data_redaction', true); 

      gtag('js', new Date());
      gtag('config', 'UA-166691191-1', {'url_passthrough': true});
    </script>

    <script>
      function consentAnalyticsGranted() {
        gtag('consent', 'update', {
          'analytics_storage': 'granted'
        });
      }
    </script>
</g:if>
<g:if env="test">
    <!-- https://developers.google.com/gtagjs/devguide/consent -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-166691191-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}

      gtag('consent', 'default', {
        'ad_storage': 'denied',
        'analytics_storage': 'denied'
        'wait_for_update': 500
      });
      gtag('set', 'ads_data_redaction', true); 

      gtag('js', new Date());
      gtag('config', 'UA-166691191-1', {'url_passthrough': true});
    </script>

    <script>
      function consentAnalyticsGranted() {
        gtag('consent', 'update', {
          'analytics_storage': 'granted'
        });
      }
    </script>
</g:if>
<g:if env="development">
  <!-- No gtag in dev mode -->
  <script>
      function consentAnalyticsGranted() {
        console.log("consent Analytics granted")
      }
    </script>
</g:if>
