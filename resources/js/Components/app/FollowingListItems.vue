<script setup>
import FollowingItem from "@/Components/app/FollowingItem.vue";
import TextInput from "@/Components/TextInput.vue";
import { ref } from "vue";

const searchKeyword = ref('');
</script>

<template>
    <TextInput :model-value="searchKeyword" placeholder="Tìm kiếm" class="w-full mt-4"/>
    <div class="mt-3 h-[200px] lg:flex-1 overflow-auto">
        <div v-if="false" class="text-gray-400 flex flex-center justify-center p-3">
            Bạn chưa có người bạn nào
        </div>
        <div v-else>
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            />
            <!-- <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Su La"
            />
            <FollowingItem 
                image="https://picsum.photos/50"
                title="Thanh La"
            /> -->
        </div>
    </div>
</template>

<style scoped>

</style>