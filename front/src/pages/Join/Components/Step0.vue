<template>
    <div>

        <div style="width:320px; margin:0 auto;">
        <b-form class="mt-5" @submit="onSubmit" @reset="onReset" >

            <h3 class="mb-2">유저 정보 작성</h3>
            
            <b-form-input
            id="input-1"
            class="mb-2"
            v-model="form.name"
            placeholder="이름"
            type="name"
            required
            />

            <b-form-input
            id="input-2"
            class="mb-2"
            v-model="form.userId"
            placeholder="사용자 ID"
            type="text"
            required
            />

            <b-form-input
            id="input-3"
            class="mb-2"
            v-model="form.password"
            placeholder="비밀번호"
            type="password"
            required
            />

            <b-form-input
            id="input-4"
            class="mb-2"
            v-model="form.phone"
            placeholder="연락처"
            type="tel"
            required
            />

            <b-form-input
            id="input-5"
            class="mb-3"
            v-model="form.email"
            placeholder="이메일"
            type="email"
            required
            />

            <Button text="입력완료" />

        </b-form>

        <BottomLine text="로그인 페이지로 돌아가기" url="/Login" />
        </div>

    </div>
</template>

<script>

import Button from '../../../shared-components/small/Button.vue'
import BottomLine from '../../../shared-components/small/BottomLine.vue'


export default {
    name: "Step0",
    components: {
        Button,
        BottomLine,
    },
    data() {
      return {
        form: {
          name: '',
          userId: '',
          password: '',
          phone: '',
          email: '',
        },
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.form))
        this.$router.push('/JoinStep/1')
      },
      onReset(event) {
        event.preventDefault()
        this.form.name = ''
        this.form.userId = ''
        this.form.password = ''
        this.form.phone = ''
        this.form.email = ''
      }
    }
}
</script>

<style>
    @import '../../../assets/css/Login.css';
</style>
