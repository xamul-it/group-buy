	
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
			<h1 dropdown-toggle>Incassi 2014<span class="caret"></span></h1>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#">2010</a></li>
				<li><a href="#">2011</a></li>
				<li><a href="#">2012</a></li>
				<li><a href="#">2013</a></li>
				<li class="divider"></li>
				<li><a href="#">2015</a></li>
			</ul>
	</div>
	
	<div class="filtro">
		<div class="pull-left">
		<i class="glyphicon glyphicon-filter"></i>

			<gas-status-filter filter="">Tutti</gas-status-filter>
			<gas-status-filter filter="3">Mese corrente <span class="badge">{{listCtrl.listData.thisMoth || 0}}</span></gas-status-filter>
			<gas-status-filter filter="1">Mese scorso <span class="badge">{{listCtrl.listData.lastMoth || 0}}</span></gas-status-filter>

		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-left">
			<gas-search></gas-search>
		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-right">
			<span class="total">Totale <strong>{{listCtrl.listData.total || 0 |currency}}</strong></span>
			<i class="glyphicon glyphicon-export"></i>
		</div>
	</div>

<table class="table table-hover elenco" data-gas-infinite-scroll ng-model="listCtrl.list">
	<tr>
		<th data-gas-sortable="date">Data</th>
		<th data-gas-sortable="description">Documento</th>
		<th data-gas-sortable="total" class="text-right">Importo</th>
		<th></th>
	</tr>
	<tr ng-repeat="item in listCtrl.list | filter:statusFilterFn | orderBy:'data'">
		<td data-ng-click="show(item)">{{item.data | dateParse | date: 'shortDate'}}</td>
		<td data-ng-click="show(item)">{{item.documento}}</td>
		<td class="text-right" data-ng-click="show(item)"><strong>{{item.importo | currency}}</strong></td>

		<td class="text-right">
			<div class="btn-group" dropdown>
				<button type="button" class="btn btn-default btn-sm" dropdown-toggle>
					<span class="caret"></span>
					<span class="sr-only">Documento {{item.number}}</span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a data-ng-href="#/show/{{item.id}}">Visualizza documento</a></li>
					<li><a data-ng-href="#/edit/{{item.id}}">Elimina</a></li>
				</ul>
			</div>
		</td>
	</tr>
	
</table>

<!-- div class="pagination pagination-centered" data-gas-pagination data-total="total"></div -->

<!-- pezzi vari - - >
	<div class="dropdown">
      <a class="dropdown-toggle btn btn-danger">
        {{(dateRange.start|date: 'shortDate')||"pick start"}} - {{(dateRange.end|date: 'shortDate')||"pick end"}}
      </a>

      <div class="dropdown-menu" ng-click="$event.preventDefault();$event.stopPropagation()">
        <div date-range start="dateRange.start" end="dateRange.end"></div>
      </div>
    </div>
<!-- /pezzi vari -->

