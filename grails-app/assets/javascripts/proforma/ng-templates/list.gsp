	
	<gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
	
	<gas-collapse>
		<a ng-click="collapseCtrl.toggleCollapsed()" class="btn btn-xs" popover="Debug info" popover-trigger="mouseenter" popover-placement="right">
			Debug <i class="caret"></i>
		</a>
		<pre collapse="collapseCtrl.isCollapsed()">
			{{listCtrl.list | json}}
		</pre>
	</gas-collapse>
	
	<div class="top-title clearfix">
	<div dropdown class="dropdown pull-left">
			<h1 dropdown-toggle>Proforma 2014 <span class="caret"></span></h1>
			<ul class="dropdown-menu pull-right text-right" role="menu">
				<li><a href="#">2010</a></li>
				<li><a href="#">2011</a></li>
				<li><a href="#">2012</a></li>
				<li><a href="#">2013</a></li>
				<li class="divider"></li>
				<li><a href="#">2015</a></li>
			</ul>
	</div>
	
	<div class="buttons" role="group">
		<a role="button" class="btn btn-sm btn-default"><i class="glyphicon glyphicon-export"></i> Esporta</a>
		<a role="button" class="btn btn-sm btn-success" data-ng-href="#create"><i class="glyphicon glyphicon-plus"></i> Nuova proforma</a>
	</div>
</div>
	
	<div class="filtro">
		<div class="pull-left">
		<i class="glyphicon glyphicon-filter"></i>

			<gas-status-filter filter="">Tutte</gas-status-filter>
			<gas-status-filter filter="3">Fatturate</gas-status-filter>
			<gas-status-filter filter="1">Inviate</gas-status-filter>
			<gas-status-filter filter="2">Scadute <span class="badge">{{listCtrl.listData.overdues}}</span></gas-status-filter>
			<gas-status-filter filter="0">Bozze</gas-status-filter>

		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-left">
			<gas-search></gas-search>
			<!--
			<form class="navbar-form" role="search">
				<div class="form-group">
					<i class="glyphicon glyphicon-search"></i>
					<input type="text" class="form-control" placeholder="Cerca"> <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				</div>
			</form>
			-->
		</div>
		<span class="divider-vertical pull-left"></span>
		<div class="pull-right">
			<span class="total">Totale <strong>{{listCtrl.listData.total|currency}}</strong></span>
		</div>
	</div>

<table class="table table-hover elenco" data-gas-infinite-scroll ng-model="listCtrl.list">
	<tr>
		<th data-gas-sortable="status">Stato</th>
		<th data-gas-sortable="number">N.</th>
		<th data-gas-sortable="date">Data</th>
		<th data-gas-sortable="description">Descrizione</th>
		<th data-gas-sortable="total" class="text-right">Totale</th>
		<th></th>
	</tr>
	<tr ng-repeat="item in listCtrl.list | filter:statusFilterFn | orderBy:'number'">
		<td data-ng-click="show(item)">
			<gas-status-label status="{{item.status}}"></gas-status-label>
		</td>
		<td data-ng-click="show(item)">{{item.number}}</td>
		<td data-ng-click="show(item)">{{item.date | dateParse | date: 'shortDate'}}<br>
			<small>Scadenza: {{item.dueDate}}</small>
		</td>
		<td data-ng-click="show(item)">{{item.customer}}<br>
			<small>{{item.description}}</small>
		</td>
		<td class="text-right" data-ng-click="show(item)">
			<strong>{{item.total | currency}}</strong><br>
			<small>Imponibile: {{item.net | currency}}</small>
		</td>

		<td class="text-right">
			<div class="btn-group" dropdown>
				<button type="button" class="btn btn-default btn-sm" dropdown-toggle>
					<span class="caret"></span>
					<span class="sr-only">Documento {{item.number}}</span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a data-ng-href="#/show/{{item.id}}">Visualizza</a></li>
					<li><a data-ng-href="#/edit/{{item.id}}">Modifica</a></li>
					<li class="divider"></li>
					<li><a href="#">Scarica PDF</a></li>
					<li class="divider"></li>
					<li><a href="#">Duplica</a></li>
				</ul>
			</div>
		</td>
	</tr>
	<tr ng-show="!infiniteScrollCtrl.loading">
		<td colspan="6">
			<img src="/img/loading-hr.gif">
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

