<sec:ifLoggedIn>
	<ul class="nav navbar-nav user-menu pull-right" data-gas-user="" user="user" role="role">
	<li class="dropdown" dropdown>
		<a href class="dropdown-toggle" dropdown-toggle>
			{{user.fullName}}<b class="caret"></b>
		<br><small>{{user.email}}
			{{roles}}
		</small></a>
		<ul class="dropdown-menu pull-right">
			<li><a data-gas-modal="" template-url="/assets/profilo/profilo.html?id=1"><i class="glyphicon glyphicon-user"></i> Profilo</a></li>
			<li ng-if="roles.includes('ROLE_SUPPLIER')"><a href="/preferenze"><i class="glyphicon glyphicon-cog"></i> Preferenze</a></li>
			<li ng-if="roles.includes('ROLE_SUPPLIER')"><a href="/vertina"><i class="glyphicon glyphicon-cog"></i> La mia vetrina</a></li>
			<li ng-if="roles.includes('ROLE_SUPPLIER')"><a href="/listino"><i class="glyphicon glyphicon-cog"></i> Il mio listino</a></li>
			<li ng-if="roles.includes('ROLE_ADMIN')"><a href="/securityInfo/mappings"><i class="glyphicon glyphicon-lock"></i> Amministazione utenti</a></li>
			<li class="divider"></li>
			<li><a href="/logoff"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
		</ul>
	</li>
	</ul>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<ul class="nav navbar-nav user-menu pull-right">
<li class="dropdown" dropdown><b class="caret"></b>
	<g:link controller='login' action='auth'>Login</g:link>
</li>
</ul>
</sec:ifNotLoggedIn>

