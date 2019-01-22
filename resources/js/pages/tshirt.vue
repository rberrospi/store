<template>
  <div id="tshirt">
    <div class="container">
      <br><br>
      <h1 class="text-center">Personaliza tu Polo</h1>
      <br><br>

      <div class="row">
        <div class="col-md-6 text-center">
          <div class="tshirt-image text-left front" v-show="!position" ref="workspace">
            <a href="#" @click.prevent="changePosition">
              <i class="fa fa-long-arrow-left"></i>
              <small>Voltear Polo</small>
            </a>
            <FreeTransform v-for="image,key in images" :key="key"
              :x="image.x"
              :y="image.y"
              :scale-x="image.scaleX"
              :scale-y="image.scaleY"
              :width="image.width"
              :height="image.height"
              :angle="image.angle"
              :offsetX="offsetX"
              :offsetY="offsetY"
              v-if="!image.position"
              @update="update(key,$event)"
            >
              <div :class="image.size">
                <img :src="image.image">
              </div>
            </FreeTransform>
          </div>
          <div class="tshirt-image text-left back" v-show="position">
            <a href="#" @click.prevent="changePosition">
              <i class="fa fa-long-arrow-left"></i>
              <small>Voltear Polo</small>
            </a>
            <FreeTransform v-for="image,key in images" :key="key"
              :x="image.x"
              :y="image.y"
              :scale-x="image.scaleX"
              :scale-y="image.scaleY"
              :width="image.width"
              :height="image.height"
              :angle="image.angle"
              :offsetX="offsetX"
              :offsetY="offsetY"
              v-if="image.position"
              @update="update(key,$event)"
            >
              <div :class="image.size">
                <img :src="image.image">
              </div>
            </FreeTransform>
          </div>
          <div class="custom-file">
            <input type="file" class="custom-file-input" id="customFile"  accept="image/*"  ref="image">
            <label class="custom-file-label" for="customFile">Choose file</label>
          </div>
          <div class="form-group form-options form-inline justify-content-center">
            <select class="form-control mr-2" v-model="options.size">
              <option value="" disabled="">Elegir tamaño</option>
              <option value="half">1/2 Hoja -- S/10.0</option>
              <option value="full">1 Hoja -- S/20.0</option>
            </select>
            <button class="btn btn-success"  v-if="loading">
              <i class="fa fa-spin fa-spinner"></i>
              <span>Loading...</span>
            </button>
            <button class="btn btn-success"  v-else @click.prevent="addImage">Agregar Imagen</button>
          </div>
        </div>
        <div class="col-md-6 form-actions">
          <div class="form-group">
            <label>Precio</label>
            <div class="price">S/. {{ price  | amount}}</div>
          </div>
          <button class="btn btn-red" @click.prevent="addToCart">Add to cart</button>
        </div>
      </div>
    </div>    
  </div>
</template>
<script type="text/javascript">
  export default{
    name: 'T-shirt',
    data(){
      return {
        options: {
          size: ''
        },
        images: [],
        loading: false,
        position: false,
        offsetX: 0,
        offsetY: 0
      }
    },
    computed:{
      price(){
        var price = 0; 
        var images = this.images;
        for(var i = 0, l = images.length; i < l; i++) {
          price += (images[i].size == 'half')? 10 : 20;
        }
        return price;
      },
    },
    filters:{
      amount(value){
        return parseFloat(value).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
      }
    },
    methods:{
      addImage(){
        var vm = this;
        vm.loading = true;
        if (this.options.size == '') {
          toastr.error('Debe seleccionar un tamaño', 'Oops!');
          vm.loading = false;
          return;
        }

        if (!this.$refs.image.files.length) {
          toastr.error('Debe seleccionar un imagen', 'Oops!');
          vm.loading = false;
          return;
        }
        var size = this.options.size;
        var position = this.position;
        var reader = new FileReader();
        reader.readAsDataURL(this.$refs.image.files[0]);
        reader.onload = function(e) {
          vm.loading = false;
          var width = (size == 'full')? 80 : 40;

          vm.images.push({
            image: e.target.result,
            size: size,
            position: position,
            x: 100,
            y: 50,
            scaleX: 1,
            scaleY: 1,
            width: width,
            height: 80,
            angle: 0,
          })
        };
      },
      update(index, payload) {
        this.images = this.images.map((item, i) => {
          if (index === i) {

            if(payload.x && ((payload.x + item.width) > 400)) {
              payload.x = 400 - item.width;
            }

            if(payload.x && ((payload.x - item.width) < 0)) {
              payload.x = 0;
            }


            if(payload.y && ((payload.y + item.height) > 435)) {
              payload.y = 435 - item.height;
            }

            if(payload.y && ((payload.y - item.height) < 0)) {
              payload.y = 0;
            }

            return {
              ...item,
              ...payload
            }
          }
          return item
        })
      },
      changePosition(){
        this.position = !this.position;
      },
      addToCart(){

        if(this.images.length == 0) {
          toastr.error('No has agregado ninguna imagen!','Oops!');
          return;
        }

        var vm = this;
        var cart = this.$ls.get('cart');
        if(cart) {
          cart = JSON.parse(cart);
        } else {
          cart = [];
        }

        var price = this.price;
        var name = '';
        if (this.images.length == 1) {
          name = 'Polo Personalizado (1 imagen)';
        } else {
          name = 'Polo Personalizado ('+ this.images.length+' imagenes)';
        }

        var images = this.images;

        cart.push({
          product : {
            image: 'tshirt',
            name: name,
            variations: [],
            price: price,
            //images: images
          },
          qty: 1,
          variation: false
        });

        this.$ls.set('cart',JSON.stringify(cart));
        this.$emit('cart',cart);
        toastr.success('The product has been addded to your cart!', 'OK!');
        this.$router.push('/cart');
      }
    },
    mounted(){
      this.offsetX = this.$refs.workspace.offsetLeft
      this.offsetY = this.$refs.workspace.offsetTop
    }
  }
</script>

<style type="text/css">      
  .tr-transform--active{
      position: absolute;
      z-index: 5;
  }
  
  .tr-transform__content{
      user-select: none;
  }
  .tr-transform__rotator {
      top: -45px;
      left: calc(50% - 7px);
  }

  .tr-transform__rotator,
  .tr-transform__scale-point {
      background: #fff;
      width: 15px;
      height: 15px;
      border-radius: 50%;
      position: absolute;
      box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.1);
      border: 1px solid rgba(0, 0, 0, 0.1);
      cursor: pointer;
  }

  .tr-transform__rotator:hover,
  .tr-transform__scale-point:hover {
      background: #F1F5F8;
  }

  .tr-transform__rotator:active,
  .tr-transform__scale-point:active {
      background: #DAE1E7;
  }

  .tr-transform__scale-point {

  }

  .tr-transform__scale-point--tl {
      top: -7px;
      left: -7px;
  }

  .tr-transform__scale-point--ml {
      top: calc(50% - 7px);
      left: -7px;
  }

  .tr-transform__scale-point--tr {
      left: calc(100% - 7px);
      top: -7px;
  }

  .tr-transform__scale-point--tm {
      left: calc(50% - 7px);
      top: -7px;
  }

  .tr-transform__scale-point--mr {
      left: calc(100% - 7px);
      top: calc(50% - 7px);
  }

  .tr-transform__scale-point--bl {
      left: -7px;
      top: calc(100% - 7px);
  }

  .tr-transform__scale-point--bm {
      left: calc(50% - 7px);
      top: calc(100% - 7px);
  }

  .tr-transform__scale-point--br {
      left: calc(100% - 7px);
      top: calc(100% - 7px);
  }
</style>