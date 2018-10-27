<template>
  <div class="create-player">
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

    </form>
  </div>
</template>

<script>
export default {
  name: "CreatePlayer",
  props: {},
  data() {
    return {
      username: "",
      name: "",
      email: "",
      password: ""
    };
  }
};
</script>

<style scoped lang="scss">
.create-player {
  border: 1px solid black;
  display: inline-block;
  label {
    display: block;
  }
}
</style>
