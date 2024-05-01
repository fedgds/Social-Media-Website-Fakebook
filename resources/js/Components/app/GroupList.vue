<script setup>
import { ref } from 'vue'
import GroupListItems from "@/Components/app/GroupListItems.vue";
import GroupModal from "@/Components/app/GroupModal.vue";
import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue'

const showNewGroupModal = ref(false);

</script>

<template>
    <div class="px-3 bg-white rounded border h-full py-3 overflow-hidden">
        <!-- Mobile -->
        <div class="block lg:hidden">
            <Disclosure v-slot="{ open }">
                <DisclosureButton class="w-full">
                    <div class="flex justify-between items-center">
                        <h2 class="text-xl font-bold">Nhóm của tôi</h2>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" :class="open ? 'rotate-90 transform' : ''" class="w-6 h-6 transition-all">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                        </svg>
                    </div>
                </DisclosureButton>
                <DisclosurePanel>
                    <button @click="showNewGroupModal = true"
                        class="text-sm bg-indigo-500 hover:bg-indigo-600 text-white  rounded py-1 px-2">
                        New
                    </button>
                    <GroupListItems />
                </DisclosurePanel>
            </Disclosure>
        </div>
        <!-- Pc -->
        <div class="h-full overflow-hidden flex-col hidden lg:flex">
            <div class="flex justify-between">
                <h2 class="text-xl font-bold">Nhóm của tôi</h2>
                <button @click="showNewGroupModal = true"
                        class="text-sm bg-indigo-500 hover:bg-indigo-600 text-white  rounded py-1 px-2">
                        New
                </button>
            </div>
            <GroupListItems />
        </div>
    </div>
    <GroupModal v-model="showNewGroupModal"/>
</template>

<style scoped>

</style>