

    <div class="item1-links  mb-0"> 
        <a href="${createLink(controller: 'user', action: 'profile')}" class="${controllerName == 'user' && actionName == 'profile' ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-user"></i></span> <g:message code="site.menu.profile"/> 
        </a> 
        <%/*<a href="${createLink(controller: 'user', action: 'settings')}"  class="${controllerName == 'user' && actionName == 'settings' ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-settings"></i></span> <g:message code="site.menu.preferences"/> 
        </a>*/%>
        <a href="${createLink(controller: 'user', action: 'orders')}" class="${controllerName == 'user' && actionName == 'orders' ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-basket"></i></span> <g:message code="site.menu.orders"/> 
        </a> 
        <a href="${createLink(controller: 'user', action: 'groups')}" class="${controllerName == 'user' && actionName == 'groups' ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-share"></i></span> <g:message code="site.menu.groups"/> 
        </a>
        <a href="/logoff" class="d-flex">
            <span class="icon1 mr-3"><i class="icon icon-power"></i></span> <g:message code="site.menu.logout"/> 
        </a> 
    </div>