/*!
 * vue-cookie-law v1.13.3
 * (c) 2020 Jakub Juszczak <jakub@posteo.de>
 * 
 */
(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define("CookieLaw", [], factory);
	else if(typeof exports === 'object')
		exports["CookieLaw"] = factory();
	else
		root["CookieLaw"] = factory();
})(this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 4);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(2);
if(typeof content === 'string') content = [[module.i, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var add = __webpack_require__(5).default
var update = add("624a20fb", content, true, {});

/***/ }),
/* 1 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var _node_modules_vue_style_loader_index_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_lib_index_js_vue_loader_options_CookieLaw_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(0);
/* harmony import */ var _node_modules_vue_style_loader_index_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_lib_index_js_vue_loader_options_CookieLaw_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_vue_style_loader_index_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_lib_index_js_vue_loader_options_CookieLaw_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0__);
/* unused harmony reexport * */
 /* unused harmony default export */ var _unused_webpack_default_export = (_node_modules_vue_style_loader_index_js_node_modules_css_loader_dist_cjs_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_sass_loader_dist_cjs_js_node_modules_vue_loader_lib_index_js_vue_loader_options_CookieLaw_vue_vue_type_style_index_0_lang_scss___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

// Imports
var ___CSS_LOADER_API_IMPORT___ = __webpack_require__(3);
exports = ___CSS_LOADER_API_IMPORT___(false);
// Module
exports.push([module.i, ".Cookie{position:fixed;overflow:hidden;box-sizing:border-box;z-index:9999;width:100%;display:flex;justify-content:space-between;align-items:baseline;flex-direction:column}.Cookie>*{margin:.9375rem 0;align-self:center}@media screen and (min-width: 48rem){.Cookie{flex-flow:row}.Cookie>*{margin:0}}.Cookie--top{top:0;left:0;right:0}.Cookie--bottom{bottom:0;left:0;right:0}.Cookie__buttons{display:flex;flex-direction:column}.Cookie__buttons>*{margin:.3125rem 0}@media screen and (min-width: 48rem){.Cookie__buttons{flex-direction:row}.Cookie__buttons>*{margin:0 .9375rem}}.Cookie__button{cursor:pointer;align-self:center;white-space:nowrap}.Cookie__declineButton{cursor:pointer;align-self:center;white-space:nowrap}.Cookie--base{background:#F1F1F1;color:#232323;padding:1.250em}.Cookie--base .Cookie__button{background:#97D058;padding:0.625em 3.125em;color:#fff;border-radius:0;border:0;font-size:1em}.Cookie--base .Cookie__button:hover{background:#7ebf36}.Cookie--base .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#727272;border-radius:0;border:0;font-size:1em}.Cookie--base .Cookie__button--decline:hover{background:#cbcbcb}.Cookie--base--rounded{background:#F1F1F1;color:#232323;padding:1.250em}.Cookie--base--rounded .Cookie__button{background:#97D058;padding:0.625em 3.125em;color:#fff;border-radius:20px;border:0;font-size:1em}.Cookie--base--rounded .Cookie__button:hover{background:#7ebf36}.Cookie--base--rounded .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#727272;border-radius:20px;border:0;font-size:1em}.Cookie--base--rounded .Cookie__button--decline:hover{background:#cbcbcb}.Cookie--blood-orange{background:#424851;color:#fff;padding:1.250em}.Cookie--blood-orange .Cookie__button{background:#E76A68;padding:0.625em 3.125em;color:#fff;border-radius:0;border:0;font-size:1em}.Cookie--blood-orange .Cookie__button:hover{background:#e03f3c}.Cookie--blood-orange .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#000;border-radius:0;border:0;font-size:1em}.Cookie--blood-orange .Cookie__button--decline:hover{background:#202327}.Cookie--blood-orange--rounded{background:#424851;color:#fff;padding:1.250em}.Cookie--blood-orange--rounded .Cookie__button{background:#E76A68;padding:0.625em 3.125em;color:#fff;border-radius:20px;border:0;font-size:1em}.Cookie--blood-orange--rounded .Cookie__button:hover{background:#e03f3c}.Cookie--blood-orange--rounded .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#000;border-radius:20px;border:0;font-size:1em}.Cookie--blood-orange--rounded .Cookie__button--decline:hover{background:#202327}.Cookie--dark-lime{background:#424851;color:#fff;padding:1.250em}.Cookie--dark-lime .Cookie__button{background:#97D058;padding:0.625em 3.125em;color:#fff;border-radius:0;border:0;font-size:1em}.Cookie--dark-lime .Cookie__button:hover{background:#7ebf36}.Cookie--dark-lime .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#000;border-radius:0;border:0;font-size:1em}.Cookie--dark-lime .Cookie__button--decline:hover{background:#202327}.Cookie--dark-lime--rounded{background:#424851;color:#fff;padding:1.250em}.Cookie--dark-lime--rounded .Cookie__button{background:#97D058;padding:0.625em 3.125em;color:#fff;border-radius:20px;border:0;font-size:1em}.Cookie--dark-lime--rounded .Cookie__button:hover{background:#7ebf36}.Cookie--dark-lime--rounded .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#000;border-radius:20px;border:0;font-size:1em}.Cookie--dark-lime--rounded .Cookie__button--decline:hover{background:#202327}.Cookie--royal{background:#FBC227;color:#232323;padding:1.250em}.Cookie--royal .Cookie__button{background:#726CEA;padding:0.625em 3.125em;color:#fff;border-radius:0;border:0;font-size:1em}.Cookie--royal .Cookie__button:hover{background:#473fe4}.Cookie--royal .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#221901;border-radius:0;border:0;font-size:1em}.Cookie--royal .Cookie__button--decline:hover{background:#d29a04}.Cookie--royal--rounded{background:#FBC227;color:#232323;padding:1.250em}.Cookie--royal--rounded .Cookie__button{background:#726CEA;padding:0.625em 3.125em;color:#fff;border-radius:20px;border:0;font-size:1em}.Cookie--royal--rounded .Cookie__button:hover{background:#473fe4}.Cookie--royal--rounded .Cookie__button--decline{background:transparent;padding:0.625em 3.125em;color:#221901;border-radius:20px;border:0;font-size:1em}.Cookie--royal--rounded .Cookie__button--decline:hover{background:#d29a04}.slideFromTop-enter,.slideFromTop-leave-to{transform:translate(0px, -12.5em)}.slideFromTop-enter-to,.slideFromTop-leave{transform:translate(0px, 0px)}.slideFromBottom-enter,.slideFromBottom-leave-to{transform:translate(0px, 12.5em)}.slideFromBottom-enter-to,.slideFromBottom-leave{transform:translate(0px, 0px)}.slideFromBottom-enter-active,.slideFromBottom-leave-active,.slideFromTop-enter-active,.slideFromTop-leave-active{transition:transform .4s ease-in}.fade-enter-active,.fade-leave-active{transition:opacity .5s}.fade-enter,.fade-leave-to{opacity:0}\n", ""]);
// Exports
module.exports = exports;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


/*
  MIT License http://www.opensource.org/licenses/mit-license.php
  Author Tobias Koppers @sokra
*/
// css base code, injected by the css-loader
// eslint-disable-next-line func-names
module.exports = function (useSourceMap) {
  var list = []; // return the list of modules as css string

  list.toString = function toString() {
    return this.map(function (item) {
      var content = cssWithMappingToString(item, useSourceMap);

      if (item[2]) {
        return "@media ".concat(item[2], " {").concat(content, "}");
      }

      return content;
    }).join('');
  }; // import a list of modules into the list
  // eslint-disable-next-line func-names


  list.i = function (modules, mediaQuery, dedupe) {
    if (typeof modules === 'string') {
      // eslint-disable-next-line no-param-reassign
      modules = [[null, modules, '']];
    }

    var alreadyImportedModules = {};

    if (dedupe) {
      for (var i = 0; i < this.length; i++) {
        // eslint-disable-next-line prefer-destructuring
        var id = this[i][0];

        if (id != null) {
          alreadyImportedModules[id] = true;
        }
      }
    }

    for (var _i = 0; _i < modules.length; _i++) {
      var item = [].concat(modules[_i]);

      if (dedupe && alreadyImportedModules[item[0]]) {
        // eslint-disable-next-line no-continue
        continue;
      }

      if (mediaQuery) {
        if (!item[2]) {
          item[2] = mediaQuery;
        } else {
          item[2] = "".concat(mediaQuery, " and ").concat(item[2]);
        }
      }

      list.push(item);
    }
  };

  return list;
};

function cssWithMappingToString(item, useSourceMap) {
  var content = item[1] || ''; // eslint-disable-next-line prefer-destructuring

  var cssMapping = item[3];

  if (!cssMapping) {
    return content;
  }

  if (useSourceMap && typeof btoa === 'function') {
    var sourceMapping = toComment(cssMapping);
    var sourceURLs = cssMapping.sources.map(function (source) {
      return "/*# sourceURL=".concat(cssMapping.sourceRoot || '').concat(source, " */");
    });
    return [content].concat(sourceURLs).concat([sourceMapping]).join('\n');
  }

  return [content].join('\n');
} // Adapted from convert-source-map (MIT)


function toComment(sourceMap) {
  // eslint-disable-next-line no-undef
  var base64 = btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap))));
  var data = "sourceMappingURL=data:application/json;charset=utf-8;base64,".concat(base64);
  return "/*# ".concat(data, " */");
}

