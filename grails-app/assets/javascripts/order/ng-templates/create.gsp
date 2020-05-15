<div>
    <gas-alert level="{{message.level}}" text="{{message.text}}">&nbsp;</gas-alert>
    <gas-alert ng-repeat="error in errors" level="warning" text="{{error.field}}: {{error.message}}">&nbsp;</gas-alert>

    <form role="form" data-ng-submit="update(createCtrl.item)">
    <div class="top-title clearfix">
        <h1 class="pull-left">Nuovo ordine</h1>
        <div class="buttons" role="group">
            <a role="button" class="btn btn-default btn-sm" data-ng-href="#list">
                <i class="glyphicon glyphicon-remove">&nbsp;</i>
                Annulla
            </a>
            <button type="submit" class="btn btn-sm btn-success" data-ng-click="createCtrl.save(createCtrl.item)"
                    data-ng-disabled="form.$invalid">
                <i class="glyphicon glyphicon-ok">&nbsp;</i>
                Salva
            </button>
        </div>
    </div>

    <div class="invoice">
            <div class="row">
                <div class="col-sm-5">

                    <div class="form-group" data-gas-typeahead=""
                         ng-model="createCtrl.item.group" field="name">
                        <label for="client">Gruppo di acquisto</label>
                        <!--Nuovo gruppo
                        <a data-gas-modal="" template-url="/assets/groups/ng-templates/create.gsp"
                           class="btn-default btn-xs pull-right">
                            <i class="glyphicon glyphicon-plus">&nbsp;</i>

                        </a>-->

                        <input id="group" name="group.id" ng-model="createCtrl.item.group.id" type="hidden"/>
                        <p class="input-group">
                            <input type="text" ng-model="asyncSelected" placeholder="Seleziona cliente"
                                   suggestion=""
                                   typeahead="item.name for item in query($viewValue,'group')"
                                   typeahead-loading="loading"
                                   typeahead-on-select="onSelect($item, $model, $label)" class="form-control"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default" ng-click="open($event)">
                                    <i class="glyphicon glyphicon-chevron-down">&nbsp;</i>
                                </button>
                            </span>
                        </p>
                        <i ng-show="loading" class="glyphicon glyphicon-refresh">&nbsp;</i>
                        <div class="invoice-to form-group" data-gas-item-load=""
                             item-id="{{selctedItem.id || createCtrl.item.group.id}}" item="gruppo"
                             resource="group">
                            <h4>{{gruppo.name}}</h4>
                            <small>{{gruppo.description}}</small>
                            <br>{{gruppo.deliveryAddress.address1}}
                            <br ng-if="gruppo.deliveryAddress.address2"/>{{gruppo.deliveryAddress.address2 || ''}}
                            <br/>
                            {{gruppo.deliveryAddress.postalCode}} {{gruppo.deliveryAddress.city}}
                            {{gruppo.deliveryAddress.district}}
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-5">

                    <div class="form-group" data-gas-typeahead=""
                         ng-model="createCtrl.item.supplier" field="name">
                        <label for="client">Negozio</label>

                        <input id="supplier.it" name="supplier.id"
                               ng-model="createCtrl.item.supplier.id" type="hidden"/>

                        <p class="input-group">
                            <input type="text" ng-model="asyncSelected" placeholder="Seleziona negozio"
                                   resource="supplier"
                                   typeahead="item.name for item in query($viewValue,'supplier')"
                                   typeahead-loading="loading"
                                   typeahead-on-select="onSelect($item, $model, $label)" class="form-control"/>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default" ng-click="open($event)">
                                    <i class="glyphicon glyphicon-chevron-down">&nbsp;</i>
                                </button>
                            </span>
                        </p>
                        <i ng-show="loading" class="glyphicon glyphicon-refresh">&nbsp;</i>
                        <div class="invoice-to form-group" data-gas-item-load=""
                             item-id="{{selctedItem.id || createCtrl.item.supplier.id}}" item="fornitore"
                             resource="supplier">

                            <h4>{{fornitore.name}}</h4>
                            <small>{{fornitore.description}}</small>
                            <br>{{fornitore.shippingAddress.address1}}
                            <br ng-if="gruppo.deliveryAddress.address2"/>{{fornitore.shippingAddress.address2 || ''}}
                            <br/>
                            {{fornitore.shippingAddress.postalCode}} {{fornitore.shippingAddress.city}}
                            {{fornitore.shippingAddress.district}}
                        </div>
                    </div>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <input type="text" class="form-control" name="description" placeholder="Descrizione ordine" ng-model="createCtrl.item.description"/>
                    </div>
                </div>
            </div>

            <table class="table elenco">
                <tr>
                    <th class="col-sm-1">Posizione</th>
                    <th class="col-sm-6">Descrizione</th>
                    <th class="col-sm-6">Utente</th>
                    <th class="col-sm-1 text-center">Quantità</th>
<!--                    <th class="text-center">Importo unitario</th>
                    <th class="text-right">Totale</th> -->
                    <th class="td-button">&nbsp;</th>
                </tr>
                <tr  ng-repeat="voce in createCtrl.item.orderVoice">
                    <td>
                        <input type="text" class="form-control" placeholder="1" ng-model="voce.posizione"/>
                    </td>
                    <td>
                        <input type="text" class="form-control" placeholder="Descrizione" ng-model="voce.description"/>
                    </td>
                    <td>
                        <p class="form-control-static">
                            <strong>Dummy@to.fix</strong>
                        </p>
                    </td>
                    <td>
                        <input type="text" class="form-control text-right ng-pristine ng-valid ng-valid-number" placeholder="1" ng-model="voce.quantity"/>
                    </td>
                    <!--<td>
                        <input type="text" class="form-control text-right" placeholder="1" ng-model="voce.price"/>
                    </td>
                    <td>
                        <input type="text" class="form-control" ng-model="voce.amount"/>
                    </td>
                    <td class="text-right text-nowrap">
                        <p class="form-control-static">
                            <strong>€ 4.000,00</strong>
                        </p>
                    </td>-->
                    <td>
                        <button class="btn btn-default btn-sm" type="button"
                                data-gas-delete-row=""
                                items="createCtrl.item.orderVoice"
                                item="voce">
                            <i class="glyphicon glyphicon-remove">&nbsp;</i>
                        </button>
                    </td>
                </tr>
                <tr>
                    <td colspan="8" class="text-right">
                        <a class="btn btn-xs" data-gas-add-new-row="" items="createCtrl.item.orderVoice"
                           defaults="['posizione': +1,'quantity':2]">
                            <i class="glyphicon glyphicon-plus">&nbsp;</i> Aggiungi riga</a>
                    </td>
                </tr>
            </table>

<!--            <div class="col-md-4 pull-right">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-xs-6">
                            <strong>Importo complessivo</strong>
                        </div>
                        <div class="col-xs-6 text-right">
                            <strong>212,00€</strong>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="col-xs-6">
                            <h4>Quota mia</h4>
                        </div>
                        <div class="col-xs-6 text-right">
                            <h4>
                                <strong>216,24€</strong>
                            </h4>
                        </div>
                        <div class="clearfix">&nbsp;</div>
                    </div>
                </div>
            </div>
    -->
        <div class="clearfix">&nbsp;</div>
        <hr/>
    </div>
    </form>
</div>