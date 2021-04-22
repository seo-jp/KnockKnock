<template>
    <b-form class="text-center" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
            
            <div :key="index" v-for="(list,index) in lists">
            
            <h4>{{ list.category }} / {{ list.keyword }}</h4>
            <div v-show="list.selectedImage == false" >
              <div
              style="width: 320px; height: 220px; border-radius: 4px; border:1px solid rgb(204, 204, 204); overflow:hidden; margin:0 auto;">
                <img :src="list.imageUrl" :style="list.imgStyle">
              </div>
              <input class="imageInput" :id="index" type="file" hidden @change="onChangeImages">
              <a class="step1-a" @click="onClickImageUpload(list.id)">배경사진 등록하기</a>
            </div>

            <div v-show="list.selectedImage">
              <v-zoomer
              ref="zoomer"
              style="width: 320px; height: 220px; border-radius: 4px; margin: 0 auto; border:1px solid rgb(204, 204, 204); "
              :max-scale="10"
              :zooming-elastic="false"
              :zoomed.sync="list.zoomed"
              >
              <img :src="list.imageUrl" style="object-fit: contain; width: 100%; height: 100%;">
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
    data() {
      return {
        lists: [
          {
             id: 1,
             category: '여행',
             ctxId: 1,
             keyword: '국내',
             keyId: 1,
             imageUrl: null,
             zoomed: false,
             selectedImage: false,
             imgStyle:'',
          },
          {
             id: 2,
             category: '음식',
             ctxId: 3,
             keyword: '떡볶이',
             keyId: 2,
             imageUrl: null,
             zoomed: false,
             selectedImage: false,
             imgStyle:'',
          },
          {
             id: 3,
             category: '쇼핑',
             ctxId: 6,
             keyword: '명품',
             keyId: 1,
             imageUrl: null,
             zoomed: false,
             selectedImage: false,
             imgStyle:'',
          },
          {
             id: 4,
             category: '건강',
             ctxId: 55,
             keyword: '헬스',
             keyId: 3,
             imageUrl: null,
             zoomed: false,
             selectedImage: false,
             imgStyle:'',
          },
        ]
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
