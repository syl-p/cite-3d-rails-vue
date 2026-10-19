<template>
  <primitive
    v-if="state?.scene"
    :object="state?.scene"
    :scale="0.01"
  ></primitive>
</template>

<script setup lang="ts">
import { useGLTF, useTexture } from "@tresjs/cientos"
import * as THREE from "three"

import usePartLocation from "@/composables/usePartLocation"

const { state } = await useGLTF(
  "/cite-carcassonne-export/cite-carcassonne.gltf",
  { draco: true },
)

const { state: alphaMap } = await useTexture("/alpha-map.png")

const material = new THREE.MeshStandardMaterial({ color: "#e2e2e2", transparent: true })
material.onBeforeCompile = (shader) => {
  shader.uniforms.alphaTexture = {
    value: alphaMap.value,
  }
  shader.vertexShader = `
    varying vec2 vUv;
    varying vec3 vPosition;
    ${shader.vertexShader}
  `.replace(
    `#include <uv_vertex>`,
    `#include <uv_vertex>
      vUv = uv;
      vPosition = (modelMatrix * vec4(position, 1.0)).xyz;
    `,
  )

  shader.fragmentShader = `
        uniform sampler2D alphaTexture;
        varying vec3 vPosition;

        ${shader.fragmentShader}
      `.replace(
    `#include <dithering_fragment>`,
    `
          // Calcul des coordonnées de la texture alpha
          vec2 textureCoords = (vPosition.xz * 0.150) + 0.5;
          vec4 textureColor = texture2D(alphaTexture, textureCoords);
          float alpha = textureColor.a;

          // Appliquer l'alpha de la texture externe sans toucher à la couleur ou à la texture
          gl_FragColor.a *= alpha;

          #include <dithering_fragment>
        `,
  )
}

state.value?.scene.traverse((object) => {
  if (object instanceof THREE.Mesh) {
    object.material = material
  }
})

usePartLocation(state)
</script>
