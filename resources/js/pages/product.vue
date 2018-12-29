<template>
  <div id="products">
    <div class="product-title">
      <div class="container">
        <h1>{{ product.name }}</h1>
      </div>
    </div>

    <div class="product-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img v-holder="{img:'480x480'}" class="rounded">
          </div>
          <div class="col-md-6">
            <div class="product-price">
              <span v-if="product.discount">S/.{{ product.discount | amount }} S/.{{ product.price | amount }}</span>
              <span v-else>S/.{{ product.price | amount }}</span>
            </div>
            <div class="product-name">
              <h6>{{ product.name }}</h6>
            </div>
            <div class="product-description">
              {{ product.summary }}
            </div>

            <div class="product-actions">
              <input type="number" v-model="cart.qty" readonly="">
              <span class="changers">
                <span @click="inc">+</span>
                <span @click="dec">-</span>
              </span>
              <button class="btn btn-red" @click.prevent="addToCart">Add to cart</button>
            </div>
          </div>
        </div>

        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews</a>
          </li>
        </ul>
        <div class="tab-content" id="tabbed-content">
          <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="Description-tab">
            <div class="row product-info">
              <div class="col-md-12">
                <h2 class="mb-4">Product Description</h2>
                <div>{{ product.body }}</div>
              </div>
            </div>
            <div class="row product-info">
              <div class="col-md-12">
                <h2 class="mb-4">Políticas de devolución</h2>
                <div v-if="product.returns">{{ product.returns }}</div>
                <div v-else>Contactarse con el vendedor</div>
              </div>
            </div>
            <div class="row product-info">
              <div class="col-md-12">
                <h2 class="mb-4">Garantia</h2>
                <div v-if="product.warranty">{{ product.warranty }}</div>
                <div v-else>Contactarse con el vendedor</div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">            
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'product',
    data(){
      return {
        product: false,
        cart: {
          qty: 1,
        }
      }
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    methods:{
      addToCart(){
        var vm = this;
        var cart = this.$ls.get('cart');
        if(cart) {
          cart = JSON.parse(cart);
          var key = cart.findIndex((item) => item.product.id == vm.product.id );

          if (key > -1) {
            cart[key].qty += this.cart.qty;
          } else {
            cart.push({
              product : this.product,
              qty: this.cart.qty
            });
          }
        } else {
          cart = [];
          cart.push({
            product : this.product,
            qty: this.cart.qty
          });
        }

        this.$ls.set('cart',JSON.stringify(cart));
        this.$emit('cart',cart);
        toastr.success('The product has been addded to your cart!', 'OK!');
      },
      inc(){
        this.cart.qty++;
      },
      dec(){
        if (this.cart.qty > 1) {
          this.cart.qty--;
        }
      }
    },
    mounted(){
      var vm =this;
      if (this.$route.params.slug){
        axios.get('/api/products-slug/'+this.$route.params.slug).then(
          (result) => {
            vm.product = result.data.product;

            $('a[data-toggle="tab"]').tab();

          },
          (error) => {

          }
        );
      }
    }
  }
</script>