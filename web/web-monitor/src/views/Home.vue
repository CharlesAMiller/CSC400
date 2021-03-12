<template>
  <div class="home" style="padding-top: 50px">
    <v-row>
      <v-col md="6">
        <v-card class="mx-auto" max-width="400">
          <v-list-item two-line>
            <v-list-item-content>
              <v-list-item-title class="headline">
                Status
              </v-list-item-title>
              <v-list-item-subtitle>{{ lastUpdate }}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>

          <v-card-text>
            <v-row align="center">
              <v-col class="display-3" cols="6"> {{ temp }}&deg;C </v-col>
              <v-col cols="6"> </v-col>
            </v-row>
          </v-card-text>

          <v-card-text>
            <v-row align="center">
              <v-col class="display-3" cols="6"> {{ humidity }}% </v-col>
              <v-col cols="6"> </v-col>
            </v-row>
          </v-card-text>

          <v-divider></v-divider>
        </v-card>
      </v-col>
      <v-col md="6">
        <div style="height: 150px; padding-right: 200px;">
          <chart-card
            :v-if="loaded"
            :chart-data="chartData"
            :options="{ maintainAspectRatio: false, responsive: true }"
          ></chart-card>
        </div>
      </v-col>
    </v-row>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from "vue-property-decorator";
import HelloWorld from "@/components/HelloWorld.vue"; // @ is an alias to /src
import ChartCard from "@/components/ChartCard.vue";
import { AxiosResponse } from "axios";

const axios = require("axios").default;

interface Status {
  temperature: number;
  humidity: number;
}

interface ChartData {
  labels: Array<string>;
  series: Array<number>;
}

@Component({
  components: {
    ChartCard
  }
})
export default class Home extends Vue {
  temp = 23.0; // Start with some filler data
  humidity = 64.0; // Start with some filler data.
  lastUpdate = "";
  data = []
//  data = [24, 22, 23];
  loaded = false;
  labels = [];
//  labels = ["12:25", "12:26", "12:27"];
  // chartData = {
  //   data: {
  //     labels: [
  //    ],
  //     datasets: [
  //       { data: [] },
  //     ],
  //   },
  // };

  get chartData() {
    return {
      data: {
        labels: this.labels
      },
      datasets: [
        {
          label: "temperature",
          data: this.data
        }
      ]
    };
  }

  created() {
    setInterval(() => {
      axios
        .get("http://localhost:8081/", { crossdomain: true })
        .then((response: AxiosResponse) => {
          this.temp = Math.round(response.data["temperature"]);
          this.humidity = Math.round(response.data["humidity"]);
          this.lastUpdate = Date().toString();
          // this.chartData.data.labels.push(this.lastUpdate);
          // this.chartData.data.datasets[0].data.push(this.humidity);
          this.data.push(this.temp);
          this.labels.push(this.lastUpdate);
          this.loaded = true;
        });
    }, 5000);
  }
}
</script>
