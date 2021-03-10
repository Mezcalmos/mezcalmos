import Vuex from 'vuex'
import Vue from 'vue'

import authModule from '@/shared/store/auth';
import messagesModule from '@/shared/store/messages'
import positionModule from '@/shared/store/position';

import taxiAuthModule from './modules/taxiAuth'
import incomingOrdersModule from './modules/incomingOrders';
import pastOrdersModule from './modules/pastOrders';
import orderModule from './modules/order';
import notificationsModule from './modules/notifications'

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    auth: authModule,
    taxiAuth: taxiAuthModule,
    order: orderModule,
    incomingOrders: incomingOrdersModule,
    pastOrders: pastOrdersModule,
    messages: messagesModule,
    notifications: notificationsModule,
    position: positionModule
  },
  getters: {
    appName() {
      return "taxi"
    }
  }
});

export default store;