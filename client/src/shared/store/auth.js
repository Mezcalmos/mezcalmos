import {
  firebaseAuth
} from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      userId: null,
      name: null,
      email: null,
      photoUrl: null,
      hasuraAuthToken: null,
      loggedIn: false
    };
  },
  getters: {
    userId(state) {
      return state.userId;
    },
    userInfo(state) {
      return {
        name: state.name,
        email: state.email,
        photo: state.photoUrl,
        userId: state.userId
      }
    },
    hasuraAuthToken(state) {
      return state.hasuraAuthToken;
    },
    loggedIn(state) {
      return state.loggedIn;
    }
  },
  actions: {
    login() {
      var provider = new firebaseAuth.FacebookAuthProvider();
      firebaseAuth().signInWithPopup(provider);
    },
    async autoSignIn(context, payload) {
      await context.commit('saveAuthData', payload)
    },
    async logout(context) {
      console.log("Logging out")
      await firebaseAuth().signOut()
      context.commit('saveAuthData', {
        userId: null,
        name: null,
        email: null,
        photoURL: null,
        hasuraAuthToken: null,
        loggedIn: false
      })
    }
  },
  mutations: {
    async saveAuthData(state, payload) {
      state.userId = payload.userId;
      state.hasuraAuthToken = payload.hasuraAuthToken;
      state.name = payload.name;
      state.email = payload.email;
      state.photoUrl = payload.photoURL;
      state.loggedIn = payload.loggedIn;
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