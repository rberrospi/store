<template>
  <div class="wrapper">
    <nav class="navbar navbar-dark bg-primary navbar-expand" v-if="admin">
      <a class="navbar-brand" href="#">Admin</a>
      <ul class="navbar-nav">
        <li class="nav-item dropdown" v-if="user.role == 'admin'">
          <router-link to="/admin/users" class="nav-link" href="#">Usuarios</router-link>
        </li>
        <li class="nav-item dropdown"  v-if="user.role == 'admin'">
          <router-link to="/admin/providers" class="nav-link" href="#">Proveedores</router-link>
        </li>
        <li class="nav-item dropdown" v-if="user.role == 'admin' || user.role == 'owner'">
          <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Productos</a>
          <div class="dropdown-menu">
            <router-link to="/admin/products" class="dropdown-item" href="#">Lista</router-link>
            <router-link to="/admin/products/categories" class="dropdown-item" v-if="user.role == 'admin'">Categorias</router-link>
          </div>
        </li>
        <li class="nav-item dropdown" v-if="user.role == 'admin' || user.role == 'owner'">
          <router-link to="/admin/orders" class="nav-link" href="#">Ordenes</router-link>
        </li>
        <li class="nav-item dropdown" v-if="user.role == 'admin' || user.role == 'middleman'">
          <router-link to="/admin/coupons" class="nav-link" href="#">Cupones</router-link>
        </li>
      </ul>
    </nav>

    <div class="bg-dark">
      <div class="container">
        <nav class="navbar navbar-dark navbar-expand">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item" v-if="!user">
              <router-link class="nav-link" to="/login">Iniciar Sesión</router-link>
            </li>
            <li class="nav-item dropdown" v-else>
              <a href="#" class="nav-link dropdown-toggle"  data-toggle="dropdown">
                <i class="ion-ios-gear-outline"></i>
              </a>
              <div class="dropdown-menu">
                <a href="#" class="dropdown-item" @click.prevent="logout">Mi Cuenta</a>
                <a href="#" class="dropdown-item" @click.prevent="logout">Cerrar Sesión</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Ayuda</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
        <router-link class="navbar-brand" to="/">
          <img src="/logo.svg" class="img-fluid">
        </router-link>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-main" aria-controls="navbar-main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbar-main">
          <form class="form-inline ml-auto">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">
              <i class="fa fa-search"></i>
            </button>
          </form>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <router-link class="nav-link" to="/join">Unete a nosotros</router-link>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Personaliza tu Polo</a>
            </li>
            <li class="nav-item dropdown cart-link">
              <a class="nav-link cart-info" href="#" data-toggle="dropdown">
                <span class="cart-length">{{ cart.length }}</span>
                <i class="ion-bag"></i>
              </a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#" v-for="item in cart">
                  <span class="item-picgture">
                    <img v-holder="{img:'28x28', text: 'P'}" class="rounded">
                  </span>
                  <span class="item-name">{{ item.product.name }}</span>
                  <span class="item-qty">{{ item.qty }}x</span>
                  <span class="item-price">S/.{{ item.product.price | amount}}</span>
                </a>
                <router-link to="/cart" class="btn btn-red">Cart</router-link>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div v-if="loaded">
      <router-view :user.sync="user" v-on:getUser="getUser"  v-on:cart="cartUpdated"></router-view>
    </div>
    <footer class="bg-dark text-white">
      <div class="container">  
        <div class="row">
          <div class="col-md-3">
            <div class="block">
              <p>
                <img src="http://hugestem.com/wosh/themes/wosh/assets/images/logo-light.png" alt="logo" class="img-fluid">
              </p>
              <p>To be a recognized world leader and authority in the industry for design and creativity.<br>
                Fax: +098 123 4567 E-mail: <a href="mailto:info@website.com">info@website.com</a>
              </p>
            </div>
          </div>
          <div class="col-md-3">
            <div class="block">
              <h2>Quick Links</h2>
              <ul>
                <li><a href="#">Accounts</a></li>
                <li><a href="#">Shipment</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Return policy</a></li>
                <li><a href="#">Compare</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-3">
            <div class="block">
              <h2>Recent Posts</h2>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'index',
    data(){
      return {
        user : false,
        loaded: false,
        cart: []
      }
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    methods:{
      cartUpdated(cart){
        this.cart = cart
      },
      getUser(){
        var vm = this;
        let token = vm.$ls.get('token');
        if (token) {
          window.axios.defaults.headers.common['Authorization'] = 'Bearer '+token;
          axios.get('/api/user').then(
            (response) => {
              vm.user = response.data.user;
              vm.loaded = true;
            }, 
            (error) => {
              vm.$ls.remove('token');
              vm.$router.push('/');
              vm.loaded = true;
            }
          );  
        } else {
          this.loaded = true;
        }
      },
      logout(){
        this.$ls.remove('token');
        window.location.reload();
      }
    },
    computed:{
      admin(){
        var user = this.user;
        return user && (user.role == 'admin' || user.role == 'owner' || user.role == 'middleman')
      }
    },
    mounted(){
      var vm = this;
      vm.getUser();
      var cart = this.$ls.get('cart');
      if(cart) {
        this.cart = JSON.parse(cart);
      }
    }
  }
</script>


