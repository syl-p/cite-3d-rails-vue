import { usePage } from "@inertiajs/vue3"
import { useTresContext } from "@tresjs/core"
import * as THREE from "three"
import type { GLTF, OrbitControls } from "three-stdlib"
import type { Ref } from "vue";
import { computed, watch } from "vue"

import type { Part } from "@/types"


export default function usePartLocation(model: Ref<GLTF | null>) {
  const part = computed(() => usePage().props.part as Part | undefined)
  
  // GET Object Position in World Space
  const target = computed<THREE.Vector3>(() => {
    const position = new THREE.Vector3()

    if (!model.value || !part.value?.object_name) return position

    model.value.scene.traverse((child) => {
      if (child.name === part.value?.object_name) {
        child.getWorldPosition(position)
      }
    })

    return position
  })

  const { camera, controls } = useTresContext()

  // Update camera target position when the part changes
  watch(
    () => part.value?.object_name,
    () => {
      const orbit = controls.value as OrbitControls | null
      if (orbit && target.value && part.value?.object_name) {
        console.log("Moving camera to part:", part.value.object_name, "at position:", target.value)
        const offset = new THREE.Vector3(1, 1, 1)
        camera.activeCamera.value.position.copy(target.value).add(offset)
        orbit.target.copy(target.value)
        orbit.update()
      }
    }
  )
}
