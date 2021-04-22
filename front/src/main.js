import Vue from 'vue'
import App from './App.vue'
import router from './config/router'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import VueZoomer from './shared-components/zoom/index'

// Import Bootstrap an BootstrapVue CSS files (order is important)
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)
// Zoomer
Vue.use(VueZoomer)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
