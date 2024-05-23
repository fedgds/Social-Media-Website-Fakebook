<script setup>
import { Link } from '@inertiajs/vue3';
import PrimaryButton from '../PrimaryButton.vue';

defineProps({
    user: Object,
    forApprove: {
        type: Boolean,
        default: false
    }
})

defineEmits(['approve']);
</script>

<template>
    <div class="cursor-pointer bg-white border border-gray-300 hover:bg-gray-100">
        <Link :href="route('profile', user.username)" class="flex items-center gap-1 py-2 px-2">
            <img :src="user.avatar_url" class="w-[40px] rounded-full">
            <div class="flex justify-between flex-1">
                <h3 class="font-black">{{ user.name }}</h3>
                <div class="flex gap-1">
                    <button v-if="forApprove" @click.prevent.stop="$emit('approve', user)" class="py-1 px-2 text-xs text-white rounded bg-emerald-500 hover:bg-emerald-600">
                        Chấp nhận
                    </button>
                    <button v-if="forApprove" @click.prevent.stop="$emit('reject', user)" class="py-1 px-2 text-xs text-white rounded bg-red-500 hover:bg-red-600">
                        Từ chối
                    </button>
                </div>
            </div>
        </Link>
    </div>
</template>

<style scoped>

</style>