<div>
    <gas-alert level="{{message.level}}" text="{{message.text}}">&nbsp;</gas-alert>

    <gas-collapse>
        <a ng-click="collapseCtrl.toggleCollapsed()" class=" btn-default btn-xs" popover="Debug info"
           popover-trigger="mouseenter" popover-placement="right">
            Debug
            <i class="caret">&nbsp;</i>
        </a>
        <pre collapse="collapseCtrl.isCollapsed()">
            {{listCtrl.list | json}}
        </pre>
    </gas-collapse>

    <div class="top-title clearfix">
        <div dropdown="" class="container">
            <h1 dropdown-toggle="">Elenco Gruppi</h1>
        </div>

        <div class="buttons" role="group">
            <a role="button" class="btn btn-sm btn-success" data-ng-href="#create">
                <i class="glyphicon glyphicon-plus">&nbsp;</i>
                Nuovo Gruppo
            </a>
        </div>
    </div>

    <div class="filtro">
        <div class="pull-left">
            <gas-search>&nbsp;</gas-search>
        </div>
        <span class="divider-vertical pull-left">&nbsp;</span>
        <div class="pull-right">
            <span class="total">
                <strong>{{listCtrl.list.length || 0}}</strong>
                Gruppi
            </span>
            <i class="glyphicon glyphicon-export">&nbsp;</i>
        </div>
    </div>

    <table class="table table-hover elenco" data-gas-infinite-scroll="" ng-model="listCtrl.list">
        <tr>
            <th >Nome</th>
            <th >Indirizzo Consegna</th>
            <th >Amministratore</th>
            <th >Pubblico</th>
            <th >Membri</th>
            <th >Proprietario</th>
            <th >Iscritto</th>
            <th>&nbsp;</th>
        </tr>
        <tr ng-repeat="item in listCtrl.list | filter:statusFilterFn | orderBy:'name'">
            <td data-ng-click="show(item)" >
                <div class="client-name">{{item.name}}</div>
                {{item.description}}
            </td>
            <td data-ng-click="show(item)">
                {{item.deliveryAddress.address1}} - {{item.deliveryAddress.address2}}
                <br/>
                {{item.deliveryAddress.postalCode}} - {{item.deliveryAddress.city}} - {{item.deliveryAddress.district}}
            </td>
            <td data-ng-click="show(item)">
                <div class="invoice-to form-group" data-gas-item-load="" item-id="{{item.owner.id}}" item="owner"
                     resource="user">
                    {{owner.username || 'No Username'}}
                </div>
            </td>
            <td data-ng-click="show(item)">
                <i class="glyphicon glyphicon-ok" data-ng-show="{{item.publicGroup}}">&nbsp;</i>
                <i class="glyphicon glyphicon-remove" data-ng-show="{{!item.publicGroup}}">&nbsp;</i>
            </td>
            <td data-ng-click="show(item)">{{item.members.length}}</td>

            <td data-ng-click="show(item)"> <!--Proprietario-->
                <i class="glyphicon glyphicon-ok" data-ng-show="{{item.administrator}}">&nbsp;</i>
            </td>
            <td data-ng-click="show(item)"><!--Iscritto-->
                <i class="glyphicon glyphicon-ok" data-ng-show="{{item.member}}">&nbsp;</i>
            </td>

            <td class="text-right">
                <div class="btn-group" dropdown="">
                    <button type="button" class="btn btn-default btn-sm" dropdown-toggle="">
                        <span class="caret">&nbsp;</span>
                        <!--					<span class="sr-only">Documento {{item.number}}</span>-->
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu" data-gas-user="" user="user">
                        <li>
                            <a data-ng-href="#/show/{{item.id}}">Dettagli</a>
                        </li>
                        <li data-ng-if="item.administrator">
                            <a data-ng-href="#/edit/{{item.id}}">Modifica</a>
                        </li>
                        <li data-gas-subscribe="" data-ng-if="!item.member">
                            <a data-ng-href="#">Iscriviti</a>
                        </li>
                        <li data-gas-leave-group="" data-ng-if="item.member && !item.administrator">
                            <a data-ng-href="#">Abbandona</a>
                        </li>
                        <li>
                            <a data-ng-href="#/delete/{{item.id}}">Elimina</a>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>

    </table>
</div>
