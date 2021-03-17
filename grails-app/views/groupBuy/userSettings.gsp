<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Preferenze</title>

</head>
<body>

    <!--Sliders Section-->
    <section>
        <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
            <div class="header-text mb-0">
                <div class="container">
                    <div class="text-center text-white">
                        <h1 class="">Preferenze</h1>
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
                            <h3 class="card-title">Dashboard</h3>
                        </div>

                        <g:render template="/navigation/theme-user-side-nav" />

                    </div>

                </div>

                <div class="col-xl-9 col-lg-12 col-md-12">
                    <div class="card mb-0">
                        <div class="card-header">
                            <h3 class="card-title">Gestisci le tue preferenze</h3>
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
                        <div class="card-footer"> <button type="submit" class="btn btn-primary" v-on:click="postSettings">Aggiorna preferenze</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /User Dashboard -->

</body>
</html>