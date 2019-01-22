
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import App from './index.vue'
import router from './router'
import VueLocalStorage from 'vue-localstorage'
import VueHolder from 'vue-holderjs';
import carousel from 'vue-owl-carousel';
import VTooltip from 'v-tooltip'
import FreeTransform from 'vue-free-transform'

 
Vue.use(VTooltip)

const VueUploadComponent = require('vue-upload-component')
Vue.component('file-upload', VueUploadComponent)
Vue.component('FreeTransform', FreeTransform)


Vue.use(VueHolder);
Vue.component('carousel',carousel);

Vue.use(VueLocalStorage, {
  name: 'ls',
  bind: true
})

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

const files = require.context('./', true, /\.vue$/i)
files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
});
