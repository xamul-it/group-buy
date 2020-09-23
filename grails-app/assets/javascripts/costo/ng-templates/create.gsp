<h1>Nuovo acquisto
	<div class="pull-right" role="group">
		<a role="button" class="btn btn-default"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
		<a role="button" class="btn btn-default"><i class="glyphicon glyphicon-trash"></i> Elimina</a>
		<a role="button" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i> Salva</a>
	</div>
</h1>


<div class="row margin-vertical">
<div class="col-sm-6">
      <div class="panel panel-default">
        <div class="panel-body">

          <h4>Carica la fattura di acquisto dal tuo computer</h4>
          <small>Formati accettati: PDF, JPG, PNG</small><br><br>

          <form action="" method="post" enctype="multipart/form-data" id="js-upload-form">
            <div class="form-inline">
              <div class="form-group">
                <input type="file" name="files[]" id="js-upload-files" multiple>
              </div>
              <button type="submit" class="btn btn-sm btn-primary" id="js-upload-submit">Carica</button>
            </div>
          </form>

          <h4>Oppure trascina i file qui sotto</h4>
          <div class="upload-drop-zone" id="drop-zone">
            Trascina qui dentro i tuoi file
          </div>

          <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
              <span class="sr-only">60% Complete</span>
            </div>
          </div>

          <div class="js-upload-finished">
            <h3>File caricati</h3>
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-01.jpg</a>
              <a href="#" class="list-group-item list-group-item-success"><span class="badge alert-success pull-right">Success</span>image-02.jpg</a>
            </div>
          </div>
        </div>
      </div>
</div>
<div class="col-sm-6">
<form role="form">
<div class="row">
<div class="col-sm-5">
	<div class="form-group">
	<label for="client">Fornitore</label> <a href="#" class="btn-default btn-xs pull-right"><i class="glyphicon glyphicon-plus"></i> Nuovo fornitore</a>
	<select class="form-control">
		<option>Denominazione</option>
		<option>Giuseppe Verdi S.p.A.</option>
		<option>Bubeefy</option>
	</select>
  </div>
  
  <div class="invoice-to form-group">
  
	<strong class="client-name">Giuseppe Verdi S.p.A.</strong><br>
	Via della Majella 4<br>
	20131 Milano MI
	<div class="more">
		<small>PI</small> 12345678901<br>
		<!-- small>CF</small> MTRTRTRTRTR<br> -->
	</div>

  </div>
</div>
<div class="col-sm-7">
	<div class="col-sm-6">
	  <div class="form-group">
		<label for="number">N. Fattura</label>
		<input type="text" class="form-control" id="number" placeholder="Automatico" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
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

<table class="table elenco"><tr><th class="col-sm-3">Descrizione</th><th class="col-sm-1 text-center">Quantità</th><th class="text-center">Importo unitario</th><th class="col-sm-1">IVA</th><th class="text-center">Ritenuta</th><th class="text-right">Totale</th><th class="td-button"></th></tr>
	<tr>
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

</form>
<div class="clearfix"></div>
</div>
</div>
<div class="clearfix"></div>



	</body>
</html>
