import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import './plugins/element.js'
import router from './router'
import store from './store'

Vue.config.productionTip = true

router.beforeEach((to, from , next) => {
  if (to.meta.requireAuth) {
    if(store.state.token) {
      next();
    } else {
      next({
        path: 'login'
      })
    }
  } else {
    next();
  }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
