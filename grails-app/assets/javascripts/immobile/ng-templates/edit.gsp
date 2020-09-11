	<gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
	
	<gas-collapse>
		<a ng-click="collapseCtrl.toggleCollapsed()" class="btn btn-xs" popover="Debug info" popover-trigger="mouseenter" popover-placement="right">
			Debug <i class="caret"></i>
		</a>
		<pre collapse="collapseCtrl.isCollapsed()">
			{{editCtrl.item | json}}
			form.$invalid: {{fattura.$invalid}}
		</pre>
	</gas-collapse>

<div class="top-title clearfix">
	<h1 class="pull-left">Modifica fattura</h1>
	<div class="buttons" role="group">
		<a role="button" class="btn btn-sm btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
		<a role="button" class="btn btn-sm btn-default" data-ng-click="editCtrl.delete(item)"><i class="glyphicon glyphicon-trash"></i> Elimina</a>
		<a role="button" class="btn btn-sm btn-success" data-ng-click="editCtrl.update(item)" data-ng-disabled="fattura.$invalid"><i class="glyphicon glyphicon-ok"></i> Aggiorna</a>
	</div>
</div>

<div class="invoice">
<form name="fattura" role="form">
<div class="row">
<div class="col-sm-5">
	<div class="form-group" data-gas-typeahead ng-model="editCtrl.item.anagrafica" field="denominazione">
		<label for="client">Cliente</label>
		<a data-gas-modal template-url="/cliente/ng-templates/create-cliente.gsp" class="btn-default btn-xs pull-right"><i class="glyphicon glyphicon-plus"></i> Nuovo cliente</a>
		
		<input id="anagrafica" name="anagrafica.id" ng-model="editCtrl.item.anagrafica.id" type="hidden">
		<p class="input-group">
			<input type="text" ng-model="asyncSelected" placeholder="Seleziona cliente" typeahead="item.denominazione for item in query($viewValue)" typeahead-loading="loading" typeahead-on-select="onSelect($item, $model, $label)" class="form-control">
			<span class="input-group-btn">
				<button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-chevron-down"></i></button>
			</span>
		</p>
		<i ng-show="loading" class="glyphicon glyphicon-refresh"></i>
	</div>
	<div class="invoice-to form-group" data-gas-item-load item-id="{{selctedItem.id || editCtrl.item.anagrafica.id}}" item="anagrafica" resource="cliente">
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
		<label for="number">N. Fattura</label>
		<input type="number" class="form-control" name="numero" id="numero" ng-model="editCtrl.item.numero" placeholder="Automatico">
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="date">Data</label>
		<p class="input-group" data-gas-date-picker>
			<input type="text" name="data" class="form-control" datepicker-popup ng-model="editCtrl.item.data" is-open="opened" datepicker-options="dateOptions" ng-required="true" close-text="Chiudi" current-text="Oggi" clear-text="Svuota"/>
			<span class="input-group-btn">
				<button type="button" class="btn btn-default" ng-click="toggle($event)"><i class="glyphicon glyphicon-calendar"></i></button>
			</span>
		</p>
		
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="payment-term">Pagamento</label>
		<select class="form-control"id="payment-term" ng-required="true">
			<option>Rimessa diretta</option>
			<option>Pagamento a 30 gg.</option>
			<option>Pagamento a 30 gg. fine mese</option>
	   </select>
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="due-date">Data di scadenza</label>
		<!-- input type="date" class="form-control" id="due-date" placeholder="25/01/2015" -->
		<p class="input-group" data-gas-date-picker>
			<input type="text" name="scadenza" class="form-control" datepicker-popup ng-model="editCtrl.item.scadenza" is-open="opened" starting-day="1" ng-required="true" close-text="Chiudi" current-text="Oggi" clear-text="Svuota" show-button-bar="true"/>
			<span class="input-group-btn">
				<button type="button" class="btn btn-default" ng-click="toggle($event)"><i class="glyphicon glyphicon-calendar"></i></button>
			</span>
		</p>
	  </div>
	</div>

</div>
</div>
<hr>
<div class="row">
	<div class="col-sm-12">
	  <div class="form-group">
		<input type="text" name="oggetto" ng-model="editCtrl.item.oggetto" class="form-control" placeholder="Oggetto">
	  </div>
	</div>
</div>

<table class="table elenco"><tr><th>Articolo</th><th class="col-sm-3">Descrizione</th><th class="col-sm-1 text-center">Quantità</th><th class="text-center">Importo unitario</th><th class="col-sm-1">IVA</th><th class="text-center">Ritenuta</th><th class="text-right">Totale</th><th class="td-button"></th></tr>
	
	<tr ng-repeat="voce in editCtrl.item.voci">
		<td>
		<select class="form-control">
			<option>Rimessa diretta</option>
			<option>Pagamento a 30 gg.</option>
			<option>Pagamento a 30 gg. fine mese</option>
		</select>
        </td>
		<td><input type="text" class="form-control" ng-model="voce.descrizione"></td>
		<td><input type="number" class="form-control text-right" placeholder="1" ng-model="voce.quantita"></td>
		<td><input type="text" class="form-control" ng-model="voce.importoUnitario"></td>
		<td>
        <select class="form-control text-right">
            <option>22%</option>
            <option>10%</option>
            <option>4%</option>
            <option>0%</option>
        </select>
   		</td>
		<td class="text-center middle"><input type="checkbox"></td>
		<td class="text-right text-nowrap"><p class="form-control-static"><strong>{{voce.totale | currency}}</strong></p></td>
		<td>
			<button class="btn btn-default btn-sm" type="button" ng-if="!$first" data-gas-delete-row items="editCtrl.item.voci" item="voce"><i class="glyphicon glyphicon-remove"></i></button>
		</td>
	</tr>
	
	<tr>
		<td colspan="8" class="text-right">
			<a class="btn btn-xs" data-gas-add-new-row items="editCtrl.item.voci" defaults="['posizione':+1,'quantita':1]"><i class="glyphicon glyphicon-plus"></i> Aggiungi riga</a>
		</td>
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
<div class="clearfix"></div>
<hr>

<div data-gas-collapse>
	<a ng-click="collapseCtrl.toggleCollapsed()" class="btn btn-xs" popover="Note, Annotazioni, Classificazione" popover-trigger="mouseenter" popover-placement="right">Avanzate <i class="caret"></i>
	</a>

	<div collapse="collapseCtrl.isCollapsed()">
	<div class="row form-group" style="margin-top:20px">
		<div class="col-sm-2"><label>Note aggiuntive</label></div>
		<div class="col-sm-10">
			<text-angular ta-toolbar="[['bold', 'italics', 'underline', 'strikeThrough', 'redo', 'undo', 'clear']]" ng-model="editCtrl.item.note "></text-angular>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2"><label>Annotazioni</label></div>
		<div class="col-sm-10">
		<input type="text" placeholder="Visibili solo a te" class="form-control">
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2"><label>Classificazione</label></div>
		<div class="col-sm-4">
		<select class="form-control">
			<option>Rimessa diretta</option>
			<option>Pagamento a 30 gg.</option>
			<option>Pagamento a 30 gg. fine mese</option>
		</select>
		</div>
	</div>
	</div>
</form>
</div>






