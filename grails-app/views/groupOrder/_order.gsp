<section class="sptb">
    <div class="container" id="v-order-edit-app" v-cloak>
        <v-modal ref="registerLoginModal"></v-modal>
        
        <div v-if="orderItem" class="row">

            <div class="col-xl-9 col-lg-8 col-md-12">

                <div class="card mb-0">
                    <div class="card-header"> 
                        <h3 class="card-title">#ORDINE-{{ orderItem.id }}</h3> 
                        <div class="card-options">
                            <button type="button" class="btn btn-sm btn-info mr-2" onclick="javascript:window.print();"><i class="icon icon-printer"></i> Stampa</button> 
                        </div>
                    </div>
                    <div class="card-body">
                        
                        <div class="row "> 
                            <div v-if="orderItem.supplier" class="col-lg-6 "> 
                                <p class="h3">{{ orderItem.supplier.name }}</p>
                                <p>{{ orderItem.supplier.description }}</p>
                                <address v-if="orderItem.supplier.contactInfo"> {{ orderItem.supplier.contactInfo.email }} <br> {{ orderItem.supplier.contactInfo.phone }}<br> {{ orderItem.supplier.contactInfo.mobile }}</address> 
                            </div>
                                
                            <div v-if="orderItem.group" class="col-lg-6 text-right"> 
                                <p>Consegna in:</p>
                                <address v-if="orderItem.group.deliveryAddress"><a target="_blank" :href="'https://www.openstreetmap.org?mlat='+orderItem.group.deliveryAddress.lat+'&mlon='+orderItem.group.deliveryAddress.lon+'#map=17/'+orderItem.group.deliveryAddress.lat+'/'+orderItem.group.deliveryAddress.lon"> {{ orderItem.group.deliveryAddress.address1 }} <br>{{ orderItem.group.deliveryAddress.postalCode }}, {{ orderItem.group.deliveryAddress.city }}</a></address>
                            </div>
                        </div>

                        <div class=" text-dark"> 
                            <p class="mb-1 mt-5"><span class="font-weight-semibold">Data :</span> {{ orderItem.orderDate }} </p>
                            <p><span class="font-weight-semibold">Data consegna :</span> 15th July 2021</p>
                        </div>

                        <div v-if="orderItem.voices" class="table-responsive push"> 
                        ${isSupplier}
                            <table class="table table-bordered table-hover text-nowrap">
                                <tbody>
                                    <tr>
                                        <g:if test="${isSupplier != true}">
                                            <th class="text-center "></th>
                                        </g:if>
                                        <th>Descrizione</th>
                                        <th class="text-center">Quantità</th>
                                        <g:if test="${isSupplier != true}">
                                            <th class="text-right"></th>
                                        </g:if>
                                        
                                    </tr>
                                    
                                    <tr v-for="(v, i) in orderItem.voices">
                                        <g:if test="${isSupplier != true}">
                                            <td class="text-center">
                                                <span v-if="v.user" class="avatar avatar-md brround cover-image mr-3 h-100">
                                                    {{ initial(v.user.username) }}
                                                </span>
                                            </td>
                                        </g:if>
                                        <td>
                                            <div v-if="!isEditVoice(i)" class="text-muted">{{ v.description }} </div>
                                            <input v-else type="text" v-model="editVoice.description" class="form-control text-center h-5" placeholder="Descrizione voce">
                                        </td>
                                        <td class="text-center">
                                            <span v-if="!isEditVoice(i)">{{ v.quantityRequested }}</span>
                                            <input v-else type="number" min="1" v-model="editVoice.quantityRequested" class="form-control text-center h-5" placeholder="1">
                                        </td>
                                        <g:if test="${isSupplier != true}">
                                            <td class="text-right"> 
                                                <a v-if="v.isOwner && !isEditVoice(i)" @click="deleteVoice(v.id, i)" class="btn btn-danger btn-sm text-white" title="Elimina"><i class="fa fa-trash-o"></i></a>
                                                <a v-if="v.isOwner && !isEditVoice(i)" @click="editVoiceNum(i)" class="btn btn-info btn-sm text-white" title="Modifica"><i class="fa fa-pencil"></i></a>
                                                
                                                <a v-if="v.isOwner && isEditVoice(i)" @click="resetEditVoice()" class="btn btn-secondary btn-sm text-white" title="Annulla"><i class="fa fa-times"></i></a>
                                                <a v-if="v.isOwner && isEditVoice(i)" @click="updateVoice(v.id, i)" class="btn btn-primary btn-sm text-white" title="Salva"><i class="fa fa-check"></i></a>  
                                            </td>
                                        </g:if>
                                    </tr>
                                    <g:if test="${isSupplier != true}">
                                        <tr v-if="addVoice">
                                            <td class="text-center"></td>
                                            <td>
                                                <input type="text" v-model="editVoice.description" class="form-control text-center h-5" placeholder="Descrizione voce">
                                            </td>
                                            <td class="text-center">
                                                <input type="number" min="1" v-model="editVoice.quantityRequested" class="form-control text-center h-5" placeholder="1">
                                            </td>
                                            <td class="text-right">
                                                <a @click="addVoice = !addVoice" class="btn btn-secondary btn-sm text-white" title="Annulla"><i class="fa fa-times"></i></a>
                                                <a @click="saveVoice()" class="btn btn-primary btn-sm text-white" title="Salva"><i class="fa fa-check"></i></a>  
                                            </td>
                                        </tr>
                                    </g:if>

                                    <g:if test="${isSupplier != true}">
                                        <tr>
                                            <td colspan="4" class="text-right"> 
                                                <button :disabled="addVoice" @click="addVoice = !addVoice" type="button" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i> Aggiungi</button>                                                     
                                            </td>
                                        </tr>
                                    </g:if>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

            </div>

            <div class="col-xl-3 col-lg-4 col-md-12 no-print">

                <div class="card"> 
                    <div class="card-body"> 
                        
                        <div class="row group-actions">
                            <div class="col-md-12 form-group" >
                                <g:if test="${isSupplier == true}">
                                    <button type="button" class="btn btn-success btn-block btn-lg" v-on:click=""> <i class="fa fa-handshake-o"></i> Accetta ordine </button>
                                    <button type="button" class="btn btn-danger btn-block btn-lg" v-on:click=""> <i class="fa fa-times-circle"></i> Rifiuta ordine </button>
                                    <button type="button" class="btn btn-secondary btn-block btn-lg" v-on:click=""> <i class="fa fa-pencil"></i> Modifica ordine </button>
                                </g:if>
                                <g:else>
                                    <button  type="button" class="btn btn-primary btn-block btn-lg" v-on:click="">  <i class="fa fa-envelope-o"></i> Invia &nbsp;</button>
                                    <button type="button" class="btn btn-secondary btn-block btn-lg" v-on:click=""> <i class="fa fa-times-circle"></i> Annulla </button>
                                </g:else>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</section>