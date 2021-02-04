<<<<<<< HEAD


    <div class="item1-links  mb-0"> 
        <a href="${createLink(controller: 'groupBuy', action: 'user')}" class="${controllerName == 'groupBuy' && actionName == 'user' ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-user"></i></span> Profilo 
        </a> 
        <a href="${createLink(controller: 'groupBuy', action: 'userSettings')}"  class="${controllerName == 'groupBuy' && actionName == 'userSettings' ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-settings"></i></span> Preferenze 
        </a> 
        <a href="#orders" class="d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-basket"></i></span> Ordini
        </a> 
        <a href="#groups" class="d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-share"></i></span> Gruppi
        </a>
        <a href="/logoff" class="d-flex">
            <span class="icon1 mr-3"><i class="icon icon-power"></i></span> Logout
        </a> 
=======


    <div class="item1-links  mb-0"> 
        <a href="${createLink(controller: 'user', action: 'profile')}" class="${controllerName == 'user' && actionName == 'profile' ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-user"></i></span> Profilo 
        </a> 
        <%/*<a href="${createLink(controller: 'user', action: 'settings')}"  class="${controllerName == 'user' && actionName == 'settings' ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-settings"></i></span> Preferenze 
        </a>*/%>
        <a href="${createLink(controller: 'user', action: 'orders')}" class="${controllerName == 'user' && actionName == 'orders' ? 'active' : ''} d-flex  border-bottom">
            <span class="icon1 mr-3"><i class="icon icon-basket"></i></span> Ordini
        </a> 
        <a href="${createLink(controller: 'user', action: 'groups')}" class="${controllerName == 'user' && actionName == 'groups' ? 'active' : ''} d-flex border-bottom"> 
            <span class="icon1 mr-3"><i class="icon icon-share"></i></span> Gruppi
        </a>
        <a href="/logoff" class="d-flex">
            <span class="icon1 mr-3"><i class="icon icon-power"></i></span> Logout
        </a> 
>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
    </div>