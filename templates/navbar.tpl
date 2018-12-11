

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

                    {if $view.session == 1}
                        <form method="post">
                            <button class="btn btn-primary" name="logout" type="submit" value="2">Logout</button>
                        </form>
                    {else}
                        <form method="post">
                            <div class="btn btn-primary"><a style="color:white" href="index.php/login" role="button">Login</a></div>
                        </form>
                    {/if}

                </ul>
            </div>
        </nav>
    </div>
</div>
