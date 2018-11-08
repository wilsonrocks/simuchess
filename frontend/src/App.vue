<template>
  <div id="app">
    <h1>Simuchess</h1>
    <CreatePlayer class="tile"/>
    <Stats class="tile"/>
    <Login
      class="tile"
      v-on:loggedIn="setToken"
      v-if="!jwt"
    />
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
  data: () => ({
    jwt: null,
  }),
  methods: {
    setToken(token) {
      this.jwt = token;
    },
  },
};
</script>

<style lang="scss">
.tile {
  border: 1px solid black;
  margin: 2px;
  display: inline-block;
}
</style>
