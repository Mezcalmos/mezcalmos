import { firebaseDatabase } from '@/shared/config/firebase'
export default {
    namespaced: true,
    state() {
      return {
        list: [],
        order: null,
        orderId: null
      };
    },
    actions: {
      async loadPastOrders(context) {
        let userId = context.rootGetters.userId
        let orders = (await firebaseDatabase().ref(`taxiDrivers/${userId}/orders/`).once('value')).val();
        context.commit('saveOrders', orders)
      }
    },
    mutations: {
      savePastOrders(state, payload){
        state.list = payload
      }
    },
    getters: {
      hasOrders(state) {
        return state.list && Object.keys(state.list).length > 0
      },
      list(state) {
        return state.list;
      } 
    }
  };