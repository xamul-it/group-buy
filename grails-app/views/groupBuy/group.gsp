<html>
<!-- TODO i18n -->
    <head>
        <meta name="layout" content="claylist"/>
        <title>Gruppo di acquisto</title>

        <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/locale/it.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/vuelidate@0.7.5/dist/vuelidate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/vuelidate@0.7.5/dist/validators.min.js"></script>

    </head>
    <body>

        <!--Sliders Section-->
        <section>
            <div class="bannerimg cover-image bg-background3" style="background: url(&quot;/assets/theme/img/banners/banner2.jpg&quot;) center center;" >
                <div class="header-text mb-0">
                    <div class="container">
                        <div class="text-center text-white">
                            <h1 class=""><span v-if="isCreate">Crea </span>Gruppo di acquisto</h1>
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
                        
                        <div class="card" v-if="!isCreate">
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
                                            <g:render template="/navigation/theme-group-nav" />
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
                                        <div class="tab-pane" v-if="!isCreate" v-bind:class="{ active: isShow }" id="tab-5">
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
                                                <div class="row group-description">
                                                    <div class="col-md-12 text-dark">
                                                        <div class="media-heading">
                                                            <h3 class="card-title mb-3 font-weight-bold">Descrizione</h3>
                                                        </div>
                                                        <p></p>
                                                        <p class="mb-0">{{ group.description }}</p>
                                                        <p></p>
                                                    </div>
                                                </div>
                                                <div class="row group-actions">
                                                    <div class="col-md-12 text-dark">
                                                        <button type="submit" :disabled="false" class="btn btn-primary" v-on:click="subscibeToGroup">Iscriviti al gruppo</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /Show -->

                                        <!-- Edit -->
                                        <div class="tab-pane" v-if="isEdit" v-bind:class="{ active: isEdit }" id="tab-6">
                                            <div class="row">

                                                <div class="col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Nome</label>
                                                        <input type="text" 
                                                            class="form-control"
                                                            placeholder="Nome gruppo"
                                                            @input="$v.group.name.$touch()"
                                                            v-model="group.name">
                                                        
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.name.minLength || !$v.group.name.required && $v.group.name.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci un nome per il gruppo (almento {{ $v.group.name.$params.minLength.min }} caratteri).
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.group.name }}</pre>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Categoria</label>
                                                        <select class="form-control w-100"
                                                            v-model="group.categoria.id">
                                                            <optgroup label="Categorie">
                                                                <option v-for="category in categories" :value="category.id">{{category.name}}</option>
                                                            </optgroup>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Descrizione</label>
                                                        <textarea rows="5" class="form-control" placeholder="Inserisci qui la descrizione del tuo gruppo"
                                                            @input="$v.group.description.$touch()"
                                                            v-model="group.description" ></textarea>
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.description.required && $v.group.description.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci una descrizione per il gruppo.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.group.description }}</pre>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-12">
                                                    <div class="form-group ">
                                                        <div class="row">
                                                            <div class="col-md-1">
                                                                <label class="form-label text-dark">Visibilità:</label>
                                                            </div>
                                                            <div class="col-md-11">
                                                                <div class="custom-controls-stacked d-md-flex">
                                                                    <label class="custom-control custom-radio mr-4">
                                                                        <input type="radio" class="custom-control-input" name="public-group" value="true" v-model="group.publicGroup">
                                                                        <span class="custom-control-label text-dark">Visibile a tutti</span>
                                                                    </label>
                                                                    <label class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="public-group" value="false" v-model="group.publicGroup">
                                                                        <span class="custom-control-label text-dark">Visibile solo agli iscritti</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" v-if="isEdit">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Indirizzo di consegna <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione"><i class="fa fa-map-marker location-gps mr-1"></i> </span> </label>
                                                        <input type="text" class="form-control" placeholder="Indirizzo di consegna per il gruppo"
                                                            @input="$v.group.deliveryAddress.address1.$touch()"
                                                            v-model="group.deliveryAddress.address1">
                                                        <input type="text" class="form-control" placeholder="Informazioni aggiuntive indirizzo"
                                                            @input="$v.group.deliveryAddress.address2.$touch()"
                                                            v-model="group.deliveryAddress.address2">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.deliveryAddress.address1.required && $v.group.deliveryAddress.address1.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci un indirizzo per il gruppo.
                                                        </div>

                                                         <pre v-if="isDebug">{{ $v.group.deliveryAddress.address1 }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-4" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Citt&agrave;</label>
                                                        <input type="text" class="form-control" placeholder="Citt&agrave;"
                                                            @input="$v.group.deliveryAddress.city.$touch()"
                                                            v-model="group.deliveryAddress.city"
                                                            >
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.deliveryAddress.city.minLength || !$v.group.deliveryAddress.city.required && $v.group.deliveryAddress.city.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci la città.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.group.deliveryAddress.city }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Codice postale</label>
                                                        <input type="number" class="form-control" placeholder="CAP"
                                                            @input="$v.group.deliveryAddress.postalCode.$touch()"
                                                            v-model="group.deliveryAddress.postalCode">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.deliveryAddress.postalCode.required && $v.group.deliveryAddress.postalCode.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci il CAP.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.group.deliveryAddress.postalCode }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-md-5" v-if="group.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Provincia</label>
                                                        <input type="text"  class="form-control" placeholder="Provincia"
                                                            @input="$v.group.deliveryAddress.district.$touch()"
                                                            v-model="group.deliveryAddress.district">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.group.deliveryAddress.district.required && $v.group.deliveryAddress.district.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci la provincia.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.group.deliveryAddress.district }}</pre>
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
                                                    <button type="submit" :disabled="$v.$invalid" :title="$v.$invalid?'Compilare tutti campi obbligatori per inviare i dati':''" class="btn btn-primary" v-on:click="saveGroup">Salva gruppo</button>
                                                    <a href="/" class="btn btn-secondary">Annulla</a>
                                                    <pre v-if="isDebug">{{ $v }}</pre>
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
        <script type="module" src="/assets/vue/v-services/categories-rest.js"></script>
        <script type="module" src="/assets/vue/v-services/location.js"></script>
        <script type="module" src="/assets/vue/v-services/toast.js"></script>

        <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
        <script type="module">
            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
            import * as locationService from '/assets/vue/v-services/location.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            //vuelidate
            Vue.use(window.vuelidate.default);
            const { required, minLength } = window.validators;
            //Moment.js
            moment.locale('it');

            var app = new Vue({
                el: '#v-group-app',
                data: {
                    group: {
                        deliveryAddress: {
                            address1: '',
                            address2: '',
                            postalCode: '',
                            city: '',
                            district: '',
                            countryCode: '',
                            lat: 0.0,
                            lon: 0.0,
                        },
                        name: '',
                        publicGroup: false,
                        description: '',
                        members: [],
                        owner: {},
                        categoria: {
                            id: 0,
                        },
                        category: {
                            id: 0,
                        }
                    },
                    groupId: ${groupId},
                    categories: [],
                    edit: ${isEdit},
                    debug: ${isDebug},
                    error: null,
                    success: null,
                    geolocationSupported: 'geolocation' in navigator,
                    currentAddress: {
                        address: {},
                        latitude: 0.0,
                        longitude: 0.0,
                    },
                    loading: false,
                },
                validations: {
                    group: {
                        name: {
                            required,
                            minLength: minLength(3),
                        },
                        description:  {
                            required,
                        },
                        deliveryAddress:{
                            address1: {
                                required,
                            },
                            city: {
                                required,
                                minLength: minLength(2),
                            },
                            postalCode: {
                                required,
                                minLength: minLength(3),
                            },
                            district: {
                                required,
                                minLength: minLength(2),
                            },
                        }
                        
                    },
                },
                computed: {
                    isShow: function () {
                        return !this.edit
                    },
                    isEdit: function () {
                        return this.edit || this.isCreate
                    },
                    isCreate: function () {
                        return (this.group == null || "undefined" === typeof(this.group["creationDate"]) ) && this.groupId <=0
                    },
                    isDebug: function () {
                        return this.debug
                    },
                },
                mounted() {
                    //will execute at pageload
                    if(this.groupId>0)
                        this.fetchGroup();
                    this.fetchCategories();
                },
                watch: {
                    currentAddress: function(currentAddress) {
                        this.group.deliveryAddress.address1 = currentAddress.address.road +' '+currentAddress.address.house_number;
                        this.group.deliveryAddress.city = currentAddress.address.village ? currentAddress.address.village : currentAddress.address.city;
                        this.group.deliveryAddress.postalCode = currentAddress.address.postcode;
                        this.group.deliveryAddress.district = currentAddress.address.county;
                        this.group.deliveryAddress.countryCode = currentAddress.address.country_code;

                        this.group.deliveryAddress.lat = currentAddress.latitude;
                        this.group.deliveryAddress.lon = currentAddress.longitude;
                    },
                    error: function (message) {
                        toastService.alertDanger(message)
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    }
                },
                methods: {
                    subscibeToGroup() {
                        toastService.alertSuccess("Complimenti ti sei iscritto al gruppo "+this.group.name)
                    },
                    async fetchGroup() {
                        try {
                            this.setLoadingState();
                            let { data, headers } = await groupService.show(this.groupId);
                            this.group = data; 
                            // Reset the loading state after fetching group.
                            this.loading = false;
                        } catch (error) {
                            if(this.debug)
                                console.log("catch error", error);
                            this.setErrorState(error.message);
                        } finally {
                            if(this.debug)
                                console.log("finally vue data", this.$data);
                        }
                    },
                    async fetchCategories() {
                        try {
                            this.setLoadingState();
                            let { data, headers } = await categoriesService.list(100,0,'name','asc');
                            this.categories = data; 
                            // Reset the loading state after fetching group.
                            this.loading = false;
                        } catch (error) {
                            if(this.debug)
                                console.log("catch error", error);
                            this.setErrorState(error.message);
                        } finally {
                            if(this.debug)
                                console.log("finally vue data", this.$data);
                        }
                    },
                    async fetchAddress() {
                        try {
                            this.setLoadingState();
                            this.currentAddress = await locationService.currentAddress();
                            // Reset the loading state after fetching the address.
                            this.loading = false;
                            this.success = 'Posizione individuata: '+_.toString(_.valuesIn(this.currentAddress.address));
                            if(this.debug)
                                console.log("Address", _.toString(_.valuesIn(this.currentAddress)), this.currentAddress );
                        } catch (error) {
                            if(this.debug)
                                console.log("catch error", error);
                            this.setErrorState(error.message);
                        }
                    },
                    async saveGroup() {
                        try {
                            let payload = this.group;
                            let r;
                            if(this.groupId == 0)
                                r = await groupService.save( payload );
                            else
                                r = await groupService.update( this.groupId, payload );
                            // Reset the loading state after fetching the address.
                            this.loading = false;
                            this.success = r.message;
                        } catch (error) {
                            if(this.debug)
                                console.log("catch error", error);
                            this.setErrorState(error.message);
                        }
                    
                    },
                    setErrorState(error) {
                        this.error = error;
                        this.loading = false;
                    },
                    setLoadingState() {
                        this.success = null;
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
                },
            })        
        </script>

    </body>
</html>