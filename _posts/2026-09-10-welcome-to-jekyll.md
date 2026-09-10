---
title: "Welcome to Jekyll!"
date: 2026-09-10 10:00:00 +0000
categories: meta
toc: true
---

This is your first post. Delete it or edit it once you know how Jekyll works.

Blog posts live in `_posts/` and are named `YYYY-MM-DD-title.md`. The front
matter (the `title`, `date`, `categories`, etc. block at the top) tells Jekyll
how to render them. Everything below is plain Markdown.

## How posts work

Add `toc: true` to a post's front matter to show an automatic table of contents
built from its headings. Leave it off (or set it to `false`) to hide it.

## Styling

There is no theme gem. A single stylesheet at `assets/css/style.css` controls
responsive layout and typography; content elements use default HTML styles.

### Headings get ids automatically

Every `h2`, `h3`, and `h4` gets an id slug, which is what the table of contents
links to.

### Everything else is default

Paragraphs, lists, links, code, and blockquotes are rendered by the browser's
plain HTML defaults. Vintage, by design.
