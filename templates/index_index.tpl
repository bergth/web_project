<!DOCTYPE html>
<html lang="en">

{if isset($view.headjs)}
{include file='headjs.tpl'}
{else}
{include file='head.tpl'}
{/if}

  <body>
  {include file='navbar.tpl'}

    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          {foreach from=$view.navMenu key=navMenuEntry item=navMenuLink}
            <li><a href="{$navMenuLink}">{$navMenuEntry}</a></li>
          {/foreach}
          </ul>
        </div>
      </div>
    </div>

  <div class="jumbotron-fluid">
    <h1 class="display-3">Welcome to {$view.appname}!</h1>
    <p class="lead">Welcome wanderer ! You seek new adventures ? Original games with their own gameplay and innovative ideas ? Then take a look at our humble shop ! </p>
    <hr class="my-4">
    <main role="main">

      <!-- Carousel -->
      <div id="carouselIndicator" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselIndicator" data-slide-to="0" class="active"></li>
          <li data-target="#carouselIndicator" data-slide-to="1"></li>
          <li data-target="#carouselIndicator" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active">
            <img class="d-block w-100" src="https://i.ibb.co/nQkM8V3/Scene1-Gate-sit.png" alt="Moonlighter in front of the gate" >
            <div class="container">
              <div class="carousel-caption text-left">
                <h1 class="car">Moonlighter</h1>
                <p class="sub_car">Hero or Merchant ?</p>
                <!--<p><a class="btn btn-info" href="#" role="button">View game</a></p>-->
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="https://i.ibb.co/g4hR3NQ/they-are-billions.jpg"" alt="They are Billions zombie town">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1 class="car">They are Billions</h1>
                <p class="sub_car">Build & Kill</p>
                <!--<p><a class="btn btn-info" href="#" role="button">View game</a></p>-->
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="https://i.ibb.co/TT0yLL8/The-Fall-of-Winterhome-06-2.png" alt="Frostpunk town">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1 class="car">Frostpunk</h1>
                <p class="sub_car">Colder than Canada</p>
                <!--<p><a class="btn btn-info" href="#" role="button">View game</a></p>-->
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselIndicator" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselIndicator" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>

    <hr class="my-4">
      <h2 class="display-4">What is New Retro ?</h2>
      <p> What is New Retro Games? </br> We seek the best retro-styled independant games </br>Click here to view list of all products:</p>
    <p class="lead">
      <a class="btn btn-primary btn-lg" style="margin-left: 5%" href="{$view.urlbaseaddr}" role="button" >Games</a>
    </p>
  </div>

  <!--
        <div class="container">
        <div id="pageBody">
          <div style="color:#65ffbd" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1>Welcome to {$view.appname}!</h1>
            <p>Click here to <a href="{$view.urlbaseaddr}">view list of all products</a>!</p>
          </div>
        </div>
        </div>-->

  </main>





  <!-- <img src="https://i.ibb.co/mNjDC73/They-Are-Billions.png" alt="They-Are-Billions" border="0">
<img src="https://i.ibb.co/yWVnCTt/frostpunk.jpg" alt="frostpunk" border="0">
<img src="https://i.ibb.co/7pGVzj3/moonlighter.png" alt="moonlighter" border="0">-->

{if $view.bodyjs == 1}
{include file='bodyjs.tpl'}
{/if}

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
