<<<<<<< HEAD
//vuelidate
Vue.use(window.vuelidate.default);
const { required,requiredIf, requiredUnless, minLength, helpers } = window.validators;

//lodash
const { drop, every, forEach, get, isArray, map, set } = _;

//https://github.com/vuelidate/vuelidate/issues/486#issuecomment-500549486
const validateIf = (prop, validator) =>
helpers.withParams({ type: 'validatedIf', prop }, function(value, parentVm) {
    return helpers.ref(prop, this, parentVm) ? validator(value) : true
})
const validateUnless = (prop, validator) =>
helpers.withParams({ type: 'validateUnless', prop }, function(value, parentVm) {
    return !helpers.ref(prop, this, parentVm) ? validator(value) : true
})

//vue-select
  // Set the components prop default to return our fresh components 
  VueSelect.VueSelect.props.components.default = () => ({
    Deselect: null,
});
Vue.component('v-select', VueSelect.VueSelect);

import * as locationService from '/assets/vue/v-services/location.js'; 

var VueLBSearchForm = Vue.component("VueLBSearchForm", {
    name: "vue-search-form",
    template: `<div class="form row no-gutters ">

                <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                    <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" 
                        id="keyword" 
                        :placeholder="keywordPlaceholder"
                        v-model="keyword"
                        @input="$v.keyword.$touch()">
                    
                      <slot name="keyword-icon"></slot>

                    <pre v-if="isDebug">{{ $v.keyword }}</pre>
                </div>

                <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                    <input type="text" class="form-control input-lg br-md-0"
                        id="address" 
                        :placeholder="addressPlaceholder"
                        v-model="address"
                        @input="$v.address.$touch()">

                      <slot name="address-icon">
                        <span v-if="geolocationSupported" @click="fetchAddress" :title="usePositionText">
                          <i v-if="!locationLoading" class="fa fa-map-marker location-gps mr-1"></i>
                          <i v-if="locationLoading" class="fa fa-spinner fa-spin location-gps mr-1"></i>
                        </span> 
                      </slot>
                    
                    <pre v-if="isDebug">{{ $v.address }}</pre>
                </div>

                <div class="form-group col-xl-2 col-lg-2 col-md-12 mb-0 bg-white">
                    <v-select 
                        :clearable="clearable"
                        append-to-body
                        :placeholder="selectPlaceholder"
                        :options="options"
                        :reduce="name => name.id"
                        :label="label"
                        v-model="optionId">
                            <template #open-indicator>
                                <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                            </template>
                    </v-select>
                </div>

                <div class="col-xl-1 col-lg-1 col-md-12 mb-0">
                    <button class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0"
                        @click="search"
                        :disabled="$v.$invalid" 
                        :title="$v.$invalid?searchDisabledText:searchEnabledText" 
                        ><i class="fa fa-search"></i></button>
                </div>
                
                <div v-if="$v.$anyDirty" class="col-xl-1 col-lg-1 col-md-12 mb-0">
                    <button class="btn btn-lg btn-block btn-secondary br-tl-md-0 br-bl-md-0"
                        @click="resetSearch"
                        :title="resetSearchText" 
                        ><i class="fa fa-times-circle"></i></button>
                </div>

            </div>`,
    
  props: {
    options: {
      type: Array,
      required: true,
      default: []
    },
    keywordPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    addressPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    usePositionText: {
      type: String,
      required: false,
      default: 'Use my position',
    },
    selectPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    searchEnabledText: {
      type: String,
      required: false,
      default: 'Search',
    },
    searchDisabledText: {
      type: String,
      required: false,
      default: 'Type keword or insert address',
    },
    resetSearchText: {
      type: String,
      required: false,
      default: 'Reset',
    },
    label: {
      type: String,
      required: false,
      default: 'name',
    },
    clearable: {
      type: Boolean,
      required: false,
      default: false,
    },
    isDebug: {
      type: Boolean,
      required: false,
      default: false,
    }
  },
  data() {
    return {
      keyword: '',
      address: '',
      locationAddress: {},
      locationLat: 0.0,
      locationLon: 0.0,
      optionId: 0,
      searchDirty: false,
      geolocationSupported: "geolocation" in navigator,
      locationLoading: false
    }
  },
  validations: {
      keyword: {
          required: validateUnless('address', required),
          minLength: minLength(3),
      },
      address:  {
          required: validateUnless('keyword', required),
          minLength: minLength(2),
      },
  },
  watch: {
      address: function (newAddress) {
        if(!_.isUndefined(newAddress) && newAddress != "" ) {
          this.setSearchDirty()
        } 
        this.$emit('address-changed', this.address);
      },
      keyword: function(newKeyword) {
        if(!_.isUndefined(newKeyword) && newKeyword!= "" ) {
            this.setSearchDirty()
        }
        this.$emit('keyword-changed', this.keyword);
      },
      optionId: function(newId) {
        if(newId>0) {
            this.setSearchDirty()
        }
        this.$emit('select-changed', this.optionId);
      },
      locationLat: function(newLocationLat) {
        if(newLocationLat!=0.0) {
            this.setSearchDirty()
        }
        this.$emit('latitude-changed', this.locationLat);
      },
      locationLon: function(newLocationLon) {
        if(newLocationLon!=0.0) {
            this.setSearchDirty()
        }
        this.$emit('longitude-changed', this.locationLon);
      },
      searchDirty: function(newDirtyState) {
        this.$emit('dirty-changed', this.searchDirty);
      },
      locationAddress: function (newAddress) {
          let addressString = '';
          addressString += newAddress.road ? newAddress.road:'';
          addressString += newAddress.house_number ? ' '+newAddress.house_number:'';
          addressString += addressString.length>0?', ':'';
          addressString += newAddress.postcode ? newAddress.postcode:'';
          addressString += newAddress.village ? ' '+newAddress.village:'';
          addressString += newAddress.city ? ' '+newAddress.city:'';
          addressString += addressString.length>0?', ':'';
          addressString += newAddress.country ? newAddress.country:'';
          this.address = addressString
          //trigger vuelidate touch to notify changed value in form field
          this.$v.address.$touch()
      },
  },
  computed: {
    
  },  
  methods: {
    async fetchAddress() {
      try {
        this.locationLoading = true;
        let {
          currentCoordinates,
          currentAddress,
        } = await locationService.currentAddress();
      
        currentAddress.latitude = currentCoordinates.latitude
        currentAddress.longitude = currentCoordinates.longitude
      
        this.locationAddress = currentAddress

        this.locationLat = currentCoordinates.latitude

        this.locationLon = currentCoordinates.longitude

      } catch (error) {
        this.$emit('error', error.message)
      } finally {
        this.locationLoading = false
      }
    },
    async fetchCoordinates() {
      try {
        this.locationLat = 0.0
        this.locationLon = 0.0
        let coords = await locationService.coordinatesByAddress(this.address);
        if (!_.isNumber(coords.latitude)) {
          coords.latitude = _.toNumber(coords.latitude);
          coords.longitude = _.toNumber(coords.longitude);
        }
        this.locationLat = coords.latitude
        this.locationLon = coords.longitude
      } catch (error) {
        this.$emit('error', error.message)
      }
    },
    async search(lbSearch = false) {
      if(typeof lbSearch === 'boolean' && lbSearch) {
        await this.fetchAddress()
      } else {
        if(!_.isUndefined(this.address) && this.address != "") {
          await this.fetchCoordinates()
        }
      }
      this.$emit('search')
    },
    setSearchDirty(dirty = true) {
      if(!this.searchDirty && dirty) {
        this.searchDirty = dirty
      } else if(this.searchDirty && !dirty) { 
        this.searchDirty = dirty
      }
    },
    resetSearchDirty() {
      this.setSearchDirty(false)
    },
    resetSearch() {
      this.keyword = ''
      this.address = ''
      this.locationAddress = {}
      this.optionId = 0
      this.locationLat = 0.0
      this.locationLon = 0.0
      this.locationLoading = false
      this.resetSearchDirty()
      //https://github.com/vuelidate/vuelidate/issues/132#issuecomment-660859862
      this.$nextTick(() => { this.$v.$reset() })
    },
 },
  
});

