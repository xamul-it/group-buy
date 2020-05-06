<div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Nuovo gruppo: {{createCtrl.item.name}}</h4>
    </div>

    <gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>
    <gas-alert ng-repeat="error in errors" level="warning" text="{{error.field}}: {{error.message}}"></gas-alert>

    <gas-collapse>
        <a ng-click="collapseCtrl.toggleCollapsed()" class="btn btn-xs" popover="Debug info"
           popover-trigger="mouseenter" popover-placement="right">
            Debug <i class="caret"></i>
        </a>
        <pre collapse="collapseCtrl.isCollapsed()">
            {{createCtrl.item | json}}
            form.$invalid: {{fattura.$invalid}}
        </pre>
    </gas-collapse>

    <form role="form" data-ng-submit="update(createCtrl.item)">
        <div class="modal-body">

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="name">Nome {{createCtrl.item.name}}</label>
                        <input type="text" class="form-control input-lg" name="name" ng-model="createCtrl.item.name"
                               placeholder="Nome"/>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group">
                        <label for="description">Descrizione</label>
                        <textarea rows="2" class="form-control input-lg" name="description"
                                  ng-model="createCtrl.item.description"
                                  placeholder="Decrizione"></textarea>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label for="address1">Indirizzo</label>
                <input type="text" class="form-control input-lg" name="address1"
                       ng-model="createCtrl.item.deliveryAddress.address1"
                       placeholder="Indirizzo"/>
                <input type="text" class="form-control input-lg" name="address2"
                       ng-model="createCtrl.item.deliveryAddress.address2"
                       placeholder="Indirizzo "/>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="city">Comune</label>
                        <input type="text" class="form-control input-lg" name="city"
                               ng-model="createCtrl.item.deliveryAddress.city"
                               placeholder="Comune"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="">Provincia</label>
                        <input type="text" class="form-control input-lg"
                               ng-model="createCtrl.item.deliveryAddress.district"
                               placeholder="Provincia"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="postalCode">CAP</label>
                        <input type="text" class="form-control input-lg" name="postalCode"
                               ng-model="createCtrl.item.deliveryAddress.postalCode"
                               placeholder="Codice postale"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-4">
                    <div class="form-check">
                        <label for="isPublic">Pubblico</label>
                        <input type="checkbox" id="isPublic" name="isPublic" ng-model="createCtrl.item.isPublic"/>
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
            <a role="button" class="btn btn-success" data-ng-click="createCtrl.save(createCtrl.item)">
                <i class="glyphicon glyphicon-ok"></i>
                Salva
            </a>
        </div>

    </form>
</div>