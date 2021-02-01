import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from './store/store'
import * as VueGoogleMaps from "vue2-google-maps";
import {
  ValidationProvider,
  ValidationObserver,
  extend,
  configure
} from 'vee-validate';
import {
  required,
  email
} from 'vee-validate/dist/rules';
import {
  firebaseInit
} from "@/shared/config/firebase";
import {
  gmapsConfig
} from "@/shared/config/gmaps";

import BaseButton from "@/shared/components/ui/BaseButton";
import Panel from "@/shared/components/ui/panel";
import Avatar from "@/shared/components/ui/avatar";
import Logo from "@/shared/components/SVG/logo";
import MapView from "@/shared/components/map/mapView";
import Fa from "@/shared/components/ui/fa";
import PickLocation from "@/shared/components/map/pickLocation";
import InputLocation from "@/shared/components/ui/inputLocation";
import Switch from "@/shared/components/ui/switch";
import GmapCustomMarker from 'vue2-gmap-custom-marker';

import {
  deepFind,
  decode
} from '@/shared/mixins/functions'
Vue.use(VueGoogleMaps, gmapsConfig);
//Vue Components
Vue.component("gmap-custom-marker", GmapCustomMarker);
Vue.component("switcher", Switch);
Vue.component("logo", Logo);
Vue.component("base-button", BaseButton);
Vue.component("panel", Panel);
Vue.component("avatar", Avatar);
Vue.component("fa", Fa);
Vue.component("pick-location", PickLocation);
Vue.component("input-location", InputLocation);
// vee validate configuration
configure({
  classes: {
    valid: 'is-valid',
    invalid: 'is-invalid',

  }
})
extend('email', email);

extend('required', {
  ...required,
  message: 'This field is required'
});
Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
Vue.component("map-view", MapView);
//Vue mixins
Vue.mixin({
  methods: {
    deepFind,
    decode
  }
})

//Vue moment configuration
Vue.use(require('vue-moment'));

Vue.config.productionTip = false

async function firebaseCallback(user) {
  if (user) {
    await store.dispatch('autoSignIn', {
      userId: user.uid,
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      loggedIn: true
    })
    await store.dispatch('loadTaxiAuth');
    if (router.currentRoute.path == "/auth") {
      if (router.currentRoute.query.redirect) {
        if (router.currentRoute.query.redirect == "/incoming" &&
          store.getters.isInTaxi) {
          router.push({
            path: `/orders/${store.getters.currentOrderId}`
          });
        } else {
          router.push({
            path: router.currentRoute.query.redirect
          })
        }
      } else {
        router.push({
          path: "/"
        })
      }
    }
    store.dispatch("notifications/loadNotificationsForTaxi");
  }
}

firebaseInit(firebaseCallback)

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')