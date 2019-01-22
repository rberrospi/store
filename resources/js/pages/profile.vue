<template>
  <div id="profile">>
    <div class="container">
      <br><br>
      <h1 class="text-center">Mi Cuenta</h1>
      <br><br>
      <ul class="nav nav-tabs justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile-info" role="tab">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="orders-tab" data-toggle="tab" href="#orders" role="tab">Mis Ordenes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="wishlist-tab" data-toggle="tab" href="#wishlist" role="tab">Mi Wishlist</a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane fade show active" id="profile-info">
          <div class="row justify-content-center">
            <form v-if="account" class="col-md-8" @submit.prevent="submit">
              <div class="form-group">
                <input type="text" v-model="account.username" class="form-control" disabled="">
                <div class="text-muted">Ingrese un nombre de usuario</div>
              </div>
              <div class="form-group">
                <input type="email" v-model="account.email" class="form-control" required="">
                <div class="text-muted">Ingrese su correo</div>
              </div>
              <div class="form-group">
                <input type="text" v-model="account.name" class="form-control" required="">
                <div class="text-muted">Ingrese su nombre.</div>
              </div>
              <div class="form-group">
                <input type="text" v-model="account.lastname" class="form-control" required="">
                <div class="text-muted">Ingrese sus apellidos.</div>
              </div>
              <div class="form-group">
                <input type="text" v-model="account.phone" class="form-control" required="">
                <div class="text-muted">Ingrese su teléfono fijo.</div>
              </div>
              <div class="form-group">
                <input type="text" v-model="account.mobile" class="form-control" required="">
                <div class="text-muted">Ingrese su teléfono celular.</div>
              </div>
              <div class="form-group">
                <input type="password" v-model="account.password" class="form-control">
                <div class="text-muted">Ingrese su contraseña</div>
              </div>
              <div class="form-actions text-center">
                <button class="btn btn-primary btn-block" type="submit">Actualizar</button>
              </div>
              <br><br>
            </form>
          </div>
        </div>
        <div class="tab-pane fade" id="orders">
          <div class="row justify-content-center">
            <div class="col-md-8 table-responsive">
              <table class="table table-bordered table-stiped">
                <thead>
                  <tr class="table-success">
                    <th>Nº Orden</th>
                    <th>Fecha</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="w in orders">
                    
                  </tr>
                  <tr v-if="orders.length == 0">
                    <td colspan="3" class="text-center">
                      <i class="fa fa-exclamation-triangle"></i> No cuenta con ordenes registradas.
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="tab-pane fade" id="wishlist">
          <div class="row justify-content-center">
            <div class="col-md-8 table-responsive">
              <table class="table table-bordered table-stiped">
                <thead>
                  <tr class="table-info">
                    <th>Producto</th>
                    <th>Precio</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="w,index in wishlist">
                    <td>{{ w.name }}</td>
                    <td>S/{{ w.price | amount }}</td>
                    <td>
                      <a @click.prevent="remove(index)" href="#">
                        <i class="fa fa-trash-o"></i>
                      </a>
                    </td>
                  </tr>
                  <tr v-if="wishlist.length == 0">
                    <td colspan="2" class="text-center">
                      <i class="fa fa-exclamation-triangle"></i> No cuenta con productos en su wishlist.
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default{
    name: 'Profile',
    props:['user'],
    data(){
      return {
        account : false,
        wishlist: [],
        orders: []
      }
    },
    methods:{
      remove(index){

        var vm = this;
        axios.post('/api/wishlist',{
          product: this.wishlist[index].id
        }).then(
          (result) => {
            toastr.error('Se ha removido el producto de su lista de deseos.','OK!');
          },
          (error) => {
        });

        this.wishlist.splice(index,1);
      },
      submit(){
        var vm = this;
        axios.post('/api/user', vm.account).then(
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
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    mounted(){
      if (this.user) {
        this.account = Object.assign({},this.user);
        this.wishlist = this.user.wishlist;
      } else {
        this.$router.push('/login');
      }
    }
  }
</script>




