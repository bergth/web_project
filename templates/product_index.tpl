<!DOCTYPE html>
<html lang="en">

{if isset($view.headjs)}
{include file='headjs.tpl'}
{else}
{include file='head.tpl'}
{/if}

  <body>
  {include file='navbar.tpl'}

        <div id="pageBody">

          <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <h1>Products page</h1>

              {if $view.session != 1}
              <div class="jumbotron-fluid">
                  <h3>You need to be connected to access options </h3>
                  <h5>Click here to <a href="index.php/login">Log in</a></h5>
              </div>
              {/if}

              <div class="table-responsive-md">
              <table id="table_id"  class="table  table-hover table-striped table-bordered dt-responsive nowrap">
                <thead style="background-color: rgb(52, 58, 64);color: rgb(167, 196, 194)">
                  <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Price</th>
                      <th>Description</th>
                      <th>Image</th>
                      <th>Options</th>
                      {if $view.session == 1}
                          <th> </th>
                      {/if}
                  </tr>
                </thead>
                  <tbody>
                  {foreach from=$view.results item=product}
                    <tr>
                        <td>{$product.id}</td>
                        <td>{$product.name}</td>
                        <td>{$product.price}</td>
                        <td>{$product.description}</td>
                        <td>{$product.image}</td>

                        {if $view.session == 1}
                        <td>
                            <a href="{$view.urlbaseaddr}index.php/product/edit/?id={$product.id}">Modify</a>
                        </td>
                        <td>
                            <a href="{$view.urlbaseaddr}index.php/product/delete/?id={$product.id}">Delete</a>
                        </td>

                        {else}
                            <td>none</td>
                        {/if}

                    </tr>
                  </tbody>
                  {/foreach}
              </table>
              </div>
            </div>
            {if $view.session == 1}

            <p style="padding-left: 5%"> <a  href="{$view.urlbaseaddr}index.php/product/add/">Add new product</a></p>
            {/if}

        </div> <!-- END pageBody -->


{if $view.bodyjs == 1}
{include file='bodyjs.tpl'}
{/if}

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    
  </body>
</html>
