<template>
  <nav class="navbar" ref="navbar">
    <div class="logo"><RouterLink to="/" @click="closeMenu">portfolio</RouterLink></div>

    <div class="burger" @click="toggleMenu">
      <div class="line" :class="{'cross': isMenuActive}"></div>
      <div class="line" :class="{'cross': isMenuActive}"></div>
      <div class="line" :class="{'cross': isMenuActive}"></div>
    </div>

    <ul :class="['nav-links', { 'nav-active': isMenuActive }]" @click.stop>
      <li><RouterLink to="/" @click="closeMenu">Home</RouterLink></li>
      <li><RouterLink to="/all3DView" @click="closeMenu">Things I 3D</RouterLink></li>
      <li><RouterLink to="/alldevView" @click="closeMenu">Things I Dev</RouterLink></li>
      <li><RouterLink to="/about" @click="closeMenu">About</RouterLink></li>
      <li><RouterLink to="/Contactme" @click="closeMenu">Contact me</RouterLink></li>
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
      if (!navbar.contains(event.target)) {
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
  z-index: 15;
}

.logo {
  font-size: 1.5rem;
  font-weight: bold;
}

.nav-links {
  display: flex;
  padding-inline-start: 0px;
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

.burger .line.cross:nth-child(1) {
  transform: rotate(45deg);
  position: relative;
  top: 8px;
}

.burger .line.cross:nth-child(2) {
  opacity: 0; 
}

.burger .line.cross:nth-child(3) {
  transform: rotate(-45deg);
  position: relative;
  top: -8px;
}


@media screen and (max-width: 1024px) {
  .nav-links {
    position: absolute;
    right: 0;
    height: 100vh;
    top: 100%;
    flex-direction: column;
    background-color: #333;
    opacity: 70%;
    justify-content: center;
    align-items: center;
    width: 100%;
    transform: translateX(100%);
    z-index: 10;
  }

  .nav-links.nav-active {
    transform: translateX(0);
    margin-top: 0;
    padding-right: 0px;
  }

  .nav-links li {
    margin: 2rem 0;
  }

  .burger {
    display: block;
  }
}
</style>
