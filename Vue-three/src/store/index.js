import Vue from 'vue'
import Vuex from 'vuex'
import Cookie from "js-cookie"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: Cookie.get("token") || "",
    SigIn: Cookie.get("token") ? 1 : 0,
  },
  mutations: {
    change_token(state, payload) {
      state.token = payload;
    },
    change_SigIn(state, payload) {
      state.SigIn = payload;
    },
  },
  actions: {
  },
  modules: {
  }
})
