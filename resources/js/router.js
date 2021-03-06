import Vue from 'vue'
import Router from 'vue-router'
import home from './pages/home.vue'
import login from './pages/login.vue'
import singup from './pages/singup.vue'
import join from './pages/join.vue'
import profile from './pages/profile.vue'
import cart from './pages/cart.vue'
import product from './pages/product.vue'
import category from './pages/category.vue'
import tshirt from './pages/tshirt.vue'

import search from './pages/search.vue'


import adminUsers from './admin/users.vue'
import adminCategories from './admin/categories.vue'
import adminOwners from './admin/owners.vue'
import adminProducts from './admin/products.vue'
import editor from './admin/editor.vue'



Vue.use(Router)
const router = new Router ({
  mode: 'history',
  routes: 
  [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/singup',
      name: 'singup',
      component: singup
    },
    {
      path: '/join',
      name: 'join',
      component: join
    },
    {
      path: '/profile',
      name: 'profile',
      component: profile
    },
    {
      path: '/personaliza-tu-polo',
      name: 'tshirt',
      component: tshirt
    },
    {
      path: '/cart',
      name: 'cart',
      component: cart
    },
    {
      path: '/product/:slug',
      name: 'product',
      component: product
    },
    {
      path: '/categories/:slug',
      name: 'category',
      component: category
    },
    {
      path: '/search/:search',
      name: 'search',
      component: search
    },
    {
      path: '/admin/users',
      name: 'adminUsers',
      component: adminUsers,
      meta: {
        roles: 'admin'
      }
    },
    {
      path: '/admin/providers',
      name: 'adminOwners',
      component: adminOwners,
      meta: {
        roles: 'admin'
      }
    },
    {
      path: '/admin/products',
      name: 'adminProducts',
      component: adminProducts,
      meta: {
        roles: 'admin'
      }
    }, 
    {
      path: '/admin/products/categories',
      name: 'adminCategories',
      component: adminCategories,
      meta: {
        roles: 'admin'
      }
    },
    {
      path: '/admin/products/:id',
      name: 'adminProductsEdit',
      component: editor,
      meta: {
        roles: 'admin'
      }
    }, 
    {
      path: '/admin/new-product',
      name: 'editor',
      component: editor,
      meta: {
        roles: 'admin'
      }
    }
  ]
})

export default router;


router.beforeEach((to, from, next) => {
  if (to.meta.roles) {
    var token = (Vue.ls.get('token'));
    if (!token) {
    }
  }
  next();
})





