import 'core-js/stable';
import 'regenerator-runtime/runtime';

import Vue from 'vue/dist/vue.esm';
import VueI18n from 'vue-i18n';
import TurbolinksAdapter from 'vue-turbolinks';

import {axios} from '../utils/axios/axios-config';
import {messages} from '../utils/i18n/messages';
import {components} from '../components/main.js';

Vue.prototype.$axios = axios;
Vue.use(TurbolinksAdapter);
Vue.use(VueI18n);

const i18n = new VueI18n({
  locale: 'pt-BR',
  messages,
});

document.addEventListener('turbolinks:load', () => {
  new Vue({
    i18n,
    el: '#app',
    components,
  });
});
