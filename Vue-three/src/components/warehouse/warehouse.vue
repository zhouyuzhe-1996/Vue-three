<template>
  <div>
    <h1>仓库管理</h1>
    <div class="input_search">
      <el-input placeholder="请输入storeMan内容" prefix-icon="el-icon-search" v-model="state" @change="getdata()"></el-input>
    </div>
    <el-table :data="datalist" style="width: 100%;">
      <el-table-column label="storeMan" width="300">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.storeMan }}</p>
        </template>
      </el-table-column>
      <el-table-column label="storeName" width="300">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.storeName }}</p>
        </template>
      </el-table-column>
      <el-table-column label="storeLoc" width="300">
        <template slot-scope="scope">
          <p>{{ scope.row.storeLoc }}</p>
        </template>
      </el-table-column>
      <el-table-column label="remark" width="300">
        <template slot-scope="scope">
          <p>{{ scope.row.remark }}</p>
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
        .get("/api/goods/hasAll_warehouse", {
          params: {storeMan:this.state}
        })
        .then(res => {
          // console.log(res);
          this.datalist = res.data.data;
        });
    },
    handleEdit(index, row) {
      //   console.log(index, row);
      this.$router.push({ name: `warehouse_btn`, params: row });
    },
    handleInsert(index, row) {
      this.$router.push("warehouse_btn/0");
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
            .get("/api/goods/delete_warehouse", { params: row })
            .then(res => {
              // console.log(res);
              if (res.data.code === 0) {
                this.$http
                  .get("/api/goods/hasAll_warehouse", {
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