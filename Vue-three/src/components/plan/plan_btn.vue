<template>
  <div>
    <el-form
      :model="form"
      ref="form"
      label-width="100px"
      class="form"
      style="width:300px;margin:100px auto"
      label-position="left"
    >
      <h1>{{text}}</h1>
      <el-form-item label="项目id">
        <el-input v-model="form.prjid" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="计划名称">
        <el-input v-model="form.planname" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="提交人id">
        <el-input v-model="form.cmtld" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="审批人">
        <el-input
          v-model="form.leaderNext"
          autocomplete="off"
          size="small"
          clearable
          maxlength="10"
        ></el-input>
      </el-form-item>
      <el-form-item label="提交日期">
        <el-input v-model="form.cdate" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="材料名称">
        <el-input v-model="form.mname" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="使用位置">
        <el-input v-model="form.userloc" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="使用量">
        <el-input v-model="form.mnum" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-button type="success" @click="go()">确定</el-button>
      <el-button @click="no()">取消</el-button>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {},
      text: ""
    };
  },
  mounted() {
    if (this.$route.params.id === "0") {
      this.text = "添加";
    } else {
      this.text = "修改";
      this.$http.get("/api/goods/has_project",{params:this.$route.params}).then(res=>{
        // console.log(res);
        this.form = res.data.data[0] 
      })
    }
  },
  methods: {
    go() {
      console.log(this.form);
      if (this.$route.params.id === "0") {
        this.$http
          .get("/api/goods/insert_project", { params: this.form })
          .then(res => {
            console.log(res);
            if (res.data.code === 0) {
              this.$message({
                message: "添加成功",
                type: "success"
              });
              this.$router.go(-1);
            } else if (res.data.code === -1) {
              this.$message({
                message: "项目id不能为空",
                type: "waring"
              });
            } else {
              this.$message({
                message: "项目id已经存在",
                type: "waring"
              });
            }
          });
      } else {
        this.$http
          .get("/api/goods/updata_project", { params: this.form })
          .then(res => {
            console.log(res);
            if (res.data.code === 0) {
              this.$message({
                message: "修改成功",
                type: "success"
              });
              this.$router.go(-1);
            } else {
              this.$message({
                message: "项目id不能为空",
                type: "waring"
              });
            }
          });
      }
    },
    no() {
      this.$router.go(-1);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>