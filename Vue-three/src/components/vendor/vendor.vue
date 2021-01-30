<template>
  <div>
    <h1>供应商配置</h1>
    <div class="input_search">
      <el-input placeholder="请输入pname内容" prefix-icon="el-icon-search" v-model="state" @change="getdata()"></el-input>
    </div>
    <el-table :data="datalist" style="width: 100%;">
      <el-table-column label="pname" width="150">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.pname }}</p>
        </template>
      </el-table-column>
      <el-table-column label="parea" width="150">
        <template slot-scope="scope">
          <p style="margin-left: 10px">{{ scope.row.parea }}</p>
        </template>
      </el-table-column>
      <el-table-column label="pcotype" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.pcotype }}</p>
        </template>
      </el-table-column>
      <el-table-column label="ptype" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.ptype }}</p>
        </template>
      </el-table-column>
      <el-table-column label="pprof" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.pprof }}</p>
        </template>
      </el-table-column>
      <el-table-column label="paddr" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.paddr }}</p>
        </template>
      </el-table-column>
      <el-table-column label="leader" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.leader }}</p>
        </template>
      </el-table-column>
      <el-table-column label="personid" width="150">
        <template slot-scope="scope">
          <p>{{ scope.row.personid }}</p>
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
        .get("/api/goods/hasAll_vendor", {
          params: {pname:this.state}
        })
        .then(res => {
          // console.log(res);
          this.datalist = res.data.data;
        });
    },
    handleEdit(index, row) {
      //   console.log(index, row);
      this.$router.push({ name: `vendor_btn`, params: row });
    },
    handleInsert(index, row) {
      this.$router.push("vendor_btn/0");
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
            .get("/api/goods/delete_vendor", { params: row })
            .then(res => {
              // console.log(res);
              if (res.data.code === 0) {
                this.$http
                  .get("/api/goods/hasAll_vendor", {
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