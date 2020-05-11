<div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modifica i dati del gruppo: {{editCtrl.item.name}} ({{editCtrl.item.id}})</h4>
    </div>

    <gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
    <gas-alert ng-repeat="error in errors" level="warning" text="{{error.field}}: {{error.message}}"></gas-alert>

    <gas-collapse>
        <a ng-click="collapseCtrl.toggleCollapsed()" class="btn btn-xs" popover="Debug info"
           popover-trigger="mouseenter" popover-placement="right">
            Debug <i class="caret"></i>
        </a>
        <pre collapse="collapseCtrl.isCollapsed()">
            {{editCtrl.item | json}}
        </pre>
    </gas-collapse>
    <form role="form" data-ng-submit="update(editCtrl.item)">
        <div class="modal-body">

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="name">Nome {{editCtrl.item.name}}</label>
                        <input type="text" class="form-control input-lg" id="name" name="name" ng-model="editCtrl.item.name"
                               placeholder="Nome"/>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group">
                        <label for="description">Descrizione</label>
                        <textarea rows="2" id="description" class="form-control" name="description" ng-model="editCtrl.item.description"
                                  placeholder="Decrizione"></textarea>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="address1">Indirizzo</label>
                <input type="text" id="address1" class="form-control" name="address1"
                       ng-model="editCtrl.item.deliveryAddress.address1"
                       placeholder="Indirizzo"/>
                <input type="text" class="form-control" name="address2"
                       ng-model="editCtrl.item.deliveryAddress.address2"
                       placeholder="Indirizzo "/>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="city">Comune</label>
                        <input type="text" id="city" class="form-control" name="city"
                               ng-model="editCtrl.item.deliveryAddress.city"
                               placeholder="Comune"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="district">Provincia</label>
                        <input type="text" id="district" class="form-control" ng-model="editCtrl.item.deliveryAddress.city"
                               placeholder="Comune"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="postalCode">CAP</label>
                        <input type="text" id="postalCode" class="form-control" name="postalCode"
                               ng-model="editCtrl.item.deliveryAddress.postalCode"
                               placeholder="Codice postale"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">
                    <div class="form-check">
                        <label for="isPublic">Pubblico</label>
                        <input type="checkbox" id="isPublic" name="isPublic" ng-model="editCtrl.item.isPublicGroup"/>
                    </div>
                </div>
                <div class="col-xs-4">
                </div>
                <div class="col-xs-4">
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <a role="button" class="btn btn-default" data-back="" data-ng-click="navBack()">
                <i class="glyphicon glyphicon-remove"></i>
                Annulla
            </a>
            <a role="button" class="btn btn-success" data-ng-click="editCtrl.update(editCtrl.item)">
                <i class="glyphicon glyphicon-ok"></i>
                Salva
            </a>
        </div>

    </form>
</div>