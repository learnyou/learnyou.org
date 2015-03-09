% include('head.tpl', title="Blog")

<div class="container">
    <div class="post">
        <div class="starter-template">
            <h1>Blog</h1>
            <p class="lead">Learn You Some Algebras!</p>
        </div>
        <nav>
            <ul>
            % for post in content:
            % t = post['date']
            % f = post['file']
            % a = post['author']
            % n = post['title']
                <li>
                    <time datetime="{{t.isoformat().split('.')[0]}}">{{t.strftime('%m-%d-%Y')}}</time>
                    <a href="/doc/{{f}}">{{n}}</a>
                    <span style="font-size:70%"><i> &mdash; <a href="/a/{{a}}">{{a}}</a></i></span>
                </li>
            % end
            </ul>
        </nav>
    </div>
</div>
% include('footer.tpl', title=title)
