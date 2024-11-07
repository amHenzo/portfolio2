<script setup>
import WelcomeItem from './WelcomeItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
import IconVlc from './icons/IconVlc.vue'
</script>

<template>
  <WelcomeItem>
    <template #icon>
      <DocumentationIcon />
    </template>
    <template #heading>WHY</template>
    to showcase some of the 
      <a href="https://cults3d.com/@amzeno" target="_blank" rel="noopener">modeling </a>
    i do and 
    to showcase some of the 
      <a href="https://github.com/amHenzo" target="_blank" rel="noopener">coding </a>
    i do
  </WelcomeItem>
  <WelcomeItem>
    <template #icon>
      <IconVlc />
    </template>
    <template #heading>Info</template>
    this website is still under construction and dosen't show all the things i do 
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <ToolingIcon />
    </template>
    <template #heading>Tooling</template>

    This project is served and bundled with
    <a href="https://vitejs.dev/guide/features.html" target="_blank" rel="noopener">Vite</a>
    and i mainly program on visual studio Code


  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <EcosystemIcon />
    </template>
    <template #heading>Ecosystem</template>
    running on my own server i recycled with an old pc running <a href="https://www.docker.com" target="_blank" rel="noopener"> Docker</a>,
     and <a href="https://nginx.org/en/" target="_blank" rel="noopener">nginx </a>, on ubuntu server

    other tools i used : 
    <a href="https://pinia.vuejs.org/" target="_blank" rel="noopener">Pinia</a>,
    <a href="https://router.vuejs.org/" target="_blank" rel="noopener">Vue Router</a>
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <CommunityIcon />
    </template>
    <template #heading>Questions ?</template>

    You can 
    <a href="/Contactme" target="_blank" rel="noopener">Contact me </a> so we may discus on working together
    i will be selling stl on cults3d but you can message me to get the part printed
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <SupportIcon />
    </template>
    <template #heading>Support Me</template>
    you can support me by following me on cults3d or github
  </WelcomeItem>
</template>
