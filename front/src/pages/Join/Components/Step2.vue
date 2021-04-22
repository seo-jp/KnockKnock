<template>
  
  <b-form class="text-center modal-choose-form" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
    <h3 class="mt-3 mb-5">{{ title }}</h3>
    
    <ul class="step2-ul">
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
    @closeModal=closeModal
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
        title: '키워드를 4개 선택해주세요',
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
      closeModal() {
        this.modalShow = !this.modalShow
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
     @import '../../../assets/css/Join.css';
</style>
