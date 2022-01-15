<template>
    <el-header>
      <el-row>
        <el-col :span="5">
          <el-menu
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            router=true>
            <el-menu-item index="/about">小米商城</el-menu-item>
            <el-menu-item index="/">小米商城移動版</el-menu-item>
            <el-menu-item index="/about">問題反饋</el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="4"  offset="14">
          <el-menu
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            router=true>
            <el-menu-item index="/about">登陸</el-menu-item>
            <el-menu-item index="/">註冊</el-menu-item>
            <el-menu-item index="/about">消息通知</el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="1">
          <el-menu
            mode="horizontal"
            @select="handleSelect"
            background-color="#ff0000"
            text-color="#fff"
            active-text-color="#ffd04b"
            router=true>
            <el-menu-item index="/about">購物車</el-menu-item>
          </el-menu>
        </el-col>
      </el-row>
    </el-header>
</template>
<script>
export default {
    name: 'Header'
    

}
</script>
<style scoped>
  .el-header {
    background-color: #545c64;
    color: #333;
    line-height: 60px;
  }
</style>