/***/ }),
/* 4 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./src/components/CookieLaw.vue?vue&type=template&id=e565edd6&
var render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('transition',{attrs:{"appear":"","name":_vm.transitionName}},[(_vm.isOpen)?_c('div',{staticClass:"Cookie",class:[_vm.containerPosition, _vm.cookieTheme]},[_vm._t("default",[_c('div',{staticClass:"Cookie__content"},[_vm._t("message",[_vm._v(_vm._s(_vm.message))])],2),_vm._v(" "),_c('div',{staticClass:"Cookie__buttons"},[(_vm.externalButtonLink)?_c('a',{class:_vm.buttonClass,attrs:{"target":_vm.target,"href":_vm.buttonLink}},[_vm._v(_vm._s(_vm.buttonLinkText))]):_vm._e(),_vm._v(" "),(_vm.internalButtonLink)?_c('router-link',{class:_vm.buttonClass,attrs:{"to":_vm.buttonLink}},[_vm._v(_vm._s(_vm.buttonLinkText))]):_vm._e(),_vm._v(" "),(_vm.buttonDecline)?_c('button',{class:_vm.buttonDeclineClass,on:{"click":_vm.decline}},[_vm._v(_vm._s(_vm.buttonDeclineText))]):_vm._e(),_vm._v(" "),_c('button',{class:_vm.buttonClass,on:{"click":_vm.accept}},[_vm._v(_vm._s(_vm.buttonText))])],1)],{"accept":_vm.accept,"close":_vm.close,"decline":_vm.decline,"open":_vm.open})],2):_vm._e()])}
var staticRenderFns = []


// CONCATENATED MODULE: ./src/components/CookieLaw.vue?vue&type=template&id=e565edd6&

// CONCATENATED MODULE: ./node_modules/tiny-cookie/es/util.js
function hasOwn(obj, key) {
  return Object.prototype.hasOwnProperty.call(obj, key);
} // Escape special characters.


function escapeRe(str) {
  return str.replace(/[.*+?^$|[\](){}\\-]/g, '\\$&');
} // Return a future date by the given string.


function computeExpires(str) {
  var lastCh = str.charAt(str.length - 1);
  var value = parseInt(str, 10);
  var expires = new Date();

  switch (lastCh) {
    case 'Y':
      expires.setFullYear(expires.getFullYear() + value);
      break;

    case 'M':
      expires.setMonth(expires.getMonth() + value);
      break;

    case 'D':
      expires.setDate(expires.getDate() + value);
      break;

    case 'h':
      expires.setHours(expires.getHours() + value);
      break;

    case 'm':
      expires.setMinutes(expires.getMinutes() + value);
      break;

    case 's':
      expires.setSeconds(expires.getSeconds() + value);
      break;

    default:
      expires = new Date(str);
  }

  return expires;
} // Convert an object to a cookie option string.


function convert(opts) {
  var res = ''; // eslint-disable-next-line

  for (var key in opts) {
    if (hasOwn(opts, key)) {
      if (/^expires$/i.test(key)) {
        var expires = opts[key];

        if (typeof expires !== 'object') {
          expires += typeof expires === 'number' ? 'D' : '';
          expires = computeExpires(expires);
        }

        res += ";" + key + "=" + expires.toUTCString();
      } else if (/^secure$/.test(key)) {
        if (opts[key]) {
          res += ";" + key;
        }
      } else {
        res += ";" + key + "=" + opts[key];
      }
    }
  }

  if (!hasOwn(opts, 'path')) {
    res += ';path=/';
  }

  return res;
}


// CONCATENATED MODULE: ./node_modules/tiny-cookie/es/index.js
function _extends() { _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; return _extends.apply(this, arguments); }

 // Check if the browser cookie is enabled.

function isEnabled() {
  var key = '@key@';
  var value = '1';
  var re = new RegExp("(?:^|; )" + key + "=" + value + "(?:;|$)");
  document.cookie = key + "=" + value;
  var enabled = re.test(document.cookie);

  if (enabled) {
    // eslint-disable-next-line
    remove(key);
  }

  return enabled;
} // Get the cookie value by key.


function get(key, decoder) {
  if (decoder === void 0) {
    decoder = decodeURIComponent;
  }

  if (typeof key !== 'string' || !key) {
    return null;
  }

  var reKey = new RegExp("(?:^|; )" + escapeRe(key) + "(?:=([^;]*))?(?:;|$)");
  var match = reKey.exec(document.cookie);

  if (match === null) {
    return null;
  }

  return typeof decoder === 'function' ? decoder(match[1]) : match[1];
} // The all cookies


function getAll(decoder) {
  if (decoder === void 0) {
    decoder = decodeURIComponent;
  }

  var reKey = /(?:^|; )([^=]+?)(?:=([^;]*))?(?:;|$)/g;
  var cookies = {};
  var match;
  /* eslint-disable no-cond-assign */

  while (match = reKey.exec(document.cookie)) {
    reKey.lastIndex = match.index + match.length - 1;
    cookies[match[1]] = typeof decoder === 'function' ? decoder(match[2]) : match[2];
  }

  return cookies;
} // Set a cookie.


