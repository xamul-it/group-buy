<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">Scheda Gruppo</h4>
</div>

<form role="form" data-ng-submit="update(item)">

	<div class="modal-body">

		<div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="nome">Nome </label>
					<p id="nome">{{showCtrl.item.name}}</p>
				</div>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<label for="description">Descrizione</label>
					<p id="description">{{showCtrl.item.description}}</p>
				</div>
			</div>
		</div>


		<div class="form-group">
			<label for="address">Indirizzo</label>
			<p name="address" id="address">{{showCtrl.item.deliveryAddress.address1}}
				{{showCtrl.item.deliveryAddress.address2 || ''}} <br ng-if="item.deliveryAddress.address2"/>
			</p>
		</div>

		<div class="row">
			<div class="col-sm-8">
				<div class="form-group">
					<label for="city">Comune</label>
					<p name="city" id="city">{{showCtrl.item.deliveryAddress.city}}</p>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="">Provincia</label>
					<p name="district" id="">{{showCtrl.item.deliveryAddress.district}}</p>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="postalCode">CAP</label>
					<p name="postalCode" id="postalCode">{{showCtrl.item.deliveryAddress.postalCode}}</p>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-4">
				<div class="form-check" >
					<label for="isPublicGroup">Pubblico -{{showCtrl.item.publicGroup}}--</label>
					<p name="isPublicGroup" id="isPublicGroup">
						<i class="glyphicon glyphicon-ok" data-ng-show="{{showCtrl.item.publicGroup}}"></i>
						<i class="glyphicon glyphicon-remove" data-ng-show="{{!showCtrl.item.publicGroup}}"></i>
					</p>
				</div>
			</div>
			<div class="col-xs-4">
			</div>
			<div class="col-xs-4">
			</div>
		</div>

	</div>

	<div class="modal-footer">
		<a role="button" class="btn btn-default" data-ng-href="#/list"><i class="glyphicon glyphicon-remove"></i> Chiudi</a>
	</div>

</form>
