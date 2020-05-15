<multiple-collapse>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		
		<collapse-group collapse-group-name="mnav">
		<div class="mainbar">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" ng-click="CollapseGroupCtrl.toggleOpen()">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar">&nbsp;</span>
						<span class="icon-bar">&nbsp;</span>
						<span class="icon-bar">&nbsp;</span>
					</button>
					<a class="navbar-brand" href="#"><img alt="Fattura Sprint" src="/assets/img/logo"/>&nbsp;</a>
				</div>
				<div class="navbar-collapse collapse main-nav" collapse="!isOpen">
					<ul class="nav navbar-nav">
						<li <g:if test="${params.menu=='orders'}">class="active"</g:if>><a href="/groupBuy/orders"><i class="fa fa-shopping-cart fa-lg"></i> Ordini</a></li>
						<li <g:if test="${params.menu=='groups'}">class="active"</g:if>><a href="/groupBuy/groups"><i class="fa fa-group fa-lg"></i> Gruppi</a></li>
						<li <g:if test="${params.menu=='suppliers'}">class="active"</g:if>><a href="/groupBuy/suppliers"><i class="fa fa-building fa-lg"></i> Negozi</a></li>
					</ul>
					<ng-include src="'/navigation/customer'">&nbsp;</ng-include>
				</div><!--/.navbar-collapse -->
			</div>
		</div>
		<g:render template="menu${params.menu}"/>
		</div>
		</collapse-group>
	</div><!--/.navbar -->
	<collapse-group collapse-group-name="help">
		<ng-include src="'/assets/ng-templates/navigation-help.html'">&nbsp;</ng-include>
	</collapse-group>
</multiple-collapse>
