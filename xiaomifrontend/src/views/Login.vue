<template>
    <div>
        <el-form :model="loginForm" label-width="80px" id="loginbox">
            <h2>會員登錄</h2>
            <el-divider></el-divider>
            <el-form-item label="用户名"    >
                <el-input placeholder="请输入用戶名" v-model="loginForm.username"></el-input>
            </el-form-item>
            <el-form-item label="密碼">
                <el-input placeholder="请输入密码" v-model="loginForm.password" show-password></el-input>
            </el-form-item>
            <el-button v-on:click="login">立即登入</el-button>
        </el-form>
    </div>
</template>

<script>
    export default {
        name : 'Login',
        data(){
            return {
                loginForm : {
                    username : '',
                    password : ''
                }
            }
        },
        methods : {
            login: function(){
                this.$axios.post('/api/login', this.loginForm)
                .then(response => {
                    if(response.data.status == 100) {
                        let token = response.data.data.token;
                        let user = response.data.data.user;
                        this.$store.commit('SET_TOKEN', token);
                        this.$store.commit('SET_USER', user);
                        this.$router.push('/');
                    } else {
                        this.$message.error('登入失敗');
                    }
                })
            }
        }
    }
</script>

<style scoped>
#loginbox {
    margin: 0px auto;
    padding: 10px 10px 30px 10px;
    width: 360px;
}
</style>