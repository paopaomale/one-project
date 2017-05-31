<template>
<div>

 <navbar
    dataRole="none"
    :leftContainerStyle="{
        width: 80
    }"
    :centerContainerStyle="{
        width: 530
    }"
    :rightContainerStyle="{
        width: 70
    }">
      <div slot="left-slot" v-on:click="openScanner">
        <text style="color:white;fontSize:46;" class="left-slot">&#xe7de;</text>
        <text style="color:white;fontSize:18;" class="left-slot">扫一扫</text>
      </div>
      <navbar-input slot="center-slot"></navbar-input>
      <text slot="right-slot" class='left-slot'>&#xe7db;</text>
  </navbar>
<div class="content-page" :style="{top:navBarHeight}">

  <scroller>
  <image style="position:absolute;width:750;height:562.5;top:-562" src="./img/second_floor.jpg"></image>
  <refresh-taobao></refresh-taobao>
  <div>

      <slider class="slider-banner" interval="3000" auto-play="true">
        <div class="slider-banner-frame" v-for="item in imageList" @click="sliderBannerOpen(item)">
          <image class="slider-banner-image" resize="cover" :src="item.src"></image>
        </div>
        <indicator class="slider-banner-indicator"></indicator>
      </slider>


    <div class="model-one">
      <div v-for="(item, index) in modelOneData"  @click="clickListItem(item, index)" style="margin-bottom:24px;">
        <div @click="modelOnePush(item)">
        <image :src="item.img" :alt="item.text" style="width: 122px;height: 86px;margin-left:9px;margin-right:9px;"></image>
          <text style="text-align: center;font-size: 20px;width: 140px;height: 34px;line-height: 34px;color:#606060">{{item.text}}</text>
        </div>
      </div>
    </div>


    <div class="marquee-warp">
      <div class="marquee-icon">
        <image src="./img/marquee-icon.png" style="width:92px;height:89px;position:absolute;right:28px;top:6px"></image>
      </div>
      <scroller style='width:540px;height:98px;margin-top:5px;margin-left:20px;position:absolute;top:0px;left:160px'>
        <marquee class="marquee-content"
          :step="marquee.height"
          :count="marquee.list.length+1"
          :interval="marquee.interval"
          :duration="marquee.duration"
          :style="{
            height: marquee.height,
          }"
          @change="marqueeChange">
          <div
            v-for="item in marquee.list"
            :style="{
              width: '540px',
              height: marquee.height,
              paddingTop: 0,
              paddingBottom: marquee.height * 0.5,
            }">
            <text class="marquee-mark"
              :style="{
              }">热评</text>
            <text class="marquee-text"
              :style="{
                height: marquee.height /2
              }">{{item.text1}}</text>
            <text class="marquee-mark"
              :style="{
                top: marquee.height /2 + 12
              }">热评</text>
            <text class="marquee-text"
              :style="{
                height: marquee.height /2,
                top: marquee.height /2
            }">{{item.text2}}</text>
          </div>
          <div
            :style="{
              width: '540px',
              height: marquee.height,
              paddingTop: 0,
              paddingBottom: marquee.height * 0.5,
            }">
            <text class="marquee-mark"
              :style="{
              }">热评</text>
            <text class="marquee-text"
              :style="{
                height: marquee.height /2
              }">{{marquee.list[0].text1}}</text>
            <text class="marquee-mark"
              :style="{
                top: marquee.height /2 + 12
              }">热评</text>
            <text class="marquee-text"
              :style="{
                height: marquee.height /2,
                top: marquee.height /2
            }">{{marquee.list[0].text2}}</text>
          </div>
        </marquee>
      </scroller>
    </div>


    

    <div class="model-two" style="margin-top:40px">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
