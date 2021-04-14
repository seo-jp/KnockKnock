<template>
    <div>
      
      <h3 class="mt-3 mb-5">피드설정</h3>
      <Button class="mt-5" text="입력완료" />


    </div>
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
        form: {
          photo: '',
        },
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.form))
        this.$router.push('/JoinStep/4')
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