function set(key, value, encoder, options) {
  if (encoder === void 0) {
    encoder = encodeURIComponent;
  }

  if (typeof encoder === 'object' && encoder !== null) {
    /* eslint-disable no-param-reassign */
    options = encoder;
    encoder = encodeURIComponent;
    /* eslint-enable no-param-reassign */
  }

  var attrsStr = convert(options || {});
  var valueStr = typeof encoder === 'function' ? encoder(value) : value;
  var newCookie = key + "=" + valueStr + attrsStr;
  document.cookie = newCookie;
} // Remove a cookie by the specified key.


function remove(key, options) {
  var opts = {
    expires: -1
  };

  if (options) {
    opts = _extends({}, options, opts);
  }

  return set(key, 'a', opts);
} // Get the cookie's value without decoding.


function getRaw(key) {
  return get(key, null);
} // Set a cookie without encoding the value.


function setRaw(key, value, options) {
  return set(key, value, null, options);
}


// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--1-0!./node_modules/vue-loader/lib??vue-loader-options!./src/components/CookieLaw.vue?vue&type=script&lang=js&
function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

var STORAGE_TYPES = {
  local: 'localStorage',
  cookies: 'cookies'
};
/* harmony default export */ var CookieLawvue_type_script_lang_js_ = ({
  name: 'VueCookieLaw',
  props: {
    buttonText: {
      type: String,
      default: 'Got it!'
    },
    buttonDecline: {
      type: Boolean,
      default: false
    },
    buttonDeclineText: {
      type: String,
      default: 'Decline'
    },
    buttonLink: {
      type: [String, Object],
      required: false
    },
    buttonLinkText: {
      type: String,
      default: 'More info'
    },
    buttonLinkNewTab: {
      type: Boolean,
      default: false
    },
    message: {
      type: String,
      default: 'This website uses cookies to ensure you get the best experience on our website.'
    },
    theme: {
      type: String,
      default: 'base'
    },

    /**
     * Cookie Container position
     * bottom, top
     * @type {Object}
     */
    position: {
      type: String,
      default: 'bottom'
    },

    /**
     * Transition name has following possibilities
     * slideFromBottom
     * slideFromTop
     * fade
     * @type {Object}
     */
    transitionName: {
      type: String,
      default: 'slideFromBottom'
    },
    buttonClass: {
      type: String,
      default: 'Cookie__button'
    },
    buttonDeclineClass: {
      type: String,
      default: 'Cookie__button--decline'
    },
    storageName: {
      type: String,
      default: 'cookie:accepted'
    },
    storageType: {
      type: String,
      default: STORAGE_TYPES.local
    },
    cookieOptions: {
      type: Object,
      default: function _default() {},
      required: false
    }
  },
  data: function data() {
    return {
      supportsLocalStorage: true,
      isOpen: false
    };
  },
  computed: {
    containerPosition: function containerPosition() {
      return "Cookie--".concat(this.position);
    },
    cookieTheme: function cookieTheme() {
      return "Cookie--".concat(this.theme);
    },
    externalButtonLink: function externalButtonLink() {
      return typeof this.buttonLink === 'string' && this.buttonLink.length;
    },
    internalButtonLink: function internalButtonLink() {
      return _typeof(this.buttonLink) === 'object' && this.buttonLink != null && Object.keys(this.buttonLink).length;
    },
    target: function target() {
      return this.buttonLinkNewTab ? '_blank' : '_self';
    },
    canUseLocalStorage: function canUseLocalStorage() {
      return this.storageType === STORAGE_TYPES.local && this.supportsLocalStorage;
    }
  },
  created: function created() {
    if (this.storageType === STORAGE_TYPES.local) {
      // Check for availability of localStorage
      try {
        var test = '__vue-cookielaw-check-localStorage';

        if (typeof window !== 'undefined') {
          window.localStorage.setItem(test, test);
          window.localStorage.removeItem(test);
        }
      } catch (e) {
        console.info('Local storage is not supported, falling back to cookie use');
        this.supportsLocalStorage = false;
      }
    }

    if (!this.getVisited()) {
      this.isOpen = true;
    }
  },
  mounted: function mounted() {
    if (this.isAccepted()) {
      this.$emit('accept');
    }
  },
  methods: {
    setVisited: function setVisited() {
      if (this.canUseLocalStorage) {
        localStorage.setItem(this.storageName, true);
      } else {
        set(this.storageName, true, _objectSpread({}, this.cookieOptions, {
          expires: '1Y'
        }));
      }
    },
    setAccepted: function setAccepted() {
      if (this.canUseLocalStorage) {
        localStorage.setItem(this.storageName, true);
      } else {
        set(this.storageName, true, _objectSpread({}, this.cookieOptions, {
          expires: '1Y'
        }));
      }
    },
    setDeclined: function setDeclined() {
      if (this.canUseLocalStorage) {
        localStorage.setItem(this.storageName, false);
      } else {
        set(this.storageName, false, _objectSpread({}, this.cookieOptions, {
          expires: '1Y'
        }));
      }
    },
    getVisited: function getVisited() {
      var visited = false;

      if (this.canUseLocalStorage) {
        visited = localStorage.getItem(this.storageName);
      } else {
        visited = get(this.storageName);
      }

      if (typeof visited === 'string') {
        visited = JSON.parse(visited);
      }

      return !(visited === null || visited === undefined);
    },
    isAccepted: function isAccepted() {
      var accepted = false;

      if (this.canUseLocalStorage) {
        accepted = localStorage.getItem(this.storageName);
      } else {
        accepted = get(this.storageName);
      }

      if (typeof accepted === 'string') {
        accepted = JSON.parse(accepted);
      }

      return accepted;
    },
    accept: function accept() {
      this.setVisited();
      this.setAccepted();
      this.isOpen = false;
      this.$emit('accept');
    },
    close: function close() {
      this.isOpen = false;
      this.$emit('close');
    },
    decline: function decline() {
      this.setVisited();
      this.setDeclined();
      this.isOpen = false;
      this.$emit('decline');
    },
    revoke: function revoke() {
      if (this.canUseLocalStorage) {
        localStorage.removeItem(this.storageName);
      } else {
        remove(this.storageName);
      }

      this.isOpen = true;
      this.$emit('revoke');
    },
    open: function open() {
      if (!this.getVisited()) {
        this.isOpen = true;
      }
    }
  }
});
// CONCATENATED MODULE: ./src/components/CookieLaw.vue?vue&type=script&lang=js&
 /* harmony default export */ var components_CookieLawvue_type_script_lang_js_ = (CookieLawvue_type_script_lang_js_); 
