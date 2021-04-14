<template>
  <b-form class="text-center" style="margin-top:100px;" @submit="onSubmit" @reset="onReset" >
            
            <!-- 나중에 파일로 수정 -->
            <b-avatar variant="secondary" size="200px"></b-avatar>
            <h3 class="mt-3 mb-5">프로필사진 등록하기</h3>
            
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
        form: {
          photo: '',
        },
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.form))
        this.$router.push('/JoinStep/2')
      },
      onReset(event) {
        event.preventDefault()
        this.form.photo = ''
      }
    }
}
</script>

<style>
    @import '../../../assets/css/Login.css';
</style>
