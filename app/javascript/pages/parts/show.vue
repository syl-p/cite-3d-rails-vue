<template>
  <div class="absolute top-0 left-0 p-4 bg-white bg-opacity-80 text-black rounded shadow">
    <h1 class="mb-3 text-lg font-bold">{{ part.title }}</h1>
    <p class="mb-3 text-sm">{{ part.description }}</p>
    <p class="mb-3 text-sm">{{ part.object_name }}</p>
  </div>
</template>

<script lang="ts" setup>
  import { usePage } from "@inertiajs/vue3"

  import PersistentLayout from "@/layouts/PersistentLayout.vue"
  import VisitLayout from "@/layouts/VisitLayout.vue";
  import type { Part } from "@/types"

  defineOptions({ layout: [PersistentLayout, VisitLayout] })

  const part = usePage().props.part as Part
</script>