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

<h2>Where others are collaborating with me</h2>
<ul>
<li><a href="https://github.com/hojak/awesome-architecture">Awesome Architecture</a> <i>A collection of awesome references regarding Software Architecture.</i></li>
</ul>
