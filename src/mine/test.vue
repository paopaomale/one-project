<template>
  <div>
    <slider class="slider" interval="3000" auto-play="true" v-on:click="onClickContainer">
      <div class="frame" v-for="img in imageList">
        <image class="image" resize="cover" :src="img.src"></image>
      </div>
    </slider>
   
  </div>
</template>
<style scoped>
  .image {
    width: 700px;
    height: 700px;
  }
  .slider {
    margin-top: 25px;
    margin-left: 25px;
    width: 700px;
    height: 700px;
    border-width: 2px;
    border-style: solid;
    border-color: #41B883;
  }
  .frame {
    width: 700px;
    height: 700px;
    position: relative;
  }
  .text {
    color: red;
    font-size: 66;
    font-family: iconfont2;
  }
</style>
<script>
  const navigator = weex.requireModule('navigator')
  export default {
    data () {
      return {
        imageList: [
          { src: './img/my.png'},
          { src: '../main/img/my.png'},
          { src: 'https://gd3.alicdn.com/bao/uploaded/i3/TB1x6hYLXXXXXazXVXXXXXXXXXX_!!0-item_pic.jpg'}
        ]
      }
    },
    components: {
      testRender: require('../components/test-render.vue'),
      aaa: require('../components/aaa.vue')
    },
    methods: {
      onClickContainer: function (e) {
        var bundleUrl = weex.config.bundleUrl;
        var baseUrl = bundleUrl.substring(0,bundleUrl.indexOf('bundlejs/')+9);
        navigator.pop({
          animated: "false"
        },function(){
          navigator.push({
            url: baseUrl+'mine/index.js',
            animated: "false"
          })
        });


      }
    }
  }
</script>