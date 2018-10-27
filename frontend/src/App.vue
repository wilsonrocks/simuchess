<template>
  <div id="app">
    <CreatePlayer/>
  </div>
</template>

<script>
import CreatePlayer from "./components/CreatePlayer.vue";

export default {
  name: "app",
  components: {
    CreatePlayer
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
