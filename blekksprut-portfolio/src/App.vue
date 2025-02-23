<script setup>
import { RouterLink, RouterView } from "vue-router";
import HelloWorld from "./components/HelloWorld.vue";
</script>

<template>
  <header>
    <nav class="navbar fixed-top navbar-expand-sm justify-content-center">
      <RouterLink to="/">Home</RouterLink>
      <RouterLink to="/about">About</RouterLink>
      <RouterLink to="/contact">Contact</RouterLink>
      <RouterLink to="/music">Music</RouterLink>
    </nav>
  </header>

  <RouterView />
</template>

<style></style>
