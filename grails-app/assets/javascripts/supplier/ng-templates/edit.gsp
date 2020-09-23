<div>
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modifica i dati del negozio: {{editCtrl.item.name}} ({{editCtrl.item.id}})</h4>
    </div>

    <gas-alert level="{{message.level}}" text="{{message.text}}">test</gas-alert>
    <form role="form" data-ng-submit="update(editCtrl.item)">
        <div class="modal-body">

            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="name">Nome {{editCtrl.item.name}}</label>
                        <input type="text" class="form-control input-lg" name="name" ng-model="editCtrl.item.name"
                               placeholder="Nome"/>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group">
                        <label for="description">Descrizione</label>
                        <textarea rows="2" class="form-control" name="description" ng-model="editCtrl.item.description"
                                  placeholder="Decrizione"></textarea>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-xs-4">
                    <div class="form-group has-success has-feedback">
                        <label class="control-label" for="email">e-mail</label>
                        <input type="text" class="form-control" id="email" name="email"
                               ng-model="editCtrl.item.contactInfo.email" placeholder="Email"/>
                        <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="form-group has-error has-feedback">
                        <label class="control-label" for="phone">Telefono</label>
                        <input type="text" class="form-control" id="phone" name="phone"
                               ng-model="editCtrl.item.contactInfo.phone" placeholder="Telefono"/>
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="form-group has-error has-feedback">
                        <label class="control-label" for="mobile">Cellulare</label>
                        <input type="text" class="form-control" id="mobile" name="mobile"
                               ng-model="editCtrl.item.contactInfo.mobile" placeholder="Cellulare"/>
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>
            </div>

            <hr/>

            <div class="form-group">
                <label for="address1">Indirizzo</label>
                <input type="text" class="form-control" name="address1"
                       ng-model="editCtrl.item.shippingAddress.address1"
                       placeholder="Indirizzo"/>
                <input type="text" class="form-control" name="address2"
                       ng-model="editCtrl.item.shippingAddress.address2"
                       placeholder="Indirizzo "/>
            </div>

            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="city">Comune</label>
                        <input type="text" class="form-control" name="city"
                               ng-model="editCtrl.item.shippingAddress.city"
                               placeholder="Comune"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="">Provincia</label>
                        <input type="text" class="form-control" ng-model="editCtrl.item.shippingAddress.city"
                               placeholder="Comune"/>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="form-group">
                        <label for="postalCode">CAP</label>
                        <input type="text" class="form-control" name="postalCode"
                               ng-model="editCtrl.item.shippingAddress.postalCode"
                               placeholder="Codice postale"/>
                    </div>
                </div>
            </div>

        </div>

        <div class="modal-footer">
            <a role="button" class="btn btn-default" data-back="" data-ng-click="navBack()">
                <i class="glyphicon glyphicon-remove"></i>
                Annulla
            </a>
            <a role="button" class="btn btn-success" data-ng-click="editCtrl.update(editCtrl.item)"
               data-ng-disabled="fattura.$invalid">
                <i class="glyphicon glyphicon-ok"></i>
                Salva
            </a>
        </div>

    </form>
</div>