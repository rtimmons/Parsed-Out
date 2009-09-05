---
layout: page
title: Home
---

<div class="posts">
{% for post in site.posts :limit 10 %}
    <div class="post">
        <div class="meta">
            <h2><a href="{{post.url}}">{{post.title}}</a></h2>
            <div class="date">{{post.date | date_to_string }}</div>
        </div>
        <div class="content">
        {{ post.content }}
        </div><!--class=content-->
    </div><!--class=post-->
{% endfor %}
</div><!--class=posts-->

