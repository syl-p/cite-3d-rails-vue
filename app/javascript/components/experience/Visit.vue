<template>
    <main>
        <TresCanvas 
            clear-color="#fff"
            window-size>
            <TresPerspectiveCamera />
            <OrbitControls make-default />
            <TresAmbientLight :intensity="1.5" />
            <TresDirectionalLight cast-shadow :position="new THREE.Vector3(4, 5, 3)" :intensity="1" />
            <TresAxesHelper />

            <Suspense
                @resolve="
                () => {
                    loaded = true;
                }
                ">
                <Carcassonne />
            </Suspense>
        </TresCanvas>
        <slot />
    </main>
</template>
<script setup lang="ts">
    import { TresCanvas } from "@tresjs/core"
    import * as THREE from "three"
    import { ref } from "vue"

    import Carcassonne from "@/components/experience/Carcassonne.vue"
import { OrbitControls } from "@tresjs/cientos"

    const loaded = ref(false)
</script>