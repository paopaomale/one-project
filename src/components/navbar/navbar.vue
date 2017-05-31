<template>
  <div
    :dataRole="dataRole"
    class="container"
    :style="containerStyle">
      <div v-if="leftItemShow" :style="leftContainerStyle" class="left-container" >
        <text
          v-if="leftItemTitle"
          :style="leftItemTextStyle"
          class="left-text"
          v-on:click="onclickleftitem">{{leftItemTitle}}</text>
        <image
          v-if="leftItemSrc"
          :src="leftItemSrc"
          :style="leftItemImageStyle"
          class="left-image"
          v-on:click="onclickleftitem"></image>
        <slot class="left-slot" name="left-slot"></slot>
      </div>


      <div v-if="centerItemShow" :style="centerContainerStyle" class="center-container">
        <text
          v-if="title"
          :style="{ color: centerItemColor }"
          class="center-text">{{title}}</text>
        <slot class="center-slot" name="center-slot"></slot>
      </div>


      <div v-if="rightItemShow" :style="rightContainerStyle" class="right-container">
        <text
          v-if="rightItemTitle"
          :style="rightItemStyle"
          class="right-text"
          v-on:click="onclickrightitem">{{rightItemTitle}}</text>
        <image
          v-if="rightItemSrc"
          :src="rightItemSrc"
          class="right-image"
          v-on:click="onclickrightitem"></image>
        <slot class="right-slot" name='right-slot'></slot>
      </div>

  </div>
</template>

<style>
  .container {
    flex-direction:row;
    justify-content: space-between;
    padding-left: 12px;
    padding-right: 12px;

    top: 0; 
    left: 0; 
    right: 0; 
    width: 750;

    background-image:linear-gradient(to right, #ff9000,#ff5000);
    background-color: transparent;
    height: 130;
  }

  .left-container {
    top: 40;
    height: 90;
    width: 230;
    justify-content: flex-start;
    flex-direction:row;
    padding-top: 8;

    overflow: hidden;

  }
  .center-container {
    top: 40;
    height: 90;
    width: 230;
    justify-content: center;
    flex-direction:row;
    padding-top: 8;

    overflow: hidden;

  }
  .right-container {
    top: 40;
    height: 90;
    width: 230;
    justify-content: flex-end;
    flex-direction:row;
    padding-top: 8;

    overflow: hidden;

  }

  .left-text {

  }

  .left-text {

  }

  .right-text {

  }

  .left-image {

  }

  .right-image {

  }

  .left-slot {

  }

  .center-slot {

  }

  .right-slot {

  }

</style>

<script>
  module.exports = {
    props: {
      dataRole: { default: 'navbar' },

      // -----数据 -------
      leftItemTitle: { default: '' },
      leftItemSrc: { default: '' },
      title: { default: '' },
      rightItemSrc: { default: '' },
      rightItemTitle: { default: '' },


      // -----样式 -------
      // 整个导航条的样式
      containerStyle: { default: '' },

      // 左侧容器的样式
      leftContainerStyle: { default: '' },
      // 左边文本项的样式
      leftItemTextStyle: { default: '' },
      // 左边图片项的样式
      leftItemImageStyle: { default: '' },

      // 中间容器的样式
      centerContainerStyle: { default: '' },
      // 中间文本项的样式
      centerItemStyle: { default: '' },

      // 右侧容器的样式
      rightContainerStyle: { default: '' },
      // 右边文本项的样式
      rightItemTextStyle: { default: '' },
      // 右边图片项的样式
      rightItemImageStyle: { default: '' },


      //  ----- 显示隐藏 -------
      leftItemShow: { default: true },
      centerItemShow: { default: true },
      rightItemShow: { default: true }

    },
    created: function(){
      // if(!this.containerStyle.backgroundImage){
      //   Object.assign(this.containerStyle,{backgroundImage:'linear-gradient(to right, #123,#456)'})
      // }
    },
    methods: {
      onclickrightitem: function (e) {
        this.$emit('naviBarRightItemClick');
      },
      onclickleftitem: function (e) {
        this.$emit('naviBarLeftItemClick');
      }
    }
  }
</script>
