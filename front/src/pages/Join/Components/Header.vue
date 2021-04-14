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

<style scoped>
  
  header {
      width: 100%;
  }

  header div{
      width: 100%;
      height: 50px;
      background: rgb(248, 247, 247);
      position: relative;
  }

  header div h2 {
      width: 1%;
      height: 50px;
      font-size: 14px;
      color: rgb(51, 51, 51);
      text-align: center;
      display: table-cell;
      vertical-align: middle;
  }

  header div a {
      position: absolute;
      cursor: pointer;
  }

  .right-btn {
      right: 20px;
      top: 14px;
      color: rgb(165, 147, 224);
      font-size: 14px;
  }

  .left-btn {
      left: 20px;
      top: 10px;
      color: rgb(51, 51, 51);
  }

  nav {
      width: 100%;
      height: 40px;
      float: left;
  }

  nav ul {
      float: left;
      width: 100%;
      padding: 0;
  }

  nav ul li {
      width: calc(100% / 3);
      height: 40px;
      border: 1px solid rgb(224, 224, 224);
      border-right: 0px solid #fff;
      float: left;
  }

  nav ul li:last-child {
      border-right: 1px solid rgb(224, 224, 224);
  }

  nav ul li a {
      color: rgb(158, 158, 158);
      font-size: 12px;
      cursor: pointer;
      width: 1%;
      height: 38px;
      display: table-cell;
      vertical-align: middle;
      text-align: center;
  }

  .list.point {
    color:rgb(51, 51, 51);
    font-weight: bold;
  }

</style>