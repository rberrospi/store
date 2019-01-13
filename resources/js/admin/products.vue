<template>
  <div class="products-page">  
    <div class="container">
      <div class="title">
        <h1>Productos</h1>
      </div>
      <div class="row justify-content-md-center">
        <div class="col-md-8" v-if="user.role == 'admin' || user.store">
          <div class="table-responsive">
            <div class="text-right">
              <router-link class="btn btn-success btn-sm" to=/admin/new-product>
                <i class="fa fa-plus"></i>
                <span class="ml-2">Agregar Producto</span>
              </router-link>
            </div>
            <br>
            <table class="table table-hovered table-bordered table-striped table-sm">
              <thead>
                <tr class="text-center">
                  <th width="80"></th>
                  <th>Nombre</th>
                  <th>Precio</th>
                  <th>Stock</th>
                  <th>Status</th>
                  <th>Visible</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="product in products">
                  <td>
                    <img v-if="product.image" :src="'/storage/'+product.image" class="rounded img-fluid img-table">
                    <img v-else v-holder="{img:'75x75'}" class="rounded">
                  </td>
                  <td class="text-center">
                    <router-link :to="'/product/'+product.slug">{{ product.name }}</router-link>
                  </td>
                  <td class="text-center">{{ product.price }}</td>
                  <td class="text-center">
                    <span v-if="product.discount">
                      <span class="mr-3">{{ product.stock }}</span>{{ product.disctount }}
                    </span>
                    <span v-else>{{ product.stock }}</span>
                  </td>
                  <td class="text-center">
                    <span class="badge badge-success" v-if="product.approved">Approved</span>
                    <span class="badge badge-danger" v-else>Not Approved</span>
                  </td>
                  <td class="text-center">
                    <a class="text-success" @click.prevent="changeState(product)" v-if="product.status">
                      <i class="fa fa-toggle-on" aria-hidden="true"></i>
                    </a>
                    <a class="text-danger" @click.prevent="changeState(product)" v-else>
                      <i class="fa fa-toggle-off" aria-hidden="true"></i>
                    </a>
                  </td>
                  <td class="text-center">
                    <router-link :to="'/admin/products/'+product.id">
                      <i class="fa fa-pencil"></i>
                    </router-link>
                  </td>
                </tr>
                <tr v-if="products.length == 0">
                  <td colspan="7" class="text-center">No existen productos.</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="col-md-8" v-else>
          <div class="alert alert-info text-center">Usted no cuenta con una tienda asignada.</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'products',
    props:['user'],
    data(){
      return {
        products : [],
        loading: false
      }
    },
    methods:{
      changeState(product){

        if (product.status) {
          product.status = 0
        } else {
          product.status = 1
        }

        axios.put('/api/products/'+product.id,product);
      },
      load(){
        var vm = this;
        this.loading = true;
        axios.get('/api/products?edit=1').then(
          (result) => {
            vm.products = result.data.products;
            vm.loading = false;
          },
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        );
      }
    },
    mounted(){


      if (this.user.role != 'admin' && this.user.role != 'owner') {
        this.$router.push('/')
      } else {
        this.load();
      }
    }
  }
</script>










