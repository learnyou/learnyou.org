<!DOCTYPE html>
<html lang="fr">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/style.css" rel="stylesheet">
    <link href="/feed" type="application/atom+xml" rel="alternate" title="Atom feed" />
    <link rel="icon" href="/static/img/favicon.png" />
    % if title == None:
        <title>Learn You</title>
    % else:
        <title>{{title}}</title>
    % end
    <script type="text/javascript" src="/static/smenu.js" async></script>
    </head>
    <body>
    <header>
        <span style="display:none"><h1>La hutte du sage bleu</h1></span>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Learn You Some Algebras!</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
                <li><a href="https://gitlab.com/lysa/pdfs/tree/master">PDFs</a></li>
                <li><a href="/blog">Blog</a></li>
                <li><a href="https://gitlab.com/groups/lysa">Sources</a></li>
                <li><a href="/page/faq.md">FAQ</a></li>
                <li><a href="/page/contributing.md">Contributing</a></li>
            </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    </header>
