---
layout: page
title: Home
---

<div class="posts">
{% for post in paginator.posts %}
    <div class="post">
        <div class="meta">
            <h2><a href="{{post.url}}">{{post.title}}</a></h2>
            <div class="date">{{post.date | date_to_string }}</div>
        </div>
        <div class="content">
        {{ post.content }}
        </div>
    </div>
{% endfor %}
</div>

<div id="pagination">
    <ul>
        {%if paginator.page > 1 %}
        <li class="back">
            {% if paginator.previous_page == 1 %}
                <a href="/">
                    &larr; 1
                </a>
            {% else %}
                <a href="/page{{paginator.previous_page}}">
                    &larr; {{paginator.previous_page}}
                </a>
            {% endif %}
        </li>
        {% endif %}
        {% if paginator.page < paginator.total_pages %}
        <li class="forward">
            <a href="/page{{paginator.next_page}}">
                {{ paginator.next_page }} &rarr;
            </a>
        </li>
        {% endif %}
        <li>
            Page {{ paginator.page }} of {{ paginator.total_pages }}
        </li>
    </ul>
</div>

