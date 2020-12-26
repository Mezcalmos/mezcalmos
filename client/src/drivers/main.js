import Vue from 'vue'
import App from './App.vue'
import router from './router.js'
import store from '@/shared/store/store'

import { firebaseInit } from '@/shared/config/firebase'

Vue.config.productionTip = false

async function firebaseCallback(user) {
  if (user) {
    await store.dispatch('autoSignIn', {
      userId: user.uid,
      name: user.displayName,
      email: user.email,
      photoURL: user.photoURL,
      loggedIn: true
      // hasuraAuthToken: token
    })
    if(router.currentRoute.path == "/auth" && router.currentRoute.query.redirect){
      router.push({path:router.currentRoute.query.redirect})
    } else {
      router.push({path:"/"})
    }
  }
}

firebaseInit(firebaseCallback)

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')

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