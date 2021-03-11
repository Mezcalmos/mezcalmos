import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'

import taxisModule from './modules/taxis';
import locationModule from '@/shared/store/location';
import groceriesModule from './modules/groceries'
import ordersModule from './modules/orders';
import savedLocationsModule from './modules/savedLocations';
import notificationsModule from './modules/notifications'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxis: taxisModule,
    location: locationModule,
    groceries: groceriesModule,
    orders: ordersModule,
    messages: messagesModule,
    savedLocations: savedLocationsModule,
    notifications: notificationsModule
  },
  getters: {
    appName() {
      return "customer"
    }
  }
});

export default store;