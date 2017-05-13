<template>
  <div class="page">
    <navbar back="true" title="Advanced Demos"></navbar>
    <scroller class="main">
      <text class="desc">Some Svg Figures</text>
      <div class="item">
        <svg style="width:363px; height:177px;" viewBox="0 0 121 59" >
                <path d="M34.93 21.862a2.734 2.734 0 0 1 0-5.466 2.734 2.734 0 0 1 0 5.466m20.622-10.31a20.59 20.59 0 0 0-5.766-4.86
                C34.99-4.104 14.29-1.036 3.256 13.506 7.303 8.28 13.39 5.503 19.57 5.472 8.03 10.708 0 22.312 0 35.8c0 3.77.837 7.627
                 1.993 11.005 1.66-1.508 3.173-5.484 4.948-6.862 .87 4.27 2.554 10.537 4.886 14.043 2.168-4.383 3.93-7.445 7.157-11.055 .88
                  6.3 4.505 11.052 8.398 15.71a33.137 33.137 0 0 1 3.138-15.576c.156.076.313.15.472.224A33.468 33.468 0 0 0 41.56 55.13
                  c-1.486-3.093-2.32-6.452-2.788-9.984 a33.586 33.586 0 0 1-.294-4.416
                  c0-3.223-.1-6.338 .754-9.286 .4-1.374 .51-2.71 1.075-4.006 .22-.503 .45-1 .695-1.49
                   1.054-2.12 2.147-4.147 3.747-6.126 .303-.376 .802-.745 1.12-1.108 1.435-1.412
                   4.15-2.285 6.324-2.285 4.123 0 7.406 2.918 7.8 6.95-.146-4.694-1.658-8.434-4.442-11.828" fill="#00B4FF" />
        </svg>
      </div>
    </scroller>
    
  </div>
   
</template>

<style>
  .page{
    flex: 1;
    padding-top: 20px;
    background-color: #fff;
  }
 
  .main{
    padding-top: 88px;
  }
  .desc{
    margin: 20px;
    font-size: 28px;
    text-align: left;
    color: #444;
  }
  .item{
    align-items: center;
    margin: 20px;
    padding: 10px;
    border-bottom: 2px solid #ddd;
  }
  .item-shape{
    width: 600px;
    height: 480px;
  }
</style>

<script>
  import navbar from '../include/navbar.vue';
  module.exports = {
    components: {
      navbar  
    },
    
    
  };
  
  
</script>