// EXTERNAL MODULE: ./src/components/CookieLaw.vue?vue&type=style&index=0&lang=scss&
var CookieLawvue_type_style_index_0_lang_scss_ = __webpack_require__(1);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js
/* globals __VUE_SSR_CONTEXT__ */

// IMPORTANT: Do NOT use ES2015 features in this file (except for modules).
// This module is a runtime utility for cleaner component module output and will
// be included in the final webpack user bundle.

function normalizeComponent (
  scriptExports,
  render,
  staticRenderFns,
  functionalTemplate,
  injectStyles,
  scopeId,
  moduleIdentifier, /* server only */
  shadowMode /* vue-cli only */
) {
  // Vue.extend constructor export interop
  var options = typeof scriptExports === 'function'
    ? scriptExports.options
    : scriptExports

  // render functions
  if (render) {
    options.render = render
    options.staticRenderFns = staticRenderFns
    options._compiled = true
  }

  // functional template
  if (functionalTemplate) {
    options.functional = true
  }

  // scopedId
  if (scopeId) {
    options._scopeId = 'data-v-' + scopeId
  }

  var hook
  if (moduleIdentifier) { // server build
    hook = function (context) {
      // 2.3 injection
      context =
        context || // cached call
        (this.$vnode && this.$vnode.ssrContext) || // stateful
        (this.parent && this.parent.$vnode && this.parent.$vnode.ssrContext) // functional
      // 2.2 with runInNewContext: true
      if (!context && typeof __VUE_SSR_CONTEXT__ !== 'undefined') {
        context = __VUE_SSR_CONTEXT__
      }
      // inject component styles
      if (injectStyles) {
        injectStyles.call(this, context)
      }
      // register component module identifier for async chunk inferrence
      if (context && context._registeredComponents) {
        context._registeredComponents.add(moduleIdentifier)
      }
    }
    // used by ssr in case component is cached and beforeCreate
    // never gets called
    options._ssrRegister = hook
  } else if (injectStyles) {
    hook = shadowMode
      ? function () { injectStyles.call(this, this.$root.$options.shadowRoot) }
      : injectStyles
  }

  if (hook) {
    if (options.functional) {
      // for template-only hot-reload because in that case the render fn doesn't
      // go through the normalizer
      options._injectStyles = hook
      // register for functional component in vue file
      var originalRender = options.render
      options.render = function renderWithStyleInjection (h, context) {
        hook.call(context)
        return originalRender(h, context)
      }
    } else {
      // inject component registration as beforeCreate hook
      var existing = options.beforeCreate
      options.beforeCreate = existing
        ? [].concat(existing, hook)
        : [hook]
    }
  }

  return {
    exports: scriptExports,
    options: options
  }
}

