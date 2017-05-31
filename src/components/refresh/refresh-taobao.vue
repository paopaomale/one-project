<template>
   <refresh class="refresh"  @pullingdown="onpullingdown" @refresh="refresh" :display="refreshing ? 'show' : 'hide'">
        <div ref="test" >
          <svg class="refresh-icon">
            <path d="M28,1 A27,27 0 1,1 21.01188578223194,1.9200026901951546" stroke="#666" stroke-width="1" fill="transparent" :stroke-dasharray="[dasharray,170]"/>  
          </svg>
        </div>
        
        <text class="refresh-title" style="color:#666">{{this.title}}</text>
    </refresh>
</template>


<style>
  .refresh{
    flex-direction: row;
    justify-content: center;

    width: 750px;
    padding-top: 60px;
    padding-bottom: 50px;
  }
  .refresh-icon{
    width: 56px;
    height: 56px;
  }
  .refresh-title {
    width: 220px;
    height: 56px;
    line-height: 56px;
    font-size: 22px;
    text-align: center;
  }
</style>

<script>
  const MAX_DASHARRAY = 170;
  const REFRESH_PULLING_DISTANCE = -166;
  const SECOND_FLOOR_PULLING_DISTANCE = -400;
  const navigator = weex.requireModule('navigator')
  const animation = weex.requireModule('animation')


  module.exports = {
    data: function(){
      return {
        dasharray: 10,
        value:0,
        refreshing: false,
        title: '下拉即可刷新...',
        canToSecondFloor: true,
      }
    },
    props: {

    },
    // created: function(){
    
    // },
    methods: {
      onpullingdown (event) {
        if(event.pullingDistance<=0  && !this.refreshing){
          var newValue = -event.pullingDistance/2.4-4;
          if(newValue < MAX_DASHARRAY){
            this.dasharray = newValue;
          }
          if(event.pullingDistance > REFRESH_PULLING_DISTANCE){
            this.title = '下拉即可刷新...';
          } else if(this.canToSecondFloor && (event.pullingDistance < SECOND_FLOOR_PULLING_DISTANCE) ){
            this.title = '进入淘宝二楼...';
          } else {
            this.title = '释放即可刷新...';
          }
          
        }
      },
      refresh(event) {
        var me = this;
        if(this.canToSecondFloor && (this.title === "进入淘宝二楼...") ){
          var bundleUrl = weex.config.bundleUrl;
          var baseUrl = bundleUrl.substring(0,bundleUrl.indexOf('bundlejs/')+9);
          navigator.push({
            url: baseUrl+'svg/index.js',
            animated: "false"
          })
          return 
        }
        this.refreshing = true;
        this.title = '加载中...';
        this.dasharray = MAX_DASHARRAY;
        var testEl = this.$refs.test;
        animation.transition(testEl, {
          styles: {
            transform: 'rotate(18)',
          },
          duration: 2000, //ms
          timingFunction: 'linear',
          delay: 0 //ms
        }, function () {
          me.refreshing = false
          animation.transition(testEl, {
            styles: {
              transform: 'rotate(0)',
            },
            duration: 0, //ms
          })
        })

      }
    }
  }
</script>