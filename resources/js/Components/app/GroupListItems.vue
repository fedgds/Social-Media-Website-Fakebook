<script setup>
import GroupItem from "@/Components/app/GroupItem.vue";
import TextInput from "@/Components/TextInput.vue";
import { ref } from "vue";

const searchKeyword = ref('');
</script>

<template>
    <TextInput :model-value="searchKeyword" placeholder="Tìm kiếm" class="w-full mt-4"/>
    <div class="mt-3 h-[200px] lg:flex-1 overflow-auto">
        <div v-if="true" class="text-gray-400 flex flex-center p-3 justify-center">
            Bạn chưa tham gia nhóm nào
        </div>
        <div v-else>
            <GroupItem 
                image="https://picsum.photos/100"
                title="Laravel Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Vue.js Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Laravel Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Vue.js Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Laravel Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Vue.js Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Laravel Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Vue.js Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Laravel Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
            <GroupItem 
                image="https://picsum.photos/100"
                title="Vue.js Developers"
                description="Lorem ipsum dolor sit. Dolore ad, molestiae incidunt pariatur recusandae illo beatae soluta!"
            />
        </div>
    </div>    
</template>

<style scoped>

</style>