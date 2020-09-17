<html>
<!-- TODO i18n -->
<head>
	<meta name="layout" content="claylist"/>
    <title>Gruppo di acquisto - membri</title>

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
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card group-head">
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
                                                    <a href="#"><i class="fa fa-star-o text-warning mr-1"></i></a> <span class="text-white">5 (XXXX Reviews)</span>
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

                    <div class="card mb-0" id="v-group-members-app">
                        <div class="card-body">
                            <div class="border-0">
                                <div class="tab-content">

                                    <div class="tab-pane userprof-tab active" id="tab-7">
                                        <div class="table-responsive border-top">

                                            <table class="table card-table table-bordered table-hover table-vcenter text-nowrap">
                                                <tbody>
                                                    <tr>
                                                        <th></th>
                                                        <th>Nome</th>
                                                        <th>Status</th>
                                                        <th>Iscritto da</th>
                                                        <th></th>
                                                    </tr>
                                                    <tr v-for="member in groupMembers">
                                                        <td class=""><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="#" class="text-dark">{{ member.username }}</a></td>
                                                        
                                                        <td><a href="#" class="badge badge-success">Active</a></td>

                                                        <td>{{ dateSimple(new Date()) }}</td>
                                                        <td>
                                                            <a href="#" class="btn btn-purple btn-sm text-white"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Jason Porter</a></td>
                                                        <td><a href="#" class="badge badge-danger">Blocked</a></td>
                                                        <td>December-01-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Teresa Wood</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-29-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Mary Butler</a></td>
                                                        <td><a href="#" class="badge badge-info">Paused</a></td>
                                                        <td>November-29-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Janice Lane</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-25-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Anthony Miller</a></td>
                                                        <td><a href="#" class="badge badge-info">Pasused</a></td>
                                                        <td>November-24-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><span class="avatar avatar-md  d-block brround cover-image" style="background: rgba(0, 0, 0, 0) url(&quot;../../assets/theme/img/faces/user-placeholder.jpg&quot;) repeat scroll center center;"></span></td>
                                                        <td><a href="userprofile.html" class="text-dark">Denise Elliott</a></td>
                                                        <td><a href="#" class="badge badge-success">Active</a></td>
                                                        <td>November-21-2018</td>
                                                        <td>
                                                            <a href="userprofile.html" class="btn btn-purple btn-sm text-white" data-toggle="tooltip" data-original-title="View"><i class="fa fa-eye"></i></a>
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

    
    <!-- Vue Pages and Components here -->
    <script type="module" src="/assets/vue/v-services/group-rest.js"></script>
    <script type="module" src="/assets/vue/v-services/toast.js"></script>

    <script type="module">
        import * as groupService from '/assets/vue/v-services/group-rest.js';
        import * as toastService from '/assets/vue/v-services/toast.js';

        moment.locale('it');

        var app = new Vue({
            el: '#v-group-members-app',
            data: {
                groupMembers: [],
                groupId: ${groupId},
                error: null,
                success: null,
                loading: false,
            },
            computed: {
                
            },
            mounted() {
                //will execute at pageload
                this.fetchGroupMembers();
            },
            methods: {
                timeFromNow(date) {
        		    return moment(date).fromNow();
                },
                dateTime(date) {
        		    return moment(date).format('D MMMM YYYY, h:mm');
                },
                dateSimple(date) {
        		    return moment(date).format('D MMMM YYYY');
                },
                async fetchGroupMembers() {
                    try {
                        this.setLoadingState();
                        let { data, headers } = await groupService.members(this.groupId);
                        this.groupMembers = data; 
                        // Reset the loading state after fetching group.
                        this.loading = false;
                    } catch (error) {
                        if(this.debug)
                            console.log("catch error", error);
                        this.setErrorState(error.message);
                    } finally {
                        if(this.debug)
                            console.log("finally data", this.$data);
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
            },
        })        
    </script>

</body>
</html>