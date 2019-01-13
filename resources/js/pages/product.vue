<template>
  <div id="products">
    <div class="product-title">
      <div class="container">
        <h1>{{ product.name }}</h1>
      </div>
    </div>

    <div class="product-content" v-if="product">
      <div class="container">
        <div class="row">
          <div class="col-md-6" v-if="product.variations.length">
            <carousel :autoplay="false" :nav="false" :items="1" ref="carousel"> 
              <div class="img-carousel" v-for="v in product.variations">
                <img :src="'/storage/'+v.image" class="img-responsive">
              </div>
            </carousel>
          </div>
          <div class="col-md-6" v-else>
            <img :src="'/storage/'+product.image" class="img-fluid">
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
            <br>
            <div class="variation" v-if="product.variations.length">
              <select class="form-control" v-model="cart.variation" @change="showImage">
                <option v-for="v, index in product.variations" :value="index">
                  {{ v.model }} - {{ v.color }} - {{ v.gender }} <span v-if="v.stock == 0">(Sin STOCK)</span>
                </option>
              </select>
            </div>
            <br>
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
          variation: false
        }
      }
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    methods:{
      showImage(){
        $($('.owl-dot')[this.cart.variation]).trigger('click');
      },
      addToCart(){
        var vm = this;
        var cart = this.$ls.get('cart');
        if(cart) {
          cart = JSON.parse(cart);
          var key = cart.findIndex((item) => item.product.id == vm.product.id );

          if (key > -1 && cart[key].variation === this.cart.variation) {
            cart[key].qty += this.cart.qty;
          } else {
            cart.push({
              product : this.product,
              qty: this.cart.qty,
              variation: this.cart.variation
            });
          }
        } else {
          cart = [];
          cart.push({
            product : this.product,
            qty: this.cart.qty,
            variation: this.cart.variation
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
            if (vm.product.variations.length) {
              vm.cart.variation = 0;
            }
            $('a[data-toggle="tab"]').tab();

          },
          (error) => {

          }
        );
      }
    }
  }
</script>