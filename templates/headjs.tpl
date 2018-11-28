  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="welcome">
    <meta name="author" content="{$view.author}">
    <link rel="icon" href="{$view.favicon}">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <title>{$view.title}</title>
      <script src="/public/js/jquery.min.js"></script>
      <script src="/public/js/bootstrap.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"></script>

    <!-- Core CSS -->
    
{foreach from=$view.css item=script}
    <link href="{$script}" rel="stylesheet">
{/foreach}
    
{foreach from=$view.jshead item=script}
    <script src="{$script}"></script>
{/foreach}
    
{foreach from=$view.jsscriptshead item=script}
    {$script}
    
{/foreach}

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
      <link rel="stylesheet2" href="/public/css/bootstrap.min.css"><!-- changes the top bar -->
      <link rel="stylesheet" href="css/mycustombootstrap.css" />
  </head>