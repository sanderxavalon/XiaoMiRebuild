<template>
    <el-header>
      <el-row>
        <el-col :span="5">
          <el-menu
            mode="horizontal"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            :router="true">
            <el-menu-item index="/home">小米商城</el-menu-item>
            <el-menu-item index="/">小米商城移動版</el-menu-item>
            <el-menu-item index="/about">問題反饋</el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="4"  :offset="14">
          <el-menu
            mode="horizontal"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b"
            :router="true">
            <el-menu-item index="/login" v-if="isLogin == false">登入</el-menu-item>
            <el-menu-item @click="logout" v-if="isLogin == true">登出</el-menu-item>
            <el-menu-item index="/">註冊</el-menu-item>
            <el-menu-item index="/about">消息通知</el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="1">
          <el-menu
            mode="horizontal"
            background-color="#ff0000"
            text-color="#fff"
            active-text-color="#ffd04b"
            :router="true">
            <el-menu-item index="/about">購物車</el-menu-item>
          </el-menu>
        </el-col>
      </el-row>
    </el-header>
</template>
<script>
export default {
    name: 'Header',
    data(){
        return {
            isLogin: false
        }
    },
    methods: {
      logout: function(){
        this.$store.commit('SET_TOKEN', '');
        this.$store.commit('SET_USER', '');
        this.$router.push('/').catch(err=>{});
      }
    },
    computed: {
      login_token(){
        return this.$store.state.token;
      }
    },
    watch: {
      login_token: {
        handler: function(newValue, oldValue) {
          if(newValue != '') {
            this.isLogin = true;
          } else {
            this.isLogin = false;
          }
        }
      }
    }

}
</script>
<style scoped>
  .el-header {
    background-color: #545c64;
    color: #333;
    line-height: 60px;
  }
</style>