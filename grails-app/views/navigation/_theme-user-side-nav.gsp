<%
    def requestURI = request.getRequestURI()
%>
    <div class="item1-links  mb-0"> 
        <a href="${createLink(mapping: 'profiloUtente', namespace: 'ui')}" class="${requestURI.contains('profilo') ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-user"></i></span> <g:message code="site.menu.profile"/> 
        </a> 
        <%/*<a href="${createLink(mapping: 'preferenzeUtente', namespace: 'ui')}"  class="${requestURI.contains('preferenze') ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-settings"></i></span> <g:message code="site.menu.preferences"/> 
        </a>*/%>
        <a href="${createLink(mapping: 'ordiniUtente', namespace: 'ui')}" class="${requestURI.contains('ordini') ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-basket"></i></span> <g:message code="site.menu.orders"/> 
        </a> 
        <a href="${createLink(mapping: 'gruppiUtente', namespace: 'ui')}" class="${requestURI.contains('gruppi') ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-share"></i></span> <g:message code="site.menu.groups"/> 
        </a>
        <a href="/logoff" class="d-flex">
            <span class="icon1 mr-3"><i class="icon icon-power"></i></span> <g:message code="site.menu.logout"/> 
        </a> 
    </div>