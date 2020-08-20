<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Profilo utente</title>
</head>
<body>

    <g:render template="/navigation/theme-topbar" />

	<g:render template="/navigation/theme-nav" />

    <!--Sliders Section-->
    <section>
        <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            <div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Profilo utente</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/Sliders Section-->

    <!-- User Dashboard -->
    <section class="sptb">
        <div class="container" id="v-user-data-app">

            <div class="row">
                <div class="col-xl-3 col-lg-12 col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">My Dashboard</h3>
                        </div>
                        <div class="card-body text-center item-user border-bottom">
                            <div class="profile-pic">
                                <div class="profile-pic-img"> <span class="bg-success dots" data-toggle="tooltip"
                                        data-placement="top" title="" data-original-title="online"></span> <img
                                        src="../../assets/theme/img/faces/user-placeholder.jpg" class="brround" alt="user"> 
                                    </div>
                                    <div class="text-dark">
                                        <h4 class="mt-3 mb-0 font-weight-semibold">{{name}}</h4>
                                    </div>
                            </div>
                        </div>
                        <div class="item1-links  mb-0"> 
                            <a href="${createLink(controller: 'groupBuy', action: 'userProfile')}" class="active d-flex border-bottom"> 
                                <span class="icon1 mr-3"><i class="icon icon-user"></i></span> Profilo 
                            </a> 
                            <a href="${createLink(controller: 'groupBuy', action: 'userSettings')}"  class=" d-flex  border-bottom">
                                <span class="icon1 mr-3"><i class="icon icon-settings"></i></span> Preferenze 
                            </a> 
                            
                            <a href="#" class="d-flex  border-bottom"> 
                                <span class="icon1 mr-3"><i class="icon icon-folder-alt"></i></span> Vetrina 
                            </a>
                            <a href="${createLink(controller: 'groupBuy', action: 'pricelist')}" class=" d-flex  border-bottom">
                                <span class="icon1 mr-3"><i class="icon icon-list"></i></span> Listino 
                            </a> 
                            <a href="#orders" class="d-flex  border-bottom">
                                <span class="icon1 mr-3"><i class="icon icon-basket"></i></span> Ordini
                            </a> 
                            <a href="#groups" class="d-flex border-bottom"> 
                                <span class="icon1 mr-3"><i class="icon icon-share"></i></span> Gruppi
                            </a>
                            <a href="/logoff" class="d-flex">
                                <span class="icon1 mr-3"><i class="icon icon-power"></i></span> Logout
                            </a> 
                        </div>
                    </div>
                    
                    <div class="card mb-xl-0">
                        <div class="card-header">
                            <h3 class="card-title">Consigli per te</h3>
                        </div>
                        <div class="card-body">
                            <ul class="list-unstyled widget-spec  mb-0">
                                <li class=""> <i class="fa fa-check text-success" aria-hidden="true"></i> 
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                </li>
                                <li class=""> <i class="fa fa-check text-success" aria-hidden="true"></i>
                                    Vivamus malesuada magna nec diam accumsan pellentesque.
                                </li>
                                <li class=""> <i class="fa fa-check text-success" aria-hidden="true"></i>
                                    Nullam sed dolor nec purus pulvinar porttitor eget at tellus.
                                </li>
                                <li class="ml-5 mb-0"> <a href="tips.html"> Vedi altro.</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-xl-9 col-lg-12 col-md-12">
                    <div class="card mb-0">
                        <div class="card-header">
                            <h3 class="card-title">Gestisci il tuo profilo</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6 col-md-6">
                                    <div class="form-group"> <label class="form-label">Nome</label> <input type="text"
                                            class="form-control" placeholder="Nome" v-model="name"> </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group"> <label class="form-label">Descrizione</label> <textarea rows="5"
                                            class="form-control" placeholder="Inserisci la tua descrizione" v-model="description"></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <div class="form-group"> <label class="form-label">E-mail</label> <input
                                            type="email" class="form-control" placeholder="E-mail" v-model="contactInfo.email"> </div>
                                </div>
                                <div class="col-sm-6 col-md-6">
                                    <div class="form-group"> <label class="form-label">Telefono</label> <input
                                            type="number" class="form-control" placeholder="Telefono" v-model="contactInfo.phone"> </div>
                                </div>
                                <div class="col-sm-6 col-md-6 offset-sm-6 offset-md-6">
                                    <div class="form-group"> <label class="form-label">Mobile</label> <input
                                            type="number" class="form-control" placeholder="Cellulare" v-model="contactInfo.mobile"> </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group"> <label class="form-label">Indirizzo</label> 
                                        <input type="text"
                                                class="form-control" placeholder="Via/Piazza" v-model="shippingAddress.address1">
                                        <input type="text"
                                                class="form-control" placeholder="" v-model="shippingAddress.address2"> 
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-4">
                                    <div class="form-group"> <label class="form-label">Citt&agrave;</label> <input type="text"
                                            class="form-control" placeholder="Citt&agrave;" v-model="shippingAddress.city"> </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="form-group"> <label class="form-label">Codice postale</label> <input
                                            type="number" maxlength="5" min="20000" max="29999" class="form-control" placeholder="00000" v-model="shippingAddress.postalCode"> </div>
                                </div>
                                <div class="col-sm-6 col-md-3">
                                    <div class="form-group"> <label class="form-label">Provincia</label> 
                                        <input type="text" maxlength="2" class="form-control" placeholder="XX" v-model="shippingAddress.district"> 
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="card-footer"> <button type="submit" class="btn btn-primary" v-on:click="postUserData">Aggiorna profilo</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /User Dashboard -->

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.js"></script>

    <script src="https://unpkg.com/lodash@4.17.19/lodash.js"></script>

    <script src="https://unpkg.com/vuelidate@0.7.5/dist/vuelidate.min.js"></script>
    <script src="https://unpkg.com/vuelidate@0.7.5/dist/validators.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.js"></script>

    <!-- Vue Pages and Components here -->
    <script src="/assets/vue/v-login/auth.vue.js"></script>

    <script>
        Vue.use(window.vuelidate.default);

        var app = new Vue({
            el: '#v-user-data-app',
            components: {
                //'v-login-auth': VLoginAuth,
            },
            data: {
                id: 0,
                owner: {
                    id: 0,
                },
                creator: {
                    id: 0,
                },
                name: '',
                description: '',
                contactInfo: {
                    email: '',
                    phone: '',
                    mobile: '',
                },
                shippingAddress: {
                    address1:'',
                    address2:'',
                    city: '',
                    postalCode: '',
                    district: '',
                    countryCode: 'IT'
                },
                
            },
            mounted:function(){
                    this.getUserData() //will execute at pageload
            },
            methods: {
                getUserData() {
                    let url =
                        "/supplier/show.json";
                    //this.showProgress = true;
                    axios
                        .get(url)
                        .then(result => {
                            console.log("result=", result ); 
                            data = result.data;
                            console.log("data=", data );

                            this.id = data.id
                            this.owner = data.owner
                            this.creator = data.creator

                            this.name = data.name
                            this.description = data.description
                            //contactInfo
                            this.contactInfo.email = data.contactInfo.email
                            this.contactInfo.phone = data.contactInfo.phone
                            this.contactInfo.mobile = data.contactInfo.mobile
                            //shippingAddress
                            this.shippingAddress.address1 = data.shippingAddress.address1
                            this.shippingAddress.address2 = data.shippingAddress.address2
                            this.shippingAddress.city = data.shippingAddress.city
                            this.shippingAddress.postalCode = data.shippingAddress.postalCode
                            this.shippingAddress.district = data.shippingAddress.district
                            this.shippingAddress.countryCode = data.shippingAddress.countryCode
                            //this.showProgress = false;
                            
                        })
                        .catch(error => {
                            console.log("error", error);
                            //this.showProgress = false;
                        }).then( () => {
                            console.log("data", this.$data);
                            console.log("data.json", JSON.stringify(this.$data));
                            
                        });
                },
                postUserData() {
                    axios.post('/supplier/save.json?id='+this.id, 
                        JSON.stringify(this.$data)
                    )
                    .then(function (response) {
                        console.log(response);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                }
            },
        })        
    </script>

</body>
</html>

<!-- 

http://localhost:8080/supplier/save.json?id=5

Request Headrs:

POST /supplier/save.json?id=5 HTTP/1.1
Host: localhost:8080
Connection: keep-alive
Content-Length: 351
Accept: application/json, text/plain, */*
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.108 Safari/537.36
Content-Type: application/json;charset=UTF-8
Origin: http://localhost:8080
Sec-Fetch-Site: same-origin
Sec-Fetch-Mode: cors
Sec-Fetch-Dest: empty
Referer: http://localhost:8080/
Accept-Encoding: gzip, deflate, br
Accept-Language: it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7
Cookie: JSESSIONID=24047C29CD4876A7328102C40971848A

Response Headers:

HTTP/1.1 201
Content-Type: application/json;charset=UTF-8
Transfer-Encoding: chunked
Date: Thu, 20 Aug 2020 08:20:04 GMT

Response body:

{"id":5,"name":"Negozio Test Nuovo","owner":{"id":3},"shippingAddress":{"address1":"Viale 10","countryCode":"IT","postalCode":"20100","address2":"Viale 2","city":"Milano","district":"MI"},"creator":{"id":3},"contactInfo":{"phone":"42215432","mobile":"54236424","email":"test@test.it"},"description":"Sono il nuovo negozio che si è appena registrato"}

cURL request:

curl 'http://localhost:8080/supplier/save.json?id=5' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.108 Safari/537.36' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Origin: http://localhost:8080' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: http://localhost:8080/' \
  -H 'Accept-Language: it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'Cookie: JSESSIONID=24047C29CD4876A7328102C40971848A' \
  --data-binary '{"id":5,"name":"Negozio Test Nuovo","owner":{"id":3},"shippingAddress":{"address1":"Viale 10","countryCode":"IT","postalCode":"20100","address2":"Viale 2","city":"Milano","district":"MI"},"creator":{"id":3},"contactInfo":{"phone":"42215432","mobile":"54236424","email":"test@test.it"},"description":"Sono il nuovo negozio che si è appena registrato"}' \
  --compressed


-->