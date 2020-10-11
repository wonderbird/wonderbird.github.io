<p>Welcome at Stefan Boos' personal home page.</p>

<h2>Table of Contents</h2>
<ul>
{% for file in site.content_root %}
  <li>
    <a href="{{ file.url }}">
      {{ file.title }}
    </a>
  </li>
{% endfor %}
</ul>
