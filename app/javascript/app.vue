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

</style>
