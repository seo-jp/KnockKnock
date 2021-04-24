<template>
  <b-form class="text-center" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
            
            <div v-show="selectedImage == false" >
              
              <div class="profile">
                <img :src="form.imageUrl" :style="form.imageStyle">
              </div>

              <input
              class="imageInput"
              type="file"
              hidden
              @change="onChangeImages"
              >
              <a
              class="step1-a"
              @click="onClickImageUpload"
              >프로필사진 등록하기</a>
            
            </div>

            <div v-show="selectedImage">
            
              <v-zoomer
              ref="zoomer"
              class="profile"
              :max-scale="10"
              :zooming-elastic="false"
              :zoomed.sync="zoomed"
              >
              <img :src="form.imageUrl" class="profile-img">
              </v-zoomer>

              <a
              class="step1-a"
              @click="getStyle()"
              >확인</a>
            
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
    props: {
      profileFrm: Object
     },
    computed: {
      form: function() {
        return this.profileFrm
      }
    },
    data() {
      return {
        selectedImage: false,
        zoomed: false,
      }
    },
    methods: {
      getStyle() {
        this.form.imageStyle = "object-fit: contain; width: 100%; height: 100%; transform:" 
                        + document.querySelector(".zoomer").style.transform
        this.selectedImage = !this.selectedImage
      },
      onClickImageUpload() {
        document.querySelector(".imageInput").click()
      },
      onChangeImages(e) {
        this.selectedImage = !this.selectedImage
        const file = e.target.files[0]
        this.form.imageUrl = URL.createObjectURL(file)
      },
      onSubmit(event) {
        event.preventDefault()
        this.$emit('sendFrm',this.form)
        this.$emit('step',2)
      },
      onReset(event) {
        event.preventDefault()
        this.form.imageUrl = ''
        this.form.imageStyle = ''
        this.zoomed = false
        this.selectedImage = false
      }
    }
}
</script>
