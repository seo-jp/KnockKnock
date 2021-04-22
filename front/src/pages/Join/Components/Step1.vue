<template>
  <b-form class="text-center" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
            
            <div v-show="selectedImage == false" >
              <div
              style="width: 200px; height: 200px; border:1px solid rgb(204, 204, 204); border-radius:50%; overflow:hidden; margin:0 auto;">
                <img :src="imageUrl" :style="imgStyle">
              </div>
              <input class="imageInput" type="file" hidden @change="onChangeImages">
              <a class="step1-a" @click="onClickImageUpload">프로필사진 등록하기</a>
            </div>

            <div v-show="selectedImage">
              <v-zoomer
              ref="zoomer"
              style="width: 200px; height: 200px; border-radius:50%; margin: 0 auto; border:1px solid rgb(204, 204, 204); "
              :max-scale="10"
              :zooming-elastic="false"
              :zoomed.sync="zoomed"
              >
              <img :src="imageUrl" style="object-fit: contain; width: 100%; height: 100%;">
              </v-zoomer>              
              <a class="step1-a" @click="getStyle()">확인</a>
            </div>
            
            
            <Button class="mt-5" text="입력완료" />

  </b-form>
</template>

<script>

import Button from '../../../shared-components/small/Button.vue'

export default {
    name: "Step1",
    components: {
        Button,
    },
    data() {
      return {
        imageUrl: null,
        zoomed: false,
        selectedImage: false,
        imgStyle:'',
      }
    },
    methods: {
      getStyle() {
        this.imgStyle = "object-fit: contain; width: 100%; height: 100%; transform:" 
                        + document.querySelector(".zoomer").style.transform
        this.selectedImage = !this.selectedImage
      },
      onClickImageUpload() {
        document.querySelector(".imageInput").click()
      },
      onChangeImages(e) {
        this.selectedImage = !this.selectedImage
        const file = e.target.files[0]
        this.imageUrl = URL.createObjectURL(file)
      },
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.form))
        this.$router.push('/JoinStep/2')
      },
      onReset(event) {
        event.preventDefault()
      }
    }
}
</script>

<style>
    @import '../../../assets/css/Join.css';
</style>
