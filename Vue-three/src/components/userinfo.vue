<template>
  <div class="userinfo">
    
    <el-form label-position="left" label-width="80px" :model="userinfo" class="form"><h1>个人信息</h1>
      <el-form-item label="用户名">
        <el-input v-model="userinfo.username"></el-input>
      </el-form-item>
      <el-form-item label="手机号">
        <el-input v-model="userinfo.phone"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="userinfo.email"></el-input>
      </el-form-item>
      <el-form-item label="头像">
        <el-upload
          class="avatar-uploader"
          action="api/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
          name="head_img"
        >
          <img v-if="imageUrl" :src="imageUrl" class="avatar" />
          <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-form-item>
      <div class="btn">
        <el-button type="success" @click="change()">修改</el-button>
        <el-button @click="qx()">取消</el-button>
      </div>
    </el-form>
  </div>
</template>

<script>
import Cookie from "js-cookie";
export default {
  data() {
    return {
      userinfo: {},
      username: Cookie.get("username"),
      imageUrl: ""
    };
  },
  mounted() {
    this.get_userinfo();
  },
  methods: {
    get_userinfo() {
      this.$http.post("api/userinfo", { username: this.username }).then(res => {
        this.userinfo = res.data.data[0];
        this.imageUrl = this.userinfo.head_img;
      });
    },
    handleAvatarSuccess(res, file) {
      //   this.imageUrl = URL.createObjectURL(file.raw);
      // this.imageUrl =
      console.log(res);
      if (res.code === 0) {
        this.imageUrl = res.data;
      }
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    change() {
      this.userinfo.old_username = this.username;
      this.userinfo.head_img = this.imageUrl;
      this.$http.post("/api/change_userinfo", this.userinfo).then(res => {
          console.log(res);
        if (res.data.code === 0) {
          this.$message({
            message: "修改成功",
            type: "success"
          });
          Cookie.set("username", this.userinfo.username);
          this.$router.push("index");
        } else if (res.data.code === -1) {
            this.$message({
            message: "用户名不能为空！",
            type: "success"
          });
        } else {
            this.$message({
            message: "用户名已存在！",
            type: "success"
          });
        }
      });
    },
    qx() {
      this.$router.push("index");
    }
  }
};
</script>

<style lang="scss" scoped>
.userinfo {
  height: 100vh;
  // background-color: rgb(84, 92, 100);
  background-image: url("../assets/login.jpg");
  padding: 100px 0px;
  box-sizing: border-box;
  h1 {
    margin-bottom: 20px;
  }
}
.form {
  width: 300px;
  margin: 100px 200px;
  // background-color: chartreuse;
  .btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .avatar-uploader {
    img {
      width: 100px;
      height: 100px;
    }
  }
}
</style>