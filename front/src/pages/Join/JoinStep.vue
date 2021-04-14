<template>
    <div>
        
        <Header
        v-if="step != 4"
        :navId="step" />

         <div style="width:320px; margin:0 auto;">
          <Step0 v-show="step == 0" />
          <Step1 v-show="step == 1" />
          <Step2 v-show="step == 2" />
          <Step3 v-show="step == 3" />
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
        form: {
          photo: '',
        },
        step: this.$route.params.step,
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        alert(JSON.stringify(this.form))
        //this.$router.push('/Join3')
      },
      onReset(event) {
        event.preventDefault()
        this.form.photo = ''
      }
    }
}
</script>

<style>
    @import '../../assets/css/Login.css';
</style>
