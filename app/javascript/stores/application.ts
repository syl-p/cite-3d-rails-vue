import { defineStore } from 'pinia'
import type { Ref} from 'vue';
import {  ref } from 'vue'


export const useApplicationStore = defineStore('application', () => {

    const universeLoaded: Ref<boolean> = ref(false)
    const state: Ref<'intro' | 'exploration' | 'page'> = ref('intro')

    function setState(value: 'intro' | 'exploration' | 'page')  {
        state.value = value
    }

    function setLoaded(bool: boolean) {
        universeLoaded.value = bool
    }

    return { state, universeLoaded, setLoaded, setState }
})