=======
//vuelidate
Vue.use(window.vuelidate.default);
const { required,requiredIf, requiredUnless, minLength, helpers } = window.validators;

//lodash
const { drop, every, forEach, get, isArray, map, set } = _;

//https://github.com/vuelidate/vuelidate/issues/486#issuecomment-500549486
const validateIf = (prop, validator) =>
helpers.withParams({ type: 'validatedIf', prop }, function(value, parentVm) {
    return helpers.ref(prop, this, parentVm) ? validator(value) : true
})
const validateUnless = (prop, validator) =>
helpers.withParams({ type: 'validateUnless', prop }, function(value, parentVm) {
    return !helpers.ref(prop, this, parentVm) ? validator(value) : true
})

//vue-select
  // Set the components prop default to return our fresh components 
  VueSelect.VueSelect.props.components.default = () => ({
    Deselect: null,
});
Vue.component('v-select', VueSelect.VueSelect);

import * as locationService from '/assets/vue/v-services/location.js'; 

var VueLBSearchForm = Vue.component("VueLBSearchForm", {
    name: "vue-search-form",
    template: `<div class="form row no-gutters ">

                <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                    <input type="text" class="form-control input-lg br-tr-md-0 br-br-md-0" 
                        id="keyword" 
                        :placeholder="keywordPlaceholder"
                        v-model="keyword"
                        @input="$v.keyword.$touch()">
                    
                      <slot name="keyword-icon"></slot>

                    <pre v-if="isDebug">{{ $v.keyword }}</pre>
                </div>

                <div class="form-group  col-xl-4 col-lg-4 col-md-12 mb-0 bg-white">
                    <input type="text" class="form-control input-lg br-md-0"
                        id="address" 
                        :placeholder="addressPlaceholder"
                        v-model="address"
                        @input="$v.address.$touch()">

                      <slot name="address-icon">
                        <span v-if="geolocationSupported" @click="fetchAddress" :title="usePositionText">
                          <i v-if="!locationLoading" class="fa fa-map-marker location-gps mr-1"></i>
                          <i v-if="locationLoading" class="fa fa-spinner fa-spin location-gps mr-1"></i>
                        </span> 
                      </slot>
                    
                    <pre v-if="isDebug">{{ $v.address }}</pre>
                </div>

                <div class="form-group col-xl-2 col-lg-2 col-md-12 mb-0 bg-white">
                    <v-select 
                        :clearable="clearable"
                        append-to-body
                        :placeholder="selectPlaceholder"
                        :options="options"
                        :reduce="name => name.id"
                        :label="label"
                        v-model="optionId">
                            <template #open-indicator>
                                <span class="select2-selection__arrow vs__open-indicator" role="presentation"><b role="presentation"></b></span>
                            </template>
                    </v-select>
                </div>

                <div class="col-xl-1 col-lg-1 col-md-12 mb-0">
                    <button class="btn btn-lg btn-block btn-primary br-tl-md-0 br-bl-md-0"
                        @click="search"
                        :disabled="$v.$invalid" 
                        :title="$v.$invalid?searchDisabledText:searchEnabledText" 
                        ><i class="fa fa-search"></i></button>
                </div>
                
                <div v-if="$v.$anyDirty" class="col-xl-1 col-lg-1 col-md-12 mb-0">
                    <button class="btn btn-lg btn-block btn-secondary br-tl-md-0 br-bl-md-0"
                        @click="resetSearch"
                        :title="resetSearchText" 
                        ><i class="fa fa-times-circle"></i></button>
                </div>

            </div>`,
    
  props: {
    options: {
      type: Array,
      required: true,
      default: []
    },
    keywordPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    addressPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    defaultAddress: {
      type: String,
      required: false,
      default: null,
    },
    usePositionText: {
      type: String,
      required: false,
      default: 'Use my position',
    },
    selectPlaceholder: {
      type: String,
      required: false,
      default: '',
    },
    searchEnabledText: {
      type: String,
      required: false,
      default: 'Search',
    },
    searchDisabledText: {
      type: String,
      required: false,
      default: 'Type keword or insert address',
    },
    resetSearchText: {
      type: String,
      required: false,
      default: 'Reset',
    },
    label: {
      type: String,
      required: false,
      default: 'name',
    },
    clearable: {
      type: Boolean,
      required: false,
      default: false,
    },
    isDebug: {
      type: Boolean,
      required: false,
      default: false,
    }
  },
  data() {
    return {
      keyword: '',
      address: '',
      locationAddress: {},
      locationLat: 0.0,
      locationLon: 0.0,
      optionId: 0,
      searchDirty: false,
      geolocationSupported: "geolocation" in navigator,
      locationLoading: false
    }
  },
  validations: {
      keyword: {
          required: validateUnless('address', required),
          minLength: minLength(3),
      },
      address:  {
          required: validateUnless('keyword', required),
          minLength: minLength(2),
      },
  },
  mounted() {
    console.log(this.$options.name + " mounted - defaultAddress: "+ this.defaultAddress)
    if(!_.isUndefined(this.defaultAddress) && this.defaultAddress!= "") {
      this.address = this.defaultAddress
    }
  },
  watch: {
      address: function (newAddress) {
        if(!_.isUndefined(newAddress) && newAddress != "" ) {
          this.setSearchDirty()
        } else if(newAddress == "") {
          this.resetLocationCoordinates()
        }
        this.$emit('address-changed', this.address);
      },
      keyword: function(newKeyword) {
        if(!_.isUndefined(newKeyword) && newKeyword!= "" ) {
            this.setSearchDirty()
        }
        this.$emit('keyword-changed', this.keyword);
      },
      optionId: function(newId) {
        if(newId>0) {
            this.setSearchDirty()
        }
        this.$emit('select-changed', this.optionId);
      },
      locationLat: function(newLocationLat) {
        if(newLocationLat!=0.0) {
            this.setSearchDirty()
        }
        this.$emit('latitude-changed', this.locationLat);
      },
      locationLon: function(newLocationLon) {
        if(newLocationLon!=0.0) {
            this.setSearchDirty()
        }
        this.$emit('longitude-changed', this.locationLon);
      },
      searchDirty: function(newDirtyState) {
        this.$emit('dirty-changed', this.searchDirty);
      },
      locationAddress: function (newAddress) {
          let addressString = '';
          addressString += newAddress.road ? newAddress.road:'';
          addressString += newAddress.house_number ? ' '+newAddress.house_number:'';
          addressString += addressString.length>0?', ':'';
          addressString += newAddress.postcode ? newAddress.postcode:'';
          addressString += newAddress.village ? ' '+newAddress.village:'';
          addressString += newAddress.city ? ' '+newAddress.city:'';
          addressString += addressString.length>0?', ':'';
          addressString += newAddress.country ? newAddress.country:'';
          this.address = addressString
          //trigger vuelidate touch to notify changed value in form field
          this.$v.address.$touch()
      },
  },
  computed: {
    
  },  
  methods: {
    async fetchAddress() {
      try {
        await this.fetchCurrentAddress()
      } catch (error) {
        this.$emit('error', error.message)
      }
    },
    async fetchCurrentAddress() {
      try {
        this.locationLoading = true;
        let {
          currentCoordinates,
          currentAddress,
        } = await locationService.currentAddress();
      
        currentAddress.latitude = currentCoordinates.latitude
        currentAddress.longitude = currentCoordinates.longitude
      
        this.locationAddress = currentAddress

        this.locationLat = currentCoordinates.latitude

        this.locationLon = currentCoordinates.longitude

      } catch (error) {
        console.log("fetchCurrentAddress",error)
        throw error
      } finally {
        this.locationLoading = false
      }
    },
    async fetchCoordinates() {
      try {
        this.locationLat = 0.0
        this.locationLon = 0.0
        let coords = await locationService.coordinatesByAddress(this.address);
        if (!_.isNumber(coords.latitude)) {
          coords.latitude = _.toNumber(coords.latitude);
          coords.longitude = _.toNumber(coords.longitude);
        }
        this.locationLat = coords.latitude
        this.locationLon = coords.longitude
      } catch (error) {
        this.$emit('error', error.message)
      }
    },
    async search(lbSearch = false) {
      if(typeof lbSearch === 'boolean' && lbSearch) {
        try {
          await this.fetchCurrentAddress()
        } catch (error) {
          this.$emit('error', error.message)
          if(!_.isUndefined(this.address) && this.address != "") {
            await this.fetchCoordinates()
          }
        }
      } else {
        if(!_.isUndefined(this.address) && this.address != "") {
          await this.fetchCoordinates()
        }
      }
      this.$emit('search')
    },
    resetLocationCoordinates() {
      this.locationLat = 0.0
      this.locationLon = 0.0
    },
    setSearchDirty(dirty = true) {
      if(!this.searchDirty && dirty) {
        this.searchDirty = dirty
      } else if(this.searchDirty && !dirty) { 
        this.searchDirty = dirty
      }
    },
    resetSearchDirty() {
      this.setSearchDirty(false)
    },
    resetSearch() {
      this.keyword = ''
      this.address = ''
      this.locationAddress = {}
      this.optionId = 0
      this.resetLocationCoordinates()
      //this.locationLat = 0.0
      //this.locationLon = 0.0
      this.locationLoading = false
      this.resetSearchDirty()
      //https://github.com/vuelidate/vuelidate/issues/132#issuecomment-660859862
      this.$nextTick(() => { this.$v.$reset() })
    },
 },
  
});

>>>>>>> b93c39cf32d719a77b044e90c88e7373debc3e16
export default VueLBSearchForm;