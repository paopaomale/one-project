<template>
  <div class="wrapper">
    <embed
      v-for="item in tabItems"
      :key="item.index"
      :src="item.src"
      type="weex"
      :style="{ visibility: item.visibility }"
      class="content"
      ></embed>
    <div class="tabbar" append="tree" :style="{  blurEffect: 'light' }">
      <tabitem
        v-for="item in tabItems"
        :key="item.index"
        :index="item.index"
        :icon="item.icon"
        @tabItemOnClick="tabItemOnClick"
        ></tabItem>
    </div>
  </div>
</template>

<style>
  .wrapper {
    width: 750;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
  .content {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin-top: 0;
  }
  .tabbar {
    flex-direction: row;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 98;
  }
</style>

<script>
  module.exports = {
    props: {
      tabItems: { default: [] },
      selectedColor: { default: '#ff0000' },
      unselectedColor: { default: '#000000' }
    },
    data: function () {
      return {
        selectedIndex: 0
      }
    },
    components: {
      tabitem: require('./tabitem.vue')
    },
    created: function () {
      this.select(this.selectedIndex);
    },
    methods: {
      tabItemOnClick: function (e) {
        this.selectedIndex = e.index;
        this.select(e.index);
        console.log(11111111111111111111)
        this.$emit('tabBarOnClick', e);
      },
      select: function(index) {
        for(var i = 0; i < this.tabItems.length; i++) {
          var tabItem = this.tabItems[i];
          if(i == index){
            tabItem.icon = tabItem.selectedImage;
            tabItem.titleColor = this.selectedColor;
            tabItem.visibility = 'visible';
          }
          else {
            tabItem.icon = tabItem.image;
            tabItem.titleColor = this.unselectedColor;
            tabItem.visibility = 'hidden';
          }
        }
      },
    }
  }
</script>
