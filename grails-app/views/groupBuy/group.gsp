<html>
<!-- TODO i18n -->
    <head>
        <meta name="layout" content="claylist"/>
        <title>Gruppo di acquisto</title>

        <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/locale/it.js"></script>

    </head>
    <body>

        <!--Sliders Section-->
        <section>
            <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
                <div class="header-text mb-0">
                    <div class="container">
                        <div class="text-center text-white">
                            <h1 class="">Gruppo di acquisto</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/Sliders Section-->

        <!-- Group -->
        <section class="sptb">
            <div class="container" id="v-group-app">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body group-pattern-1">
                                <div class="wideget-user">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                            <div class="wideget-user-desc text-center">
                                                <!-- div class="wideget-user-img">
                                                    <img class="brround" src="/assets/images/faces/male/25.jpg" alt="img">
                                                </div -->
                                                <div class="user-wrap wideget-user-info">
                                                    <a href="#" class="text-white"><h4 class="font-weight-semibold">{{ group.name }}</h4></a>
                                                    <div class="wideget-user-rating">
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star-o text-warning mr-1"></i></a> <span class="text-white">5 (3876 Reviews)</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 text-center">
                                            <div class="wideget-user-info ">
                                                <div class="wideget-user-icons mt-2">
                                                    <a href="#" class="facebook-bg mt-0"><i class="fa fa-facebook"></i></a>
                                                    <a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a>
                                                    <a href="#" class="google-bg"><i class="fa fa-google"></i></a>
                                                    <a href="#" class="dribbble-bg"><i class="fa fa-dribbble"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="wideget-user-tab">
                                    <div class="tab-menu-heading">
                                        <div class="tabs-menu1">
                                            <ul class="nav">
                                                <li class=""><a v-on:click="showItem()" v-bind:class="{ active: show }">Informazioni</a></li>
                                                <li><a v-on:click="editItem()" class="" v-bind:class="{ active: edit }">Gestisci gruppo</a></li>
                                                <li><a href="${createLink(controller: 'groupBuy', action: 'groupOrders', id: params.id)}" class="">Ordini<span class="badge badge-primary badge-pill">20</span></a></li>
                                                <li><a href="${createLink(controller: 'groupBuy', action: 'groupMembers', id: params.id)}" data-toggle="tab" class="">Membri<span class="badge badge-primary badge-pill">08</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-0">
                            <div class="card-body">
                                <div class="border-0">
                                    <div class="tab-content">

                                        <!-- Show -->
                                        <div class="tab-pane" v-bind:class="{ active: show }" id="tab-5">
                                            <div class="profile-log-switch">
                                                <div class="media-heading">
                                                    <h3 class="card-title mb-3 font-weight-bold text-dark">Dettagli</h3>
                                                </div>
                                                <ul class="usertab-list mb-0 text-dark">
                                                    <li><span class="font-weight-semibold">Nome :</span> {{ group.name }} </li>
                                                    <li><span class="font-weight-semibold">Luogo :</span> <span v-if="group.deliveryAddress">{{ group.deliveryAddress.city }} - {{ group.deliveryAddress.countryCode }}</span> </li>
                                                    <li><span class="font-weight-semibold">Creato :</span> {{ timeFromNow(group.creationDate) }}</li>
                                                    <li><a href="#" class="text-dark"><span class="font-weight-semibold">Web :</span> <span> - </span></a></li>
                                                    <li v-if="group.owner"><a :href="'mailto:'+group.owner.email" class="text-dark"><span class="font-weight-semibold">Email :</span> <span>{{ group.owner.email }}</span> </a></li>
                                                    <li v-if="group.owner"><a :href="group.owner.phone?'tel:'+group.owner.phone:'tel:'" class="text-dark"><span class="font-weight-semibold">Telefono :</span> <span v-if="group.owner">{{ group.owner.phone }}</span> </a></li>
                                                </ul>
                                                <div class="row profie-img">
                                                    <div class="col-md-12 text-dark">
                                                        <div class="media-heading">
                                                            <h3 class="card-title mb-3 font-weight-bold">Descrizione</h3>
                                                        </div>
                                                        <p></p>
                                                        <p class="mb-0">{{ group.description }}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Show -->

                                        <!-- Edit -->
                                        <div class="tab-pane" v-bind:class="{ active: edit }" id="tab-6">
                                            <div class="row">
                                                <div class="col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Nome</label>
                                                        <input type="text" v-model="group.name" class="form-control" placeholder="Nome gruppo">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Descrizione</label>
                                                        <textarea rows="5" v-model="group.description" class="form-control" placeholder="Inserisci qui la descrizione del tuo gruppo"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Indirizzo di consegna</label>
                                                        <input type="text" v-model="group.deliveryAddress.address1" class="form-control" placeholder="Indirizzo di consegna per il gruppo">
                                                        <input type="text" v-model="group.deliveryAddress.address2" class="form-control" placeholder="Informazioni aggiuntive indirizzo">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-4" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Citt&agrave;</label>
                                                        <input type="text" v-model="group.deliveryAddress.city" class="form-control" placeholder="Citt&agrave;">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Codice postale</label>
                                                        <input type="number" v-model="group.deliveryAddress.postalCode" class="form-control" placeholder="CAP">
                                                    </div>
                                                </div>
                                                <div class="col-md-5" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Provincia</label>
                                                        <input type="text" v-model="group.deliveryAddress.district" class="form-control" placeholder="Provincia">
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Carica immagine gruppo</label>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" name="example-file-input-custom">
                                                            <label class="custom-file-label">Scegli file</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <button type="submit" class="btn btn-primary" v-on:click="saveGroup">Salva gruppo</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Edit -->

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Group -->


        <!-- Vue Pages and Components here -->
        <script type="module" src="/assets/vue/v-services/group-rest.js"></script>

        <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
        <script type="module">
            import * as groupService from '/assets/vue/v-services/group-rest.js';
            
            moment.locale('it');

            var app = new Vue({
                el: '#v-group-app',
                data: {
                    group: {},
                    groupId: 0,
                    edit: false
                },
                computed: {
                    show: function () {
                        return !this.edit
                    }
                },
                mounted() {
                        console.log("query id", "${params}", "${params.id}") 
                        //will execute at pageload
                        this.groupId = ${params.id};
                        this.edit = ${params.edit?(params.edit != 'false'?'true':'false'):'false'};
                        this.fetchGroup();
                },
                methods: {
                    async fetchGroup() {
                        try {
                            this.setLoadingState();
                            let { data, headers } = await groupService.show(this.groupId);
                            this.group = data; 
                            // Reset the loading state after fetching group.
                            this.loading = false;
                        } catch (error) {
                            console.log("catch error", error);
                            this.setErrorState(error);
                        } finally {
                            console.log("finally vue data", this.$data);
                        }
                    },
                    setErrorState(error) {
                        this.error = error;
                        this.loading = false;
                    },
                    setLoadingState() {
                        this.error = null;
                        this.loading = true;
                    },

                    editItem() {
                        this.edit = true;
                    },
                    showItem() {
                        this.edit = false;
                    },
                    timeFromNow(date) {
                        return moment(date).fromNow();
                    },
                    
                    async saveGroup() {
                        let payload = this.group;

                        if(this.groupId == 0)
                            await groupService.save( payload );
                        else
                            await groupService.update( this.groupId, payload );
                    
                    }

                },
            })        
        </script>

    </body>
</html>