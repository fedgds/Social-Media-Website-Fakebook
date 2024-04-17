<script setup>
import PostItem from '@/Components/app/PostItem.vue';
const post1 = {
    user: {
        id: 1,
        avatar: 'https://randomuser.me/api/portraits/men/60.jpg',
        name: 'Su La'
    },
    group: null,
    attachments: [
        {
            id: 1,
            name: 'test.png',
            url: 'https://picsum.photos/1000',
            mime: 'image/png'
        },
        {
            id: 2,
            name: 'test2.png',
            url: 'https://picsum.photos/1000',
            mime: 'image/png'
        },
        {
            id: 3,
            name: 'MyDocument.docx',
            url: '#',
            mime: 'application/msword'
        }
    ],
    body: `<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Accusamus dolorum architecto deleniti non molestiae quam, ad, 
        nisi fugiat consequatur vero iusto commodi magnam veniam similique 
        maxime totam, repellendus maiores voluptatem.</p>

        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Accusamus dolorum architecto deleniti non molestiae quam, ad, 
        nisi fugiat consequatur vero iusto commodi magnam veniam similique 
        maxime totam, repellendus maiores voluptatem.</p>`,
    created_at: '2024-04-14 15:54'
}

const post2 = {
    user: {
        id: 2,
        avatar: 'https://randomuser.me/api/portraits/men/61.jpg',
        name: 'Sang La'
    },
    group: {
        id: 1,
        name: 'Laravel Develop'
    },
    
    body: `<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Accusamus dolorum architecto deleniti non molestiae quam, ad, 
        nisi fugiat consequatur vero iusto commodi magnam veniam similique 
        maxime totam, repellendus maiores voluptatem.</p>

        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        Accusamus dolorum architecto deleniti non molestiae quam, ad, 
        nisi fugiat consequatur vero iusto commodi magnam veniam similique 
        maxime totam, repellendus maiores voluptatem.</p>`,
    created_at: '2024-04-14 15:54'
}

</script>

<template>
    <div class="overflow-auto">
        <PostItem :post="post1"/>

        <PostItem :post="post2"/>
    </div>
</template>

<style scoped>

</style>