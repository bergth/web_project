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

        <div id="pageBody">
          <div style="color:#65ffbd" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1>Welcome to {$view.appname}!</h1>
            <p>Click here to <a href="{$view.urlbaseaddr}index.php/product/index">view list of all products</a>!</p>
          </div>
        </div> <!-- END pageBody -->
        
      </div>
    </div>

  <!-- Carousel -->

  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="carousel-item active">
        <img class="d-block w-100" src="moonlighter.png" alt="Moonlighter" >
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="TheyAreBillions.png" alt="They are Billions">
      </div>
      <div class="carousel-item">
        <img class="d-block w-100" src="frostpunk.png" alt="Frostpunk">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>



  <!-- https://ibb.co/GcFvDwy
  https://ibb.co/C9nvtmj
  https://ibb.co/6XMnR5k-->

{if $view.bodyjs == 1}
{include file='bodyjs.tpl'}
{/if}

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <!--<script src="js/ie10-viewport-bug-workaround.js"></script>-->

</body>
</html>
