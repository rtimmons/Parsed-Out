---
title: Category - Commentary
layout: page
---

Posts in the *commentary* category:

<ol>{% for post in site.categories.commentary %}
    <li><a href="#{{post.id}}">{{post.title}}</a>
        <span class="date">
            {{ post.date | date_to_string }}
        </span>
    </li>
{% endfor %}</ol>

<hr />

<div class="posts">
{% for post in site.categories.commentary %}
    <div class="post">
        <div class="meta">
            <a name="{{post.id}}" />
            <h2><a href="{{post.url}}">{{post.title}}</a></h2>
            <div class="date">{{post.date | date_to_string }}</div>
        </div>
        <div class="content">
        {{ post.content }}
        </div>
    </div>
{% endfor %}
</div>
