	
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
			<h1 dropdown-toggle>Articoli</h1>
	</div>
	
	<div class="filtro">
		<div class="pull-left">
			<gas-search></gas-search>
		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-right">
			<i class="glyphicon glyphicon-export"></i>
		</div>
	</div>

<table class="table table-hover elenco" data-gas-infinite-scroll ng-model="listCtrl.list">
	<tr>
		<th data-gas-sortable="descrizione">Descrizione</th>
		<th data-gas-sortable="prezzoUnitario">Prezzo unitario</th>
		<th data-gas-sortable="unita">Unità</th>
		<th data-gas-sortable="aliquota">Aliquota</th>
		<th data-gas-sortable="applicaCassa" class="text-right">Cassa</th>
		<th data-gas-sortable="applicaRitenuta" class="text-right">Ritenuta</th>
		<th></th>
	</tr>
	<tr ng-repeat="item in listCtrl.list" gas-inline-edit="item" on-save="listCtrl.update(item)" on-cancel="listCtrl.cancel(item)">
		
	</tr>
	
</table>

		<!--
		<td data-ng-click="show(item)">{{item.descrizione}}</td>
		<td data-ng-click="show(item)">{{item.prezzoUnitario || '-'}}</td>
		<td data-ng-click="show(item)">{{item.unita || '-'}}</td>
		<td data-ng-click="show(item)">{{item.aliquota}}</td>
		<td data-ng-click="show(item)"><i class="fa fa-check" ng-if="item.applicaCassa"></i></td>
		<td data-ng-click="show(item)"><i class="fa fa-check" ng-if="item.applicaRitenuta"></i></td>
		<td class="text-right">
			<div class="btn-group" dropdown>
				<button type="button" class="btn btn-default btn-sm" dropdown-toggle>
					<span class="caret"></span>
					<span class="sr-only">Articolo {{item.descrizione}}</span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a data-ng-href="#/edit/{{item.id}}">Modifica</a></li>
					<li><a data-ng-click="delete(item.id}">Elimina</a></li>
				</ul>
			</div>
		</td>
		-->