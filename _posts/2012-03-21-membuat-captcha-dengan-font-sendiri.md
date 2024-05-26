---
id: 1095
title: 'Membuat Captcha dengan font sendiri.'
date: '2012-03-21T06:45:22+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1095'
permalink: /2012/03/21/membuat-captcha-dengan-font-sendiri/
post_views_count:
    - '367'
image: /wp-content/uploads/2012/03/application_feature-250x112.jpg
categories:
    - Coding
    - 'Dunia IT'
    - PHP
tags:
    - Captcha
    - 'Membuat Captcha'
    - 'Membuat Captcha dengan font sendiri.'
---

[![](http://hangga.github.io/blog/wp-content/uploads/2012/03/Untitled-1.jpg "Untitled-1")](http://hangga.github.io/blog/wp-content/uploads/2012/03/Untitled-1.jpg)Teman2 tahu *Captcha* kan.. yup gambar yang di create dari sebuah teks secara random yang bertujuan untuk melindungi form php kita dari aksi *flooding.* Di php kita dapat membuat teks menjadi gambar dengan fungsi

```
imagestring( resource $image , int $font , int $x, int $y, string $string, int $color);
```

Tetapi sayangnya kita tidak dapat merubah ukuran font nya. Untuk dapat men-*custom* fontnya, kita harus meload font sendiri, yup pake fungsi

```
int imageloadfont( string $file)
```

Akan tetapi sy sudah mencoba berbagai cara, *browsing* sana-sini dan hasilnya masih belum memuaskan.

Akhirnya pada suatu ketika malah nemuin thread bagus di kaskus <http://www.kaskus.us/showthread.php?t=13180161>. Intinya, font yg akan kita load harus dengan format file \*.gdf. Nah untuk merubah format font *\*.ttf* ke *\*.gdf* pake program [ini ni](http://www.wedwick.com/wftopf.exe)

Setelah itu barulah mari kita beraksi

```
$font = imageloadfont('./fontku.gdf');
```

Akhirnya *captcha*ku jadi juga

[![](http://hangga.github.io/blog/wp-content/uploads/2012/03/2012-03-21_135727.png "2012-03-21_135727")](http://hangga.github.io/blog/wp-content/uploads/2012/03/2012-03-21_135727.png)