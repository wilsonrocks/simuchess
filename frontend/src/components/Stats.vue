<template>

  <div v-if="dataReceived" class="stats">
    <h2>Stats</h2>
    <p> {{stats.players}} players registered! </p>
    <p> {{stats.games}} games started! </p>
  </div>

</template>

<script>
import axios from 'axios';

export default {
  name: 'Stats',
  data: () => ({
    dataReceived: false,
    stats: {},
  }),
  mounted() {
    axios.get('http://localhost:3000/stats').then(response => {
      const { data } = response;
      this.dataReceived = true;
      this.stats = data[0];
    });
  },
};
</script>

<style lang="scss">
</style>
