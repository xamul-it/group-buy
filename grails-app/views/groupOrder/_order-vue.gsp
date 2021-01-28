<script type="module">
    import * as ahm from '/assets/vue/v-common/alert-helper-mixin.js';
    import * as osm from '/assets/vue/v-order/order-status-mixin.js';
    import * as dh from '/assets/vue/v-common/date-helper-mixin.js';

    import * as orderVoiceService from '/assets/vue/v-services/order-voice-rest.js';
    import * as orderService from '/assets/vue/v-services/order-rest.js';
    import * as toastService from '/assets/vue/v-services/toast.js';

    import { mapFields } from '/assets/vue/v-jslib/vuex-map-fields@1.4.0/index.esm.js';
    import { store } from '/assets/vue/v-store/order-store.js';

    var OrderEditApp = new Vue({
        el: '#v-order-edit-app',
        name: 'OrderEdit',
        mixins: [ahm.alertHelperMixin,osm.orderStatusMixin,dh.dateHelperMixin],
        components: {
            'v-modal': VModal,
        },
        store,
        data: {
            groupId: ${groupId},
            orderId: ${orderId},
            orderToken: '${params?.orderToken?:'no-token'}',
            addVoice: false,
            editVoice: {
                i: -1,
                id: -1,
                description: '',
                quantityRequested: 1,
                order: ${orderId},
            },
            orderStatusAction: orderService.ORDER_STATUS
        },
        computed: {
            //all needed data fields from vuex store
            //mapped with vuex-map-fields
            ...mapFields([
                'group.groupItem',
                'order.orderItem',
                'loading',
                'error',
                'success',
                'debug',
            ]),
            
        },
        watch: {
            error: function (error) {
                toastService.alertDanger(this.fetchError(error))
            },
            success: function (message) {
                toastService.alertSuccess(message)
            }
        },
        //https://stackoverflow.com/a/53513789
        async mounted() {
            this.debug = ${isDebug}
            //will execute at pageload
            if(this.groupId>0) {
                await this.fetchOrder()
            } else {
                this.fetchSupplierOrder()
            }
        },
        methods: {
            ...Vuex.mapActions([
                'fetchOrderAction',
                'fetchSupplierOrderAction',
                'saveOrderVoiceAction',
                'deleteOrderVoiceAction',
                'changeOrderStatusAction',
                'changeSupplierOrderStatusAction',
            ]),
            async changeOrderStatus(status) {
                if(this.groupId>0) {
                    await this.changeOrderStatusAction({service: orderService, groupId: this.groupId, orderId: this.orderId, status: status})
                } else {
                    await this.changeSupplierOrderStatusAction({service: orderService, orderToken: this.orderToken, status: status})
                }
            },
            async fetchOrder() {
                await this.fetchOrderAction({service: orderService, groupId: this.groupId, orderId: this.orderId});
            },
            async fetchSupplierOrder() {
                await this.fetchSupplierOrderAction({service: orderService, orderHash: this.orderToken });
            },
            isEditVoice(i) {
                return this.editVoice.i == i
            },
            initial(string, numChars = 2) {
                if (!_.isUndefined(string)) 
                    return string.substring(0, numChars).toUpperCase();
                else
                    return "-";
            },
            editVoiceNum(i) {
                this.addVoice = false
                this.editVoice.i = i
                this.editVoice.id = this.orderItem.voices[i].id
                this.editVoice.description = this.orderItem.voices[i].description
                this.editVoice.quantityRequested = this.orderItem.voices[i].quantityRequested 
            },
            resetEditVoice() {
                this.editVoice = {
                    i: -1,
                    id: -1,
                    description: '',
                    quantityRequested: 1,
                    order: this.orderId,
                }
                this.addVoice = false
            },
            async saveVoice() {
                console.log("saveVoice", this.editVoice )
                let saveVoice = await this.saveOrderVoiceAction({service: orderVoiceService, groupId: this.groupId, orderId: this.orderId, orderVoiceId: 0, orderVoiceItem: this.editVoice})
                this.orderItem.voices.push(saveVoice)
                this.resetEditVoice()
            },
            async updateVoice(orderVoiceId, i) {
                console.log("updateVoice",orderVoiceId, this.editVoice )
                let updatedVoice = await this.saveOrderVoiceAction({service: orderVoiceService, groupId: this.groupId, orderId: this.orderId, orderVoiceId: orderVoiceId, orderVoiceItem: this.editVoice})
                this.orderItem.voices[i] = updatedVoice
                this.resetEditVoice()
            },
            async deleteVoice(orderVoiceId, i) {
                console.log("deleteVoice",orderVoiceId, i)
                await this.deleteOrderVoiceAction({service: orderVoiceService, groupId: this.groupId, orderId: this.orderId, orderVoiceId: orderVoiceId})
                this.orderItem.voices.splice(i,1)
            }

            
        }
    });
</script>