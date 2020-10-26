
<ul class="nav no-print">
    <li><a href="${createLink(controller: 'groupBuy', action: 'group', id: groupId)}" class="${controllerName == 'groupBuy' && actionName == 'group' ? 'active' : ''}">Scheda</a></li>
    <sec:ifLoggedIn>
        <gb:ifGroupOwner groupId="${groupId}">
            <li><a href="${createLink(controller: 'groupBuy', action: 'groupEdit', id: groupId)}" class="${controllerName == 'groupBuy' && actionName == 'groupEdit' ? 'active' : ''}">Modifica</a></li>
        </gb:ifGroupOwner>
    </sec:ifLoggedIn>
    <li><a href="${createLink(controller: 'groupBuy', action: 'groupMembers', id: groupId)}" class="${controllerName == 'groupBuy' && actionName == 'groupMembers' ? 'active' : ''}">Iscritti</a></li>
    <li><a href="${createLink(controller: 'groupBuy', action: 'groupOrders', id: groupId)}" class="${controllerName == 'groupBuy' && actionName == 'groupOrders' ? 'active' : ''}">Ordini</a></li>
</ul>