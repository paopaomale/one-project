<template>
  <div class="wrapper" @click="update">
    <image :src="logoUrl" class="logo"></image>
    <text class="title">Hello {{target}}</text>
    <text class="desc">00000</text>
  </div>
</template>

<style>
  .wrapper { align-items: center; margin-top: 120px; }
  .title { padding-top:40px; padding-bottom: 40px; font-size: 48px; }
  .logo { width: 360px; height: 156px; }
  .desc { padding-top: 20px; color:#888; font-size: 24px;}
</style>

<script>
  const navigator = weex.requireModule('navigator')
  export default {
    data: {
      logoUrl: 'http://img1.vued.vanthink.cn/vued08aa73a9ab65dcbd360ec54659ada97c.png',
      target: 'World'
    },
    methods: {
      update: function (e) {
        this.target = 'Weex'
        var bundleUrl = weex.config.bundleUrl;
        var baseUrl = bundleUrl.substring(0,bundleUrl.indexOf('bundlejs/')+9);
        navigator.push({
          url: baseUrl+'index.js',
          animated: "true"
        }, item => {
          modal.toast({ message: 'callback: ' + item })
        })
        
      }
    }
  }
</script>