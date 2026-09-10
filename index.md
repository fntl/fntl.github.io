---
title: Home
---

# Home

This is the homepage of a hand-built Jekyll theme. Every Markdown file gets the
`default` layout automatically; posts additionally get the `post` layout with a
table of contents. All styling is one stylesheet (`assets/css/style.css`) that
only controls responsive layout and vintage typography — content elements keep
their default browser HTML styling.

## Posts

<ul>
  {% for post in site.posts %}
  <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> — <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: '%B %-d, %Y' }}</time></li>
  {% endfor %}
</ul>
