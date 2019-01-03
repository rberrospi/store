<template>
  <div class="container" v-if="category">
    <br><br>
    <h1 class="text-center">{{ category.name }}</h1>
    <div class="row">
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
    name: 'category',
    data(){
      return {
        products:[],
        category: false
      }
    },
    methods:{

    },
    mounted(){

      var vm = this;

      axios.get('/api/products').then(
        (result) => {

          vm.products = result.data.products;

        },

        (error) => {

        }
      );



      axios.get('/api/category-slug/'+this.$route.params.slug).then(
        (result) => {

          vm.category = result.data.category;

        },
        (error) => {

        }
      )
      
    }
  }
</script>