<template>
  <div class="categories-page">  
    <div class="container">
      <div class="title">
        <h1>Categories</h1>
      </div>

      <div class="row justify-content-md-center">
        <div class="col-md-8">
          <div class="table-responsive">
            <div class="text-right">
              <button class="btn btn-success btn-sm" @click.prevent="create">
                <i class="fa fa-plus"></i>
                <span class="ml-2">Agregar Categoria</span>
              </button>
            </div>
            <br>
            <table class="table table-hovered table-bordered table-striped table-sm">
              <thead>
                <tr>
                  <th width="80"></th>
                  <th>Nombre</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="category in categories">
                  <td>
                    <img v-if="category.image" :src="'/storage/'+category.image" class="rounded img-fluid img-table">
                    <img v-else v-holder="{img:'75x75'}" class="rounded">
                  </td>
                  <td>
                    <router-link :to="'/categories/'+category.slug">{{ category.name }}</router-link>
                  </td>
                  <td class="text-center">
                    <a href="#" @click.prevent="edit(category)">
                      <i class="fa fa-pencil"></i>
                    </a>
                  </td>
                </tr>
                <tr v-if="categories.length == 0">
                  <td colspan="3" class="text-center">No existen categorias.</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>



    <div class="modal" tabindex="-1" role="dialog" id="category-modal">
      <div class="modal-dialog" role="document">
        <form @submit.prevent="submit">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">
                <span v-if="category.id">Editar Categoria</span>
                <span v-else>Nueva Categoria</span>
              </h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Nombre de Categoría:</label>
                <input type="text" class="form-control" v-model="category.name" required>
              </div>
              <div class="form-group">
                <label>Imagen:</label>
                <input type="file" ref="file">
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
    name: 'categories',
    props:['user'],
    data(){
      return {
        categories: [],
        loading: false,
        category: {
          id: 0,
          name: '',
        }
      }
    },
    methods:{
      create(){
        this.clear();
        $('#category-modal').modal();
      },
      edit(category){
        this.category = Object.assign({},category);
        $('#category-modal').modal();
      },
      clear(){
        this.category = {
          id: 0,
          name: '', 
        };
      },
      submit(){
        var vm = this;
        var action = 'post'
        var path = '/api/categories';
        var data = new FormData();
        if (vm.category.id) {
          data.append('_method','PUT');
          path += '/'+ vm.category.id;
        }

        data.append('name',vm.category.name);

        if (vm.$refs.file.files.length) {
          data.append('image',vm.$refs.file.files[0]);
        }

        axios[action](path, data).then(
          (result) => {
            if (result.data.error) {
              toastr.error(result.data.error,'Oops!');
            } else {
              $(vm.$refs.file).val('');
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
        axios.get('/api/categories').then(
          (result) => {
            vm.categories = result.data.categories;
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