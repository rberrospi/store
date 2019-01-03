<template>
  <div class="editor-page">  
    <div class="container">
      <div class="title">
        <h1 v-if="!product.id">Nuevo Producto</h1>
        <h1 v-else>Editar Producto</h1>
      </div>
      <form @submit.prevent="submit">
        <div class="form-group" v-if="user.role == 'admin'">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="1" id="approved" v-model="product.approved">
            <label class="form-check-label" for="approved">Aprobar Producto.</label>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-md-6">
            <label>Imagen de Producto</label>
            <input type="file" :required="!product.image" class="form-control" ref="file">
          </div>
          <div class="col-md-6 text-center" v-if="product.image">
            <img  :src="'/storage/'+product.image" class="rounded img-fluid img-table2">
          </div>
        </div>

        <div class="form-group row">
          <div class="col-md-6">
            <label>Nombre de Producto</label>
            <input type="text" v-model="product.name" class="form-control" required="">
          </div>
          <div class="col-md-6">
            <label>Categoría de Producto</label>
            <select class="form-control" v-model="product.category_id" required="">
              <option value="" disabled="">- Seleccione -</option>
              <option v-for="c in categories" :value="c.id">{{ c.name }}</option>
            </select>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-6">
            <label>Precio</label>
            <input type="number" v-model="product.price" class="form-control" step="0.01" required="">
          </div>
          <div class="col-md-6">
            <label>Precio descuento <small>(Opcional)</small></label>
            <input type="number" v-model="product.discount" class="form-control" step="0.01" required="">
          </div>
        </div>

        <div class="form-group row">
          <div class="col-md-6">
            <label>Resumen de Producto</label>
            <textarea class="form-control" v-model="product.summary"></textarea>
          </div>
          <div class="col-md-6">
            <label>Detalle de Producto</label>
            <textarea class="form-control" v-model="product.body"></textarea>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-md-6">
            <label>Stock</label>
            <input type="number" v-model="product.stock" class="form-control" step="0.01" required="" min="1">
          </div>
          <div class="col-md-6">
            <label>Estado del Producto</label>
            <select class="form-control" v-model="product.condition" required="">
              <option value="" disabled="">- Seleccione -</option>
              <option value="0">Usado</option>
              <option value="1">Nuevo</option>
            </select>
          </div>
        </div>

        <hr>
        <h3>Delivery</h3>

        <div class="form-group">
          <div class="form-check d-inline-block mr-2">
            <input class="form-check-input" type="checkbox" value="1" id="address" v-model="product.address">
            <label class="form-check-label" for="address">Entrega a domicilio</label>
          </div>
          <div class="form-check d-inline-block mr-2">
            <input class="form-check-input" type="checkbox" value="1" id="province" v-model="product.province">
            <label class="form-check-label" for="province">Entrega a provincia</label>
          </div>
          <div class="form-check d-inline-block mr-2" v-if="user.role == 'admin'">
            <input class="form-check-input" type="checkbox" value="1" id="free" v-model="product.free">
            <label class="form-check-label" for="free">Envio gratuito</label>
          </div>
        </div>
        <hr>
        <h3>Restricciones</h3>

        <div class="form-group">
          <div class="form-check d-inline-block mr-2">
            <input class="form-check-input" type="checkbox" value="1" id="over18" v-model="product.over18">
            <label class="form-check-label" for="over18">Prohibida la venta a menores.</label>
          </div>
        </div>
        <hr>
        <h3>Políticas y Garantía</h3>
        <hr>

        <div class="form-group">
          <label>Políticas de devolución</label>
          <textarea class="form-control" v-model="product.returns"></textarea>
        </div>


        <div class="form-group">
          <label>Garantía</label>
          <textarea class="form-control" v-model="product.warranty"></textarea>
        </div>

        <div class="form-actions">
          <button class="btn btn-success" v-if="product.id">Guardar Producto</button>
          <button class="btn btn-success" v-else>Crear Producto</button>
        </div>
        <br><br>
      </form>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'editor',
    props:['user'],
    data(){
      return {
        product : {
          name: '',
          category: 0,
          price: 0,
          discount: 0,
          summary: '',
          body: ''
        },
        categories:[]
      }
    },
    methods:{
      submit(){
        var vm = this;
        var action = 'post'
        var path = '/api/products';
        var data = vm.product;
        if (vm.product.id) {
          action = 'post';
          path += '/'+ vm.product.id;
          data['_method'] = 'PUT';
        }

        axios[action](path, vm.product).then(
          (result) => {
            if (result.data.error) {
              toastr.error(result.data.error,'Oops!');
            } else {

              var product = result.data.product;

              if (vm.$refs.file.files.length) {
                var data = new FormData();
                data.append('_method','PUT');
                data.append('image', vm.$refs.file.files[0]);
                
                axios.post('/api/products/'+product.id, data).then(
                  (result) => {
                    vm.$router.push('/admin/products');
                  },
                  (error) => {

                  }
                );


              } else {
                vm.$router.push('/admin/products');
              }
            }
          }, 
          (error) => {
            toastr.error('Something happen.','Oops!');
          }
        )

      },
      load(){
        var vm = this;
        axios.get('/api/categories').then(
          (result) => {
            vm.categories = result.data.categories;
          },
          (error) => {

          }
        );
      }
    },
    mounted(){
      var vm =this;
      if (this.$route.params.id){
        axios.get('/api/products/'+this.$route.params.id).then(
          (result) => {
            vm.product = result.data.product;
          },
          (error) => {

          }
        );
      }


      if (!this.user || (this.user.role != 'admin' && this.user.role != 'owner')) {
        this.$router.push('/')
      } else {
        this.load();
      }
    }
  }
</script>