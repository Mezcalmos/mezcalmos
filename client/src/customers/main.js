import Vue from "vue";
import App from "./App.vue";
import router from "./router.js";
import store from './store/store'
import * as VueGoogleMaps from "vue2-google-maps";
import GmapCustomMarker from 'vue2-gmap-custom-marker';

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
import notificationBtn from "@/shared/components/ui/notification";
import Card from "@/shared/components/ui/card";

import "./registerServiceWorker";
import {
  deepFind,
  geocodedAddress,
  decode

} from '@/shared/mixins/functions'
Vue.use(VueGoogleMaps, gmapsConfig);
Vue.component("gmap-custom-marker", GmapCustomMarker);

//Vue Components
Vue.component("card", Card);

Vue.component("notification-btn", notificationBtn);
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
    geocodedAddress,
    decode

  }
})

//Vue moment configuration
Vue.use(require('vue-moment'));
//Firebase state changed function
async function firebaseCallback(user) {
  if (user) {
    await store.dispatch("autoSignIn", {
      userId: user.uid,
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      loggedIn: true,
      // hasuraAuthToken: token
    });
    if (
      router.currentRoute.path == "/auth" &&
      router.currentRoute.query.redirect
    ) {
      router.push({
        path: router.currentRoute.query.redirect
      });
    } else if (router.currentRoute.path == "/auth") {
      router.push({
        path: "/"
      });
    }
    store.dispatch("notifications/loadNotificationsForCustomer");
  }
}

firebaseInit(firebaseCallback);

Vue.config.productionTip = false;

new Vue({
  render: (h) => h(App),
  router,
  store,
}).$mount("#app");

// HASURA STUFF
// import { apolloClient } from "./config/apollo";
// import { DefaultApolloClient } from "@vue/apollo-composable";
// app.provide(DefaultApolloClient, apolloClient)
// let token = await user.getIdToken()
// let tokenResult = await user.getIdTokenResult()
// let hasuraClaim = tokenResult.claims['https://hasura.io/jwt/claims']
// if (!hasuraClaim) {
//   console.log("No hasura, retrying")
//   await firebase.functions().httpsCallable('addHasuraClaims')();
//   token = await user.getIdToken(true)
// }
// console.log(token);