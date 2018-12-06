

<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
            <a style="color:#a7c4c2"  class="navbar-brand" href="{$view.links.Home}"><img src="{$view.logo}" alt="Logo"><b>{$view.title}</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse" id="navbarCollapse">
                <ul class="nav navbar-nav">

                    {foreach from=$view.links key=name item=link}
                        <li class="nav-item"><a style="color:#a7c4c2" href="{$link}" role="button">{$name}</a></li>
                    {/foreach}

                </ul>
            </div>

            <form method="post">
                <button class="btn btn-primary" name="logout" type="submit" value="2">Logout</button>
            </form>
        </nav>
        <!--
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a style="color:#a7c4c2" class="navbar-brand" href="{$view.links.Home}"><img src="{$view.logo}" alt="Logo"><b>{$view.title}</b></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul  class="nav navbar-nav" >

                        {foreach from=$view.links key=name item=link}
                        <li><a style="color:#a7c4c2" style="margin-top: -15px" href="{$link}" role="button">{$name}</a></li>
                        <li><a style="color:#a7c4c2" href="http://127.0.0.2/index.php/product/index" role="button">Products list</a></li>
                        {/foreach}
                       <!-- <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Main Menu <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        {foreach from=$view.navMenu key=navMenuEntry item=navMenuLink}
                            <li class="dropdown-header">Menu</li>
                            <li><a href="{$navMenuLink}">{$navMenuEntry}</a></li>
                            <li role="separator" class="divider"></li>
                        {/foreach}
                        </ul>
                        </li> --> <!--
=======
                        </li> --><!--
                    </ul>
                </div>
            </div>
        </nav>-->
    </div>
</div>