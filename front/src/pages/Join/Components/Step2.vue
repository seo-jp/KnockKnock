<template>
  
  <b-form class="text-center modal-choose-form" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
    <h3 class="mt-3 mb-5">키워드 4개를 선택해주세요</h3>

    <ul>
      <li :key="index" v-for="(list,index) in lists">
        <b-button
        @click=openModal(index)
        @selectedList="list"
        variant="light"
        class="modal-btn">
          <span>{{ list.category }}</span> <br /> {{ list.keyword }}
        </b-button>    
      </li>
    </ul>
    
    <Button class="mt-5" text="선택완료" />
    
    <Modal 
    @closeModal="modalShow = !modalShow"
    v-show="modalShow" :list="lists[currentId]"
    />
  
  </b-form>
  


</template>

<script>

import Modal from './Modal.vue'
import Button from '../../../shared-components/small/Button.vue'

export default {
    name: "Step2",
    components: {
        Modal,
        Button,
    },
    data() {
      return {
        lists: [
          {
            id: 1,
            category : '1',
            ctxId: '',
            keyword: '1',
            keyId: '',
          },
          {
            id: 2,
            category : '1',
            ctxId: '',
            keyword: '1',
            keyId: '',
          },
          {
            id: 3,
            category : '1',
            ctxId: '',
            keyword: '1',
            keyId: '',
          },
          {
            id: 4,
            category : '1',
            ctxId: '',
            keyword: '1',
            keyId: '',
          }
        ], 
        modalShow: false,
        currentId: '',
      }
    },
    methods: {
      openModal(id) {
        this.modalShow = !this.modalShow
        this.currentId = id
      },
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.lists))
        this.$router.push('/JoinStep/3')
      },
      onReset(event) {
        event.preventDefault()
        this.lists = ''
      }
    }
}
</script>

<style scoped>
    h3 {
      font-size: 18px!important;
    }

    .modal-btn.btn {
      width: 150px;
      height: 140px;
      background: rgb(248, 247, 247);
      border-radius: 25px!important;
      
    }

    .modal-btn.btn-light {
      color: rgb(165, 147, 224)!important;
      font-size: 25px!important;
      line-height: 1.2!important;
    }

    span {
      color: rgb(158, 158, 158);
      font-size: 13px;
    }

    ul {
      padding: 0;
    }

    ul li {
      float: left;
      margin-bottom: 1rem;
    }

    ul li:nth-child(even){
      margin-left: 1rem;
    }


</style>
