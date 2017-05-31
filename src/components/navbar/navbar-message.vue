<template>
  <div class="container">
    <text class="container-icon">&#xe7db;</text>
    <text class="container-text">消息</text>
  </div>
</template>

<style>
 .container {
    width: 530;
    height: 84;
    blur-effect: 'light';
 }
 .container-icon {

 }
 .container-text {

 }

</style>

<script>
  module.exports = {
    props: {

    },
    created: function(){
    
    },
    methods: {
      onclickrightitem: function (e) {
        this.$emit('naviBarRightItemClick');
      }
    }
  }
</script>