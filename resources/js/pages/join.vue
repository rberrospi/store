<template>
  <div class="login-page">  
    <div class="container">
      <div class="title">
        <h1>Unete a nosotros</h1>
      </div>
      <div class="alert alert-success text-center"  v-if="(user && (user.role != 'user' || user.role == 'user' && user.store))">
        <i class="fa fa-info-circle"></i>
        <span>Ya has enviado el formulario.</span>
      </div>
      <div v-else>
        <div class="alert alert-success" v-if="send">
          <i class="fa fa-info-circle"></i>
          <span class="ml-2">Su solicitud ha sido enviada.</span>
        </div>
        <form class="user-form" @submit.prevent="submit" v-else>
          <div class="form-group">
            <input type="text" v-model="account.name" class="form-control" placeholder="Razón Social" required="">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.commercial_name" class="form-control" placeholder="Nombre Comercial">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.ruc" class="form-control" placeholder="RUC" required="" maxlength="11">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.contact" class="form-control" placeholder="Persona de Contacto" required="">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.phone" class="form-control" placeholder="Teléfono Fijo">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.mobile" class="form-control" placeholder="Celular">
          </div>
          <div class="form-group">
            <input type="email" v-model="account.email" class="form-control" placeholder="Email" required="">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.person" class="form-control" placeholder="Nombres del responsable" required="">
          </div>
          <div class="form-group">
            <input type="text" v-model="account.dni" class="form-control" placeholder="DNI" required="" maxlength="7">
          </div>
          <div class="form-group">
            <select class="form-control" v-model="account.bank" required="">
              <option disabled="" value="">- Seleccione -</option>
              <option value="BCP">Banco de Credito</option>
              <option value="IBK">Banco Interbank</option>
              <option value="Scotia">Banco Scotiabank</option>
              <option value="BBVA">Banco Continental</option>
            </select>
          </div>
          <div class="form-group">
            <input type="text" v-model="account.cci" class="form-control" placeholder="Numero de cuenta Interbancaria" required="">
          </div>
          <div class="form-group">
            <div class="checkbox">
              <input type="checkbox" name="terms" required="" id="terms">
              <label for="terms">Acepto los terminos y condiciones</label>
            </div>
          </div>
          <div class="form-actions text-center" v-if="(!user || (user && user.role == 'user'))">
            <button class="btn btn-red" type="submit">Enviar</button>
          </div>
        </form>
      </div>
    </div>
  </div>  
</template>
<script type="text/javascript">
  export default {
    name: 'join',
    props:['user'],
    data(){
      return {
        account:{
          name:'',
          commercial_name:'',
          ruc:'',
          contact:'',
          phone:'',
          mobile:'',
          email:'',
          name:'',
          lastname:'',
          dni:'',
          bank:'',
          cci:'',
        },
        send: false
      }
    },
    methods:{
      submit(){
        var vm = this;
        axios.post('/api/stores',this.account).then(
          (result) => {
            toastr.success('Su solicitud ha sido enviado.','OK!');
            vm.send = true;
          },
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        );

      }
    },
    mounted(){
      
    }
  }
</script>