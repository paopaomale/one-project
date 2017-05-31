<template>
  <div
    :style="{backgroundColor:backgroundColor}"
    class="container"
    @click="onclickitem">
    <image
      :src="icon"
      class="tab-icon"></image>
  </div>  
</template>

<style>
  .container {
    flex: 1; 
    flex-direction: column; 
    align-items:center; 
    justify-content:center; 
    height: 98;
  }
  .tab-icon {
    width: 96; 
    height: 96;
  }
/*  .tab-text {
    margin-top: 5; 
    text-align: center;  
    font-size: 20;
  }*/
</style>

<script>
  module.exports = {
    props: {
      index: { default: 0 },
      // title: { default: '' },
      // titleColor: { default: '#000000' },
      icon: { default: '' },
      backgroundColor: { default: 'rgba(255, 255, 255, 0.5)' },
      backgroundImage: { default: 'linear-gradient(to right, #a80077,rgba(200, 54, 54, 0.5))'}
    },
    methods: {
      onclickitem: function (e) {
        var params = {
          index: this.index
        };
        this.$emit('tabItemOnClick', params);
      }
    }
  }
</script>
