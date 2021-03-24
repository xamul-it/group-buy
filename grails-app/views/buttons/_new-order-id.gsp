
<div class="col-md-12 form-group" v-if="groupItem.administrator || groupItem.member">
    <a class="btn btn-outline-primary btn-block btn-lg" :href="'/groupBuy/group/'+groupId+'/order/create'"><i class="fa fa-shopping-cart"></i> <g:message code="button.newOrder"/> </a>
</div>
