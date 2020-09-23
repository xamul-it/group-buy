		<td ng-show="!editMode" data-ng-click="listCtrl.show(model)">{{model.descrizione}}</td>
		<td ng-show="editMode"><input type="text" class="form-control" on-enter="save()" on-esc="cancel()" ng-model="model.descrizione"></td>
		
		<td ng-show="!editMode" data-ng-click="listCtrl.show(model)">{{model.prezzoUnitario || '-'}}</td>
		<td ng-show="editMode"><input type="number" class="form-control" on-enter="save()" on-esc="cancel()" ng-model="model.prezzoUnitario"></td>
		
		<td ng-show="!editMode" data-ng-click="show(model)">{{model.unita || '-'}}</td>
		<td ng-show="editMode"><input type="text" class="form-control" on-enter="save()" on-esc="cancel()" ng-model="model.unita"></td>
		
		<td ng-show="!editMode" data-ng-click="show(model)">{{model.aliquota}}</td>
		<td ng-show="editMode">
			<select class="form-control">
				<option>22%<option>
				<option>10%<option>
				<option>4%<option>
				<option>0%<option>
			</select>
		</td>
		
		<td ng-show="!editMode" data-ng-click="show(model)"><i class="fa fa-check" ng-if="model.applicaCassa"></i></td>
		<td ng-show="editMode"><input type="checkbox" class="form-control" ng-model="model.applicaCassa"></td>
		
		<td ng-show="!editMode" data-ng-click="show(model)"><i class="fa fa-check" ng-if="model.applicaRitenuta"></i></td>
		<td ng-show="editMode"><input type="checkbox" class="form-control" ng-model="model.applicaRitenuta"></td>
		
		<td ng-show="!editMode" class="text-right">
			<div class="btn-group" dropdown>
				<button type="button" class="btn btn-default btn-sm" dropdown-toggle>
					<span class="caret"></span>
					<span class="sr-only">Articolo {{model.descrizione}}</span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a ng-click="edit()">Modifica</a></li>
					<li><a data-ng-click="delete(model)">Elimina</a></li>
				</ul>
			</div>
		</td>
		<td ng-show="editMode" class="text-right">
			<button ng-click="cancel()" class="btn btn-default btn-sm">Annulla</button>
			<button ng-click="save()" class="btn btn-default btn-sm">Salva</button>
		</td>