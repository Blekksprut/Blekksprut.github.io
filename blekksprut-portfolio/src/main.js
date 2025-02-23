import "./assets/main.css";

import { createApp } from "vue";
import App from "./App.vue";
import { createVuetify } from "vuetify";
import "vuetify/styles";
import * as components from "vuetify/components";
import * as directives from "vuetify/directives";
import "@mdi/font/css/materialdesignicons.css";
import "@fortawesome/fontawesome-free/css/all.css";
import router from "./router";
import { VDateInput } from "vuetify/labs/VDateInput";

const vuetify = createVuetify({
  components: { VDateInput },
  directives,
});

const app = createApp(App);

app.use(router);
app.use(vuetify);
app.mount("#app");
