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


<div class="container">

    <form class="form-signin" method="post">
        <h2 class="form-signin-heading">Please sign in to Retro Games Shop</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div> <!-- /container -->



{if $view.bodyjs == 1}
    {include file='bodyjs.tpl'}
{/if}

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
