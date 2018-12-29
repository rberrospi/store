<template>
  <div class="login-page">  
    <div class="container">
      <div class="title">
        <h1>Registrarse</h1>
      </div>
      <form class="user-form" @submit.prevent="submit">
        <div class="form-group">
          <input type="email" v-model="account.email" class="form-control" placeholder="Email" required="">
          <div class="text-muted">Ingrese su correo</div>
        </div>
        <div class="form-group">
          <input type="email" v-model="account.email2" class="form-control" placeholder="Repita su Email" required="">
          <div class="text-muted">Repita su correo</div>
        </div>
        <div class="form-group">
          <input type="text" v-model="account.name" class="form-control" placeholder="Nombres" required="">
          <div class="text-muted">Ingrese su nombre.</div>
        </div>
        <div class="form-group">
          <input type="text" v-model="account.lastname" class="form-control" placeholder="Apellidos" required="">
          <div class="text-muted">Ingrese sus apellidos.</div>
        </div>
        <div class="form-group">
          <input type="text" v-model="account.phone" class="form-control" placeholder="teléfono Fijo">
          <div class="text-muted">Ingrese su teléfono fijo.</div>
        </div>
        <div class="form-group">
          <input type="text" v-model="account.mobile" class="form-control" placeholder="Celular">
          <div class="text-muted">Ingrese su teléfono celular.</div>
        </div>
        <div class="form-group">
          <input type="password" v-model="account.password" class="form-control" placeholder="Contraseña" required="">
          <div class="text-muted">Ingrese su contraseña</div>
        </div>
        <div class="form-actions text-center">
          <button class="btn btn-red" type="submit">Registrarse</button>
        </div>
      </form>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'singup',
    props:['user'],
    data(){
      return {
        account:{
          email: '',
          email2: '',
          password: '',
          name: '',
          lastname: '',
          phone: '',
          mobile: '',
          password: ''
        }
      }
    },
    methods:{
      submit() {
        var vm = this;
        if (vm.account.email != vm.account.email2) {
          toastr.error('Los correos no coinciden.','Oops!');
          return 
        }

        axios.post('/api/users', vm.account).then(
          (result) => {
            if (result.data.error) {
              toastr.error(result.data.error,'Oops!');
            } else {
              axios.post('/oauth/token',{
                'grant_type':'password',
                'client_id':'2',
                'client_secret':'fMX0XYhAK4WjrT4CqGewSbXeOUujS0ozfKgWzNCo',
                'username':vm.account.email,
                'password':vm.account.password,
                'scope':'*'
              }).then(
                (response) => {
                  let token = response.data.access_token;
                  vm.$ls.set('token', token);
                  vm.$router.push('/');
                  vm.$emit('getUser');
                },
                (error) => {
                }
              );
            }
          },
          (error) => {
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










