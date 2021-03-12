<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      Web monitoring
      <v-spacer></v-spacer>

    </v-app-bar>

    <v-main>
      <home></home>
    </v-main>
  </v-app>
</template>

<script lang="ts">
import Vue from "vue";
import Home from "./views/Home.vue";

export default Vue.extend({
  name: "App",

  components: {
    Home
  },

  data: () => ({
    //
  })
});
</script>
