<p>Welcome at Stefan Boos' personal home page.</p>

<h2>Blog Posts</h2>

<dl>
  <dt>
    <a href="pages/blog-your-code-as-a-crimescene.html">Blog Post Series on Your Code as a Crime Scene</a>
  </dt>
  <dd>
    In 2022 I analyzed the software system <a href="https://github.com/HospitalRun/hospitalrun">HospitalRun</a> using practices from <a href="https://pragprog.com/titles/atcrime/your-code-as-a-crime-scene/">Adam Tornhill: Your Code as a Crime Scene</a>. This blog post series describes the major steps in a hopefully reproducible way.
  </dd>
    <dt>
        <a href="2024/11/09/relevante-gedanken-entdecken.html">Relevante Gedanken entdecken</a>
    </dt>
</dl>

<h2>Link Collection</h2>
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
