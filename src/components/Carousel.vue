<template>
    <div class="carousel">
      <div class="carousel-images">
        <img 
          v-for="(image, index) in images" 
          :key="index" 
          :src="image" 
          :alt="'Slide ' + (index + 1)" 
          :class="{ active: index === currentSlide }"
        />
      </div>
      <button class="prev" @click="prevSlide">&lt;</button>
      <button class="next" @click="nextSlide">&gt;</button>
      <div class="indicators">
        <span 
          v-for="(image, index) in images" 
          :key="'dot-' + index" 
          :class="{ active: index === currentSlide }" 
          @click="goToSlide(index)"
        ></span>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  
  const props = defineProps({
    images: {
      type: Array,
      required: true
    }
  });
  
  const currentSlide = ref(0);
  
  const nextSlide = () => {
    currentSlide.value = (currentSlide.value + 1) % props.images.length;
  };
  
  const prevSlide = () => {
    currentSlide.value = 
      (currentSlide.value - 1 + props.images.length) % props.images.length;
  };
  
  const goToSlide = (index) => {
    currentSlide.value = index;
  };
  </script>
  
  <style scoped>
  .carousel {
    position: relative;
    max-width: 600px;
    margin: 0 auto;
    overflow: hidden;
  }
  
  .carousel-images {
    display: flex;
    transition: transform 0.5s ease-in-out;
    transform: translateX(calc(-100% * var(--currentSlide, 0)));
  }
  
  .carousel-images img {
    width: 100%;
    flex-shrink: 0;
    display: none;
  }
  
  .carousel-images img.active {
    display: block;
  }
  
  button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5);
    color: #fff;
    border: none;
    padding: 0.5rem 1rem;
    cursor: pointer;
    z-index: 10;
  }
  
  button.prev {
    left: 10px;
  }
  
  button.next {
    right: 10px;
  }
  
  .indicators {
    display: flex;
    justify-content: center;
    margin-top: 10px;
  }
  
  .indicators span {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 0 5px;
    background: #ccc;
    border-radius: 50%;
    cursor: pointer;
    transition: background 0.3s;
  }
  
  .indicators span.active {
    background: #333;
  }
  </style>
  