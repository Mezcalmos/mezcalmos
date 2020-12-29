import Vue from "vue";
import App from "./App.vue";
import router from "./router.js";
import store from "@/shared/store/store";
import * as VueGoogleMaps from "vue2-google-maps";
import {
  firebaseInit
} from "@/shared/config/firebase";

import BaseButton from "@/shared/components/ui/BaseButton";
import Panel from "@/shared/components/ui/panel";
import Avatar from "@/shared/components/ui/avatar";
import Logo from "@/shared/components/SVG/logo";
import MapView from "@/shared/components/map/mapView";
import Fa from "@/shared/components/ui/fa";
import PickLocation from "@/shared/components/map/pickLocation";
import "./registerServiceWorker";

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyB9vaAB9ptXhpeRs_JjxODEyuA_eO0tYu0",
    libraries: "places",
  },

  installComponents: true,
});
Vue.component("logo", Logo);
Vue.component("base-button", BaseButton);
Vue.component("panel", Panel);
Vue.component("avatar", Avatar);
Vue.component("fa", Fa);
Vue.component("pick-location", PickLocation);

Vue.component("map-view", MapView);
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
      router.push({ path: router.currentRoute.query.redirect });
    } else if (router.currentRoute.path == "/auth") {
      router.push({ path: "/" });
    }
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