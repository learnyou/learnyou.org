% include('head.tpl', title=title)


<div class="container">
    <div class="post">
        <div class="starter-template">
            <h1>{{title}}</h1>
        </div>
        <nav id="posts">
                <ul>
                % for post in content:
                % f = post['file']
                % n = post['title']
                % t = post['date']
                    <li>
                        <time datetime="{{t.isoformat().split('.')[0]}}">{{t.strftime('%d %B %Y')}}</time>
                        <a href="/doc/{{f}}">{{n}}</a>
                    </li>
                % end
                </ul>
        </nav>
    </div>
</div>
% include('footer.tpl', title=None)
