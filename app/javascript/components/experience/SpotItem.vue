<template>
  <div class="flex space-x-3">
    <div
      class="flex h-8 w-8 flex-col items-center justify-center rounded-full border border-yellow-500 bg-white font-bold text-black hover:bg-yellow-500"
    >
      <span class="block">{{index + 1}}</span>
    </div>
    <div class="flex-1">
      <h3 class="mb-1">
        <Link :href="parts.show(part.id)" class="font-bold hover:underline">
          {{ part.title }}
        </Link>
      </h3>
      <p class="mb-3 text-sm">{{ part.description }}</p>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { Link } from "@inertiajs/vue3";

import { parts } from "@/routes";
import type { Part } from "@/types"

const { part } = defineProps<{
  part: Part
  index: number
}>()
</script>