// CONCATENATED MODULE: ./src/components/CookieLaw.vue






/* normalize component */

var component = normalizeComponent(
  components_CookieLawvue_type_script_lang_js_,
  render,
  staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* harmony default export */ var CookieLaw = __webpack_exports__["default"] = (component.exports);

/***/ }),
/* 5 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXPORTS
__webpack_require__.d(__webpack_exports__, "default", function() { return /* binding */ addStylesClient; });

// CONCATENATED MODULE: ./node_modules/vue-style-loader/lib/listToStyles.js
/**
 * Translates the list format produced by css-loader into something
 * easier to manipulate.
 */
function listToStyles (parentId, list) {
  var styles = []
  var newStyles = {}
  for (var i = 0; i < list.length; i++) {
    var item = list[i]
    var id = item[0]
    var css = item[1]
    var media = item[2]
    var sourceMap = item[3]
    var part = {
      id: parentId + ':' + i,
      css: css,
      media: media,
      sourceMap: sourceMap
    }
    if (!newStyles[id]) {
      styles.push(newStyles[id] = { id: id, parts: [part] })
    } else {
      newStyles[id].parts.push(part)
    }
  }
  return styles
}

// CONCATENATED MODULE: ./node_modules/vue-style-loader/lib/addStylesClient.js
/*
  MIT License http://www.opensource.org/licenses/mit-license.php
  Author Tobias Koppers @sokra
  Modified by Evan You @yyx990803
*/



