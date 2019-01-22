<template>
  <div class="login-page">  
    <div class="container">
      <div class="title">
        <h1>Proveedores</h1>
      </div>

      <div class="row justify-content-md-center">
        <div class="col-md-12">
          <div class="table-responsive">
            <div class="text-right">
              <button class="btn btn-success btn-sm" @click.prevent="create">
                <i class="fa fa-plus"></i>
                <span class="ml-2">Agregar Proveedor</span>
              </button>
            </div>
            <br>
            <div class="alert alert-info">
              El estado <div class="badge badge-warning">Solicitud</div> indica que el proveedor aún no tiene un usuario asignado o el usuario asignado no cuenta con el rol correspondiente por lo que no podra crear productos, y los productos que tengan no se mostraran.<br>
              El estado <div class="badge badge-success">Asignado</div> indica que el proveedor tiene un usuario asigando y puede crear y mostar sus productos, pero puede ser habilitado o deshabilitado  con el boton <i class="fa fa-toggle-on"></i>
            </div>
            <br>
            <table class="table table-hovered table-bordered table-striped">
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Usuario</th>
                  <th>Nombre Comercial</th>
                  <th>RUC</th>
                  <th>Persona de Contacto</th>
                  <th>Banco</th>
                  <th>CCI</th>
                  <th>Estado</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="store in stores">
                  <td>{{ store.name }}</td>
                  <td>
                    <span v-if="store.userdata">{{ store.userdata.name }}</span>
                    <span v-else>No Asignado</span>
                  </td>
                  <td>{{ store.commercial_name }}</td>
                  <td>{{ store.ruc }}</td>
                  <td>{{ store.contact }}</td>
                  <td>{{ store.bank }}</td>
                  <td>{{ store.cci }}</td>
                  <td>
                    <span class="badge badge-warning" 
                      v-if="!store.user_id || (store.userdata && store.userdata.role != 'owner')">Solicitud</span>
                    <span class="badge badge-success" v-else>Asignado</span>
                  </td>
                  <td>
                    <a @click.prevent="edit(store)" href="#">
                      <i class="fa fa-pencil"></i>
                    </a>
                    <span v-if="store.user_id">
                      <a class="text-success" @click.prevent="changeState(store)" v-if="store.status">
                        <i class="fa fa-toggle-on" aria-hidden="true"></i>
                      </a>
                      <a class="text-danger" @click.prevent="changeState(store)" v-else>
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


    <div class="modal" tabindex="-1" role="dialog" id="store-modal">
      <div class="modal-dialog modal-lg" role="document">
        <form @submit.prevent="submit">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">
                <span v-if="store.id">Editar Proveedor</span>
                <span v-else>Nueva Proveedor</span>
              </h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="row">
                <div class="form-group col-md-6">
                  <label>Razón Social:</label>
                  <input type="text" v-model="store.name" class="form-control" placeholder="Razón Social" required="">         
                </div>
                <div class="form-group col-md-6">
                  <label>Nombre Comercial:</label>
                  <input type="text" v-model="store.commercial_name" 
                  class="form-control" placeholder="Nombre Comercial" required="">
                </div>
                <div class="form-group col-md-6">
                  <label>RUC:</label>
                  <input type="text" v-model="store.ruc" class="form-control" placeholder="RUC" required="" maxlength="11">
                </div>
                <div class="form-group col-md-6">
                  <label>Persona de Contacto:</label>
                  <input type="text" v-model="store.contact" class="form-control" placeholder="Persona de Contacto" required="">
                </div>
                <div class="form-group col-md-6">
                  <label>Teléfono Fijo:</label>
                  <input type="text" v-model="store.phone" class="form-control" placeholder="Teléfono Fijo">
                </div>
                <div class="form-group col-md-6">
                  <label>Celular:</label>
                  <input type="text" v-model="store.mobile" class="form-control" placeholder="Celular">
                </div>
                <div class="form-group col-md-6">
                  <label>Email:</label>
                  <input type="text" v-model="store.email" class="form-control" placeholder="Email" required="">
                </div>
                <div class="form-group col-md-6">
                  <label>Nombres del responsable:</label>
                  <input type="text" v-model="store.person" class="form-control" placeholder="Persona Responsable" required="">
                </div>
                <div class="form-group col-md-6">
                  <label>DNI:</label>
                  <input type="text" v-model="store.dni" class="form-control" placeholder="DNI" required="" maxlength="7">
                </div>
                <div class="form-group col-md-6">
                  <label>Banco</label>
                  <select class="form-control" v-model="store.bank" required="">
                    <option disabled="" value="">- Seleccione -</option>
                    <option value="BCP">Banco de Credito</option>
                    <option value="IBK">Banco Interbank</option>
                    <option value="Scotia">Banco Scotiabank</option>
                    <option value="BBVA">Banco Continental</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label>Número de cuenta Interbancaria</label>
                  <input type="text" v-model="store.cci" class="form-control" placeholder="Numero de cuenta Interbancaria" required="">
                </div>
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
    name: 'owners',
    props:['user'],
    data(){
      return {
        users:[],
        stores: [],
        store: {
          id: 0,
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
        }
      }
    },
    methods:{
      create(){
        this.clear();
        $('#store-modal').modal();
      },
      edit(store){
        this.store = Object.assign({},store);
        $('#store-modal').modal();
      },
      changeState(store){

        if (store.status) {
          store.status = 0
        } else {
          store.status = 1
        }

        axios.put('/api/stores/'+store.id,store);
      },
      clear(){
        this.store = {
          id: 0,
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
        }
      },
      submit(){
        var vm = this;
        var action = 'post'
        var path = '/api/stores';
        if (vm.store.id) {
          action = 'put';
          path += '/'+ vm.store.id;
        }

        axios[action](path, vm.store).then(
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
        axios.get('/api/stores').then(
          (result) => {
            vm.stores = result.data.stores;
            vm.loading = false;
          },
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        );
      }
    },
    mounted(){
      if (!this.user && this.user.role != 'admin') {
        this.$router.push('/')
      } else {
        this.load();
      }
    }
  }
</script>