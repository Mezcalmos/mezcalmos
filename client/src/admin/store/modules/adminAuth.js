import { firebaseDatabase } from '@/shared/config/firebase'
// import { apolloClient } from '@/config/apollo'
// import gql from 'graphql-tag'
export default {
  state() {
    return {
      isAdmin: false,
    };
  },
  getters: {
    isAdmin(state) {
      return state.isAdmin;
    }
  },
  actions: {
    async loadAdminAuth(context) {
      let userId = context.rootGetters.userId
      let isAdmin = (await firebaseDatabase().ref(`admins/${userId}/authorized`).once('value')).val();
      isAdmin = isAdmin != null && isAdmin == true 
      context.commit('saveIsAdmin', isAdmin)
      if(isAdmin) {
        context.dispatch('messages/loadMessages')
      }
    }
  },
  mutations: {
    saveIsAdmin(state, payload) {
      state.isAdmin = payload;
    }
  }
}