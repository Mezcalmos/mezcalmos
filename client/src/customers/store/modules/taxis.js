import { firebaseDatabase, firebaseFunctions } from '@/shared/config/firebase'
export default {
  namespaced: true,
  state() {
    return {
      value: null,
      orderId: null
    };
  },
  actions: {
    loadTaxi(context, payload) {
      let orderId = context.state.orderId
      if(orderId){
        if (orderId == payload.orderId){
          return
        } else {
          firebaseDatabase().ref(`/orders/taxi/${orderId}`).off()
          context.commit('unloadTaxi')
        }
      }
      orderId  = payload.orderId;
      firebaseDatabase().ref(`/orders/taxi/${orderId}`).on('value', async snapshot => {
        let order = snapshot.val();
        console.log(order)
        // TODO: if unauthorized or wrong type of order redirect to home page
        context.commit('loadTaxi', {order:order, orderId:orderId})
      });
    },
    async requestTaxi(_, payload) {
      // let userId = context.rootGetters.userId
      let from  = payload.from
      let to = payload.to
      let response = await firebaseFunctions().httpsCallable('requestTaxi')({ from: from, to: to });
      return response;
    }
  },
  mutations: {
    loadTaxi(state, payload){
      state.value = payload.order
      state.orderId = payload.orderId
    },
    unloadTaxi(state){
      state.value = null
      state.orderId = null
    }
  },
  getters: {
    value(state) {
      return state.value;
    }
  }
};