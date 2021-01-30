<template>
  <div>
    <top></top>
    <div class="neirong">
      <div class="tab_left">
        <el-scrollbar style="height:100%">
          <el-menu
            class="tab"
            default-active="2"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            :unique-opened="true"
          >
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-office-building"></i>
                <span>物质计划</span>
              </template>
              <el-menu-item-group>
                <router-link to="/index/zong_plan">
                  <el-menu-item index="1-1">总计划</el-menu-item>
                </router-link>
                <router-link to="/index/xuyong_plan">
                  <el-menu-item index="1-2">需用计划</el-menu-item>
                </router-link>
                <router-link to="/index/htpz">
                  <el-menu-item index="1-3">合同配置</el-menu-item>
                </router-link>
              </el-menu-item-group>
            </el-submenu>
            <router-link to="/index/clrc">
              <el-menu-item index="2-1"><i class="el-icon-data-line"></i>材料入场</el-menu-item>
            </router-link>
            <router-link to="/index/delivery">
              <el-menu-item index="3-1"><i class="el-icon-data-board"></i>材料出库</el-menu-item>
            </router-link>
            <router-link to="/index/content">
              <el-menu-item index="4-1"><i class="el-icon-data-analysis"></i>材料盘点</el-menu-item>
            </router-link>
            <el-submenu index="5">
              <template slot="title">
                <i class="el-icon-files"></i>
                <span>仓库管理材料设置</span>
              </template>
              <el-menu-item-group>
                <router-link to="/index/vendor">
                  <el-menu-item index="5-1">供应商配置</el-menu-item>
                </router-link>
                <router-link to="/index/basicmaterials">
                  <el-menu-item index="5-2">基础物资库</el-menu-item>
                </router-link>
                <router-link to="/index/warehouse">
                  <el-menu-item index="5-3">仓库管理</el-menu-item>
                </router-link>
                <router-link to="/index/contract">
                  <el-menu-item index="5-4">合同配置</el-menu-item>
                </router-link>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-scrollbar>
      </div>
      <div class="tab_right">
        <el-scrollbar style="height:100%">
          <router-view />
        </el-scrollbar>
      </div>
    </div>
  </div>
</template>

<script>
import top from "../components/top";
export default {
  components: { top },
  methods: {
    to() {
       this.$router.push("zong_plan") 
    },
  },
};
</script>

<style lang="scss" scoped>
.neirong {
  border-top: 1px solid red;
  box-sizing: border-box;
  height: calc(100vh - 100px);
  display: flex;
  .tab_left {
    background-color: #545c64;
    width: 220px;
    height: 100%;
    .tab {
      width: 100%;
      height: 100%;
    }
  }
  .tab_right {
    flex: 1;
    background-color: rgb(233, 230, 230);
    padding: 20px 0px;
  }
}
</style>