<multiple-collapse>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		
		<collapse-group collapse-group-name="mnav">
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
						<li <g:if test="${params.menu=='orders'}">class="active"</g:if>><a href="/groupBuy/orders"><i class="glyphicon glyphicon-home"></i> Ordini</a></li>
						<li <g:if test="${params.menu=='groups'}">class="active"</g:if>><a href="/groupBuy/groups"><i class="fa fa-money fa-lg"></i> Gruppi</a></li>
						<li <g:if test="${params.menu=='suppliers'}">class="active"</g:if>><a href="/groupBuy/suppliers"><i class="fa fa-shopping-cart fa-lg"></i> Negozi</a></li>
					</ul>
					<ng-include src="'/navigation/customer'"></ng-include>
				</div><!--/.navbar-collapse -->
			</div>
		</div>
		<g:render template="menu${params.menu}"/>
		</div>
		</collapse-group>
	</div><!--/.navbar -->
	<collapse-group collapse-group-name="help">
		<ng-include src="'/ng-templates/navigation-help.html'"></ng-include>
	</collapse-group>
</multiple-collapse>
