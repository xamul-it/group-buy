	
	<gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
	
	<gas-collapse>
		<a ng-click="collapseCtrl.toggleCollapsed()" class=" btn-default btn-xs" popover="Debug info" popover-trigger="mouseenter" popover-placement="right">
			Debug <i class="caret"></i>
		</a>
		<pre collapse="collapseCtrl.isCollapsed()">
			{{listCtrl.list | json}}
		</pre>
	</gas-collapse>
	
	<div dropdown class="container">
			<h1 dropdown-toggle>Clienti</h1>
	</div>
	
	<div class="filtro">
		<div class="pull-left">
			<gas-search></gas-search>
		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-right">
			<span class="total"><strong>{{listCtrl.listData.count || 0}}</strong> Clienti</span>
			<i class="glyphicon glyphicon-export"></i>
		</div>
	</div>

<table class="table table-hover elenco" data-gas-infinite-scroll ng-model="listCtrl.list">
	<tr>
		<th data-gas-sortable="date">Denominazione</th>
		<th data-gas-sortable="total">Contatti</th>
		<th data-gas-sortable="description">C.F. / P.I.</th>
		<th></th>
	</tr>
	<tr ng-repeat="item in listCtrl.list | filter:statusFilterFn">
		<td data-ng-click="show(item)"><div class="client-name">{{item.denominazione}}</div>
			{{item.indirizzo1}}<br>
			{{item.indirizzo2 || ''}} <br ng-if="item.indirizzo2">
			{{item.cap}} {{item.cap?'-':''}} {{item.comune}}
			{{item.provincia?'(':''}}{{item.provincia}}{{item.provincia?')':''}}</td>
		<td data-ng-click="show(item)">
			<a href="mailto:{{item.email}}" ng-if="item.email">{{item.email || ''}}</a> <br ng-if="item.email">
			<small ng-if="item.telefono"><i class="fa fa-phone"></i> {{item.telefono || ''}} </small><br ng-if="item.telefono">
			<small ng-if="item.cellulare"><i class="fa fa-mobile"></i> {{item.cellulare || ''}} </small><br ng-if="item.cellulare">
			<small ng-if="item.fax"><i class="fa fa-fax"></i> {{item.fax || ''}} </small>
		</td>
		<td data-ng-click="show(item)"><small ng-if="item.codiceFiscale">CF</small> {{item.codiceFiscale}}<br>
			<small ng-if="item.partitaIva">PI</small> {{item.partitaIva}}
		</td>

		<td class="text-right">
			<div class="btn-group" dropdown>
				<button type="button" class="btn btn-default btn-sm" dropdown-toggle>
					<span class="caret"></span>
					<span class="sr-only">Documento {{item.number}}</span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a data-ng-href="#/show/{{item.id}}">Modifica</a></li>
				</ul>
			</div>
		</td>
	</tr>
	
</table>
