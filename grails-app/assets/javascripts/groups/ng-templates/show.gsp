
<gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
	
<div class="top-title clearfix">
<h1 class="pull-left">Fattura n. {{showCtrl.item.numero}}<br>
<small>{{showCtrl.item.data | dateParse | date: 'shortDate'}} - {{showCtrl.item.anagrafica.denominazione}}</small></h1>
<div class="buttons" role="group">
		
		<div class="btn-group">
			<a role="button" class="btn btn-sm btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
		</div>
		
		<div class="btn-group" dropdown>
		  <a role="button" class="btn btn-sm btn-default" data-ng-href="#/edit/{{showCtrl.item.id}}"><i class="glyphicon glyphicon-pencil"></i> Modifica</a>
		  <button type="button" class="btn btn-sm btn-default" dropdown-toggle aria-expanded="false">
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu dropdown-sm" role="menu">
		    <li><a href="#">Copia</a></li>
		    <li class="divider"></li>
		    <li><a href="#">Elimina</a></li>
		  </ul>
		</div>
		
		<div class="btn-group">
		  <button type="button" class="btn btn-sm btn-default"><i class="fa fa-send-o"></i> Invia</button>
		</div>
		
		<div class="btn-group" dropdown>
		  <button type="button" class="btn btn-sm btn-default"><i class="fa fa-file-pdf-o"></i> PDF</button>
		  <button type="button" class="btn btn-sm btn-default" dropdown-toggle aria-expanded="false">
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu dropdown-sm" role="menu">
		    <li><a href="#">Stampa</a></li>
		    <li><a href="#">Invia</a></li>
		  </ul>
		</div>

		<div class="btn-group" dropdown>
		  <button type="button" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-euro"></i> Pagamenti</button>
		  <button type="button" class="btn btn-sm btn-success" dropdown-toggle aria-expanded="false">
		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu dropdown-sm" role="menu">
		    <li><a href="#">Nota di credito</a></li>
		  </ul>
		</div>
	</div>
</div>
	
<div class="invoice">
<form role="form">
<div class="row">
<div class="col-sm-5">
	<!-- div class="form-group">
		<strong>Cliente</strong>
	</div -->

	<div class="invoice-to form-group" data-gas-item-load item-id="{{selctedItem.id || showCtrl.item.anagrafica.id}}" item="anagrafica" resource="cliente">
		<small ng-if="anagrafica.titolo">{{anagrafica.titolo}}<br></small>
		<strong class="client-name">{{anagrafica.denominazione}}</strong><br>
		<span ng-bind-html="anagrafica.indirizzo | nl2br"></span>
		<div class="more">
			<span ng-if="anagrafica.partitaIva"><small>PI</small> {{anagrafica.partitaIva}}<br></span>
			<span ng-if="anagrafica.codiceFiscale"><small>CF</small> {{anagrafica.codiceFiscale}}</span>
		</div>
	</div>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-5">
	<div class="col-sm-6">
	  <div class="form-group">
		<strong>Fattura n.</strong>
		<span class="form-control-static">{{showCtrl.item.numero}}</span>
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="date">Data</label>
		<p class="form-control-static">{{showCtrl.item.data | dateParse | date: 'dd/MM/yyyy'}}</p>
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="payment-term">Pagamento</label>
        <p class="form-control-static">Pagamento a 30 gg. fine mese</p>
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="due-date">Data di scadenza</label>
		<p class="form-control-static">{{showCtrl.item.scadenza | dateParse | date: 'dd/MM/yyyy'}}</p>
	  </div>
	</div>

</div>
</div>
<hr>
<div class="row">
	<div class="col-sm-12">
	  <div class="form-group">
		<p class="form-control-static"><strong>Oggetto:</strong> {{showCtrl.item.oggetto}}</p>
	  </div>
	</div>
</div>

<table class="table elenco"><tr><th>Articolo</th><th class="col-sm-3">Descrizione</th><th class="col-sm-1 text-right">Quantità</th><th class="text-right">Importo unitario</th><th class="col-sm-1 text-right">IVA</th><th class="text-right">Importo IVA</th><th class="text-right">Importo netto</th></tr>
	<tr ng-repeat="voce in showCtrl.item.voci">
		<td>{{voce.articolo.descrizione}}</td>
		<td>{{voce.descrizione}}</td>
		<td class="text-right">{{voce.quantita}}</td>
		<td class="text-right">{{voce.importoUnitario | currency}}</td>
		<td class="text-right">22%</td>
		<td class="text-right">{{voce.iva | currency}}</td>
		<td class="text-right text-nowrap"><strong>€ 4.000,00</strong></td>
	</tr>
	
	<tr>
		<td>Consulenza</td>
		<td>Trapanazione del cranio</td>
		<td class="text-right">1</td>
		<td class="text-right">1.500,00 €</td>
		<td class="text-right">22%</td>
		<td class="text-right">300,00 €</td>
		<td class="text-right text-nowrap"><strong>€ 4.000,00</strong></td>
	</tr>
</table>
<div class="row">
<div class="col-md-4 pull-right">
<div class="panel panel-default">
  <div class="panel-body">
  <div class="col-xs-6"><strong>Importo</strong></div><div class="col-xs-6 text-right"><strong>212,00€</strong></div>
  <div class="col-xs-6">Ritenuta</div><div class="col-xs-6 text-right">42,40€</div>
  <div class="col-xs-6">IVA</div><div class="col-xs-6 text-right">46,64€</div>
  
  </div>
  <div class="panel-footer"><div class="col-xs-6"><h4>Da pagare</h4></div><div class="col-xs-6 text-right"><h4><strong>216,24€</strong></h4></div>
  <div class="clearfix"></div>
  </div>
</div>
</div>
</div>
</form>
<div class="clearfix"></div>
<hr>
</div>

<h3>Timeline documento</h3>
<ul class="timeline" data-gas-item-load item-id="{{showCtrl.item.id}}" item="timeline" resource="timeline">
	<li ng-repeat="event in timeline.events | orderBy:'date':reverse" >
		<div class="timeline-badge" data-ng-class="{'success': event.type == 'paid', 'warning': event.type == 'sent', 'danger': event.type == 'expired'}" ng-switch="event.type">
			<i ng-switch-when="paid" class="fa fa-check"></i>
			<i ng-switch-when="sent" class="fa fa-envelope"></i>
			<i ng-switch-when="created" class="fa fa-file"></i>
			<i ng-switch-when="expired" class="fa fa-exclamation-triangle"></i>
		</div>
		<div class="timeline-panel">
			<small class="text-muted"><i class="fa fa-time"></i>{{event.date | dateParse | date: 'shortDate'}}</small>
			<h4 class="timeline-title">{{event.description}}</h4>
			<span class="timeline-body" ng-show="event.message">
				{{event.message}}
			</span>
			<a ng-href="{{event.link}}" ng-if="event.link">Visualizza documento &raquo;</a>
		</div>
	<li>
</ul>


