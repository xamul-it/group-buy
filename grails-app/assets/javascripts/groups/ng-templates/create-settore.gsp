<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Nuovo Settore</h4>
</div>
  
<form role="form" data-ng-submit="update(item)">

<div class="modal-body">
<div class="form-group">
	<label for="">Descrizione</label>
	<input type="text" class="form-control input-lg">
</div>
</div>

<div class="modal-footer">
	<a role="button" class="btn btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
	<a role="button" class="btn btn-success" data-ng-click="editCtrl.update(item)" data-ng-disabled="fattura.$invalid"><i class="glyphicon glyphicon-ok"></i> Salva</a>
</div>

</form>
