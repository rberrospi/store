<template>
  <div class="login-page">  
    <div class="container">
      <div class="title">
        <h1>Iniciar Sesión</h1>
      </div>
      <form class="user-form" @submit.prevent="login">
        <div class="form-group">
          <input type="email" v-model="email" class="form-control" placeholder="Email" required="">
          <div class="text-muted">Ingrese su correo</div>
        </div>
        <div class="form-group">
          <input type="password" v-model="password" class="form-control" placeholder="Contraseña" required="">
          <div class="text-muted">Ingrese su contraseña</div>
        </div>
        <div class="form-actions text-center">
          <button class="btn btn-red" type="submit">Iniciar Sesión</button>
          <hr>
          <router-link to="/singup" class="btn btn-red">Registrate</router-link> 
          <button class="btn btn-blue" type="button">
            <i class="fa fa-facebook mr-3"></i>
            <span>Iniciar Sesión</span>
          </button>
        </div>
      </form>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'login',
    props: ['user'],
    data(){
      return {
        email: '',
        password: ''
      }
    },
    methods:{
      login() {
        var vm = this;
        axios.post('/oauth/token',{
          'grant_type':'password',
          'client_id':'2',
          'client_secret':'fMX0XYhAK4WjrT4CqGewSbXeOUujS0ozfKgWzNCo',
          'username':vm.email,
          'password':vm.password,
          'scope':'*'
        }).then(
          (response) => {
            let token = response.data.access_token;
            vm.$ls.set('token', token);
            vm.$router.push('/');
            vm.$emit('getUser');
          },
          (error) => {
            vm.loading = false;
            toastr.error('Usuario o Password incorrecto.','Oops!');
          }
        );
      }
    },
    mounted(){
      if (this.user) {
        this.$router.push('/');
      }
    }
  }
</script>