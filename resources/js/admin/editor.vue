<template>
  <div class="editor-page">  
    <div class="container">
      <div class="title">
        <h1 v-if="!product.id">Nuevo Producto</h1>
        <h1 v-else>Editar Producto</h1>
      </div>

      <form @submit.prevent="submit">
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" href="#info" data-toggle="tab">Información Básica</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#variations" data-toggle="tab">Variaciones</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#delivery" data-toggle="tab">Información de Delivery</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#warranty" data-toggle="tab">Políticas y Garantía</a>
          </li>
        </ul>

        <div class="tab-content">
          <div class="tab-pane fade show active" id="info" role="tabpanel">
            <div class="form-group" v-if="user.role == 'admin'">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="1" id="approved" v-model="product.approved">
                <label class="form-check-label" for="approved">Aprobar Producto.</label>
              </div>
            </div>
            <div class="form-group row">
              <div class="col-md-6">
                <label>Imagen Principal del producto</label>
                <input type="file" :required="!product.image" class="form-control" ref="file">
                <p class="text-muted"><small>Esta imagen unicamente aparecera en el homepage y las paginas de categorias.</small></p>
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
            </div>
            <div class="form-group row">
              <div class="col-md-6">
                <label>Categoría de Producto</label>
                <select class="form-control" v-model="product.category_id" required="">
                  <option value="" disabled="">- Seleccione -</option>
                  <option v-for="c in categories" :value="c.id">{{ c.name }}</option>
                </select>
              </div>
              <div class="col-md-6">
                <label>Categoría de Producto</label>
                <select class="form-control" v-model="product.subcategory" :disabled="!subcategories">
                  <option value="" disabled="">- Seleccione -</option>
                  <option v-for="c in subcategories" :value="c">{{ c }}</option>
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
          </div>
          <div class="tab-pane fade" id="variations" role="tabpanel">
            <div class="row" v-if="product.id">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" placeholder="Talla / Modelo" class="form-control" v-model="variation.model" ref="varmodel">
                </div>
                <div class="form-group">
                  <input type="text" placeholder="Color" class="form-control" v-model="variation.color">
                </div>
                <div class="form-group">
                  <input type="text" placeholder="Hombe / Mujer / Unisex" class="form-control" v-model="variation.gender">
                </div>
                <div class="form-group">
                  <input type="number" placeholder="Stock" class="form-control" v-model="variation.stock">
                </div>
                <div class="form-group">
                  <input type="file" ref="varimage">
                </div>
                <div class="form-actions text-right">
                  <button class="btn btn-primary" @click.prevent="addVar" v-if="variation.index > -1">Guardar</button>
                  <button class="btn btn-primary" @click.prevent="addVar" v-else>Agregar</button>
                  <button class="btn btn-danger" @click.prevent="clearVar" v-if="variation.index > -1">Cancelar</button>
                </div>
              </div>
              <div class="col-md-6">
                <div class="table-responsive"> 
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>Talal / Modelo</th>
                        <th>Color</th>
                        <th>Genero</th>
                        <th>Stock</th>
                        <th>Image</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="v, index in product.variations">
                        <td>{{ v.model }}</td>
                        <td>{{ v.color }}</td>
                        <td>{{ v.gender }}</td>
                        <td>{{ v.stock }}</td>
                        <td>
                          <img :src="'/storage/'+v.image" class="img-fluid img-table3">
                        </td>
                        <td>
                          <a href="#" @click.prevent="editVar(v, index)">
                            <i class="fa fa-pencil"></i>
                          </a>
                          <a href="#" @click.prevent="delVar(index)">
                            <i class="fa fa-trash-o"></i>
                          </a>
                        </td>
                      </tr>
                      <tr v-if="!product.variations || !product.variations.length">
                        <td class="text-center" colspan="6">
                          No hay variaciones.
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="alert alert-info" v-else>
              Debes crear primero el producto antes de agregar las variaciones.
            </div>
          </div>
          <div class="tab-pane fade" id="delivery" role="tabpanel">
            <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="1" id="address" v-model="product.address">
                <label class="form-check-label" for="address">Entrega a domicilio</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="1" id="province" v-model="product.province">
                <label class="form-check-label" for="province">Entrega a provincia</label>
              </div>
              <div class="form-check" v-if="user.role == 'admin'">
                <input class="form-check-input" type="checkbox" value="1" id="free" v-model="product.free">
                <label class="form-check-label" for="free">Envio gratuito</label>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="warranty" role="tabpanel">
            <div class="form-group">
              <div class="form-check d-inline-block mr-2">
                <input class="form-check-input" type="checkbox" value="1" id="over18" v-model="product.over18">
                <label class="form-check-label" for="over18">Prohibida la venta a menores.</label>
              </div>
            </div>
            <div class="form-group">
              <label>Políticas de devolución</label>
              <textarea class="form-control" v-model="product.returns"></textarea>
            </div>
            <div class="form-group">
              <label>Garantía</label>
              <textarea class="form-control" v-model="product.warranty"></textarea>
            </div>
          </div>
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
          category_id: 0,
          price: 0,
          discount: 0,
          summary: '',
          body: '',
          variations: []
        },
        variation:{

        },
        categories:[]
      }
    },
    computed:{
      subcategories(){
        var cat = this.product.category_id
        var categories = this.categories;
        if (cat) {
          var selected = this.categories.find(category => category.id == cat);
          if (selected) {
            return selected.subs;
          }
        }
        return [];
      }
    },
    methods:{
      clearVar(){
        this.variation = {};
      },
      editVar(variation, index){
        this.variation = Object.assign({},variation);
        this.variation.index = index;
        $(this.$refs.varmodel).focus();
      },
      delVar(index){
        var vm = this;

        var data = {
          index: index,
          delete: 1
        };

        axios.post('/api/products/'+vm.product.id+'/variations', data).then(
          (result) => {
            vm.product = result.data.product;
            vm.variation = {};
          },
          (error) => {
          }
        )
      },
      addVar(){
        var vm = this;

        if (!vm.variation.stock > 0) {
          toastr.error('Debes ingresar una stock', 'Oops!');
          return;
        }

        if (!vm.$refs.varimage.files.length &&  typeof vm.variation.index == 'undefined') {
          toastr.error('Debes ingresar una imagen', 'Oops!');
          return;
        }

        var data = new FormData();
        data.append('model', vm.variation.model);
        data.append('color', vm.variation.color);
        data.append('gender', vm.variation.gender);
        data.append('stock', vm.variation.stock);
        data.append('image', vm.$refs.varimage.files[0]);

        if (vm.variation.index > -1) {
          data.append('index', vm.variation.index);
        }

        axios.post('/api/products/'+vm.product.id+'/variations', data).then(
          (result) => {
            vm.product = result.data.product;

            if (vm.variation.index > -1) {
              toastr.success('La variación se ha actualizado', 'OK!');
            } else {
              toastr.success('La variación se ha creado', 'OK!');
            }

            vm.variation = {};
            $(vm.$refs.varimage).val('')
          },
          (error) => {
          }
        )
      },
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