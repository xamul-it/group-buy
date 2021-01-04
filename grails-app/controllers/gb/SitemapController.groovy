package gb

class SitemapController {

    def index() {
        render(contentType: 'text/xml', encoding: 'UTF-8') {
            mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
            urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                    'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                    'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                //more static pages here
                url {
                    loc(g.createLink(absolute: true, controller: 'home', action: 'view'))
                    changefreq('daily')
                    priority(1.0)
                }

                //add some dynamic entries
                Supplier.list().each { domain ->
                    url {
                        loc(g.createLink(absolute: true,
                                controller: 'supplier',
                                action: 'get',
                                params: [supplierName: domain.name, supplierId: domain.id]))
                        changefreq('daily')
                        priority(0.8)
                    }
                }
            }
        }
    }
}
