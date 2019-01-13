<template>
  <div class="container" v-if="loaded">
    <br><br>
    <h1 class="text-center">{{ search }}</h1>
    <div class="row">
      <div class="col-md-12 text-center" v-if="products.length == 0">
        <h4>No se han encontrado productos</h4>
        <br><br>
      </div>
      <div class="col-md-3" v-for="product in products">
        <div class="product-box">
          <div class="product-image">
            <img :src="'/storage/'+product.image" class="img-fluid">
            <a :href="'/product/'+product.slug"></a>
          </div>
          <div class="product-meta-container">
            <div class="product-meta text-center">
              <div class="product-title">
                <a :href="'/product/'+product.slug">{{ product.name }}</a>
              </div>
              <div class="product-price">
                <span v-if="product.discount">S/.{{ product.discount | amount }}</span>
                <span v-else>S/.{{ product.price | amount }}</span>
              </div>
            </div>
            <div class="product-add-cart">
              <button class="btn btn-red" @click.prevent="addToCart(product)">Add to cart</button>
            </div>
          </div>
          <br><br>
        </div>
      </div>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'search',
    data(){
      return {
        products:[],
        search: '',
        loaded: false,
      }
    },
    watch:{
      $route(){
        this.load();
      }
    },
    methods:{
      load(){
        var vm = this;

        this.search = this.$route.params.search;

        axios.get('/api/products-index?search='+this.search).then(
          (result) => {
            vm.products = result.data.products;
            vm.loaded = true;
          },

          (error) => {
          }
        );
      }

    },
    mounted(){
      this.load();
    }
  }
</script>