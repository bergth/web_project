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






{if $view.bodyjs == 1}
    {include file='bodyjs.tpl'}
{/if}

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>
