<template>
  <div class="top">
    <div class="logo">
      <el-image style="width: 80px; height: 80px" :src="logo" fit="fill"></el-image>
    </div>
    <div class="pro_name">
      <h1>某某科技有限公司</h1>
    </div>
    <div class="user">
      <el-menu
        class="el-menu-demo"
        mode="horizontal"
        background-color="#101116"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-submenu index="2">
          <template slot="title">
            <el-avatar :src="head_img"></el-avatar>
            {{username}}
          </template>
          <el-menu-item index="2-1" @click="to_userinfo()">个人信息</el-menu-item>
          <el-menu-item index="2-2" @click="out_logo()">退出登录</el-menu-item>
        </el-submenu>
      </el-menu>
    </div>
  </div>
</template>

<script>
import Cookie from "js-cookie";
export default {
  data() {
    return {
      logo: require("../assets/1.jpg"), //logo
      head_img: "",         //用户头像
      username: "",         //用户名
      userinfo:{}           //用户信息
    };
  },
  mounted() {
    //获取cookie 的username
    this.username = Cookie.get("username");
    this.get_userinfo();
  }, 
  methods: {
      //获取用户信息
    get_userinfo() {
      this.$http.post("/api/userinfo",{username:this.username}).then(res=>{
            // console.log(res);
            this.userinfo = res.data.data[0];
            this.head_img = res.data.data[0].head_img ? res.data.data[0].head_img : "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png";
        })
    },
    out_logo(){
        // 退出登录
        this.$router.push('/login');
        Cookie.set("token","");
        Cookie.set("username","");
    },
    to_userinfo(){
        //个人信息
        this.$router.push('/userinfo');
    }
  }
};
</script>

<style lang="scss" scoped>
@mixin flex {
  display: flex;
  justify-content: space-around;
  align-items: center;
}
.top {
  color: rgb(30, 59, 162);
  background-color: #101116;
  height: 100px;
  @include flex;
}
</style>