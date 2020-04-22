<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Richiesta conferma</h4>
</div>
  
<form role="form" data-ng-submit="update(item)">

<div class="modal-body">
	<div class="row">
		<div class="col-xs-2 text-right"><h2 class="glyphicon glyphicon-remove" aria-hidden="true"></h2></div>
		<div class="col-xs-10"><h4> Vuoi tu eliminare Fattura Sprint e formattare C:\?</h4></div>
	</div>
</div>

<div class="modal-footer">
	<a role="button" class="btn btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
	<a role="button" class="btn btn-danger" data-ng-click="editCtrl.update(item)" data-ng-disabled="fattura.$invalid"><i class="glyphicon glyphicon-ok"></i> Elimina</a>
</div>

</form>
