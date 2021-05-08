<template>
    <div>
        
        <div>
        <b-form class="mt-5" @submit="onSubmit" @reset="onReset" >

            <h3 class="mb-2">유저 정보 작성</h3>
            
            <b-form-input
            id="input-name"
            class="mb-2"
            v-model="form.name"
            placeholder="이름"
            type="text"
            required
            />

            <b-form-input
            id="input-id"
            class="mb-2"
            v-model="form.userId"
            placeholder="사용자 ID"
            type="text"
            required
            />

            <b-form-input
            id="input-pwd"
            class="mb-2"
            v-model="form.password"
            placeholder="비밀번호"
            type="password"
            required
            />

            <b-form-input
            id="input-tel"
            class="mb-2"
            v-model="form.phone"
            placeholder="연락처"
            type="tel"
            required
            />

            <b-form-input
            id="input-mail"
            class="mb-3"
            v-model="form.email"
            placeholder="이메일"
            type="email"
            required
            />

            <span class="error">{{ error }}</span>
            <Button text="입력완료" />

        </b-form>

        <BottomLine text="로그인 페이지로 돌아가기" url="/Login" />
        </div>

    </div>
</template>

<script>

import Button from '../../../shared-components/small/Button.vue'
import BottomLine from '../../../shared-components/small/BottomLine.vue'
import { checkForm } from '../../../config/validator'

export default {
    name: "Step0",
    components: {
        Button,
        BottomLine,
    },
    props: {
      basicFrm: Object
     },
     data() {
      return {
        error : null,
      }
    },
    computed: {
      form: function() {
        return this.basicFrm
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        this.error = checkForm('step0',this.basicFrm)
        if(this.error == null) {
          this.$emit('sendFrm',this.form)
          this.$emit('step',1)
        }
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

