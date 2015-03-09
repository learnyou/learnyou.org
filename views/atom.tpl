<?xml version="1.0" encoding="utf-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
 
 <title>Learn You Some Algebras!</title>
 <link href="http://learnyou.org/blog"/>
 <updated>
 % if updated != '':
    {{updated.isoformat().split('.')[0]}}
 % else:
    
 % end
 </updated>
 <id>urn:uuid:1b8836d5-298a-49e2-a032-4acb2044c8d3</id>

% for post in articles:
    <entry>
      <title>{{post['title']}}</title>
      <link href="http://learnyou.org/doc/{{post['file']}}"/>
      <id>{{post['file']}}</id>      
      <published>{{post['date'].isoformat().split('.')[0]}}</published>
      % summary = post['content'][0:200]
      <summary>{{!summary}}</summary>
      <content type="html" xml:lang="{{post['lang']}}">
			<div xmlns="http://www.w3.org/1999/xhtml">
				{{post['content']}}
			</div>
	  </content>
      <author>
		<name>{{post['author']}}</name>
	  </author>
    </entry>
    
% end
 
</feed>
