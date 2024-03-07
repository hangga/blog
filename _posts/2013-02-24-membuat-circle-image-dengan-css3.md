---
id: 153
title: 'Membuat Circle Image dengan CSS3'
date: '2013-02-24T06:04:37+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=153'
permalink: /2013/02/24/membuat-circle-image-dengan-css3/
post_views_count:
    - '222'
image: /wp-content/uploads/2014/11/html5-css3-250x97.jpg
categories:
    - 'Web Design'
tags:
    - css
    - css3
    - 'web design'
---

<style><!--
.circular {  margin:auto;  width: 199px;  height: 199px;  border-radius: 150px;  -webkit-border-radius: 150px;  -moz-border-radius: 150px;  box-shadow: 5px 5px 10px #000000; background: url(http://hangga.github.io/blog/wp-content/uploads/2014/02/101120123227.png) no-repeat; }
--></style></head><body><div class="circular"></div>1\. Langkah pertama, sisipkan style seperti contoh berikut ini :

```
<pre class="brush:css">.circular {  margin:auto;  
width: 199px;  
height: 199px;  
border-radius: 150px;  
-webkit-border-radius: 150px;  
-moz-border-radius: 150px;  
box-shadow: 5px 5px 10px #000000; 
background: url(http://hangga.github.io/blog/wp-content/uploads/2014/02/101120123227.png) no-repeat; }
```

Dalam contoh diatas, saya membuat kelas bernama ***circular***.  
Kemudian, pilih baground Image Anda, misalnya : background: url(http://hangga.github.io/blog/wp-content/uploads/2014/02/101120123227.png.

2\. **Buat area div** dengan nama kelas ***circular*** (sesuai dg nama kelas yg anda buat si style)

```
<pre class="brush:css"><div class="circular"></div>
```