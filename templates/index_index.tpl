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
              <img class="d-block w-100" src="https://i.ibb.co/nQkM8V3/Scene1-Gate-sit.png" alt="Moonlighter" >
              <div class="container">
                <div class="carousel-caption text-left">
                  <h1>Moonlighter</h1>
                  <p>Hero or Merchant ?</p>
                  <p><a class="button" href="#" role="button">View game</a></p>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://i.ibb.co/m9hKGxC/They-Are-Billions-Screenshot-1.jpg" alt="They are Billions">
              <div class="container">
                <div class="carousel-caption text-left">
                  <h1>They are Billions</h1>
                  <p>Build & Kill</p>
                  <p><a class="button" href="#" role="button">View game</a></p>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="https://i.ibb.co/TT0yLL8/The-Fall-of-Winterhome-06-2.png" alt="Frostpunk">
              <div class="container">
                <div class="carousel-caption text-left">
                  <h1>Frostpunk</h1>
                  <p>More cold than Canada</p>
                  <p><a class="button" href="#" role="button">View game</a></p>
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


        <div class="container">
        <div id="pageBody">
          <div style="color:#65ffbd" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1>Welcome to {$view.appname}!</h1>
            <p>Click here to <a href="{$view.urlbaseaddr}index.php/product/index">view list of all products</a>!</p>
          </div>
        </div>
        </div>

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