<!--      <slider class="slider-banner" interval="3000" auto-play="true">
        <div class="slider-banner-frame" v-for="item in imageList" @click="sliderBannerOpen(item)">
          <image class="slider-banner-image" resize="cover" :src="item.src"></image>
        </div>
        <indicator class="slider-banner-indicator"></indicator>
      </slider> -->
    <ul class="model-two">
      <li v-for="(item, index) in modelTwoData" :key="index" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </li>
    </ul>
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <ul class="model-two">
      <li v-for="(item, index) in modelTwoData" :key="index" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </li>
    </ul>    
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <ul class="model-two">
      <li v-for="(item, index) in modelTwoData" :key="index" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </li>
    </ul>  
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <div class="model-two">
      <div v-for="(item, index) in modelTwoData" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </div>
    </div>
    <ul class="model-two" style="padding-bottom:98px">
      <li v-for="(item, index) in modelTwoData" :key="index" class="model-two-li" :style="{borderRightWidth:index%2?'0':'1px'}">
        <a :href="item.href">
        <image :src="item.img" :alt="item.text" style="width: 374px;height: 222px;"></image>
        </a>
      </li>
    </ul>


 

 


   <!--       <div class="model-two">
            <ListItem :items="modelTwoData" :classNames="['r-1px-border','b-1px-border','b-1px-border','r-1px-border']"></ListItem>
          </div>

         <div class="model-three">
            <ListItem :items="modelThreeData" :classNames="['border-1px-rb','border-1px-rb','border-1px-rb','border-1px-rb',
            ['border-1px-rb','flex-grow-1'],'border-1px-rb','border-1px-rb','border-1px-rb']">
            </ListItem>
          </div> -->

          <!-- <TBRecommedList :items='TBRecommedListData'></TBRecommedList> -->

          <!-- <div class="model-test">
            <ListItem :items='itemTest' inline-template>
              <ul>
                <li v-for="item in items">
                  sd
                </li>
              </ul>
            </ListItem>

            
          </div>
          <div class="model-tt">
            <ListItem :items='itemTest'>
            </ListItem>
          </div> -->
      

  <!-- <Tabbar></Tabbar> -->



</div>
<loading class="loading" @loading="onloading" :display="showLoading">
  <text class="loading-indicator">Loading ...</text>
</loading>

  </scroller>

   <div class="wrapper-a">
    <div ref="test" @click="move" class="box">
      <image src="https://paopaopc.github.io/oauth-test/img/bottom_buyue.png" style="width:256px;height:256px;"></image>
    </div>
  </div>
</div>


</div>
</template>





<script>
// import axios from 'axios'

// import Swipe from '../components/Swipe.vue'

// import { Swipe, SwipeItem } from 'vue-swipe'

// import Tabbar from '../components/Tabbar/Tabbar.vue'

// import ListItem from '../components/ListItem.vue'
// import TBRecommedList from '../components/TB/TB-RecommedList.vue'

import ModelOneData from './data/model-one-data.json'
import ModelTwoData from './data/model-two-data.json'
// import ModelThreeData from './data/model-three-data.json'

// import TBRecommedListData from './data/TB-RecommedList-data.json'

// var animation = require('@weex-module/animation')


const navigator = weex.requireModule('navigator')
  const getBaseURL = require('../include/base-url.js').getBaseURL
  const animation = weex.requireModule('animation')
  const scanner = weex.requireModule('scanner')


 const LOADMORE_COUNT = 4
