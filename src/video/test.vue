<template>
  <scroller>
    <div class="zhibo">
      <div class="zhibo-left">
        <text class="zhibo-left-title">你要控技你寄几！</text>
        <text class="zhibo-left-content">不是吧！？你可能看了假的淘宝</text>
        <text class="zhibo-left-button">看直播</text>
      </div>
      <video class="zhibo-right" :src="src" :play-status="videoStatus" controls
      @appear="startVideo"  @disappear="pasueVideo" @finish="onfinish"></video>
    </div>
    
    <text class="info">state: {{state}}</text>
    <text class="btn" v-on:click="startVideo">开始</text>
    <text class="btn" style="background-color:red" v-on:click="pasueVideo">暂停</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
    <text class="btn">测试</text>
  </scroller>
</template>
<style scoped>
  
  .info {
    margin-top: 40px;
    font-size: 40px;
    text-align: center;
  }
  .btn {
    background-color: yellow;
    width: 200;
    height: 100;
    font-size: 30;
    line-height: 100;
    text-align: center;
  }
  .zhibo {
    flex-direction: row;
    justify-content: flex-start;
    width: 750px;
    padding-left: 18px;
    padding-right: 18px;

    margin-top: 60px;
  }
  .zhibo-left {
    width: 357px;
    height: 201px;
  }
  .zhibo-left-title {
    font-size: 36px;
    line-height: 40px;
    font-family: 700;
    color: black;
    margin-top: 50px;
  }
  .zhibo-left-content {
    font-size: 24px;
    line-height: 40px;
    color: #333;
  }
  .zhibo-left-button {
    font-size: 28px;
    line-height: 40px;
    color: red;
  }
  .zhibo-right {
    width: 357px;
    height: 201px;
  }
</style>
<script>
  export default {
    data () {
      return {
        state: '----',
        videoStatus: 'pause',
        src:'./video.MOV'
      }
    },
    created (){
      console.log('created！！！！！！')
      this.videoStatus = 'play';
    },
    ready (){
      console.log('ready！！！！！！')
    },
    destroyed (){
      console.log('destroyed！！！！！！')
    },
    methods:{
      startVideo () {
        this.videoStatus = 'play';
      },
      pasueVideo () {
        this.videoStatus = 'pause';
      },
      onstart (event) {
        this.state = 'onstart'
      },
      onpause (event) {
        this.state = 'onpause'
      },
      onfinish (event) {
      },
      onfail (event) {
        this.state = 'onfinish'
      }
    }
  }
</script>