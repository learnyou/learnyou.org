% html = post['content']
% title = post['title']
% author = post['author']
% tags = post['tags']
% date = post['date']
% lang = post['lang']
% file = post['file']

% include('head.tpl', title=title)
    <div class="container">
        <article id="content">
        <div class="blog header">
            <p>
                <span style="font-size:60%;color:grey">
                   <time datetime="{{date.isoformat().split('.')[0]}}">{{date.strftime('%d %B %Y')}}</time> &mdash; <a href="/a/{{author}}">{{author}}</a>
                </span>
            </p>
        </div>
        <div class="post">
            {{!html}}
        </div>
        <div id="tags">
            <span style="color:grey">
                % if len(tags) == 1:
                    Tag: 
                % else:
                    Tags:
                % end
                % for t in tags:
                    <span class="label label-info"><a href="/t/{{t}}">{{t}}</a></span>
                % end
            </span>
        </div>
        <span style="color:grey"><p>Publication date: <time datetime="{{date.isoformat().split('.')[0]}}">{{date}}</time></p></span>
        </article>
    </div>
    

% include('footer.tpl', title=title, date=date)
