<template>
  <div class="threejs-container" ref="threeContainer">
    <!-- Your 3D view will be rendered here -->
    <input type="range" id="light-control" min="0" max="100" value="50" />
    <input type="color" id="color-control" value="#ff5533" />
  </div>
</template>

<script>
import * as THREE from "three";
import { STLLoader } from "three/examples/jsm/loaders/STLLoader";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";

export default {
  mounted() {
    this.initThreeJS();
  },
  methods: {
    initThreeJS() {
      // Reference to the div with the canvas 
      const container = this.$refs.threeContainer;

      const scene = new THREE.Scene();
      scene.background = new THREE.Color(0xdddddd);

      const camera = new THREE.PerspectiveCamera(50, container.offsetWidth / container.offsetHeight, 1, 1000);
      camera.position.set(0, 100, 220);
      scene.add(camera);

      const renderer = new THREE.WebGLRenderer({ antialias: true });
      renderer.setSize(container.offsetWidth, container.offsetHeight);
      container.appendChild(renderer.domElement); // Attach the canvas to the specific div

      const ambientLight = new THREE.AmbientLight(0x4f4f4f, 1.5);
      scene.add(ambientLight);

      const directionalLight = new THREE.DirectionalLight(0xffffff, 1.5);
      directionalLight.position.set(0, 1, 1).normalize();
      scene.add(directionalLight);

      const loader = new STLLoader();
      let mesh, material;
      let color = 0xff5533;

      loader.load('/stl/cache_ampoules_v2.stl', (geometry) => {
        material = new THREE.MeshPhongMaterial({ color: color, specular: 0x111111, shininess: 200 });
        geometry.center();
        mesh = new THREE.Mesh(geometry, material);
        mesh.scale.set(0.5, 0.5, 0.5);
        scene.add(mesh);
      }, (error) => {
        console.error('Error loading the STL file:', error);
      });

      const controls = new OrbitControls(camera, renderer.domElement);
      controls.update();

      const animate = () => {
        requestAnimationFrame(animate);
        if (mesh) {
          mesh.rotation.y += 0.005;
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

      const lightControl = document.getElementById('light-control');
      lightControl.addEventListener('input', (event) => {
        const intensity = event.target.value / 100;
        directionalLight.intensity = intensity;
      });

      const colorControl = document.getElementById('color-control');
      colorControl.addEventListener('input', (event) => {
        material.color.set(event.target.value);
      });
    }
  }
};
</script>

<style scoped>
.threejs-container {
  width: 100%;
  height: 100vh;
  position: relative;
}
</style>
