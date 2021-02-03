import { setOptions, control } from 'leaflet';

var capitalizeFirstLetter = function (string) {
  if (!string || typeof string.charAt !== 'function') {
    return string;
  }
  return string.charAt(0).toUpperCase() + string.slice(1);
};

var propsBinder = function (vueElement, leafletElement, props, options) {
  var loop = function ( key ) {
    var setMethodName = 'set' + capitalizeFirstLetter(key);
    var deepValue =
      props[key].type === Object ||
      props[key].type === Array ||
      Array.isArray(props[key].type);
    if (props[key].custom && vueElement[setMethodName]) {
      vueElement.$watch(
        key,
        function (newVal, oldVal) {
          vueElement[setMethodName](newVal, oldVal);
        },
        {
          deep: deepValue,
        }
      );
    } else if (setMethodName === 'setOptions') {
      vueElement.$watch(
        key,
        function (newVal, oldVal) {
          setOptions(leafletElement, newVal);
        },
        {
          deep: deepValue,
        }
      );
    } else if (leafletElement[setMethodName]) {
      vueElement.$watch(
        key,
        function (newVal, oldVal) {
          leafletElement[setMethodName](newVal);
        },
        {
          deep: deepValue,
        }
      );
    }
  };

  for (var key in props) loop( key );
};

var collectionCleaner = function (options) {
  var result = {};
  for (var key in options) {
    var value = options[key];
    if (value !== null && value !== undefined) {
      result[key] = value;
    }
  }
  return result;
};

var optionsMerger = function (props, instance) {
  var options =
    instance.options && instance.options.constructor === Object
      ? instance.options
      : {};
  props = props && props.constructor === Object ? props : {};
  var result = collectionCleaner(options);
  props = collectionCleaner(props);
  var defaultProps = instance.$options.props;
  for (var key in props) {
    var def = defaultProps[key]
      ? defaultProps[key].default
      : Symbol('unique');
    if (result[key] && def !== props[key]) {
      console.warn(
        (key + " props is overriding the value passed in the options props")
      );
      result[key] = props[key];
    } else if (!result[key]) {
      result[key] = props[key];
    }
  }
  return result;
};

var ControlMixin = {
  props: {
    position: {
      type: String,
      default: 'topright'
    }
  },
  mounted: function mounted () {
    this.controlOptions = {
      position: this.position
    };
  },
  beforeDestroy: function beforeDestroy () {
    if (this.mapObject) {
      this.mapObject.remove();
    }
  }
};

var Options = {
  props: {
    options: {
      type: Object,
      default: function () { return ({}); }
    }
  }
};

/**
 * Add any custom component as a leaflet control-layers
 */
var script = {
  name: 'LControlLayers',
  mixins: [ControlMixin, Options],
  props: {
    collapsed: {
      type: Boolean,
      default: true,
    },
    autoZIndex: {
      type: Boolean,
      default: true,
    },
    hideSingleBase: {
      type: Boolean,
      default: false,
    },
    sortLayers: {
      type: Boolean,
      default: false,
    },
    sortFunction: {
      type: Function,
      default: undefined,
    },
  },
  mounted: function mounted() {
    var this$1 = this;

    var options = optionsMerger(
      Object.assign({}, this.controlOptions,
        {collapsed: this.collapsed,
        autoZIndex: this.autoZIndex,
        hideSingleBase: this.hideSingleBase,
        sortLayers: this.sortLayers,
        sortFunction: this.sortFunction}),
      this
    );
    this.mapObject = control.layers(null, null, options);
    propsBinder(this, this.mapObject, this.$options.props);
    this.$parent.registerLayerControl(this);
    this.$nextTick(function () {
      /**
       * Triggers when the component is ready
       * @type {object}
       * @property {object} mapObject - reference to leaflet map object
       */
      this$1.$emit('ready', this$1.mapObject);
    });
  },
  methods: {
    addLayer: function addLayer(layer) {
      if (layer.layerType === 'base') {
        this.mapObject.addBaseLayer(layer.mapObject, layer.name);
      } else if (layer.layerType === 'overlay') {
        this.mapObject.addOverlay(layer.mapObject, layer.name);
      }
    },
    removeLayer: function removeLayer(layer) {
      this.mapObject.removeLayer(layer.mapObject);
    },
  },
  render: function render() {
    return null;
  },
};

function normalizeComponent(template, style, script, scopeId, isFunctionalTemplate, moduleIdentifier /* server only */, shadowMode, createInjector, createInjectorSSR, createInjectorShadow) {
    if (typeof shadowMode !== 'boolean') {
        createInjectorSSR = createInjector;
        createInjector = shadowMode;
        shadowMode = false;
    }
    // Vue.extend constructor export interop.
    var options = typeof script === 'function' ? script.options : script;
    // render functions
    if (template && template.render) {
        options.render = template.render;
        options.staticRenderFns = template.staticRenderFns;
        options._compiled = true;
        // functional template
        if (isFunctionalTemplate) {
            options.functional = true;
        }
    }
    // scopedId
    if (scopeId) {
        options._scopeId = scopeId;
    }
    var hook;
    if (moduleIdentifier) {
        // server build
        hook = function (context) {
            // 2.3 injection
            context =
                context || // cached call
                    (this.$vnode && this.$vnode.ssrContext) || // stateful
                    (this.parent && this.parent.$vnode && this.parent.$vnode.ssrContext); // functional
            // 2.2 with runInNewContext: true
            if (!context && typeof __VUE_SSR_CONTEXT__ !== 'undefined') {
                context = __VUE_SSR_CONTEXT__;
            }
            // inject component styles
            if (style) {
                style.call(this, createInjectorSSR(context));
            }
            // register component module identifier for async chunk inference
            if (context && context._registeredComponents) {
                context._registeredComponents.add(moduleIdentifier);
            }
        };
        // used by ssr in case component is cached and beforeCreate
        // never gets called
        options._ssrRegister = hook;
    }
    else if (style) {
        hook = shadowMode
            ? function (context) {
                style.call(this, createInjectorShadow(context, this.$root.$options.shadowRoot));
            }
            : function (context) {
                style.call(this, createInjector(context));
            };
    }
    if (hook) {
        if (options.functional) {
            // register for functional component in vue file
            var originalRender = options.render;
            options.render = function renderWithStyleInjection(h, context) {
                hook.call(context);
                return originalRender(h, context);
            };
        }
        else {
            // inject component registration as beforeCreate hook
            var existing = options.beforeCreate;
            options.beforeCreate = existing ? [].concat(existing, hook) : [hook];
        }
    }
    return script;
}

var isOldIE = typeof navigator !== 'undefined' &&
    /msie [6-9]\\b/.test(navigator.userAgent.toLowerCase());

/* script */
var __vue_script__ = script;

/* template */

  /* style */
  var __vue_inject_styles__ = undefined;
  /* scoped */
  var __vue_scope_id__ = undefined;
  /* module identifier */
  var __vue_module_identifier__ = undefined;
  /* functional template */
  var __vue_is_functional_template__ = undefined;
  /* style inject */
  
  /* style inject SSR */
  
  /* style inject shadow dom */
  

  
  var __vue_component__ = normalizeComponent(
    {},
    __vue_inject_styles__,
    __vue_script__,
    __vue_scope_id__,
    __vue_is_functional_template__,
    __vue_module_identifier__,
    false,
    undefined,
    undefined,
    undefined
  );

export default __vue_component__;
