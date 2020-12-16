---
title: Git
layout: default
---
<h1>Git</h1>

<ul>
    {% for menuEntry in site.data.navigation.programming-git %}
      <li>
        <a href="{{ menuEntry.url }}">
          {{ menuEntry.title }}
        </a>
      </li>
    {% endfor %}
</ul>
