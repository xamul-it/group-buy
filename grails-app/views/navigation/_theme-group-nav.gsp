<%
    def schedaGruppo = createLink(mapping: 'schedaGruppo', params: [groupId: groupId], namespace: 'ui')
    def requestURI = request.getRequestURI()
%>
<ul class="nav no-print">
    <li><a href="${schedaGruppo}" class="${requestURI.equals(schedaGruppo) ? 'active' : ''}"> <g:message code="site.menu.group.board"/> </a></li>
    <sec:ifLoggedIn>
        <gb:ifGroupOwner groupId="${groupId}">
            <li><a href="${createLink(mapping: 'modificaGruppo', params: [groupId: groupId], namespace: 'ui')}" class="${requestURI.contains('modifica') ? 'active' : ''}">  <g:message code="site.menu.group.edit"/> </a></li>
        </gb:ifGroupOwner>
    </sec:ifLoggedIn>
    <li><a href="${createLink(mapping: 'iscrittiGruppo', params: [groupId: groupId], namespace: 'ui')}" class="${requestURI.contains('iscritti') ? 'active' : ''}">  <g:message code="site.menu.group.members"/> </a></li>
    <li><a href="${createLink(mapping: 'ordiniGruppo', params: [groupId: groupId], namespace: 'ui')}" class="${requestURI.contains('ordini') ? 'active' : ''}"> <g:message code="site.menu.group.orders"/> </a></li>
</ul>