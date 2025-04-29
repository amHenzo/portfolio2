<template>
    <foot class="foot">
      <p>
        Made by 
        <a :href="githubLink" target="_blank" rel="noopener noreferrer">Enzo L.</a>
      </p>
      <p class="copyright" :title="altText">
        © {{ currentYear }} All Rights Reserved
      </p>
    </foot>
  </template>
  
  <script>
  export default {
    name: "Footer",
    data() {
      return {
        githubLink: "https://github.com/amHenzo",
        altText: "All Rights Reserved. Unauthorized use is prohibited.", 
      };
    },
    computed: {
      currentYear() {
        return new Date().getFullYear(); 
      },
    },
  };
  </script>
  
<style scoped>
.foot {
    display: flex;
    background-color: #505969;
    color: white;
    text-align: center;
    padding: 1rem 0;
    width: 100%;
    flex-direction: row;
    align-content: center;
    justify-content: center;
    align-items: center;
}

.foot a {
  color: #61dafb;
  text-decoration: none;
}

.foot a:hover {
  text-decoration: underline;
}

</style>