var hasDocument = typeof document !== 'undefined'

if (typeof DEBUG !== 'undefined' && DEBUG) {
  if (!hasDocument) {
    throw new Error(
    'vue-style-loader cannot be used in a non-browser environment. ' +
    "Use { target: 'node' } in your Webpack config to indicate a server-rendering environment."
  ) }
}

/*
type StyleObject = {
  id: number;
  parts: Array<StyleObjectPart>
}

type StyleObjectPart = {
  css: string;
  media: string;
  sourceMap: ?string
}
*/

var stylesInDom = {/*
  [id: number]: {
    id: number,
    refs: number,
    parts: Array<(obj?: StyleObjectPart) => void>
  }
*/}

var head = hasDocument && (document.head || document.getElementsByTagName('head')[0])
var singletonElement = null
var singletonCounter = 0
var isProduction = false
var noop = function () {}
var options = null
var ssrIdKey = 'data-vue-ssr-id'

// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
// tags it will allow on a page
var isOldIE = typeof navigator !== 'undefined' && /msie [6-9]\b/.test(navigator.userAgent.toLowerCase())

function addStylesClient (parentId, list, _isProduction, _options) {
  isProduction = _isProduction

  options = _options || {}

  var styles = listToStyles(parentId, list)
  addStylesToDom(styles)

  return function update (newList) {
    var mayRemove = []
    for (var i = 0; i < styles.length; i++) {
      var item = styles[i]
      var domStyle = stylesInDom[item.id]
      domStyle.refs--
      mayRemove.push(domStyle)
    }
    if (newList) {
      styles = listToStyles(parentId, newList)
      addStylesToDom(styles)
    } else {
      styles = []
    }
    for (var i = 0; i < mayRemove.length; i++) {
      var domStyle = mayRemove[i]
      if (domStyle.refs === 0) {
        for (var j = 0; j < domStyle.parts.length; j++) {
          domStyle.parts[j]()
        }
        delete stylesInDom[domStyle.id]
      }
    }
  }
}

