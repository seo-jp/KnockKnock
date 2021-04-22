<template>
    <div class="modal-box">
        
        <nav>
            <a
             v-show="keyShow"
             @click="selectCtx(list.ctxId,list.category)"
             style="left: 20px; top:14px;">
                <b-icon
                style="width: 18px; height: 18px;"
                icon="arrow-return-left"
                flip-v />
            </a>
            
            <h4 v-show="ctxShow">카테고리</h4>
            <h4 v-show="keyShow">키워드</h4>
            
            <a
            style="right: 20px; top:12px;">
                <b-icon icon="x"
                style="width: 26px; height: 26px;"
                @click="closeModal()" />
            </a>
        </nav>

        <div class="modal-search">
            <b-form-input placeholder="검색"></b-form-input>
            <a><b-icon icon="search" /></a>
        </div>

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

        <div class="page-container">
            <b-pagination v-model="currentPage" pills :total-rows="rows" size="sm"></b-pagination>
        </div>

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

        rows: 100,
        currentPage: 1,
        
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
            {
                ctxId: 2,
                id: 1,
                name: '음주'
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
     @import '../../../assets/css/Join.css';
</style>