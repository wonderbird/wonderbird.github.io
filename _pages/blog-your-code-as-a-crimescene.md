---
title: Blog Post Series on Your Code as a Crime Scene
layout: default
---
<h1>Blog Post Series</h1>

<h2>Your Code as a Crime Scene</h2>

<!-- show all posts written in 2022 -->
{% assign posts = site.posts | where: "date", "2022" %}

<ul>
  {% for post in posts %}
    <li>
      {{ post.date | date_to_string}}: <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
