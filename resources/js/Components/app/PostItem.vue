<script setup>
import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue'
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { ChevronDownIcon, PencilIcon, TrashIcon, EllipsisVerticalIcon, PaperClipIcon } from '@heroicons/vue/20/solid'
import { ChatBubbleLeftRightIcon, HandThumbUpIcon, ArrowDownTrayIcon } from '@heroicons/vue/24/outline';
import PostUserHeader from '@/Components/app/PostUserHeader.vue';
import CommentList from "@/Components/app/CommentList.vue";
import { router, usePage } from '@inertiajs/vue3';
import { isImage } from '@/helpers.js';
import axiosClient from "@/axiosClient.js";
import ReadMoreReadLess from "@/Components/app/ReadMoreReadLess.vue";
import EditDeleteDropdown from "@/Components/app/EditDeleteDropdown.vue";

const props = defineProps({
    post: Object
});

const authUser = usePage().props.auth.user;

const emit = defineEmits(['editClick', 'attachmentClick'])


function openEditModal() {
    emit('editClick', props.post)
}

function deletePost() {
    if(window.confirm('Bạn có chắc muốn xóa bài viết này?')){
        router.delete(route('post.destroy', props.post), {
            preserveScroll: true
        })
    }
}

function openAttachment(index) {
    emit('attachmentClick', props.post, index)
}

function sendReaction() {
    axiosClient.post(route('post.reaction', props.post), {
        reaction: 'like'
    })
        .then(({data}) => {
            props.post.current_user_has_reaction = data.current_user_has_reaction
            props.post.num_of_reactions = data.num_of_reactions;
        })
}

</script>

<template>
    <div class="bg-white border rounded p-4 mb-3">
        <div class="flex items-center justify-between mb-3">
            <PostUserHeader :post="post" />
            <EditDeleteDropdown @edit="openEditModal"
                                @delete="deletePost" />
        </div>
        <div class="mb-3">
            <!-- <ReadMoreReadLess /> -->
            <ReadMoreReadLess :content="post.body"/>
        </div>
        <div class="grid gap-3 mb-3" :class="[
            post.attachments.length == 1 ? 'grid-cols-1' : 'grid-cols-2'
        ]">
            <template v-for="(attachment, index) of post.attachments.slice(0, 4)" :key="attachment.id">
                
                
                <div @click="openAttachment(index)" class="group aspect-square bg-blue-100 flex flex-col items-center justify-center text-gray-500 relative cursor-pointer">
                    <div v-if="index === 3 && post.attachments.length > 4" class="absolute left-0 top-0 right-0 bottom-0 z-10 bg-black/50 text-white flex items-center justify-center text-2xl">
                        +{{ post.attachments.length - 4 }} 
                    </div>
                    <!-- Download -->
                    <a @click.stop :href="route('post.download', attachment)" class="z-20 opacity-0 group-hover:opacity-100 transition-all w-8 h-8 flex items-center justify-center text-gray-100 bg-gray-700 rounded absolute right-2 top-2 cursor-pointer hover:bg-gray-800">
                        <ArrowDownTrayIcon class="w-4 h-4"/>
                    </a>

                    <img v-if="isImage(attachment)" 
                        :src="attachment.url" 
                        class="object-contain aspect-square">

                    <div v-else class="felx flex-col justify-center items-center px-3">
                        <PaperClipIcon class="h-10 mb-3 w-full" />
                        <small>{{ attachment.name }}</small>
                    </div>
                </div>
            </template>
        </div>
        <Disclosure v-slot="{  }">
            <!--Like & Comment-->
            <div class="flex gap-10">
                <button
                    @click="sendReaction"
                    class="text-gray-800 dark:text-gray-100 flex gap-1 items-center justify-center  rounded-lg py-2 px-4 flex-1"
                    :class="[
                    post.current_user_has_reaction ?
                     'bg-sky-200 dark:bg-sky-900 hover:bg-sky-200 dark:hover:bg-sky-950' :
                     'bg-gray-100 dark:bg-slate-900 dark:hover:bg-slate-800 '
                ]"
                >
                    <HandThumbUpIcon class="w-5 h-5"/>
                    <span class="mr-2">{{ post.num_of_reactions }}</span>
                    {{ post.current_user_has_reaction ? 'Unlike' : 'Like' }}
                </button>
                <DisclosureButton
                    class="text-gray-800 dark:text-gray-100 flex gap-1 items-center justify-center bg-gray-100 dark:bg-slate-900 dark:hover:bg-slate-800 rounded-lg hover:bg-gray-200  py-2 px-4 flex-1"
                >
                    <ChatBubbleLeftRightIcon class="w-5 h-5"/>
                    <span class="mr-2">{{ post.num_of_comments }}</span>
                    Bình luận
                </DisclosureButton>
            </div>

            <DisclosurePanel class="comment-list mt-3 max-h-[400px] overflow-auto">
                <CommentList :post="post" :data="{comments: post.comments}"/>
            </DisclosurePanel>
        </Disclosure>
    </div>
</template>

<style scoped>

</style>