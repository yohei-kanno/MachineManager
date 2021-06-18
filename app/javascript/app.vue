<template>
  <div id="app">
    <table class="table table-hover">
      <thead class="thead-light">
        <tr class="small-font">
          <th>形式</th>
          <th>メーカー</th>
          <th>形式名</th>
          <th>状態①</th>
          <th>状態②</th>
          <th>場所</th>
          <th>認定</th>
          <th>備考</th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody v-for="m in machines" :key="m.id">
        <tr>
          <td>{{m.form_type}}</td>
          <td>{{m.maker}}</td>
          <td>{{m.name}}</td>
          <td>{{m.machine_status}}</td>
          <td>{{m.parts_status}}</td>
          <td>{{m.place}}</td>
          <td>{{m.certification}}</td>
          <td>{{m.remarks}}</td>
          <td>番号</td>
          <td>編集</td>
          <td>削除</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      machines: []
    }
  },
  mounted(){
   axios
    .get("/api/v1/stores/1/machines.json") 
    .then(response=>(this.machines = response.data) )
  }
}

  
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>