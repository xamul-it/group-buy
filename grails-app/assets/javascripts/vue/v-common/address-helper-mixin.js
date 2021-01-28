export const addressHelperMixin = {
  methods: {
    addressFormat(deliveryAddress) {
      let formattedAddress = '';
      formattedAddress += deliveryAddress.address1 ? deliveryAddress.address1:'';
      formattedAddress += deliveryAddress.address2 ? ' '+deliveryAddress.address2:'';
      formattedAddress += formattedAddress.length>0?', ':'';
      formattedAddress += deliveryAddress.postalCode ? deliveryAddress.postalCode:'';
      formattedAddress += deliveryAddress.city ? ' '+deliveryAddress.city:'';
      formattedAddress += formattedAddress.length>0?', ':'';
      formattedAddress += deliveryAddress.countryCode ? deliveryAddress.countryCode:'';
      return formattedAddress
    },

  },
};
