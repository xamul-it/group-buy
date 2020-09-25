<html>
<!-- TODO i18n -->
    <head>
        <meta name="layout" content="claylist"/>
        <title>Gruppo di acquisto</title>

        <!-- vuex store -->
	    <script type="module" src="/assets/vue/v-store/group-store.js"></script>
	    <!-- actions -->
	    <script type="module" src="/assets/vue/v-store/group-actions.js"></script>
        <!-- alerts -->
        <script type="module" src="/assets/vue/v-services/toast.js"></script>
        <!-- date time helpers -->
        <script src="/assets/vue/v-jslib/moment@2.28.0/moment.js"></script>
        <script src="/assets/vue/v-jslib/moment@2.28.0/locale/it.js"></script>
        <!-- vue form validation -->
	    <script src="/assets/vue/v-jslib/vuelidate@0.7.5/vuelidate.min.js"></script>
	    <script src="/assets/vue/v-jslib/vuelidate@0.7.5/validators.min.js"></script>

    </head>
    <body>

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Gruppo di acquisto']"/>
        <!--/Sliders Section-->

        <!-- Group -->
        <section class="sptb">
            <div class="container" id="v-group-edit-app">

                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="card">

                            <g:render template="/group/group-header"/>

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
                                    <div v-if="groupItem" class="tab-content">

                                        <!-- Edit -->
                                        <div class="tab-pane active" id="tab-6">

                                            <pre v-if="isDebug">{{ groupItem }}</pre>

                                            <div class="row">

                                                <div class="col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Nome</label>
                                                        <input type="text" 
                                                            class="form-control"
                                                            placeholder="Nome gruppo"
                                                            @input="$v.groupItem.name.$touch()"
                                                            v-model="groupItem.name">
                                                        
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.name.minLength || !$v.groupItem.name.required && $v.groupItem.name.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci un nome per il gruppo (almento {{ $v.groupItem.name.$params.minLength.min }} caratteri).
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.groupItem.name }}</pre>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Categoria</label>
                                                        <select class="form-control w-100"
                                                            v-model="groupItem.category.id">
                                                            <optgroup label="Categorie">
                                                                <option v-for="category in groupCategories" :value="category.id">{{ category.name }}</option>
                                                            </optgroup>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Descrizione</label>
                                                        <textarea rows="5" class="form-control" placeholder="Inserisci qui la descrizione del tuo gruppo"
                                                            @input="$v.groupItem.description.$touch()"
                                                            v-model="groupItem.description" ></textarea>
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.description.required && $v.groupItem.description.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci una descrizione per il gruppo.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.groupItem.description }}</pre>
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
                                                                        <input type="radio" class="custom-control-input" name="public-group" value="true" v-model="groupItem.publicGroup">
                                                                        <span class="custom-control-label text-dark">Visibile a tutti</span>
                                                                    </label>
                                                                    <label class="custom-control custom-radio">
                                                                        <input type="radio" class="custom-control-input" name="public-group" value="false" v-model="groupItem.publicGroup">
                                                                        <span class="custom-control-label text-dark">Visibile solo agli iscritti</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" v-if="groupItem.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Indirizzo di consegna <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione"><i class="fa fa-map-marker location-gps mr-1"></i> </span> </label>
                                                        <input type="text" class="form-control" placeholder="Indirizzo di consegna per il gruppo"
                                                            @input="$v.groupItem.deliveryAddress.address1.$touch()"
                                                            v-model="groupItem.deliveryAddress.address1">
                                                        <input type="text" class="form-control" placeholder="Informazioni aggiuntive indirizzo"
                                                            @input="$v.groupItem.deliveryAddress.address2.$touch()"
                                                            v-model="groupItem.deliveryAddress.address2">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.deliveryAddress.address1.required && $v.groupItem.deliveryAddress.address1.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci un indirizzo per il gruppo.
                                                        </div>

                                                         <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.address1 }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-4" v-if="groupItem.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Citt&agrave;</label>
                                                        <input type="text" class="form-control" placeholder="Citt&agrave;"
                                                            @input="$v.groupItem.deliveryAddress.city.$touch()"
                                                            v-model="groupItem.deliveryAddress.city"
                                                            >
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.deliveryAddress.city.minLength || !$v.groupItem.deliveryAddress.city.required && $v.groupItem.deliveryAddress.city.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci la città.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.city }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3" v-if="groupItem.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Codice postale</label>
                                                        <input type="number" class="form-control" placeholder="CAP"
                                                            @input="$v.groupItem.deliveryAddress.postalCode.$touch()"
                                                            v-model="groupItem.deliveryAddress.postalCode">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.deliveryAddress.postalCode.required && $v.groupItem.deliveryAddress.postalCode.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci il CAP.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.postalCode }}</pre>
                                                    </div>
                                                </div>
                                                <div class="col-md-5" v-if="groupItem.deliveryAddress">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Provincia</label>
                                                        <input type="text"  class="form-control" placeholder="Provincia"
                                                            @input="$v.groupItem.deliveryAddress.district.$touch()"
                                                            v-model="groupItem.deliveryAddress.district">
                                                        <!-- alerts -->
                                                        <div v-if="!$v.groupItem.deliveryAddress.district.required && $v.groupItem.deliveryAddress.district.$error" class="alert alert-danger" role="alert">
                                                            Inseirisci la provincia.
                                                        </div>

                                                        <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.district }}</pre>
                                                    </div>
                                                </div>
                                                
                                                <!-- div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="form-label text-dark">Carica immagine gruppo</label>
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" name="example-file-input-custom">
                                                            <label class="custom-file-label">Scegli file</label>
                                                        </div>
                                                    </div>
                                                </div -->
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

        <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
        <script type="module">
            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
            import * as locationService from '/assets/vue/v-services/location.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/group-store.js';

            //vuelidate
            Vue.use(window.vuelidate.default);
            const { required, minLength } = window.validators;
            //Moment.js
            moment.locale('it');

            var app = new Vue({
                el: '#v-group-edit-app',
                components: {
                    'v-modal': VModal,
                },
                store,
                data: {
                    groupId: ${groupId},
                },
                validations: {
                    groupItem: {
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
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'group.groupItem',
                        'group.groupCategories',
                        'loading',
                        'error',
                        'success',
                        'debug',
                        'geolocationSupported',
                    ]),
                    ...mapFields({
                        currentAddress: 'search.searchAddress',
                    }),
                    isDebug: function () {
                        return this.debug
                    },
                },
                mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    if(this.groupId>0)
                        this.fetchGroup();
                    this.fetchCategoriesAction({service: categoriesService});
                },
                watch: {
                    currentAddress: function(currentAddress) {
                        this.groupItem.deliveryAddress.address1 = currentAddress.road +' '+ (currentAddress.house_number? currentAddress.house_number : '');
                        this.groupItem.deliveryAddress.city = currentAddress.village ? currentAddress.village : currentAddress.city;
                        this.groupItem.deliveryAddress.postalCode = currentAddress.postcode;
                        this.groupItem.deliveryAddress.district = currentAddress.county;
                        this.groupItem.deliveryAddress.countryCode = currentAddress.country_code;

                        this.groupItem.deliveryAddress.lat = currentAddress.latitude;
                        this.groupItem.deliveryAddress.lon = currentAddress.longitude;
                    },
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchGroupAction',
                        'fetchCategoriesAction',
                        'fetchAddressAction',
                    ]),
                    async fetchGroup() {
                        this.fetchGroupAction({service: groupService, groupId: this.groupId});
                    },
                    async fetchAddress() {
                        this.fetchAddressAction({service: locationService})
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
                },
            })        
        </script>

    </body>
</html>