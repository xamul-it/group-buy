  <div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Scheda negozio</h4>
  </div>
  
<form role="form" data-ng-submit="update(item)">

<div class="modal-body">

<div class="row">
	<div class="col-sm-3">
		<div class="form-group">
		<label for="name">Nome </label>
			<p class="form-control" name="name" id="name" >{{showCtrl.item.name}}</p>
		</div>
	</div>
	<div class="col-md-9">
		<div class="form-group">
			<label for="description">Descrizione</label>
			<textarea rows="2" class="form-control"  name="description" id="description" >{{showCtrl.item.description}}</textarea>
		</div>
	</div>
</div>


<div class="form-group">
	<label for="address">Indirizzo</label>
	<p name="address" id="address" class="form-control">{{showCtrl.shippingAddress.address2}}
		{{showCtrl.item.shippingAddress.address2 || ''}} <br ng-if="item.shippingAddress.address2"/>
	</p>
</div>

<div class="row">
	<div class="col-sm-8">
		<div class="form-group">
		<label for="city">Comune</label>
		<p name="city" id="city" class="form-control">{{showCtrl.item.shippingAddress.city}}</p>
		</div>
	</div>
	<div class="col-xs-2">
		<div class="form-group">
		<label for="">Provincia</label>
		<p name="" id="" class="form-control"></p>
		</div>
	</div>
	<div class="col-xs-2">
		<div class="form-group">
		<label for="postalCode">CAP</label>
		<p name="postalCode" id="postalCode" class="form-control">{{showCtrl.item.shippingAddress.postalCode}}</p>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-4">
		<label class="control-label" for="cf">e-mail</label>
		<p name="" id="" class="form-control" id="cf">{{showCtrl.item.contactInfo.email}}</p>
	</div>
	<div class="col-xs-4">
			<label class="control-label" for="">Telefono</label>
			<p name="" id="" class="form-control">{{showCtrl.item.contactInfo.phone}}</p>
	</div>
	<div class="col-xs-4">
			<label class="control-label" for="">Cellulare</label>
			<p name="" id="" class="form-control">{{showCtrl.item.contactInfo.mobile}}</p>
	</div>
</div>

</div>

<div class="modal-footer">
	<a role="button" class="btn btn-default" data-back data-ng-click="navBack()"><i class="glyphicon glyphicon-remove"></i> Annulla</a>
</div>
	
</form>
