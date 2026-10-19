? emplate>
  <div class="group relative transition-opacity duration-150">

  </div>
</template>

<script lang="ts" setup>
import { usePage } from "@inertiajs/vue3"
import { computed } from "vue"

import type { Part } from "@/types"

const {part} = defineProps<{part: Part}>()
const {part: pagePart} = usePage().props

const visibilityClasses = computed(() => part.id === pagePart.id ? "opacity-100": "opacity-50")
</script>