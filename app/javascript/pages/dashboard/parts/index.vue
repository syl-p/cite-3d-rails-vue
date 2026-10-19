<script setup lang="ts">
import { Head, Link } from "@inertiajs/vue3"

import { Button } from "@/components/ui/button"
import AppLayout from "@/layouts/AppLayout.vue"
import { dashboardParts, editDashboardPart } from "@/routes"
import type { BreadcrumbItem, Part } from "@/types"

interface Props {
  parts: Part[]
}

defineProps<Props>()

const breadcrumbs: BreadcrumbItem[] = [
  {
    title: "Parts",
    href: dashboardParts.index().url,
  },
]
</script>

<template>
  <Head :title="breadcrumbs[breadcrumbs.length - 1].title" />

  <AppLayout :breadcrumbs="breadcrumbs">
    <div class="flex h-full flex-1 flex-col gap-4 overflow-x-auto rounded-xl p-4">
      <div class="space-y-4">
        <div
          v-for="part in parts"
          :key="part.id"
          class="flex items-center justify-between space-y-2 rounded-lg border p-4"
        >
          <div class="space-y-1">
            <p class="font-medium">{{ part.title }}</p>
            <p class="text-muted-foreground text-sm">{{ part.description }}</p>
          </div>
          <div class="flex items-center gap-2">
            <Button asChild variant="outline">
              <Link :href="editDashboardPart(part.id)">Edit</Link>
            </Button>
            <Button asChild variant="destructive">
              <Link :href="dashboardParts.destroy(part.id)">Delete</Link>
            </Button>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>