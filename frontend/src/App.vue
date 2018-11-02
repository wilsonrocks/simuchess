<template>
  <div id="app">
    <h1>Simuchess</h1>
    <CreatePlayer/>
    <Stats/>
    <Login/>
  </div>
</template>

<script>
import CreatePlayer from './components/CreatePlayer.vue';
import Stats from './components/Stats.vue';
import Login from './components/Login.vue';

export default {
  name: 'app',
  components: {
    CreatePlayer,
    Stats,
    Login,
  },
};
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