export default {
  name: 'item-test',
  components: {
    // ListItem,
    // TBRecommedList,
    // Tabbar,
    // Swipe,
    // SwipeItem
     panel: require('../include/panel.vue'),
      navbar: require('../components/navbar/navbar.vue'),
      navbarInput: require('../components/navbar/navbar-input.vue'),
      navpage: require('../include/navpage.vue'),
      button: require('../include/button.vue'),
    marquee: require('weex-vue-components/marquee.vue'),
    refreshTaobao: require('../components/refresh/refresh-taobao.vue')
  },
  mounted () {
  },
  created: function() {
    this.baseURL = getBaseURL(this)
  },
  methods: {
    openScanner() {
      scanner.openScanner();
    },
      push: function () {
        var params = {
          'url':  this.baseURL + 'vue/components/navigator.js?test=1',
          'animated' : 'true',
        }
        navigator.push(params, function () {});
      },
      pop: function () {
        var params = {
          'url':  this.baseURL + 'vue/components/navigator.js?test=1',
          'animated' : 'true',
        }
        navigator.pop(params, function () {});
      },
    modelOnePush (item){
      var bundleUrl = weex.config.bundleUrl;
      var baseUrl = bundleUrl.substring(0,bundleUrl.indexOf('bundlejs/')+9);
      navigator.push({
        url: baseUrl+'home/index.js',
        animated: "true"
      })
    },
    sliderBannerOpen (item){
      if (item && item.href) {
          this.jump(`/article/${item.href}`)
        } else {
          window.open('https://www.baidu.com')
        }
    },
    modelOneCallback (item, index){
      this.$router.push('/aa')
    },
  
    loadMore () {
      this.busy = true;

      setTimeout(() => {
        for (var i = 0, j = 10; i < j; i++) {
          this.data.push({ name: count++ });
        }
        this.busy = false;
      }, 1000);
    },
      onloading (event) {
        this.showLoading = 'show'
        setTimeout(() => {
          const length = this.lists.length
          for (let i = length; i < length + LOADMORE_COUNT; ++i) {
            this.lists.push(i + 1)
          }
          this.showLoading = 'hide'
        }, 1500)
      },
      move () {
        var testEl = this.$refs.test;
        if(!this.animation){
          animation.transition(testEl, {
            styles: {
              transform: 'translate(500, -900)',
              transformOrigin: 'center center',
            },
            duration: 1600, //ms
            timingFunction: 'ease-in-out',
            scale: 2,
            delay: 0 //ms
          }, function () {
          })
            this.animation = true
        } else {
          animation.transition(testEl, {
            styles: {
              transform: 'translate(0, 0)',
              transformOrigin: 'center center',
            },
            duration: 1600, //ms
            timingFunction: 'ease-in-out',
            scale: 1,
            delay: 0 //ms
          }, function () {
          })
            this.animation = false

        }
        navigator.pop({
          animated: "true"
        })

        
      },
      marqueeChange: function (e) {
      }
  },
  data: function(){
    return {
       navBarHeight: 130,
        title: 'Navigator',
        dir: 'examples',
        baseURL: '',
      modelOneData: ModelOneData,
      // modelThreeData: ModelThreeData,
      modelTwoData: ModelTwoData,
      imageList: [
          { 
            src: 'https://img.alicdn.com/tps/TB12veZPXXXXXXOXFXXXXXXXXXX-1125-352.jpg_q50.jpg',
            href: 'https://pages.tmall.com/wow/act/15910/huijia?scm=2027.1.35751.146303&spm=a215s.7406091.1.home-1-5-1&locate=home-1-5-1'
          },
          { 
            src: 'https://aecpm.alicdn.com/simba/img/TB1r7qUPXXXXXbVXpXXSutbFXXX.jpg_q50.jpg',
            href: 'https://market.m.taobao.com/markets/act-mobile/taopinpai1?scm=2027.1007_12948_71520_100200300000000_84900_4_43674_4021.35504.146608&item_id=542417268103&activity_id=43674&spm=a215s.7406091.1.home-1-5-4&locate=home-1-5-4'
            
          },
          { src: 'https://aecpm.alicdn.com/simba/img/TB14ab1KpXXXXclXFXXSutbFXXX.jpg_q50.jpg',
            href: 'https://pages.tmall.com/wow/act/15910/huijia?scm=2027.1.35751.146303&spm=a215s.7406091.1.home-1-5-1&locate=home-1-5-1'
          },
          { src: 'https://gw.alicdn.com/imgextra/i2/59/TB2GWWzc9FjpuFjSszhXXaBuVXa_!!59-0-yamato.jpg_q50.jpg',
            href: 'https://market.m.taobao.com/markets/act-mobile/taopinpai1?scm=2027.1007_12948_71520_100200300000000_84900_4_43674_4021.35504.146608&item_id=542417268103&activity_id=43674&spm=a215s.7406091.1.home-1-5-4&locate=home-1-5-4'
          },
          { src: 'https://img.alicdn.com/tps/TB1BBq1PXXXXXaeXXXXXXXXXXXX-1125-352.jpg_q50.jpg',
            href: 'https://pages.tmall.com/wow/act/15910/huijia?scm=2027.1.35751.146303&spm=a215s.7406091.1.home-1-5-1&locate=home-1-5-1'
          },
          { src: 'https://img.alicdn.com/tps/TB1xLfTPXXXXXcgXpXXXXXXXXXX-1125-352.jpg_q50.jpg',
            href: 'https://click.mz.simba.taobao.com/ecpm?e=FIoJYBA61%2F6m7JZHpWwQvxsQmLP5zomMgMXdo3%2BuocNJPOekVymVepez5U%2FIgPve8Yf%2BHgOtPPkqSzJ2i2ivIsqyNMGMHOJEUK7RDtIZydUyXElRAMLwo62Qb3Xy%2B8KVkhmz%2BE4AO%2BJfWlhn61lQT0w2bmrVnXERoa4mkULV16H28nKX%2BFS8m8K9UT9VU9ODRtSV09hKFTYVKCVNhzJxcToNny2uP5RqxTRCNl0FU4cgmPN%2Bc0NY25kBvvHslWXsJzNJZ%2B14HGg%2BKG1Sk7ZS0Eor6gTzTgO2MXYJBJhaJ9XJqfG0Wljg1qRO3QixoL7p07I4Gg9TJlMbEJiz%2Bc6JjA%3D%3D&u=https%3A%2F%2Fre.m.taobao.com%2Ftssearch%3Frefpid%3Decpm&k=345'
          },
          { src: 'https://gw.alicdn.com/imgextra/i4/71/TB2MV.tcHJkpuFjy1zcXXa5FFXa_!!71-0-yamato.jpg_q50.jpg',
            href: 'https://pages.tmall.com/wow/act/15910/huijia?scm=2027.1.35751.146303&spm=a215s.7406091.1.home-1-5-1&locate=home-1-5-1'
          },
          { src: 'https://img.alicdn.com/tps/TB1UjjhPXXXXXcTXpXXXXXXXXXX-1125-352.jpg_q50.jpg',
            href: 'https://click.mz.simba.taobao.com/ecpm?e=FIoJYBA61%2F6m7JZHpWwQvxsQmLP5zomMgMXdo3%2BuocNJPOekVymVepez5U%2FIgPve8Yf%2BHgOtPPkqSzJ2i2ivIsqyNMGMHOJEUK7RDtIZydUyXElRAMLwo62Qb3Xy%2B8KVkhmz%2BE4AO%2BJfWlhn61lQT0w2bmrVnXERoa4mkULV16H28nKX%2BFS8m8K9UT9VU9ODRtSV09hKFTYVKCVNhzJxcToNny2uP5RqxTRCNl0FU4cgmPN%2Bc0NY25kBvvHslWXsJzNJZ%2B14HGg%2BKG1Sk7ZS0Eor6gTzTgO2MXYJBJhaJ9XJqfG0Wljg1qRO3QixoL7p07I4Gg9TJlMbEJiz%2Bc6JjA%3D%3D&u=https%3A%2F%2Fre.m.taobao.com%2Ftssearch%3Frefpid%3Decpm&k=345'
          },

        ],
      marquee: {
            height: 98,
            duration: 1000,
            interval: 2000,
            list: [
              {
                text1: '小米6 1999起售，过年就能买到了！',
                text2: '这2个功能都不会关，手机没电怪你自己（这个测试一下省略号这个测试一下省略号这个测试一下省略号这个测试一下省略号）'
              },
              {
                text1: '新思域R来了，只会开自动挡的买不了！这个测试一下省略号这个测试一下省略号这个测试一下省略号',
                text2: '你想不到诺基亚8800现在还能卖多少？'
              },
              {
                text1: '骁龙835媲美i3？Intel打脸高通',
                text2: '骚年你没看错，这款敞篷跑车18万'
              }
            ]
        },
         lists: [1, 2, 3, 4, 5],
      // TBRecommedListData: TBRecommedListData,
      busy: false,
      checked: false,
      value:'',
      animation: false,
      showLoading: 'hide',
      refreshing: false,
    }
  }
}
</script>


