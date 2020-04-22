<gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
<div class="top-title clearfix">
	<h1 class="pull-left">Nuova fattura</h1>
		<div class="buttons" role="group">
			<a role="button" class="btn btn-default btn-sm" data-ng-href="#list" ><i class="glyphicon glyphicon-remove"></i> Annulla</a>
			<a role="button" class="btn btn-default btn-sm" data-ng-click="delete(item)"><i class="glyphicon glyphicon-trash"></i> Elimina</a>
			<button type="submit" class="btn btn-sm btn-success" data-ng-disabled="form.$invalid"><i class="glyphicon glyphicon-ok"></i> Salva</a></button>	
	</div>
</div>

<div class="invoice">
<form role="form" data-ng-submit="update(item)">

<div class="row">
<div class="col-sm-5">
	<div class="form-group">
	<label for="client">Cliente</label> <a href="#" class="btn-default btn-xs pull-right"><i class="glyphicon glyphicon-plus"></i> Nuovo cliente</a>
	<select class="form-control">
		<option>Denominazione</option>
		<option>UAU Studio</option>
		<option>Bubeefy</option>
	</select>
  </div>
  
  <div class="form-group">
	<h4>UAU Studio</h4>
	Via della Majella 4<br>
	20131 Milano MI
  </div>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-5">
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="number">N. Fattura</label>
		<input type="text" class="form-control" id="number" placeholder="Automatico">
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="date">Data</label>
		<input type="date" class="form-control" id="date" placeholder="25/12/2014">
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="payment-term">Pagamento</label>
		<select class="form-control"id="payment-term">
			<option>Rimessa diretta</option>
			<option>Pagamento a 30 gg.</option>
			<option>Pagamento a 30 gg. fine mese</option>
	   </select>
	  </div>
	</div>
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="due-date">Data di scadenza</label>
		<input type="date" class="form-control" id="due-date" placeholder="25/01/2015">
	  </div>
	</div>

</div>
</div>
<hr>
<div class="row">
	<div class="col-sm-12">
	  <div class="form-group">
		<input type="text" class="form-control" placeholder="Oggetto">
	  </div>
	</div>
</div>

<table class="table elenco"><tr><th>Articolo</th><th class="col-sm-3">Descrizione</th><th class="col-sm-1 text-center">Quantità</th><th class="text-center">Importo unitario</th><th class="col-sm-1">IVA</th><th class="text-center">Ritenuta</th><th class="text-right">Totale</th><th class="td-button"></th></tr>
	<tr>
		<td>	
		<select class="form-control">
			<option>Rimessa diretta</option>
			<option>Pagamento a 30 gg.</option>
			<option>Pagamento a 30 gg. fine mese</option>
		</select>
        </td>
		<td><input type="text" class="form-control"></td>
		<td><input type="text" class="form-control text-right" placeholder="1"></td>
		<td><input type="text" class="form-control"></td>
		<td>
        <select class="form-control text-right">
            <option>22%</option>
            <option>10%</option>
            <option>4%</option>
            <option>0%</option>
        </select>
   		</td>
		<td class="text-center middle"><input type="checkbox"></td>
		<td class="text-right text-nowrap"><p class="form-control-static"><strong>€ 4.000,00</strong></p></td>
        <td><button class="btn btn-default btn-sm" type="button"><i class="glyphicon glyphicon-remove"></i></button></td>
	</tr>
    <tr><td colspan="8" class="text-right"><a href="#" class=" btn-default btn-xs"><i class="glyphicon glyphicon-plus"></i> Aggiungi riga</a>
	</td></tr>
</table>
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
</form>
<div class="clearfix"></div>
<hr>

<a href="#" class=" btn-default btn-xs">Avanzate <i class="caret"></i></a>




