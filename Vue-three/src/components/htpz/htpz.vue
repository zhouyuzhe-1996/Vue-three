<template>
  <div>
    <h1>合同配置</h1>
    <div class="input_search">
      <el-input placeholder="请输入ct_name内容" prefix-icon="el-icon-search" v-model="state" @change="getdata()"></el-input>
    </div>
    <el-table :data="datalist" style="width: 100%;">
      <el-table-column label="申请人id">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.user_id }}</p>
        </template>
      </el-table-column>
      <el-table-column label="合同名称">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.ct_name }}</p>
        </template>
      </el-table-column>
      <el-table-column label="合同类型">
        <template slot-scope="scope">
          <p>{{ scope.row.ct_type }}</p>
        </template>
      </el-table-column>
      <el-table-column label="供应商">
        <template slot-scope="scope">
          <p>{{ scope.row.pr_id }}</p>
        </template>
      </el-table-column>
      <el-table-column label="合同金额">
        <template slot-scope="scope">
          <p>{{ scope.row.ct_sum }}</p>
        </template>
      </el-table-column>
      <el-table-column label="付款方式">
        <template slot-scope="scope">
          <p>{{ scope.row.pay_mode }}</p>
        </template>
      </el-table-column>
      <el-table-column label="结算">
        <template slot-scope="scope">
          <p>{{ scope.row.ct_state }}</p>
        </template>
      </el-table-column>
      <el-table-column label="签订日期">
        <template slot-scope="scope">
          <p>{{ scope.row.ct_date }}</p>
        </template>
      </el-table-column>
      <el-table-column label="项目id">
        <template slot-scope="scope">
          <p>{{ scope.row.prj_id }}</p>
        </template>
      </el-table-column>
      <el-table-column label="预付款">
        <template slot-scope="scope">
          <p>{{ scope.row.pre_pay }}</p>
        </template>
      </el-table-column>
      <el-table-column label="保证金">
        <template slot-scope="scope">
          <p>{{ scope.row.deposit }}</p>
        </template>
      </el-table-column>
      <el-table-column label="合同执行人">
        <template slot-scope="scope">
          <p>{{ scope.row.ctext_man }}</p>
        </template>
      </el-table-column>
      <el-table-column label="审批人">
        <template slot-scope="scope">
          <p>{{ scope.row.leader_next }}</p>
        </template>
      </el-table-column>
      <el-table-column label="材料id">
        <template slot-scope="scope">
          <p>{{ scope.row.m_id }}</p>
        </template>
      </el-table-column>
      <el-table-column label="采购数量">
        <template slot-scope="scope">
          <p>{{ scope.row.ctd_num }}</p>
        </template>
      </el-table-column>
      <el-table-column label="采购单价">
        <template slot-scope="scope">
          <p>{{ scope.row.ctd_money }}</p>
        </template>
      </el-table-column>
      <el-table-column label="结算">
        <template slot-scope="scope">
          <p>{{ scope.row.ctd_state }}</p>
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-button size="mini" type="success" @click="handleInsert()">添加</el-button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      datalist: [],
      state:""
    };
  },
  mounted() {
    this.getdata();
  },
  methods: {
    getdata() {
      this.$http
        .get("/api/goods/hasAll_htpz", {
          params: {ct_name:this.state}
        })
        .then(res => {
        //   console.log(res);
          this.datalist = res.data.data;
        });
    },
    handleEdit(index, row) {
      //   console.log(index, row);
      this.$router.push({ name: `htpz_btn`, params: row });
    },
    handleInsert(index, row) {
      this.$router.push("htpz_btn/0");
    },
    handleDelete(index, row) {
      // console.log(row.prjid);
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.$http
            .get("/api/goods/delete_htpz", { params: row })
            .then(res => {
              // console.log(res);
              if (res.data.code === 0) {
                this.$http
                  .get("/api/goods/hasAll_htpz", {
                    params: {}
                  })
                  .then(res => {
                    //   console.log(res);
                    this.datalist = res.data.data;
                  });
                this.$message({
                  type: "success",
                  message: "删除成功!"
                });
              } else {
                this.$message({
                  type: "waring",
                  message: "删除失败!"
                });
              }
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>