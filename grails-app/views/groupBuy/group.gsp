<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppo di acquisto</title>
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
                        <div class="card-body pattern-1">
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
                                            <li><a href="#tab-7" data-toggle="tab" class="">Ordini<span class="badge badge-primary badge-pill">20</span></a></li>
                                            <li><a href="#tab-8" data-toggle="tab" class="">Membri<span class="badge badge-primary badge-pill">08</span></a></li>
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
                                                <li><a :href="group.owner.www" class="text-dark"><span class="font-weight-semibold">Web :</span> <span v-if="group.owner">{{ group.owner.www }}</span>
                                                <li><a :href="'mailto:'+group.owner.email" class="text-dark"><span class="font-weight-semibold">Email :</span> <span v-if="group.owner">{{ group.owner.email }}</span> </a></li>
                                                <li><a :href="group.owner.phone?'tel:'+group.owner.phone:'tel:'" class="text-dark"><span class="font-weight-semibold">Telefono :</span> <span v-if="group.owner">{{ group.owner.phone }}</span> </a></li>
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

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label text-dark">Indirizzo di consegna</label>
                                                    <input type="text" v-model="group.deliveryAddress.address1" class="form-control" placeholder="Indirizzo di consegna per il gruppo">
                                                    <input type="text" v-model="group.deliveryAddress.address2" class="form-control" placeholder="Informazioni aggiuntive indirizzo">
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-4">
                                                <div class="form-group">
                                                    <label class="form-label text-dark">Citt&agrave;</label>
                                                    <input type="text" v-model="group.deliveryAddress.city" class="form-control" placeholder="Citt&agrave;">
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-3">
                                                <div class="form-group">
                                                    <label class="form-label text-dark">Codice postale</label>
                                                    <input type="number" v-model="group.deliveryAddress.postalCode" class="form-control" placeholder="CAP">
                                                </div>
                                            </div>
                                            <div class="col-md-5">
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

                                    <div class="tab-pane userprof-tab" id="tab-7">
                                        <div class="table-responsive border-top">
                                            <table class="table table-bordered table-hover mb-0 text-nowrap">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Item</th>
                                                    <th>Category</th>
                                                    <th>Price</th>
                                                    <th>Ad Status</th>
                                                    <th >Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Camera 2d33</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Feb-21-2018 , 16:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i>sale</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Electronics</td>
                                                    <td class="font-weight-semibold fs-16">$54</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/j2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring IT Developers</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Oct-23-2018 , 9:18</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Jobs</td>
                                                    <td class="font-weight-semibold fs-16">$156</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">2Bk Delux Rooms</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 12:45</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>RealEstate</td>
                                                    <td class="font-weight-semibold fs-16">$22,765</td>
                                                    <td>
                                                        <a href="#" class="badge badge-primary">featured</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/f1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Chiness Food</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-25-2018 , 16:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Restaurant</td>
                                                    <td class="font-weight-semibold fs-16">$89</td>
                                                    <td>
                                                        <a href="#" class="badge badge-success">Active</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/l1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Lenova laptop</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Feb-21-2018 , 16:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i>used</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Electronics</td>
                                                    <td class="font-weight-semibold fs-16">$25</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h4.jpg" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">3 seater Sofa set</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i>Dec-15-2018 , 12:45 pm</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> sale</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Furniture</td>
                                                    <td class="font-weight-semibold fs-16">$22</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/j1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring Civil Engineers</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-22-2018 , 9:18</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Jobs</td>
                                                    <td class="font-weight-semibold fs-16">$14,000</td>
                                                    <td>
                                                        <a href="#" class="badge badge-primary">featured</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/f2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Spons Restaurant</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-30-2018 , 11:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Restaurant</td>
                                                    <td class="font-weight-semibold fs-16">$89</td>
                                                    <td>
                                                        <a href="#" class="badge badge-success">Active</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/v2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Race Modal Car</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Dec-03-2018 , 16:45</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> sale</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Vehicle</td>
                                                    <td class="font-weight-semibold fs-16">$35,978</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">2Bk Delux Rooms</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 12:45</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>RealEstate</td>
                                                    <td class="font-weight-semibold fs-16">$22,765</td>
                                                    <td>
                                                        <a href="#" class="badge badge-danger">Expired</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/v1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">2017 Toyota Avalon</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-03-2018 , 12:50</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Used</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Vehicle</td>
                                                    <td class="font-weight-semibold fs-16">$35,978</td>
                                                    <td>
                                                        <a href="#" class="badge badge-success">Active</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/f3.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Food Restaurant</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-20-2018 , 16:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Restaurant</td>
                                                    <td class="font-weight-semibold fs-16">$129</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/j3.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring Engineers</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Sep-22-2018 , 9:18 </a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Jobs</td>
                                                    <td class="font-weight-semibold fs-16">$235</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h3.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Villas</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Dec-21-2018 , 19:45</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>RealEstate</td>
                                                    <td class="font-weight-semibold fs-16">$765</td>
                                                    <td>
                                                        <a href="#" class="badge badge-warning">Published</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/v1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Maruthi Suzuki 2065</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-12-2018 , 16:50</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Used</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Vehicle</td>
                                                    <td class="font-weight-semibold fs-16">$35,978</td>
                                                    <td>
                                                        <a href="#" class="badge badge-primary">featured</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/f1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Chinese Food</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-25-2018 , 16:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Restaurant</td>
                                                    <td class="font-weight-semibold fs-16">$89</td>
                                                    <td>
                                                        <a href="#" class="badge badge-info">Sold</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/v1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">2017 Toyota Avalon</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-03-2018 , 12:50</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Used</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Vehicle</td>
                                                    <td class="font-weight-semibold fs-16">$35,978</td>
                                                    <td>
                                                        <a href="#" class="badge badge-info">Sold</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/h2.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">2Bk Delux Rooms</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 12:45 pm</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>RealEstate</td>
                                                    <td class="font-weight-semibold fs-16">$22,765</td>
                                                    <td>
                                                        <a href="#" class="badge badge-info">Sold</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/f1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">Food Court</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 08:54</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Restaurant</td>
                                                    <td class="font-weight-semibold fs-16">$89</td>
                                                    <td>
                                                        <a href="#" class="badge badge-primary">featured</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                            <span class="custom-control-label"></span>
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <div class="media mt-0 mb-0">
                                                            <div class="card-aside-img">
                                                                <a href="#"></a>
                                                                <img src="../../assets/images/products/j1.png" alt="img">
                                                            </div>
                                                            <div class="media-body">
                                                                <div class="card-item-desc ml-4 p-0 mt-2">
                                                                    <a href="#" class="text-dark"><h4 class="font-weight-semibold">We need Hr Recruiter</h4></a>
                                                                    <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-14-2018 , 19:18</a><br>
                                                                    <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>Jobs</td>
                                                    <td class="font-weight-semibold fs-16">$14,000</td>
                                                    <td>
                                                        <a href="#" class="badge badge-primary">featured</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                        <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                        <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                        <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane userprof-tab" id="tab-8">
                                        <div class="table-responsive border-top">
                                            <table class="table table-bordered table-hover mb-0 text-nowrap">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Item</th>
                                                        <th>Category</th>
                                                        <th>Price</th>
                                                        <th>Ad Status</th>
                                                        <th >Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/j1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring Civil Engineers</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-22-2018 , 9:18</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Jobs</td>
                                                        <td class="font-weight-semibold fs-16">$14,000</td>
                                                        <td>
                                                            <a href="#" class="badge badge-primary">featured</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/h2.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">2Bk Delux Rooms</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 12:45</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>RealEstate</td>
                                                        <td class="font-weight-semibold fs-16">$22,765</td>
                                                        <td>
                                                            <a href="#" class="badge badge-primary">featured</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/v1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Maruthi Suzuki 2065</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-12-2018 , 16:50</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Used</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Vehicle</td>
                                                        <td class="font-weight-semibold fs-16">$35,978</td>
                                                        <td>
                                                            <a href="#" class="badge badge-primary">featured</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/f1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Food Court</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-15-2019 , 08:54</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Restaurant</td>
                                                        <td class="font-weight-semibold fs-16">$89</td>
                                                        <td>
                                                            <a href="#" class="badge badge-primary">featured</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/j1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">We need Hr Recruiter</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-14-2018 , 19:18</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Jobs</td>
                                                        <td class="font-weight-semibold fs-16">$14,000</td>
                                                        <td>
                                                            <a href="#" class="badge badge-primary">featured</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane userprof-tab" id="tab-9">
                                        <div class="table-responsive border-top">
                                            <table class="table table-bordered table-hover mb-0 text-nowrap">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Item</th>
                                                        <th>Category</th>
                                                        <th>Price</th>
                                                        <th>Ad Status</th>
                                                        <th >Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/h1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Camera 2d33</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Feb-21-2018 , 16:54</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i>sale</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Electronics</td>
                                                        <td class="font-weight-semibold fs-16">$54</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/j2.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring IT Developers</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Oct-23-2018 , 9:18</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Jobs</td>
                                                        <td class="font-weight-semibold fs-16">$156</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/l1.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Lenova laptop</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Feb-21-2018 , 16:54</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i>used</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Electronics</td>
                                                        <td class="font-weight-semibold fs-16">$25</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/h4.jpg" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">3 seater Sofa set</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i>Dec-15-2018 , 12:45 pm</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> sale</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Furniture</td>
                                                        <td class="font-weight-semibold fs-16">$22</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/v2.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Race Modal Car</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Dec-03-2018 , 16:45</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> sale</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Vehicle</td>
                                                        <td class="font-weight-semibold fs-16">$35,978</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/f3.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Food Restaurant</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Nov-20-2018 , 16:54</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Restaurant</td>
                                                        <td class="font-weight-semibold fs-16">$129</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/j3.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Hiring Engineers</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Sep-22-2018 , 9:18 </a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Open</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Jobs</td>
                                                        <td class="font-weight-semibold fs-16">$235</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" name="checkbox" value="checkbox">
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <div class="media mt-0 mb-0">
                                                                <div class="card-aside-img">
                                                                    <a href="#"></a>
                                                                    <img src="../../assets/images/products/h3.png" alt="img">
                                                                </div>
                                                                <div class="media-body">
                                                                    <div class="card-item-desc ml-4 p-0 mt-2">
                                                                        <a href="#" class="text-dark"><h4 class="font-weight-semibold">Villas</h4></a>
                                                                        <a href="#"><i class="fa fa-clock-o mr-1"></i> Dec-21-2018 , 19:45</a><br>
                                                                        <a href="#"><i class="fa fa-tag mr-1"></i> Rent</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>RealEstate</td>
                                                        <td class="font-weight-semibold fs-16">$765</td>
                                                        <td>
                                                            <a href="#" class="badge badge-warning">Published</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success btn-sm text-white" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
                                                            <a class="btn btn-danger btn-sm text-white" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash-o"></i></a>
                                                            <a class="btn btn-info btn-sm text-white" data-toggle="tooltip" data-original-title="Save to Wishlist"><i class="fa fa-heart-o"></i></a>
                                                            <a class="btn btn-primary btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- /Group -->

    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.js"></script>

    <script src="https://unpkg.com/lodash@4.17.19/lodash.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios@0.19.2/dist/axios.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/locale/it.js"></script>

    <!-- Vue Pages and Components here -->
    <!-- script src="/assets/vue/v-group-buy/group.vue.js"></script -->

    <script>
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
                    this.getGroup() 

            },
            methods: {
                editItem() {
                    this.edit = true;
                },
                showItem() {
                    this.edit = false;
                },
                timeFromNow(date) {
        		    return moment(date).fromNow();
        	    },
                getGroup() {
                    let url =
                        "/group/show/"+this.groupId+".json";
                    //this.showProgress = true;
                    axios
                        .get(url)
                        .then(result => {
                            console.log("result=", result ); 
                            data = result.data;
                            this.group = data;
                            //this.showProgress = false;
                        })
                        .catch(error => {
                            console.log("error", error);
                            //this.showProgress = false;
                        }).then( () => {
                            console.log("data", this.$data);
                        });
                },
                saveGroup() {
                    axios.post('/group/save/'+this.groupId+'.json',
                        JSON.stringify(this.group)
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