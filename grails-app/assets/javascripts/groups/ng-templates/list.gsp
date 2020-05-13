<div>
    <gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>

    <gas-collapse>
        <a ng-click="collapseCtrl.toggleCollapsed()" class=" btn-default btn-xs" popover="Debug info"
           popover-trigger="mouseenter" popover-placement="right">
            Debug <i class="caret"></i>
        </a>
        <pre collapse="collapseCtrl.isCollapsed()">
			{{listCtrl.list | json}}
		</pre>
    </gas-collapse>

    <div class="top-title clearfix">
        <div dropdown class="container">
            <h1 dropdown-toggle>Elenco Gruppi</h1>
        </div>

        <div class="buttons" role="group">
            <a role="button" class="btn btn-sm btn-success" data-ng-href="#create">
                <i class="glyphicon glyphicon-plus"></i>
                Nuovo Gruppo
            </a>
        </div>
    </div>


    <div class="filtro">
        <div class="pull-left">
            <gas-search></gas-search>
        </div>
        <span class="divider-vertical pull-left"></span>
        <div class="pull-right">
            <span class="total"><strong>{{listCtrl.count || 0}}</strong> Gruppi</span>
            <i class="glyphicon glyphicon-export"></i>
        </div>
    </div>

    <table class="table table-hover elenco" data-gas-infinite-scroll ng-model="listCtrl.list">
        <tr>
            <th data-gas-sortable="date">Nome</th>
            <th data-gas-sortable="total">Indirizzo Consegna</th>
            <th data-gas-sortable="description">Amministratore</th>
            <th data-gas-sortable="description">Pubblico</th>
            <th data-gas-sortable="description">Membri</th>
            <th></th>
        </tr>
        <tr ng-repeat="item in listCtrl.list | filter:statusFilterFn">
            <td data-ng-click="show(item)">
                <div class="client-name">{{item.name}}</div>
                {{item.description}}
            </td>
            <td data-ng-click="show(item)">
                {{item.deliveryAddress.address1}} - {{item.deliveryAddress.address2}}<br>
                {{item.deliveryAddress.postalCode}} - {{item.deliveryAddress.city}} - {{item.deliveryAddress.district}}
            </td>
            <td data-ng-click="show(item)">---{{item.owner.username}}+++</td>
            <td data-ng-click="show(item)"><i class="glyphicon glyphicon-ok" data-ng-show="{{item.publicGroup}}"></i></td>
            <td data-ng-click="show(item)">{{item.members.size}}</td>

            <td class="text-right">
                <div class="btn-group" dropdown>
                    <button type="button" class="btn btn-default btn-sm" dropdown-toggle>
                        <span class="caret"></span>
                        <!--					<span class="sr-only">Documento {{item.number}}</span>-->
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a data-ng-href="#/show/{{item.id}}">Dettagli</a></li>
                        <li><a data-ng-href="#/edit/{{item.id}}">Modifica</a></li>
                        <li><a data-ng-href="#/changePublic/{{item}}">Rendi {{item.publicGroup? 'privato' : 'pubblico'}}</a></li>
                        <li><a data-ng-href="#/delete/{{item.id}}">Elimina</a></li>
                    </ul>
                </div>
            </td>
        </tr>

    </table>
</div>
