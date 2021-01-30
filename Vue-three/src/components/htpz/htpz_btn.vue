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
      <el-form-item label="申请人id">
        <el-input v-model="form.user_id" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="合同名称">
        <el-input v-model="form.ct_name" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="合同类型">
        <el-input v-model="form.ct_type" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="供应商">
        <el-input v-model="form.pr_id" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="合同金额">
        <el-input v-model="form.ct_sum" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="付款方式">
        <el-input v-model="form.pay_mode" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="结算">
        <el-input v-model="form.ct_state" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="签订日期">
        <el-input v-model="form.ct_date" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="项目id">
        <el-input v-model="form.prj_id" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="预付款">
        <el-input v-model="form.pre_pay" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="保证金">
        <el-input v-model="form.deposit" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="合同执行人">
        <el-input v-model="form.ctext_man" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="审批人">
        <el-input v-model="form.leader_next" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="材料id">
        <el-input v-model="form.m_id" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="采购数量">
        <el-input v-model="form.ctd_num" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="采购单价">
        <el-input v-model="form.ctd_money" autocomplete="off" size="small" clearable maxlength="10"></el-input>
      </el-form-item>
      <el-form-item label="结算">
        <el-input v-model="form.ctd_state" autocomplete="off" size="small" clearable maxlength="10"></el-input>
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
      this.$http
        .get("/api/goods/has_htpz", { params: this.$route.params })
        .then(res => {
          // console.log(res);
          this.form = res.data.data[0];
        });
    }
  },
  methods: {
    go() {
      // console.log(this.form);
      if (this.$route.params.id === "0") {
        this.$http
          .get("/api/goods/insert_htpz", { params: this.form })
          .then(res => {
            // console.log(res);
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
          .get("/api/goods/updata_htpz", { params: this.form })
          .then(res => {
            // console.log(res);
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