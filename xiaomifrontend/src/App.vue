<template> 
  <div id="app">
    <Header/>
      <el-main>
        <router-view/>
      </el-main>
    <Footer/>
  </div>
</template>
<script>
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
export default{
  components: {
    Header,Footer
  },
  data(){
    return {

    };
  },
  methods: {
    handleSelect(key, keyPath){
      console.log(key, keyPath);
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
