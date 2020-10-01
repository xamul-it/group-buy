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

    </head>
    <body>

        <!--Sliders Section-->
        <g:render template="/common/theme-header" model="['headerTitle':'Gruppo di acquisto']"/>
        <!--/Sliders Section-->

        <!-- Group -->
        <section class="sptb">
            <div class="container" id="v-group-app">
                <v-modal ref="registerLoginModal"></v-modal>
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


                    </div>
                </div>

                <div class="row">

                    <div class="col-xl-9 col-lg-8 col-md-12">

                        <div class="card mb-0">
                            <div class="card-body">
                                <div class="border-0">
                                    <div class="tab-content">

                                        <!-- Show -->
                                        <div class="tab-pane active" id="tab-5">
                                            <pre v-if="isDebug">{{ groupItem }}</pre>
                                            
                                            <div class="profile-log-switch">
                                                <!-- Members -- >
                                                <a href="${createLink(controller: 'groupBuy', action: 'groupMembers', id: groupId)}" >
                                                    <div class="avatar-list avatar-list-stacked">
                                                        <span class="avatar brround cover-image cover-image">AD</span>
                                                        <span class="avatar brround cover-image cover-image">LU</span>
                                                        <span class="avatar brround cover-image cover-image">TE</span>
                                                        <span class="avatar brround cover-image cover-image">AL</span>
                                                        <span class="avatar brround cover-image cover-image">US</span>
                                                        <span class="avatar brround cover-image cover-image">+3</span>
                                                    </div>
                                                </a>
                                                -->
                                                
                                                <div class="media-heading">
                                                    <h3 class="card-title mb-3 font-weight-bold text-dark">Dettagli</h3>
                                                </div>
                                                <ul class="usertab-list mb-0 text-dark" v-if="groupItem">
                                                    <li><span class="font-weight-semibold">Nome :</span> {{ groupItem.name }} </li>
                                                    <li><span class="font-weight-semibold">Luogo :</span> <span v-if="groupItem.deliveryAddress">{{ groupItem.deliveryAddress.city }} - {{ groupItem.deliveryAddress.countryCode }}</span> </li>
                                                    <li><span class="font-weight-semibold">Creato :</span> {{ timeFromNow(groupItem.creationDate) }}</li>
                                                    <li><a href="#" class="text-dark"><span class="font-weight-semibold">Web :</span> <span> - </span></a></li>
                                                    <li v-if="groupItem.owner"><a :href="'mailto:'+groupItem.owner.email" class="text-dark"><span class="font-weight-semibold">Email :</span> <span>{{ groupItem.owner.email }}</span> </a></li>
                                                    <li v-if="groupItem.owner"><a :href="groupItem.owner.phone?'tel:'+groupItem.owner.phone:'tel:'" class="text-dark"><span class="font-weight-semibold">Telefono :</span> <span v-if="groupItem.owner">{{ groupItem.owner.phone }}</span> </a></li>
                                                </ul>
                                                <div class="row group-description">
                                                    <div class="col-md-12 text-dark">
                                                        <div class="media-heading">
                                                            <h3 class="card-title mb-3 font-weight-bold">Descrizione</h3>
                                                        </div>
                                                        <p></p>
                                                        <p v-if="groupItem" class="mb-0">{{ groupItem.description }}</p>
                                                        <p></p>
                                                    </div>
                                                </div>
        
                                            </div>
                                        </div>
                                        <!-- /Show -->

                                            <l-map
                                            v-if="showMap"
                                            :zoom="16"
                                            :center="center"
                                            :options="{ zoomSnap: 0.5 }"
                                            style="height: 400px"
                                            >
                                                <l-marker :lat-lng="markerLatLng">
                                                    <l-tooltip :options="{ permanent: true, interactive: true }">
                                                        {{ groupItem.name }}
                                                    </l-tooltip>
                                                </l-marker>
                                                <l-tile-layer
                                                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                                                :attribution="attribution"
                                                />
                                            </l-map>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-12">

                        <div class="card"> 
                            <div class="card-body"> 
                               
                                <div class="row group-actions" v-if="groupItem">
                                        <sec:ifLoggedIn>
                                        <div class="col-md-12 form-group" v-if="!groupItem.administrator">
                                            <button v-if="!groupItem.member" type="button" class="btn btn-primary btn-block btn-lg" v-on:click="subscribe">  <i class="fa fa-heart-o"></i> Iscriviti al gruppo</button>
                                            <button v-else-if="groupItem.member" type="button" class="btn btn-secondary btn-block btn-lg" v-on:click="unsubscribe"><i class="fa fa-heart"></i> Lascia gruppo</button>
                                        </div>
                                        <div class="col-md-12 form-group" v-if="groupItem.administrator">
                                            <button class="btn btn-outline-primary btn-block btn-lg" onclick="alert('unavailable')"><i class="fa fa-cart-plus"></i> Crea ordine </button>
                                        </div>
                                        <div class="col-md-12 form-group" v-if="!groupItem.member && !groupItem.administrator">
                                            <button class="btn btn-outline-primary btn-block btn-lg" onclick="alert('unavailable')"><i class="fa fa-envelope"></i> Contatta l'amministratore </button>
                                        </div>
                                        </sec:ifLoggedIn>
                                        <sec:ifNotLoggedIn>
                                        <div class="col-md-12 form-group">
                                            <button v-if="!groupItem.member && !groupItem.administrator" type="button" class="btn btn-primary btn-block btn-lg" @click="$refs.registerLoginModal.openModal()">  <i class="fa fa-heart-o"></i> Iscriviti al gruppo</button>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <button class="btn btn-outline-primary btn-block btn-lg" @click="$refs.registerLoginModal.openModal()"><i class="fa fa-envelope"></i> Contatta l'amministratore </button>
                                        </div>
                                        </sec:ifNotLoggedIn>
                                </div>
                                





                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </section>
        <!-- /Group -->



        <!-- link rel="stylesheet" href="//unpkg.com/leaflet/dist/leaflet.css" /-->
        <link rel="stylesheet" href="/assets/vue/v-jslib/leaflet@1.7.1/leaflet.css" />

        <!--
        <script type="module" src="/assets/vue/v-jslib/leaflet@1.7.1/leaflet-src.esm.js"></script>
        <script type="module" src="/assets/vue/v-jslib/vue2-leaflet@2.5.2/vue2-leaflet.min.js"></script>
        -->

        <script src="//unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
        <script src="//unpkg.com/vue2-leaflet@2.5.2/dist/vue2-leaflet.min.js"></script>


        <!-- Vue Pages and Components here -->
        <script type="module" src="/assets/vue/v-services/group-rest.js"></script>
        <script type="module" src="/assets/vue/v-services/categories-rest.js"></script>

        <!-- require vue@2.6.11 lodash@4.17.19 axios@0.19.2 -->
        <script type="module">
            import * as groupService from '/assets/vue/v-services/group-rest.js';
            import * as categoriesService from '/assets/vue/v-services/categories-rest.js';
            import * as toastService from '/assets/vue/v-services/toast.js';
            
            import { mapFields } from "/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js";
            import { store } from '/assets/vue/v-store/group-store.js';

            //Moment.js
            moment.locale('it');

            var app = new Vue({
                el: '#v-group-app',
                name: 'Group',
                components: {
                    'v-modal': VModal,
                    //Leaflet
                    'l-map': window.Vue2Leaflet.LMap,
                    'l-tile-layer': window.Vue2Leaflet.LTileLayer,
                    'l-marker': window.Vue2Leaflet.LMarker,
                    'l-tooltip': window.Vue2Leaflet.LTooltip,
                },
                store,
                data: {
                    attribution:
                        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    showMap: false,
                    groupId: ${groupId},
                },
                computed: {
                    //all needed data fields from vuex store
                    //mapped with vuex-map-fields
                    ...mapFields([
                        'group.groupItem',
                        'error',
                        'success',
                        'debug',
                        'loading',
                    ]),
                    center: function () { 
                        return L.latLng(this.groupItem.deliveryAddress.lat, this.groupItem.deliveryAddress.lon)
                    },
                    markerLatLng: function() {
                        return this.center
                    },
                    isDebug: function () {
                        return this.debug
                    },
                },
                mounted() {
                    this.debug = ${isDebug};
                    //will execute at pageload
                    if(this.groupId>0)
                        this.fetchGroup();
                },
                watch: {
                    error: function (message) {
                        toastService.alertDanger(message)
                    },
                    success: function (message) {
                        toastService.alertSuccess(message)
                    },
                    groupItem: function(newGroupItem, oldGroupItem) {
                        if(this.isDebug)
                            console.log('groupItem',newGroupItem, oldGroupItem)
                        if(oldGroupItem == null)
                            this.showMap = true
                    }
                },
                methods: {
                    ...Vuex.mapActions([
                        'fetchGroupAction',
                        'subscriptionAction',
                    ]),
                    async fetchGroup() {
                        await this.fetchGroupAction({service: groupService, groupId: this.groupId});
                    },
                    async subscribe() {
                        console.log("Subscribe to " + this.groupId);
                        this.subscriptionAction({service: groupService, groupId: this.groupId, subscribe: true, mode: 'single'})
                    },
                    async unsubscribe() {
                        console.log("Unsubscribe from " + this.groupId);
                        this.subscriptionAction({service: groupService, groupId: this.groupId, subscribe: false, mode: 'single'})
                    },
                    timeFromNow(date) {
                        return moment(date).fromNow();
                    },
                },
            })        
        </script>

    </body>
</html>