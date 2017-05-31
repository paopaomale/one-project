<template>
  <div style="flex-direction: column">
    <tabbar :tabItems="tabItems" @tabBarOnClick="tabBarOnClick"></tabbar>
  </div>
</template>

<script>
  var getBaseURL = require('~include/base-url.js').getBaseURL
  var domModule = weex.requireModule('dom');

  module.exports = {
    data: function () {
      return {
        dir: 'examples',
        tabItems: [
          {
            index: 0,
            icon: '',
            image: './img/home.png',
            selectedImage: './img/home_tao_fill.png',
            src: '../home/index.js?itemId=tab2',
            visibility: 'visible',
          },
          {
            index: 1,
            icon: '',
            image: './img/weitao.png',
            selectedImage: './img/weitao_fill.png',
            src: '../mine/index.js?itemId=tab2',
            visibility: 'hidden',
          },
          {
            index: 2,
            icon: '',
            image: './img/ask.png',
            selectedImage: './img/favor_addCategory@2x.png',
            src: '../video/test.js?itemId=tab2',
            visibility: 'hidden',
          },
          {
            index: 3,
            icon: '',
            image: './img/cart.png',
            selectedImage: './img/cart_fill.png',
            src: '../home/index.js?itemId=tab2',
            visibility: 'hidden',
          },
          {
            index: 4,
            icon: '',
            image: './img/my.png',
            selectedImage: './img/my_fill.png',
            src: '../svg/index.js?itemId=tab2',
            visibility: 'hidden',
          }
        ],
      }
    },
    components: {
      tabbar: require('~include/tabbar.vue')
    },
    created: function() {
      var baseURL = getBaseURL(this)
      for(var i = 0; i < this.tabItems.length; i++) {
        var tabItem = this.tabItems[i];
        tabItem.src = baseURL + tabItem.src;
      }
      domModule.addRule('fontFace', {
        'fontFamily': "iconfont2",
        'src': "url('../iconfont1.ttf')"
      });

    },
    methods: {
      tabBarOnClick: function (e) {
        console.log('tabBarOnClick', e.index)
      }
    }
  }
</script>
