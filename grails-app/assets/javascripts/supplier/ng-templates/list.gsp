<div>
    <gas-alert level="{{message.level}}" text="{{message.text}}"></gas-alert>

    <gas-collapse>
        <a ng-click="collapseCtrl.toggleCollapsed()" class=" btn-default btn-xs" popover="Debug info"
           popover-trigger="mouseenter" popover-placement="right">
            Debug
            <i class="caret"></i>
        </a>
        <pre collapse="collapseCtrl.isCollapsed()">
            {{listCtrl.list | json}}
        </pre>
    </gas-collapse>


    <div class="top-title clearfix">
        <div dropdown="" class="container">
            <h1 dropdown-toggle="">Elenco negozi</h1>
        </div>

        <div class="buttons" role="group">
            <a role="button" class="btn btn-sm btn-success" data-ng-href="#create">
                <i class="glyphicon glyphicon-plus"></i>
                Nuovo negozio
            </a>
        </div>
    </div>

    <div class="filtro">
        <div class="pull-left">
            <gas-search></gas-search>
        </div>
        <span class="divider-vertical pull-left"></span>
        <div class="pull-right">
            <span class="total">
                <strong>{{listCtrl.count || 0}}</strong>
                Elenco negozzi
            </span>
            <i class="glyphicon glyphicon-export"></i>
        </div>
    </div>

    <table class="table table-hover elenco" data-gas-infinite-scroll="" ng-model="listCtrl.list">
        <tr>
            <th data-gas-sortable="date">Nome</th>
            <th data-gas-sortable="total">Contatto</th>
            <th data-gas-sortable="description">Indirizzo</th>
            <th data-gas-sortable="description">Creato da</th>
            <th></th>
        </tr>
        <tr ng-repeat="item in listCtrl.list | filter:statusFilterFn">
            <td data-ng-click="show(item)">
                <div class="client-name">{{item.name}}</div>
            </td>
            <td data-ng-click="show(item)">
                <a href="mailto:{{item.contactInfo.email}}" ng-if="item.contactInfo.email">{{item.contactInfo.email || ''}}</a>
                <br ng-if="item.contactInfo.email"/>
                <small ng-if="item.contactInfo.phone">
                    <i class="fa fa-phone"></i>
                    {{item.contactInfo.phone || ''}}
                </small>
                <br ng-if="item.contactInfo.phone"/>
                <small ng-if="item.contactInfo.mobile">
                    <i class="fa fa-mobile"></i>
                    {{item.contactInfo.mobile || ''}}
                </small>
            </td>
            <td data-ng-click="show(item)">
                {{item.shippingAddress.address1}}
                <br/>
                {{item.shippingAddress.address2 || ''}}
                <br ng-if="item.shippingAddress.address2"/>
                {{item.shippingAddress.postalCode}} {{item.shippingAddress.postalCode?'-':''}}
                {{item.shippingAddress.city}}
                {{item.shippingAddress.district?'(':''}}{{item.shippingAddress.district}}{{item.shippingAddress.district?')':''}}
            </td>
            <td data-ng-click="show(item)">
                <div class="invoice-to form-group" data-gas-item-load="" item-id="{{item.id}}" item="creator" resource="user">
                {{creator.id}} - {{creator.username || 'No Username'}}
                </div>
            </td>
            <td class="text-right">
                <div class="btn-group" dropdown="">
                    <button type="button" class="btn btn-default btn-sm" dropdown-toggle="">
                        <span class="caret"></span>
                        <span class="sr-only">Documento {{item.number}}</span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li>
                            <a data-gas-modal="" template-url="/assets/supplier/ng-templates/show.gsp?id={{item.id}}">Dettagli</a>
                        </li>
                        <li>
                            <a data-gas-modal="" data-ng-href="#/edit/{{item.id}}">Modifica</a>
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</div>