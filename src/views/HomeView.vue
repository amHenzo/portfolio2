<template>
  <section id="about" class="about">
    <div class="container">
      <h2>About Me</h2>
      <p>
        I'm a student pursuing a BUT in Computer Science at 
        IUT Grand Ouest Normandie. With a specialization in application realization, 
        I focus on designing, developing, and validating software solutions. 
        My interests include coding, modeling, and reverse-engineering projects, 
        especially in embedded systems and ECUs.  
      </p>
      <p>
        I thrive on solving complex problems and constantly seek opportunities to learn 
        and innovate. From hands-on hardware hacking to creating Dockerized solutions, 
        I aim to bridge the gap between software and hardware. My experience includes 
        working with C#, JavaScript, Vue.js, Java, alongside managing 
        private servers with Docker.
      </p>
        <p>
        <a href="./Contactme">
          Let's connect to build impactful solutions or discuss exciting projects!
        </a>

        <Carousel :images="imageList" />
      </p>
    </div>
  </section>
</template>

<script setup></script>

<style scoped>
.about {
  padding: 4rem 1rem;
}
.about h2 {
  text-align: center;
  margin-bottom: 1rem;
}
.about p {
  max-width: 800px;
  margin: 0 auto 1rem;
  text-align: center;
  line-height: 1.6;
}
</style>


<script setup>
import Carousel from '../components/Carousel.vue';

const imageFiles = import.meta.glob('@/assets/pictures/*.{png,jpg,jpeg,svg}');
const imageList = Object.keys(imageFiles);

</script>