<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './components/NavBar.vue'
import footerbar from './components/footerbar.vue';


</script>

<template>
  <header>
    <!--<Navbar /> for uptrack--> 
  </header> 
  
  <main>
    <RouterView />
  </main>
  <footer>
    <footerbar/>
  </footer>
</template>

<style scoped>
header {
  line-height: 1.5;
  height: 57px;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}
footer {
    flex: 1; 
  }
  main {
  display: flex;
  flex-direction: column;
  min-height: 100vh; /* Ensures the page takes up the full height of the viewport */
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  nav {
    text-align: left;
    font-size: 1rem;
    padding: 1rem 0;
  }
  
}
</style>
