  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Nuovo cliente</h4>
  </div>
  
<form role="form" data-ng-submit="update(item)">

<div class="modal-body">

<div class="row">
	<div class="col-sm-3">
		<div class="form-group">
		<label for="">Titolo</label>
		<select class="form-control input-sm">
			<option> </option>
			<option>Spett.</option>
			<option>Egr.</option>
		</select>
		</div>
	</div>
	<div class="col-md-9">
		<div class="form-group">
			<label for="">Denominazione</label>
			<input type="text" class="form-control input-lg">
		</div>
	</div>
</div>


<div class="form-group">
	<label for="">Indirizzo</label> 
	<textarea rows="2" class="form-control"></textarea>
</div>

<div class="row">
	<div class="col-sm-8">
		<div class="form-group">
		<label for="">Comune</label>
		<input type="text" class="form-control">
		</div>
	</div>
	<div class="col-xs-2">
		<div class="form-group">
		<label for="">Provincia</label>
		<input type="text" class="form-control">
		</div>
	</div>
	<div class="col-xs-2">
		<div class="form-group">
		<label for="">CAP</label>
		<input type="text" class="form-control">
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-6">
		<div class="form-group has-success has-feedback">
		<label class="control-label" for="cf">Codice Fiscale</label>
		<input type="text" class="form-control" id="cf">
		<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
		</div>
	</div>
	<div class="col-xs-6">
		<div class="form-group has-error has-feedback">
		<label class="control-label" for="">Partita IVA</label>
		<input type="text" class="form-control">
		<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-5">
	<label for="">Settore</label>
		<select class="form-control input-sm">
			<option> </option>
			<option>Spett.</option>
			<option>Egr.</option>
		</select>
	</div>
	<div class="col-xs-5">
		<div class="form-group">
		<label for="">Gruppo</label>
		<select class="form-control input-sm">
			<option> </option>
			<option>Spett.</option>
			<option>Egr.</option>
		</select>
		</div>
	</div>
	<div class="col-xs-2">
		<div class="form-group">
		<label for="">CTP</label>
		<input type="text" class="form-control input-sm">
		</div>
	</div>
</div>
</div>

<div class="modal-footer">
	<a role="button" class="btn btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
	<a role="button" class="btn btn-success" data-ng-click="editCtrl.update(item)" data-ng-disabled="fattura.$invalid"><i class="glyphicon glyphicon-ok"></i> Salva</a>
</div>
	
</form>