<style>
  .left-slot {
    color: white;
    width: 80px;
    font-weight:100;
    text-align: center;
    font-family: iconfont2;
  }
  .content-page {
    left: 0;
    right: 0;
    bottom: 0;
    position: absolute;
    background-color: #f4f4f4;
  }
  /* 广告slide */
  .slider-banner {
    width: 750px;
    height: 234.375px;
  }
  .slider-banner-frame {
    width: 750px;
    height: 234.375px;
    position: relative;
  }
  .slider-banner-image {
    width: 750px;
    height: 234.375px;
  }

  .slider-banner-indicator {
    width:200px;
    height:20px;
    right: 54px;
    bottom:22px;
    item-selected-color: #ff5501;
    item-color:#cecece;
    item-size: 16px;
  }

  /* 模块 */
  .model-one {
    display: flex;
    flex-wrap: wrap;
    padding-left:24px;
    padding-right:24px;
    padding-top: 24px;
    flex-direction: row;
    background-color: white;
  }
  
  /* 跑马灯广告 */
  .marquee-warp {
    width: 750px;
    height: 118px;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 28px;
    padding-right: 28px;
    position: relative;
    background-color: white;

  }
  .marquee-icon {
    width: 132px;
    height: 98px;
    border-right-color: #e6e6e6;
    border-right-width: 1px;
    background-color: white;
    
  }

  .marquee-content {
    width: 540;
    padding-left: 5px;
    padding-right: 5px;
    padding-top: 5px;
    padding-bottom: 5px;
  }

  .marquee-mark {
    color: #db3a34;
    font-size: 24px;
    position: absolute;
    padding-top: 5px;
    top: 12px;
    line-height: 20px;
    width: 58px;
    border-width: 1px;
    border-color: #db3a34;
    border-radius: 5px;
    text-align: center;
    height: 30px;
  }
  
  .marquee-text {
    color: #323232;
    font-size: 24px;
    padding-top: 10px;
    position: absolute;
    top: 0;
    left: 68px;
    right: 0;
    text-overflow: ellipsis;
    lines: 1;
  }

  .model-two {
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
    margin-top: 12px;
    border-top-width: 2px;
    border-top-color: #e8e8e8;
  }

  .model-two-li {
   /* width: 375px;
    height: 224px;*/
    border-bottom-width: 2px;
    border-bottom-color: #e8e8e8;
    border-right-color: #e8e8e8;
  }


