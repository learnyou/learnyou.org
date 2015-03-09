% include('head.tpl', title=title)
    
    <article>
    <p>Your document <i>HAS</i> to have metadata</p>
    <p>For .tar and .zip: medias URL like <code>href="/static/img/your_image.(.png|.jpeg|.jpg|.svg|.gif)"</code>, just
    one .md-file per archive</p>

    <form action="/pub" method="post" enctype="multipart/form-data">
    <input name="content" value="Your text" type="file" />
    <input type="submit" value="Post it">
    </form>
    </article>

% include('footer.tpl', title=title, date=date)