function addStylesToDom (styles /* Array<StyleObject> */) {
  for (var i = 0; i < styles.length; i++) {
    var item = styles[i]
    var domStyle = stylesInDom[item.id]
    if (domStyle) {
      domStyle.refs++
      for (var j = 0; j < domStyle.parts.length; j++) {
        domStyle.parts[j](item.parts[j])
      }
      for (; j < item.parts.length; j++) {
        domStyle.parts.push(addStyle(item.parts[j]))
      }
      if (domStyle.parts.length > item.parts.length) {
        domStyle.parts.length = item.parts.length
      }
    } else {
      var parts = []
      for (var j = 0; j < item.parts.length; j++) {
        parts.push(addStyle(item.parts[j]))
      }
      stylesInDom[item.id] = { id: item.id, refs: 1, parts: parts }
    }
  }
}

function createStyleElement () {
  var styleElement = document.createElement('style')
  styleElement.type = 'text/css'
  head.appendChild(styleElement)
  return styleElement
}

function addStyle (obj /* StyleObjectPart */) {
  var update, remove
  var styleElement = document.querySelector('style[' + ssrIdKey + '~="' + obj.id + '"]')

  if (styleElement) {
    if (isProduction) {
      // has SSR styles and in production mode.
      // simply do nothing.
      return noop
    } else {
      // has SSR styles but in dev mode.
      // for some reason Chrome can't handle source map in server-rendered
      // style tags - source maps in <style> only works if the style tag is
      // created and inserted dynamically. So we remove the server rendered
      // styles and inject new ones.
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  if (isOldIE) {
    // use singleton mode for IE9.
    var styleIndex = singletonCounter++
    styleElement = singletonElement || (singletonElement = createStyleElement())
    update = applyToSingletonTag.bind(null, styleElement, styleIndex, false)
    remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true)
  } else {
    // use multi-style-tag mode in all other cases
    styleElement = createStyleElement()
    update = applyToTag.bind(null, styleElement)
    remove = function () {
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  update(obj)

  return function updateStyle (newObj /* StyleObjectPart */) {
    if (newObj) {
      if (newObj.css === obj.css &&
          newObj.media === obj.media &&
          newObj.sourceMap === obj.sourceMap) {
        return
      }
      update(obj = newObj)
    } else {
      remove()
    }
  }
}

var replaceText = (function () {
  var textStore = []

  return function (index, replacement) {
    textStore[index] = replacement
    return textStore.filter(Boolean).join('\n')
  }
})()

function applyToSingletonTag (styleElement, index, remove, obj) {
  var css = remove ? '' : obj.css

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = replaceText(index, css)
  } else {
    var cssNode = document.createTextNode(css)
    var childNodes = styleElement.childNodes
    if (childNodes[index]) styleElement.removeChild(childNodes[index])
    if (childNodes.length) {
      styleElement.insertBefore(cssNode, childNodes[index])
    } else {
      styleElement.appendChild(cssNode)
    }
  }
}

function applyToTag (styleElement, obj) {
  var css = obj.css
  var media = obj.media
  var sourceMap = obj.sourceMap

  if (media) {
    styleElement.setAttribute('media', media)
  }
  if (options.ssrId) {
    styleElement.setAttribute(ssrIdKey, obj.id)
  }

  if (sourceMap) {
    // https://developer.chrome.com/devtools/docs/javascript-debugging
    // this makes source maps inside style tags work properly in Chrome
    css += '\n/*# sourceURL=' + sourceMap.sources[0] + ' */'
    // http://stackoverflow.com/a/26603875
    css += '\n/*# sourceMappingURL=data:application/json;base64,' + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + ' */'
  }

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = css
  } else {
    while (styleElement.firstChild) {
      styleElement.removeChild(styleElement.firstChild)
    }
    styleElement.appendChild(document.createTextNode(css))
  }
}


/***/ })
/******/ ]);
});