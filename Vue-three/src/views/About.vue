<template>
  <div class="about">
    <h1>This is an about page</h1>
    <h1>{{msg}}</h1>
    <img :src="tup" alt="">
    <img src="../assets/1.jpg" alt="">
  </div>
</template>
<script>
export default {
  name: 'About',
  data() {
    return {
      msg:'我是about组件',
      tup:require('../assets/1.jpg')
    };
  },
  mounted() {
    
  },
  methods: {
    
  },
};
</script>
