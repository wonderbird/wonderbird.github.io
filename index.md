<p>Welcome at Stefan Boos' personal home page.</p>

<h2>Table of Contents</h2>
<ul>
{% for menuEntry in site.data.navigation.main %}
  <li>
    <a href="{{ menuEntry.url }}">
      {{ menuEntry.title }}
    </a>
  </li>
{% endfor %}
</ul>
