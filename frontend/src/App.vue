<template>
  <div id="app">
    <h1>Simuchess</h1>
    <CreatePlayer/>
    <Stats/>
  </div>
</template>

<script>
import CreatePlayer from "./components/CreatePlayer.vue";
import Stats from "./components/Stats.vue";


export default {
  name: "app",
  components: {
    CreatePlayer,
    Stats,
  }
};
</script>

<style lang="scss">
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
