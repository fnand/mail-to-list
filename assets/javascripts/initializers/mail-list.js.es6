import { withPluginApi } from "discourse/lib/plugin-api";

function initializeMailList(api) {
  // https://github.com/discourse/discourse/blob/master/app/assets/javascripts/discourse/lib/plugin-api.js.es6
}

export default {
  name: "mail-list",

  initialize() {
    withPluginApi("0.8.31", initializeMailList);
  }
};
