<template>
  <div class="threejs-container" ref="threeContainer">
     <div class="controls">
     <label>
        light intensity
        <input type="range" v-model="lightIntensity" min="0" max="100" />
      </label>
      <label>
        Color
        <input type="color" v-model="color" />
      </label>
    </div>

  </div>
</template>

<script>
import * as THREE from "three";
import { STLLoader } from "three/examples/jsm/loaders/STLLoader";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

export default {
  props: {
    stlFileName: {
      type: String,
      required: true, 
    },
  },
  data() {
    return {
      lightIntensity: 50, 
      color: "#" + Math.random().toString(16).slice(2, 8), 
    };
  },
  watch: {
    lightIntensity(newVal) {
      this.directionalLight.intensity = newVal / 100;
    },
    color(newVal) {
      if (this.material) {
        this.material.color.set(newVal);
      }
    },
  },
  mounted() {
    this.initThreeJS();
  },
  methods: {
    initThreeJS() {
      const container = this.$refs.threeContainer;

      const scene = new THREE.Scene();
      scene.background = new THREE.Color(0xdddddd);

      const camera = new THREE.PerspectiveCamera(20, container.offsetWidth / container.offsetHeight, 1, 1000);
      camera.position.set(0, 100, 220);
      scene.add(camera);

      const renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.setSize(container.offsetWidth, container.offsetHeight);
      container.appendChild(renderer.domElement);

      const ambientLight = new THREE.AmbientLight(0x4f4f4f, 1.5);
      scene.add(ambientLight);

      this.directionalLight = new THREE.DirectionalLight(0xffffff, this.lightIntensity / 100);
      this.directionalLight.position.set(0, 1, 1).normalize();
      scene.add(this.directionalLight);

      const loader = new STLLoader();
      loader.load(`/stl/${this.stlFileName}`, (geometry) => {
        this.material = new THREE.MeshPhongMaterial({ color: this.color, specular: 0x111111, shininess: 200 });
        geometry.center();
        this.mesh = new THREE.Mesh(geometry, this.material);
        this.mesh.scale.set(0.5, 0.5, 0.5);
        scene.add(this.mesh);
      }, (error) => {
        console.error('Error loading the STL file:', error);
      });

      const controls = new OrbitControls(camera, renderer.domElement);
      controls.update();

      const animate = () => {
        requestAnimationFrame(animate);
        if (this.mesh) {
          this.mesh.rotation.y += 0.005;
        }
        controls.update();
        renderer.render(scene, camera);
      };

      animate();

      window.addEventListener('resize', () => {
        const width = container.offsetWidth;
        const height = container.offsetHeight;
        renderer.setSize(width, height);
        camera.aspect = width / height;
        camera.updateProjectionMatrix();
      });
    },
  },
};

</script>

<style scoped>
.controls{
  margin: 10px;
}
input[type="range"] {
  -webkit-appearance: none;     /*Chrome */
  padding: 0;                   /* nécessaire pour IE */
  
}
.threejs-container {
  min-width: 250px;
  min-height: 200px;
  position: relative;
  max-width: 70%;
  max-height: 30%;
  overflow: hidden; 
  border-radius: 15px; 
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3); 
  border: 2px solid #cccccc; 
  display: flex;
  flex-direction: column-reverse;
}
</style>
