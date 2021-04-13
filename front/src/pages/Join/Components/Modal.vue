<template>
    <div class="modal-box">
        
        <!-- category -->
        <ul v-show="ctxShow">
            <li :key="index" v-for="(ctx,index) in categories">
            <b-button
            @click=selectCtx(ctx.id,ctx.name)
            variant="light"
            class="modal-select-btn">
                {{ ctx.name }}
            </b-button>    
            </li>
        </ul>

        <!-- keyword -->
        <ul v-show="keyShow">
            <li :key="index" v-for="(key,index) in keywords">
            <b-button
            v-if="list.ctxId == key.ctxId"
            @click=selectKey(key.id,key.name)
            variant="light"
            class="modal-select-btn">
            {{ key.name }}
            </b-button>    
            </li>
        </ul>


        <b-button @click="closeModal()" >취소</b-button>
    </div>
</template>

<script>

export default {
    name: "Modal",
     props: {
         list: {
             id: Number,
             category: String,
             ctxId: Number,
             keyword: String,
             keyId: Number,
         }
     },
     data() {
      return {
        ctxShow: true,
        keyShow: false,
        
        categories: [
            {
                id: 1,
                name: '여행'
            },
            {
                id: 2,
                name: '문화생활'
            }
        ],
        keywords: [
            {
                ctxId: 1,
                id: 1,
                name: '국내'
            },
            {
                ctxId: 1,
                id: 2,
                name: '일본'
            },
        ],
      }
    },
    methods: {
        selectCtx(id,name) {
            this.list.category = name
            this.list.ctxId = id
            this.ctxShow = !this.ctxShow
            this.keyShow = !this.keyShow
        },
        selectKey(id,name) {
            this.list.keyword = name
            this.list.keyId = id
            this.$emit('selectedList',this.list)
            this.closeModal()
        },
        closeModal() {
            this.ctxShow = true
            this.keyShow = false
            this.$emit('closeModal')
        }
    }
};
</script>

<style scoped>
    .modal-box{
      position: absolute;
      top: 220px;
      width: 320px;
      height: 420px;
      background-color:rgb(248, 247, 247);
      border-radius: 10px;
      border: 0px solid #fff;
    }
</style>