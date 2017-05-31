<template>
  <div class="wrapper">
  <input ref="input" class="input" type="text" autofocus="true" :placeholder="placeholder" @input="oninput" @change="onchange" @focus="onfocus" @blur="onblur"></input>
  </div>
</template>
<script>
  const dom = weex.requireModule('dom')
  const modal = weex.requireModule('modal')
  export default {
    data() {
      return {
        placeholder: '水电费水电费'
      }
    },
    created() {
  
    },
    components: {
      navbar: require('../components/navbar/navbar.vue'),
      navbarInput: require('../components/navbar/navbar-input.vue'),
    },
    methods: {
      oninput (event) {

      },
      onchange (event) {

      },
      onblur (event) {
        this.placeholder = '你失焦了';
      }
    }
  }
</script>
<style>
  .input {
    font-size: 50px;
    width: 650px;
    margin-top: 50px;
    margin-left: 50px;
    padding-top: 20px;
    padding-bottom: 20px;
    padding-left: 20px;
    padding-right: 20px;
    color: #666666;
    border-width: 2px;
    border-style: solid;
    border-color: #41B883;
  }
</style>