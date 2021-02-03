

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
    </div>