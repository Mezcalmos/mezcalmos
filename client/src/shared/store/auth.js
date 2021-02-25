import {
  firebaseAuth,
  firebaseDatabase
} from '@/shared/config/firebase'

import {
  i18n
} from '@/shared/config/i18n'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      userId: null,
      info: null,
      hasuraAuthToken: null,
      loggedIn: false,
      logoutCallbacks: [],
    };
  },
  getters: {
    userId(state) {
      return state.userId;
    },
    userInfo(state) {
      return state.info
    },
    userLanguage(state) {
      return state.info.language
    },
    hasuraAuthToken(state) {
      return state.hasuraAuthToken;
    },
    loggedIn(state) {
      return state.loggedIn;
    },
    getUserDefaultLocation() {
      return {
        lat: 15.8720,
        long: -97.0767
      }
    }
  },
  actions: {
    async login() {
      var provider = new firebaseAuth.FacebookAuthProvider();
      await firebaseAuth().signInWithPopup(provider);
    },
    async autoSignIn(context, payload) {
      firebaseDatabase().ref(`users/${payload.userId}/info/`).on('value', function(snapshot) {
        context.commit('saveUserInfo', snapshot.val())
        let lang = snapshot.val().language
        if(lang){
          i18n.locale = lang
        } else {
          let browserLang = navigator.language.split('-')[0]
          let existingLanguages = {
            'en': true,
            'es': true
        }
          context.dispatch('setLanguage', !existingLanguages[browserLang] ? 'en' : browserLang)
        }
      })
      context.commit('saveAuthData', payload)
    },
    async logout(context) {
      firebaseDatabase().ref(`users/${context.state.userId}/info/`).off()
      await firebaseAuth().signOut()
      context.state.logoutCallbacks.forEach(cb => cb.func(...cb.args));
      context.commit('clearData')
    },
    setLanguage(context, payload) {
      firebaseDatabase().ref(`users/${context.state.userId}/info/language`).set(payload)
      i18n.locale = payload
    },
    saveLogoutCallback(context, payload) {
      context.commit('saveLogoutCallback', payload)
    }
  },
  mutations: {
    saveAuthData(state, payload) {
      state.userId = payload.userId;
      state.hasuraAuthToken = payload.hasuraAuthToken;
      state.loggedIn = payload.loggedIn;
    },
    saveUserInfo(state, payload) {
      state.info = payload
    },
    clearData(state) {
      state.userId = null;
      state.hasuraAuthToken = null;
      state.loggedIn = false;
      state.info = null
      state.logoutCallbacks = []
    },
    saveLogoutCallback(state, payload) {
      state.logoutCallbacks.push(payload)
    }

  }
}


// how to make hasura query
// const { data } = await apolloClient.query({
//   query: gql`
//     query MyQuery {
//         users {
//           name
//         }
//       }
//   ` })
// console.log("hasura query");
// console.log(data)