.wrapper-a {
    height: 100%;
    position: absolute;
    bottom: 0;
  }
  .box {
    width: 250px;
    height: 250px;
    top:-200px;
  }

.wrapper {
    flex-direction: column;
    justify-content: center;
  }
  .group {
    flex-direction: row;
    justify-content: center;
    margin-bottom: 40px;
    align-items: center;
  }
  .label {
    font-size: 40px;
    color: #888888;
  }
  .title {
    font-size: 80px;
    color: #41B883;
  }
  .button {
    font-size: 36px;
    width: 280px;
    color: #41B883;
    text-align: center;
    padding-top: 25px;
    padding-bottom: 25px;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(162, 217, 192);
    background-color: rgba(162, 217, 192, 0.2);
  }

.example {
    flex-direction: row;
    justify-content: flex-start;
    margin-top: 60px;
  }
  .label {
    font-size: 40px;
    line-height: 60px;
    width: 350px;
    color: #666;
    text-align: right;
    margin-right: 20px;
  }
  .info {
    font-size: 30px;
    line-height: 60px;
    color: #BBB;
    margin-left: 10px;
  }

    .model-test ul {
      display: flex;
      box-sizing: border-box;
      flex-wrap: wrap;
    }
    .model-test li {
      flex: 1;
    }

    .model-tt ul {
      display: flex;
        flex-wrap: wrap;
        height: 140px;
    }
    
    .model-tt li {
      width: 30%;
        height: 50px;
        position: relative;
    } 

    .model-tt li a {
      display: block;
      height: 100%;
    }

    .model-tt li img {
      display: block;
      width: 100%;

    }

    .model-three li {
      width: 19%;
      display: inline-block;
      flex-grow: 1;
      position: relative;
      padding-top: 30.5%;
    }

    .model-three li:nth-child(1),.model-three li:nth-child(5) {
      width: 38%;
    }

    .model-three li a {
      width: 100%;
      height: 100%;
      position: absolute;
      top: 0;
    }

    .model-three li img {
      width: 100%;
    }





    .vue_tabbar_item.bar_item_on .tabbar_label {
      color: red;
    }
        


        .loading {
    justify-content: center;
  }
  .loading-indicator {
    color: #888888;
    font-size: 42px;
    padding-top: 20px;
    padding-bottom: 20px;
    text-align: center;
  }
  .refresh-indicator {
    color: #888888;
    font-size: 42px;
    text-align: center;
  }


 .panel {
    width: 600px;
    height: 250px;
    margin-left: 75px;
    margin-top: 35px;
    margin-bottom: 35px;
    flex-direction: column;
    justify-content: center;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(162, 217, 192);
    background-color: rgba(162, 217, 192, 0.2);
  }
  .text {
    font-size: 50px;
    text-align: center;
    color: #41B883;
  }
  
      
</style>
