<div class="tab-pane active">

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

            <div class="form-group">
                <label class="form-label text-dark">Categoria</label>
                <v-select 
                    :clearable="false" 
                    placeholder="Scegli la categoria per il gruppo" 
                    label="name" 
                    :options="groupCategories" 
                    v-model="groupItem.category">
                    <template #open-indicator>
                        <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                    </template>
                </v-select>

                <!-- alerts -->
                <div v-if="!$v.groupItem.category.id.minValue && $v.groupItem.$anyDirty || $v.groupItem.category.id.$error" class="alert alert-danger" role="alert">
                    Scegli una categoria per il gruppo.
                </div>

                <pre v-if="isDebug">{{ $v.groupItem.category.id }}</pre>
            </div>

        </div>

        <div class="col-sm-6 col-md-6">
            <div class="form-group">
                <label class="form-label text-dark">Descrizione</label>
                <textarea rows="4" class="form-control" placeholder="Inserisci qui la descrizione del tuo gruppo"
                    @input="$v.groupItem.description.$touch()"
                    v-model="groupItem.description" ></textarea>
                <!-- alerts -->
                <div v-if="!$v.groupItem.description.required && $v.groupItem.$anyDirty || $v.groupItem.description.$error" class="alert alert-danger" role="alert">
                    Inseirisci una descrizione per il gruppo (almento {{ $v.groupItem.description.$params.minLength.min }} caratteri).
                </div>

                <pre v-if="isDebug">{{ $v.groupItem.description }}</pre>
            </div>
        </div>

    </div>
    <div class="row">

        <div class="col-sm-6 col-md-6">
            <div class="form-group ">
                <div class="row no-gutters">
                    <div class="col-md-2">
                        <label class="form-label text-dark">Visibilità:</label>
                    </div>
                    <div class="col-md-10">
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

        <div class="col-sm-6 col-md-6">
            <div class="form-group">
                <button 
                    type="button" 
                    title="Visualizza indirizzo" 
                    class="btn btn-outline-primary"
                    v-on:click="fetchCoordinates"
                    :disabled="$v.groupItem.deliveryAddress.address1.$invalid && $v.groupItem.deliveryAddress.city.$invalid"
                    >
                    Visualizza indirizzo
                </button>
            </div>
        </div>

    </div>
    <div class="row"> 

        <div class="col-sm-6 col-md-6" v-if="groupItem.deliveryAddress">

            <div class="form-group">
                <label class="form-label text-dark">Indirizzo di consegna 
                    <span v-if="geolocationSupported" @click="fetchAddress" title="Usa la mia posizione">
                        <i v-if="!locationLoading" class="fa fa-map-marker location-gps mr-1"></i>
                        <i v-if="locationLoading" class="fa fa-spinner fa-spin location-gps mr-1"></i>
                    </span> 
                </label>
                <input type="text" class="form-control" placeholder="Indirizzo di consegna per il gruppo"
                    @input="$v.groupItem.deliveryAddress.address1.$touch()"
                    v-model="groupItem.deliveryAddress.address1">
                <input type="text" class="form-control" placeholder="Informazioni aggiuntive indirizzo"
                    @input="$v.groupItem.deliveryAddress.address2.$touch()"
                    v-model="groupItem.deliveryAddress.address2">
                <!-- alerts -->
                <div v-if="!$v.groupItem.deliveryAddress.address1.minLength || !$v.groupItem.deliveryAddress.address1.required && $v.groupItem.$anyDirty" class="alert alert-danger" role="alert">
                    Inseirisci un indirizzo valido per il gruppo.
                </div>
                <div v-if="!$v.groupItem.deliveryAddress.address2.minLength" class="alert alert-danger" role="alert">
                    Inseirisci almento {{ $v.groupItem.deliveryAddress.address2.$params.minLength.min }} caratteri.
                </div>

                <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.address1 }}</pre>
            </div>
            <div class="row no-gutters">

                <div class="col-sm-12 col-md-12">
                    <div class="form-group">
                        <label class="form-label text-dark">Citt&agrave;</label>
                        <input type="text" class="form-control" placeholder="Citt&agrave;"
                            @input="$v.groupItem.deliveryAddress.city.$touch()"
                            v-model="groupItem.deliveryAddress.city"
                            >
                        <!-- alerts -->
                        <div v-if="!$v.groupItem.deliveryAddress.city.minLength || !$v.groupItem.deliveryAddress.city.required && $v.groupItem.$anyDirty || $v.groupItem.deliveryAddress.city.$error" class="alert alert-danger" role="alert">
                            Inseirisci la città (almento {{ $v.groupItem.deliveryAddress.city.$params.minLength.min }} caratteri).
                        </div>

                        <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.city }}</pre>
                    </div>
                </div>

                

            </div>
            <div class="row no-gutters">

                <div class="col-sm-6 col-md-6">
                    <div class="form-group">
                        <label class="form-label text-dark">Codice postale</label>
                        <input type="number" class="form-control" placeholder="CAP"
                            @input="$v.groupItem.deliveryAddress.postalCode.$touch()"
                            v-model="groupItem.deliveryAddress.postalCode">
                        <!-- alerts -->
                        <div v-if="(!$v.groupItem.deliveryAddress.postalCode.required || !$v.groupItem.deliveryAddress.postalCode.minLength || !$v.groupItem.deliveryAddress.postalCode.maxLength) && $v.groupItem.deliveryAddress.postalCode.$error" class="alert alert-danger" role="alert">
                            Inseirisci il CAP corretto ({{ $v.groupItem.deliveryAddress.postalCode.$params.minLength.min }} cifre).
                        </div>

                        <pre v-if="isDebug">{{ $v.groupItem.deliveryAddress.postalCode }}</pre>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6">
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

            </div>

        </div><!-- /col -->

        <div class="col-sm-6 col-md-6" v-if="showMap">
            <div class="form-group">
                <l-map
                    v-if="showMap"
                    :zoom="16"
                    :center="center"
                    :options="{ zoomSnap: 0.5 }"
                    style="height: 300px"
                    >
                        <l-marker :lat-lng="markerLatLng"></l-marker>
                        <l-tile-layer
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                        :attribution="attribution"
                        />
                </l-map>
            </div>
        </div>

    </div>
    
    <div class="row group-social" v-if="groupItem">

        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-facebook tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.facebook" class="form-control" placeholder="Facebook page id" type="text">
            </div>
        </div>
        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-twitter tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.twitter" class="form-control" placeholder="Twitter name" type="text">
            </div>
        </div>
        <div class="col-md-12 col-lg-4 form-group">
            <div class="row">
                <div class="col-md-10 col-lg-8">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fa fa-youtube tx-16 lh-0 op-6"></i>
                            </div>
                        </div>
                        <input v-model="youtube" class="form-control" placeholder="YouTube id" type="text">
                    </div>
                </div>
                <div class="col-md-2 col-lg-4">
                    <label class="custom-switch">
                        <input type="radio" name="youtube-url" value="channel" v-model="socialYouTubeUrlPrefix" class="custom-switch-input">
                        <span class="custom-switch-indicator"></span>
                        <span class="custom-switch-description">Channel</span>
                    </label>
                    <label class="custom-switch">
                        <input type="radio" checked name="youtube-url" value="c" v-model="socialYouTubeUrlPrefix" class="custom-switch-input">
                        <span class="custom-switch-indicator"></span>
                        <span class="custom-switch-description">Custom</span>
                    </label>
                </div>
            </div>   
        </div>

        <div class="col-md-12 col-lg-4 form-group">
            <div class="row">
                <div class="col-md-10 col-lg-8">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fa fa-linkedin tx-16 lh-0 op-6"></i>
                            </div>
                        </div>
                        <input v-model="linkedin" class="form-control" placeholder="LinkedIn id" type="text">
                    </div>
                </div>
                <div class="col-md-2 col-lg-4">
                    <label class="custom-switch">
                        <input type="radio" name="linkedin-url" value="company" v-model="socialLinkedInUrlPrefix" class="custom-switch-input">
                        <span class="custom-switch-indicator"></span>
                        <span class="custom-switch-description">Company</span>
                    </label>
                    <label class="custom-switch">
                        <input type="radio" checked name="linkedin-url" value="in" v-model="socialLinkedInUrlPrefix" class="custom-switch-input">
                        <span class="custom-switch-indicator"></span>
                        <span class="custom-switch-description">User</span>
                    </label>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-instagram tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.instagram" class="form-control" placeholder="Instagram name" type="text">
            </div>
        </div>
        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-whatsapp tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.whatsapp" class="form-control" placeholder="Whatsapp group id" type="text">
            </div>
        </div>

        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-skype tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.skype" class="form-control" placeholder="Skype group id" type="text">
            </div>
        </div>
        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-slack tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.slack" class="form-control" placeholder="Slack team id" type="text">
            </div>
        </div>
        <div class="col-md-6 col-lg-4 form-group">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <i class="fa fa-snapchat-ghost tx-16 lh-0 op-6"></i>
                    </div>
                </div>
                <input v-model="groupItem.snapchat"  class="form-control" placeholder="Snapchat username" type="text">
            </div>
        </div>

        <!-- div class="col-md-12">
            <div class="form-group">
                <label class="form-label text-dark">Carica immagine</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="example-file-input-custom">
                    <label class="custom-file-label">Scegli file</label>
                </div>
            </div>
        </div -->

        <div class="col-md-12">
            <div class="form-group">
                <button type="submit" :disabled="$v.$invalid" :title="$v.$invalid?'Compilare tutti campi obbligatori per inviare i dati':''" class="btn btn-primary" @click.once="saveGroup()" :key="saveButtonKey">Salva gruppo</button> <!-- @click.once -->
                <a href="${createLink(controller: 'groupBuy', action: 'group', id: groupId)}" class="btn btn-secondary">Annulla</a>
                <pre v-if="isDebug">{{ $v }}</pre>
            </div>
        </div>

        
    </div>
</div>