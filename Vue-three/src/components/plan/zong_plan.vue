<template>
  <div>
    <h1>总计划</h1>
    <div class="input_search">
      <el-input placeholder="请输入planname内容" prefix-icon="el-icon-search" v-model="state" @change="getdata()"></el-input>
    </div>
    <el-table :data="datalist" style="width: 100%;">
      <el-table-column label="项目id" width="160">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.prjid }}</p>
        </template>
      </el-table-column>
      <el-table-column label="计划名称" width="160">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.planname }}</p>
        </template>
      </el-table-column>
      <el-table-column label="提交人id" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.cmtld }}</p>
        </template>
      </el-table-column>
      <el-table-column label="审批人" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.leaderNext }}</p>
        </template>
      </el-table-column>
      <el-table-column label="提交时间" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.cdate }}</p>
        </template>
      </el-table-column>
      <el-table-column label="材料名称" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.mname }}</p>
        </template>
      </el-table-column>
      <el-table-column label="使用位置" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.userloc }}</p>
        </template>
      </el-table-column>
      <el-table-column label="使用量" width="160">
        <template slot-scope="scope">
          <p>{{ scope.row.mnum }}</p>
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
      state: ""
    };
  },
  methods: {
    getdata() {
      this.$http
        .get("/api/goods/hasAll_project", {
          params: { planname: this.state }
        })
        .then(res => {
          //   console.log(res);
          this.datalist = res.data.data;
        });
    },
    handleEdit(index, row) {
      //   console.log(index, row);
      this.$router.push({ name: `plan_btn`, params: row });
    },
    handleInsert(index, row) {
      this.$router.push("plan_btn/0");
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
            .get("/api/goods/delete_project", { params: row })
            .then(res => {
              // console.log(res);
              if (res.data.code === 0) {
                this.$http
                  .get("/api/goods/hasAll_project", {
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
  },
  mounted() {
    this.getdata();
  }
};
</script>

<style lang="scss" scoped>
</style>