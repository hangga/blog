---
id: 2094
title: 'Featured Image tidak support pada theme Anda'
date: '2014-11-11T09:53:17+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2094'
permalink: /2014/11/11/featured-image-tidak-support-pada-theme-anda/
post_views_count:
    - '924'
image: /wp-content/uploads/2014/11/blogging.jpg
categories:
    - Blogging
    - 'Dunia IT'
tags:
    - blogging
    - 'Featured Image'
    - 'featured image wordpress'
---

Anda merasa pernah menginstal plugin ***Featured Image***, tapi setelah ganti *theme* tiba-tiba waktu mau posting artikel menu *Featured Image,* tidak muncul.

## Solusinya…

Anda perlu menambahkan *script* di bawah ini ke dalam *functions.php* pada *theme* Anda.

```
<pre class="brush:php">add_theme_support( 'post-thumbnails' );
```

Buka Menu ***Apperance*** -&gt; ***Editor*** -&gt; *functions.php*

![Screenshot-1](http://hangga.github.io/blog/wp-content/uploads/2014/11/Screenshot-1.png)

Lalu tambahkan script diatas.  
Selesai.