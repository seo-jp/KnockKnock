<template>
    <b-form class="text-center" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
            
            <div :key="index" v-for="(list,index) in keyList">
            
            <h4>{{ list.category }} / {{ list.keyword }}</h4>
            <div v-show="list.selectedImage == false" >
              <div class="feed">
                <img :src="list.imageUrl" :style="list.imgStyle">
              </div>
              <input class="imageInput" :id="index" type="file" hidden @change="onChangeImages">
              <a class="step1-a" @click="onClickImageUpload(list.id)">배경사진 등록하기</a>
            </div>

            <div v-show="list.selectedImage">
              <v-zoomer
              ref="zoomer"
              class="feed"
              :max-scale="10"
              :zooming-elastic="false"
              :zoomed.sync="list.zoomed"
              >
              <img :src="list.imageUrl" class="profile-img">
              </v-zoomer>              
              <a class="step1-a" @click="getStyle(index)">확인</a>
            </div>

            </div>
            
            <Button class="mt-5" text="선택완료" />

  </b-form>
</template>

<script>

import Button from '../../../shared-components/small/Button.vue'

export default {
    name: "Step3",
    components: {
        Button,
    },
    props: {
      keyList: Array
     },
    computed: {
      lists: function() {
        return this.keyList
      }
    },
    methods: {
      getStyle(i) {
        this.lists[i].imgStyle = "object-fit: contain; width: 100%; height: 100%; transform:" 
                        + document.querySelectorAll(".zoomer")[i+1].style.transform
        this.lists[i].selectedImage = !this.lists[i].selectedImage
      },
      onClickImageUpload(i) {
        document.querySelectorAll(".imageInput")[i].click()
      },
      onChangeImages(e) {
        const i = e.target.id
        this.lists[i].selectedImage = !this.lists[i].selectedImage
        const file = e.target.files[0]
        this.lists[i].imageUrl = URL.createObjectURL(file)
      },
      onSubmit(event) {
        event.preventDefault()
        this.$emit('step',4)
      },
      onReset(event) {
        event.preventDefault()
      }
    },
}
</script>
