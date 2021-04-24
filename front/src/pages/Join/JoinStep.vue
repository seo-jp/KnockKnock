<template>
    <div>
        
        <Header
        v-if="step != 4"
        v-bind:navId="this.step"
        @step="setStep" />

         <div style="width:320px; margin:0 auto;">
          <Step0 v-show="step == 0" @step="setStep" :basicFrm="this.basic" />
          <Step1 v-show="step == 1" @step="setStep" :profileFrm="this.profile" />
          <Step2 v-show="step == 2" @step="setStep" :keyList="this.kwd" />
          <Step3 v-show="step == 3" @step="setStep" :keyList="this.kwd" />
          <br />
          <br />
          {{ basic }}
          <br />
          <br />
          {{ profile }}
          <br />
          <br />
          {{ kwd }}
          <br />
          <br />
          <Step4 v-show="step == 4" />
         </div>

    </div>
</template>

<script>

import Header from './Components/Header.vue'
import Step0 from './Components/Step0.vue'
import Step1 from './Components/Step1.vue'
import Step2 from './Components/Step2.vue'
import Step3 from './Components/Step3.vue'
import Step4 from './Components/Step4.vue'

export default {
    name: "JoinStep",
    components: {
        Header,
        Step0,
        Step1,
        Step2,
        Step3,
        Step4,
    },
    data() {
      return {
        step: null,
        basic: null,
        profile: null,
        kwd: []
      }
    },
    methods: {
      setStep(i){
        this.step = i
      },
    },
    created() {
      this.step = 0
      this.basic = {
        name: '',
        userId: '',
        password: '',
        phone: '',
        email: '',
      },

      this.profile = {
        imageUrl: '',
        imageStyle: '',
      },

      this.kwd = [
        {
          id: 1,
          category : '',
          ctxId: '',
          keyword: '',
          keyId: '',
          imageUrl: null,
          zoomed: false,
          selectedImage: false,
          imgStyle:'',
        },
        {
          id: 2,
          category : '',
          ctxId: '',
          keyword: '',
          keyId: '',
          imageUrl: null,
          zoomed: false,
          selectedImage: false,
          imgStyle:'',
        },
        {
          id: 3,
          category : '',
          ctxId: '',
          keyword: '',
          keyId: '',
          imageUrl: null,
          zoomed: false,
          selectedImage: false,
          imgStyle:'',
        },
        {
          id: 4,
          category : '',
          ctxId: '',
          keyword: '',
          keyId: '',
          imageUrl: null,
          zoomed: false,
          selectedImage: false,
          imgStyle:'',
        }
      ]
    }
}
</script>

<style scoped>
    @import '../../assets/css/Join.css';
</style>

