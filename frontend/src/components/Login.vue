<template>
<div class="login">
    <h2>Login</h2>
    <form>
      <label>
        Username
        <input type="text" v-model="username"/>
      </label>

      <label>
        Password
        <input type="password" v-model="password"/>
      </label>

      <button v-on:click.prevent="login">
        Login
      </button>

      <span v-if="error" class="error">Something Went Wrong</span>
    </form>
  </div>
  
</template>

<script>
import axios from 'axios';

export default {
  name: 'Login',
  data: () => ({
    username: '',
    password: '',
    jwt: '',
  }),
  methods: {
    login() {
      return axios
        .post('http://localhost:3000/rpc/login', {
          given_username: this.$data.username,
          given_password: this.$data.password,
        })
        .then(({ data }) => {
          this.$data.jwt = data;
        });
    },
  },
};
</script>

<style lang="scss">
.login {
  label {
    display: block;
  }
}
</style>
