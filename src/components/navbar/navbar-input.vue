<template>
  <div class='container' v-on:click="onClickContainer">
    <text class="container-icon">&#xe65c;</text>
    <text class="container-text">电风扇 落地</text>
    <text class="container-camera" v-on:click="openScanner">&#xe7e6;</text>
  </div>
</template>

<style>
 .container {
    flex-direction: row;
    justify-content: flex-start;

    width: 530;
    height: 62;
    blur-effect: 'light';
    border-radius: 40;
    overflow: hidden;
 }
 .container-icon {

    color: white;
    font-family: iconfont2;

    width: 70;
    height: 62;
    line-height: 62;
    padding-left: 6;
    text-align: center;
    font-size: 36;
 }
 .container-text {
    width: 382;
    height: 62;
    line-height: 62;
    font-size: 28;
    color: white;

 }
 .container-camera {
    color: white;
    font-family: iconfont2;

    width: 74;
    height: 62;
    line-height: 62;
    padding-left: 10;
    font-size: 40;
    text-align: center;

 }


</style>

<script>
  const navigator = weex.requireModule('navigator')
  const scanner = weex.requireModule('scanner')
  module.exports = {
    props: {

    },
    // created: function(){
    
    // },
    methods: {
      onClickContainer: function (e) {
        var bundleUrl = weex.config.bundleUrl;
        var baseUrl = bundleUrl.substring(0,bundleUrl.indexOf('bundlejs/')+9);
        navigator.push({
          url: baseUrl+'search/test.js',
          animated: "false"
        })
      },
      openScanner: function(){
        scanner.openScanner();
      }
    }
  }
</script>