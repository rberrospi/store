<template>
  <div id="cart">
    <div class="product-title">
      <div class="container">
        <h1>Shopping cart</h1>
      </div>
    </div>
    <div class="container cart-content">
      <div class="table-responsive">
        <table>
          <thead>
            <tr>
              <th>PRODUCT</th>
              <th>NAME & DESCRIPTION</th>
              <th>PRICE</th>
              <th>QUANTITY</th>
              <th>TOTAL</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item,index in cart">
              <td>
                <img v-if="item.product.image" :src="'/storage/'+item.product.image" class="rounded img-table3">
                <img v-else v-holder="{img:'100x100'}" class="rounded">
              </td>
              <td>{{ item.product.name }}</td>
              <td>S/. {{ item.product.price | amount }}</td>
              <td>
                <input type="number" v-model="item.qty" step="1" min="1">
              </td>
              <td>S/. {{ (item.product.price * item.qty) | amount }}</td>
              <td>
                <a href="#" @click.prevent="remove(index)" class="remove-option">
                  <i class="fa fa-remove"></i>
                </a>
              </td>
            </tr>
            <tr v-if="!cart.length">
              <td class="text-center" colspan="5">No hay productos en su carrito.</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="order-subtotal">
        <span class="order-label">Subtotal</span>
        <span class="order-amount">S/. {{ subtotal | amount }}</span>
      </div>
      <div class="order-total">
        <span class="order-label">Total</span>
        <span class="order-amount">S/. {{ total | amount }}</span>
      </div>
      <div class="form-actions">
        <button class="btn btn-red" @click.prevent="update" :disabled="!cart.length" :class="{disabled: !cart.length}">Update Cart</button>
        <button class="btn btn-red disabled" disabled="">Checkout</button>
      </div>
    </div>
  </div>
  
</template>
<script type="text/javascript">
  export default {
    name: 'cart',
    data(){
      return {
        cart : []
      }
    },
    methods:{
      update(){
        var cart = this.cart;
        this.$ls.set('cart',JSON.stringify(cart));
        this.$emit('cart',cart);
        toastr.success('Your cart has been updated!', 'OK!');
      },
      remove(index){
        this.cart.splice(index,1);
        var cart = this.cart;
        this.$ls.set('cart',JSON.stringify(cart));
        this.$emit('cart',cart);
        toastr.success('Your cart has been updated!', 'OK!');
      }
    },
    computed:{
      total(){
        var total = 0;


        for(var i = 0, l = this.cart.length; i < l; i++) {
          var item = this.cart[i];
          total += item.product.price * item.qty;
        }

        return total;
      },
      subtotal(){
        var subtotal = 0;

        for(var i = 0, l = this.cart.length; i < l; i++) {
          var item = this.cart[i];
          subtotal += item.product.price * item.qty;
        }

        return subtotal;
      }
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    mounted(){
      var vm = this;
      var cart = this.$ls.get('cart');
      if(cart) {
        this.cart = JSON.parse(cart);
      }
    }
  }
</script>