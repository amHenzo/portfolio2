<template>
  <nav class="navbar" ref="navbar">
    <div class="logo">portfolio</div>

    <div class="burger" @click="toggleMenu">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
    </div>

    <ul :class="['nav-links', { 'nav-active': isMenuActive }]" @click.stop>
      <li><RouterLink to="/" @click="closeMenu">Home</RouterLink></li>
      <li><RouterLink to="/about" @click="closeMenu">About</RouterLink></li>
      <li><RouterLink to="/all3DView" @click="closeMenu">The things I 3D</RouterLink></li>
    </ul>
  </nav>
</template>

<script>
import { RouterLink } from 'vue-router';

export default {
  data() {
    return {
      isMenuActive: false,
    };
  },
  methods: {
    toggleMenu() {
      this.isMenuActive = !this.isMenuActive;
    },
    closeMenu() {
      this.isMenuActive = false;
    },
    handleClickOutside(event) {
      const navbar = this.$refs.navbar;
      if (navbar && !navbar.contains(event.target)) {
        this.isMenuActive = false;
      }
    },
  },
  mounted() {
    document.addEventListener('click', this.handleClickOutside);
  },
  beforeDestroy() {
    document.removeEventListener('click', this.handleClickOutside);
  },
};
</script>

<style scoped>
body {
  margin: 0;
  font-family: Arial, sans-serif;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  background-color: #333;
  color: white;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 1000;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
}

.nav-links {
  display: flex;
  list-style: none;
  transition: transform 0.5s ease;
}

.nav-links li {
  margin: 0 1rem;
}

.nav-links a {
  color: white;
  text-decoration: none;
  font-size: 1.2rem;
}

.burger {
  display: none;
  cursor: pointer;
}

.burger .line {
  width: 25px;
  height: 3px;
  background-color: white;
  margin: 5px;
  transition: all 0.3s ease;
}

/* phone */
@media screen and (max-width: 768px) {
  .nav-links {
    position: absolute;
    right: 0;
    height: 100vh;
    top: 0;
    flex-direction: column;
    background-color: #333;
    opacity: 70%;
    justify-content: center;
    align-items: center;
    width: 100%;
    transform: translateX(100%);
  }

  .nav-links.nav-active {
    transform: translateX(0);
  }

  .nav-links li {
    margin: 2rem 0;
  }

  .burger {
    display: block;
    margin-right: 1.5rem;
  }
}
</style>
