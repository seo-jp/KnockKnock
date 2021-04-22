<template>
    <header>
        <div>
            <a
            class="left-btn"
            v-show="navId != 0"
            :href="Number(navId) - 1">
                <b-icon icon="arrow-return-left" flip-v></b-icon>
            </a>

            <h2>{{ lists[Number(navId)].text }} 설정</h2>
            
            <a 
            class="right-btn"
            v-show="navId == 1 || navId == 3"
            :href="Number(navId) + 1">
                넘어가기
            </a>
        </div>
        
        <nav class="mb-5" v-show="navId != 0">
            <ul>
                <li v-show="list.id > 0" :key="list.id" v-for="list in lists">
                    <a :href="list.url"
                    :class="[list.point ? 'point' : '', 'list']">{{ list.text }}</a>
                </li>
            </ul>
        </nav>
    </header>


</template>

<script>

export default {
    name: "Header",
    props: {
        navId: String,
    },
    data() {
      return {
        lists: [],
      }
    },
    methods: {
        changePoint(navId) {
            this.lists = this.lists.map((list) => list.id == navId 
            ? {...list, point: !list.point} : list)
        },
    },
    created() {
    this.lists = [
      {
        id: 0,
        text: '유저정보',
        url: '/JoinStep/0',
        point: false,
      },  
      {
        id: 1,
        text: '프로필',
        url: '/JoinStep/1',
        point: false,
      },
      {
        id: 2,
        text: '키워드',
        url: '/JoinStep/2',
        point: false,
      },
      {
        id: 3,
        text: '피드',
        url: '/JoinStep/3',
        point: false,
      },
    ],
    this.changePoint(this.navId)
    }
};
</script>
