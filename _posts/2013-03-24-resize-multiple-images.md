---
id: 2429
title: 'Resize multiple images'
date: '2013-03-24T13:01:40+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2429'
permalink: /2013/03/24/resize-multiple-images/
post_views_count:
    - '33'
image: /wp-content/uploads/2015/08/illu_reprenez-le-controle-a-l-aide-de-linux1-88x88.png
categories:
    - Linux
    - Uncategorized
tags:
    - Linux
    - 'resize image'
    - 'resize image easy'
    - 'trik linux'
---

Ada cara yg sangat mudah untuk me*resize* semua *image* dalam satu direktori. Setidaknya trik ini pernah memudahkan saya bekerja. Sengaja saya posting siapa tahu dapat berguna bagi nusa dan bangsa. ha3x.

Oh iya, trik ini khusus pengguna *Linux* ya. Kalo window sori ndak tahu 🙂 he3x.

1\. Buka terminal.

2\. Masuk ke direktori yg terdapat *image* yang akan anda *resize*.

Dengan cara seperti dibawah ini juga bisa.

![car_040](http://hangga.github.io/blog/wp-content/uploads/2015/08/car_040-510x277.png)

![Screenshot-Terminal](http://hangga.github.io/blog/wp-content/uploads/2015/08/Screenshot-Terminal-510x359.png)

```
<pre class="brush:plain">mogrify -resize <prosentase>% -format <output extension> *
```

contoh

```
<pre class="brush:plain">mogrify -resize 90% -format png *
```

![Screenshot-Terminal-1](http://hangga.github.io/blog/wp-content/uploads/2015/08/Screenshot-Terminal-1-510x266.png)