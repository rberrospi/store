<template>
  <div class="users-page">  
    <div class="container">
      <div class="title">
        <h1>Usuarios</h1>
      </div>
      <div class="row justify-content-md-center">
        <div class="col-md-8">
          <div class="table-responsive">
            <div class="text-right">
              <button class="btn btn-success btn-sm" @click.prevent="create">
                <i class="fa fa-plus"></i>
                <span class="ml-2">Agregar Usuario</span>
              </button>
            </div>
            <br>
            <table class="table table-hovered table-bordered table-striped">
              <thead>
                <tr>
                  <th>Nombres</th>
                  <th>Apellidos</th>
                  <th>E-mail</th>
                  <th>Role</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="account in accounts">
                  <td>{{ account.name }}</td>
                  <td>{{ account.lastname }}</td>
                  <td>{{ account.email }}</td>
                  <td>
                    <label class="badge badge-primary">{{ account.role | role }}</label>
                  </td>
                  <td>
                    <a @click.prevent="edit(account)" href="#">
                      <i class="fa fa-pencil"></i>
                    </a>
                    <span v-if="account.role != 'admin'">
                      <a class="text-success" @click.prevent="changeState(account)" v-if="account.status">
                        <i class="fa fa-toggle-on" aria-hidden="true"></i>
                      </a>
                      <a class="text-danger" @click.prevent="changeState(account)" v-else>
                        <i class="fa fa-toggle-off" aria-hidden="true"></i>
                      </a>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div class="modal" tabindex="-1" role="dialog" id="account-modal">
      <div class="modal-dialog" role="document">
        <form @submit.prevent="submit">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">
                <span v-if="account.id">Editar Usuario</span>
                <span v-else>Nuevo Usuario</span>
              </h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Tipo de Usuario</label>
                <select class="form-control" v-model="account.role">
                  <option value="user">Usuario</option>
                  <option value="owner">Proveedor</option>
                  <option value="admin">Administrador</option>
                </select>
              </div>
              <div class="form-group">
                <label>Nombres:</label>
                <input type="text" v-model="account.name" class="form-control" placeholder="Nombres" required="">                
              </div>
              <div class="form-group">
                <label>Apellidos:</label>
                <input type="text" v-model="account.lastname" class="form-control" placeholder="Apellidos" required="">
              </div>
              <div class="form-group">
                <label>Email:</label>
                <input type="email" v-model="account.email" class="form-control" placeholder="Email" required="">
              </div>
              <div class="form-group">
                <label>Teléfono Fijo:</label>
                <input type="text" v-model="account.phone" class="form-control" placeholder="teléfono Fijo">
              </div>
              <div class="form-group">
                <label>Teléfono Celular:</label>
                <input type="text" v-model="account.mobile" class="form-control" placeholder="Celular">
              </div>
              <div class="form-group">
                <label>Contraseña:</label>
                <input type="password" v-model="account.password" class="form-control" placeholder="Contraseña">
              </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Guardar</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="clear">Close</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'users',
    props: ['user'],
    data(){
      return {
        accounts:[],
        account:{
          id: 0,
          role: 'user',
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
    filters:{
      role(name){
        switch(name) {
          case 'admin':
            return 'Administrador';
          case 'owner':
            return 'Proveedor';
          case 'user':
          default:
            return 'Cliente';
        }
      }
    },
    methods:{
      create(){
        this.clear();
        $('#account-modal').modal();
      },
      edit(account){
        this.account = Object.assign({},account);
        $('#account-modal').modal();
      },
      changeState(account){

        if (account.status) {
          account.status = 0
        } else {
          account.status = 1
        }

        axios.put('/api/users/'+account.id,account);
      },
      clear(){
        this.account = {
          id: 0,
          role: 'user',
          email: '',
          email2: '',
          password: '',
          name: '',
          lastname: '',
          phone: '',
          mobile: '',
          password: ''
        }
      },
      submit(){
        var vm = this;
        var action = 'post'
        var path = '/api/users';
        if (vm.account.id) {
          action = 'put';
          path += '/'+ vm.account.id;
        }

        axios[action](path, vm.account).then(
          (result) => {
            if (result.data.error) {
              toastr.error(result.data.error,'Oops!');
            } else {
              window.location.reload();
            }
          }, 
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        )

      },
      load(){
        var vm = this;
        this.loading = true;
        axios.get('/api/users').then(
          (result) => {
            vm.accounts = result.data.users;
            vm.loading = false;
          },
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        );
      }
    },
    mounted(){
      if (this.user.role != 'admin') {
        this.$router.push('/')
      } else {
        this.load();
      }
    }
  }
</script>