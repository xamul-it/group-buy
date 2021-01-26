<div class="card">
    <div class="card-header">
        <h3 class="card-title">Dashboard</h3>
    </div>
    <div class="card-body text-center item-user border-bottom">
        <div class="profile-pic">
            <div class="profile-pic-img"> <span class="bg-success dots" data-toggle="tooltip"
                    data-placement="top" title="" data-original-title="online"></span> <img
                    src="../../assets/theme/img/faces/user-placeholder.jpg" class="brround" alt="user"> 
                </div>
                <div class="text-dark">
                    <h4 v-if="userItem" class="mt-3 mb-0 font-weight-semibold">{{userItem.username}}</h4>
                </div>
        </div>
    </div>

    <g:render template="/navigation/theme-user-side-nav" />

</div>