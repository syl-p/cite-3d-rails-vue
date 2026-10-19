<script setup lang="ts">
import { Head, usePage } from "@inertiajs/vue3"
import PersistentLayout from "@/layouts/PersistentLayout.vue"
import VisitLayout from "@/layouts/VisitLayout.vue"
import type { Part } from "@/types"
import SpotItem from "@/components/experience/SpotItem.vue"

defineOptions({ layout: [PersistentLayout, VisitLayout] })

const page = usePage()
// const appName = import.meta.env.VITE_APP_NAME ?? "Vue Starter Kit"
const parts = page.props.parts as Part[]
</script>

<template>
  <Head title="Welcome">
    <link rel="preconnect" href="https://rsms.me/" />
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />
  </Head>
  <div class="absolute top-0 left-0 p-4 bg-white bg-opacity-80 text-black rounded shadow">
    <ul>
      <li v-for="(p, index) in parts" :key="p.id">
        <SpotItem :part="p" :index="index" />
      </li>
    </ul>
  </div>
</template>