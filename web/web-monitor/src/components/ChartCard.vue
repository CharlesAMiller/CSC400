<script>
import { Line, mixins } from "vue-chartjs";

export default {
  extends: Line,
  mixins: [mixins.reactiveProp],
  props: ["options"],
  mounted() {
    // this.chartData is created in the mixin.
    // If you want to pass options please create a local options object
    console.log(this.chartData);
    this.renderChart(this.chartData, this.options);
  },

  watch: {
    chartData() {
      console.log("Update!");
      console.log(this.$data);
      this.$data._chart.update();
    }
  }
};
</script>

<style></style>
