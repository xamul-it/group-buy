<div class="mainbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" ng-click="CollapseGroupCtrl.toggleOpen()">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img alt="Fattura Sprint" src="/img/logo.png"></a>
        </div>
        <div class="navbar-collapse collapse main-nav" collapse="!isOpen">
            <ul class="nav navbar-nav">
                <li><a href="/groupby/myorders"><i class="glyphicon glyphicon-home"></i> Ordini</a></li>
                <li class="active"><a href="/groupby/mygroups"><i class="fa fa-money fa-lg"></i> Gruppi</a></li>
                <li><a href="/groupbuy/mysuppliers"><i class="fa fa-shopping-cart fa-lg"></i> Negozi</a></li>
            </ul>
            <ng-include src="'/navigation/customer'"></ng-include>
        </div><!--/.navbar-collapse -->
    </div>
</div>
