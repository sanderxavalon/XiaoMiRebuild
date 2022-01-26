<template>
    <p>Frist View</p>
</template>

<script>
    export default {
        name : 'FirstView',
        mounted(){
            this.$axios.get('/api/test')
            .then(response => {
                console.log(response);
            })
        }
    }
</script>

<style scoped>

</style>