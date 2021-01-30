<template>
  <div class="register">
    <el-form :model="form" ref="form" label-width="100px" class="form" label-position="left">
      <h2>注册</h2>
      <el-form-item label="用户名：" prop="username">
        <el-input v-model="form.username" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="密码：" prop="password">
        <el-input
          type="password"
          v-model="form.password"
          show-password
          size="small"
          clearable
          maxlength="16"
        ></el-input>
      </el-form-item>
      <el-form-item label="手机号：" prop="phone">
        <el-input v-model="form.phone" size="small" clearable></el-input>
      </el-form-item>
      <!-- <el-form-item label="年龄：" prop="age">
        <el-input v-model="form.age" size="small" clearable></el-input>
      </el-form-item>-->
      <el-form-item label="邮箱：" prop="email">
        <el-input v-model="form.email" size="small" clearable></el-input>
      </el-form-item>
      <!-- <el-form-item label="昵称：" prop="nick">
        <el-input v-model="form.nick" size="small" clearable></el-input>
      </el-form-item>-->
      <!-- <el-form-item label="头像：" prop="head_img">
        <el-input v-model="form.head_img" size="small" clearable></el-input>
      </el-form-item>-->
      <div class="btn">
        <el-button type="success" @click="register()">注册</el-button>
        <el-button @click="login()">已有帐号</el-button>
      </div>
    </el-form>
  </div>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      form: {
        username: "",
        password: "",
        phone: "",
        // nick: "",
        // age: "",
        email: "",
        head_img: ""
      }
    };
  },
  mounted() {},
  methods: {
    register() {
      // this.$http.post("/api/register",this.form).then(res => {
      this.$http.post("/api/register", this.form).then(res => {
        console.log(res);
        if (res.data.code === 0) {
          this.$message({
            message: "注册成功，请登录！",
            type: "success"
          });
          this.$router.push("/login");
        } else if (res.data.code === -1) {
          this.$message({
            message: "用户名或密码不能为空！",
            type: "fail"
          });
        } else if (res.data.code === 1) {
          this.$message({
            message: "用户名已存在，请重新输入！",
            type: "fail"
          });
        }
      });
    },
    login() {
      this.$router.push("/login");
    }
  }
};
</script>

<style lang="scss" scoped>
.register {
  height: 100vh;
  // background-color: rgb(84, 92, 100);
  background-image: url("../assets/login.jpg");
  padding: 100px 0px;
  box-sizing: border-box;
}
.form {
  width: 300px;
  margin: 100px 200px;
  // background-color: chartreuse;
  .btn {
    display: flex;
    justify-content: space-around;
    align-items: center;
  }
}
</style>