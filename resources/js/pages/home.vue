<template>
  <div class="home-page">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 2</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 3</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 4</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 5</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 6</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Categoría 7</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="banner">
      <div class="banner-slide">
        <div class="slide-image">
          <img src="/images/slide2.jpg" alt="slide2"/>
        </div>
        <div class="slide-content-wrap">
          <div class="container slide-wrap">
            <div class="slide-content ">
              <div class="slide-content-main">
                <div class="pre-heading-text" data-animation-in="bounceInDown" data-animation-out="animate-out slideOutUp">
                  Recreate your style
                </div>
                <div class="heading-text">
                  <div>Get 50% discount off</div>
                  <div>summer formal wears</div>
                </div>
                <div class="slide-content-body">
                  <p>Create your unique niche through creative brand concepts</p>
                </div>
              </div>
            </div>
           </div> 
        </div>
      </div>
    </div>

    <div class="sections">
      <div class="container">
        <div class="row">

          <div class="col-md-4">
            <div class="row">
              <div class="col-md-12">
                <div class="category-box">
                  <a href="#">
                    <h3>Nuevos Productos</h3>
                  </a>
                </div>
              </div>
              <div class="col-md-12">
                <div class="category-box">
                  <a href="#">
                    <h3>Productos Recomendados</h3>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="category-box x2">
              <a href="#">
                <h3>Lo más vendido</h3>
              </a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="row">
              <div class="col-md-12">
                <div class="category-box">
                  <a href="#">
                    <h3>Video Juegos</h3>
                  </a>
                </div>
              </div>
              <div class="col-md-12">
                <div class="category-box">
                  <a href="#">
                    <h3>Accesorio Celulares</h3>
                  </a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>


    <div class="sections">
      <div class="container">
        <h2 class="text-center">Detalle de envio y comisiones.</h2>

        <div class="description">
          <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>
          <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
        </div>
      </div>
    </div>

  </div>
</template>
<script type="text/javascript">
  export default {
    name: 'home',
    data(){
      return {
        categories:[]
      }
    },
    methods:{

    },
    mounted(){
      var vm = this;

      axios.get('/api/categories').then(
        (result) => {

          vm.categories = result.data.categories;

        },
        (error) => {

        }
      )
    }
  }
</script>