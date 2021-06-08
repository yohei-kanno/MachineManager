<template>
  <div id="app" class="container">
    <p>{{ message }}</p>
    <div class="button">
      <button v-on:click="add">追加する</button>
      <button v-on:click="reduce">減らす</button>
      <button v-on:click="shuffle"> スタート！</button>
      <button v-on:click="big">小さい順にする</button>
      <button v-on:click="small">大きい順にする</button>
    </div>
    <div>
      <transition-group name="fast-shuffle">
        <p v-for="number in numbers" :key="number" class="yoko">{{number}}</p>
      </transition-group>
    </div>
      
      
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      numbers: [],
      nextNumber: 0
    }
  },
  
  methods:{
    add: function(){
       this.numbers.splice(0,0,this.nextNumber++)
    },
    
    reduce: function(){
       this.numbers.splice(0,1)
    },
   shuffle:function(){
      this.numbers = _.shuffle(this.numbers);
    },
    comparableFunc: function(a,b){
      return a - b;
    },
    
    big:function(){
      this.numbers.sort(function(a,b){
        return a -b
      })
    },
    small:function(){
      this.numbers.sort(function(a,b){
        return b - a
      })
    }
    
      
  }
  
}
</script>

<style scoped>
.container{
  width: 100%;
}
p {
  font-size: 2em;
  text-align: center;
}

.button{
  margin: 0 auto;
  width:  100%;
  
}

.yoko{
  display: inline-block;
  margin: 5px;
  border: 1px solid orange;
  line-height: 80px;
  width: 80px;
  height: 80px;
  border-radius: 5px;
  transition: all .4s;
  user-select: none;
}
.fast-shuffle-enter, .fast-shuffle-leave-to
/* .fast-shuffle-leave-active for below version 2.1.8 */ {
  opacity: 0;
  transform: translateY(-100px);
}
.fast-shuffle-leave-active {
  position: absolute;
}
</style>
