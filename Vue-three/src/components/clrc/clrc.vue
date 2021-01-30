<template>
  <div>
    <h1>材料入场</h1>
    <div class="input_search">
      <el-input placeholder="请输入prold内容" prefix-icon="el-icon-search" v-model="state" @change="getdata()"></el-input>
    </div>
    <el-table :data="datalist" style="width: 100%;">
      <el-table-column label="vno">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.vno }}</p>
        </template>
      </el-table-column>
      <el-table-column label="verMan">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.verMan }}</p>
        </template>
      </el-table-column>
      <el-table-column label="prold">
        <template slot-scope="scope">
          <p>{{ scope.row.prold }}</p>
        </template>
      </el-table-column>
      <el-table-column label="mConld">
        <template slot-scope="scope">
          <p>{{ scope.row.mConld }}</p>
        </template>
      </el-table-column>
      <el-table-column label="aprlistld">
        <template slot-scope="scope">
          <p>{{ scope.row.aprlistld }}</p>
        </template>
      </el-table-column>
      <el-table-column label="ifacpt">
        <template slot-scope="scope">
          <p>{{ scope.row.ifacpt }}</p>
        </template>
      </el-table-column>
      <el-table-column label="mmid">
        <template slot-scope="scope">
          <p>{{ scope.row.mmid }}</p>
        </template>
      </el-table-column>
      <el-table-column label="mnum">
        <template slot-scope="scope">
          <p>{{ scope.row.mnum }}</p>
        </template>
      </el-table-column>
      <el-table-column label="ifsave">
        <template slot-scope="scope">
          <p>{{ scope.row.ifsave }}</p>
        </template>
      </el-table-column>
      <el-table-column label="repold">
        <template slot-scope="scope">
          <p>{{ scope.row.repold }}</p>
        </template>
      </el-table-column>
      <el-table-column label="rmanver">
        <template slot-scope="scope">
          <p>{{ scope.row.rmanver }}</p>
        </template>
      </el-table-column>
      <el-table-column label="filepathsmlist">
        <template slot-scope="scope">
          <p>{{ scope.row.filepathsmlist }}</p>
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
        .get("/api/goods/hasAll_admission", {
          params: {mmid:this.state}
        })
        .then(res => {
          // console.log(res);
          this.datalist = res.data.data;
        });
    },
    handleEdit(index, row) {
      //   console.log(index, row);
      this.$router.push({ name: `clrc_btn`, params: row });
    },
    handleInsert(index, row) {
      this.$router.push("clrc_btn/0");
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
            .get("/api/goods/delete_admission", { params: row })
            .then(res => {
              // console.log(res);
              if (res.data.code === 0) {
                this.$http
                  .get("/api/goods/hasAll_admission", {
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