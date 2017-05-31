<template>
  <div>
    <slider class="slider" interval="3000" auto-play="true">
      <div class="frame" v-for="img in imageList">
        <image class="image" resize="cover" :src="img.src"></image>
      </div>
    </slider>
    <test-render>
        <text class="text">{{ this.imageList[0].src + '&#xe6bc; &#xe6fd; &#xe6fc; &#xe7cd; &#xe6c3;&#xe7f0; &#xe600;'}}</text>
    </test-render>
    <test-render>
         <aaa></aaa>
    </test-render>
    <test-render>
        <text>{{ this.imageList[2].src }}</text>
    </test-render>

    <text class="icon-skin"></text>
     
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
    }
  }
</script>