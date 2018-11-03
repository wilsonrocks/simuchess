<template>
  <div class="create-player">
    <h2>Sign up</h2>
    <form>
      <label>
        Username
        <input type="text" v-model="username"/>
      </label>

      <label>
        Email
        <input type="text" v-model="email"/>
      </label>

      <label>
        Name
        <input type="text" v-model="name"/>
      </label>

      <label>
        Password
        <input type="password" v-model="password"/>
      </label>

      <button v-on:click.prevent="createPlayerApiCall">
        Create Player
      </button>

      <span v-if="error" class="error">Something Went Wrong</span>

    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'CreatePlayer',
  props: {},
  data: () => ({
    username: '',
    name: '',
    email: '',
    password: '',
    error: false,
  }),
  methods: {
    createPlayerApiCall() {
      const { username, name, email, password } = this.$data;
      const payload = { username, name, email, password };
      axios
        .post('http://localhost:3000/player', payload)
        .then(() => {
          this.$data.error = false;
        })
        .catch(() => {
          this.$data.error = true;
        });
    },
  },
};
</script>

<style scoped lang="scss">
.create-player {
  label {
    display: block;
  }
}

.error {
  color: red;
}
</style>
