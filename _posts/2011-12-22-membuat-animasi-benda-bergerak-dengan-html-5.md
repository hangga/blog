---
id: 981
title: 'Membuat animasi benda bergerak dengan HTML 5'
date: '2011-12-22T04:16:35+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=981'
permalink: /2011/12/22/membuat-animasi-benda-bergerak-dengan-html-5/
post_views_count:
    - '382'
image: /wp-content/uploads/2014/11/html5-css3-250x97.jpg
categories:
    - Coding
    - 'Dunia IT'
    - 'HTML 5'
    - 'JavaScript - Jquery'
    - Uncategorized
    - 'Web Design'
tags:
    - animasi
    - 'html 5'
    - html5
---

![](http://hangga.github.io/blog/wp-content/uploads/2011/12/2011-12-22_112633-300x226.png "2011-12-22_112633")

Di HTML 5 terdapat beberapa komponen baru salah satunya yang saya suka adalah *canvas.* Di canvas ini kita dapat melakukan *draw(*menggambar*).*

Nah pada postingan kali ini saya akan tunjukkan bagaimana membuat animasi benda bergerak dengan HTML 5. Sebenarnya bukan benda bergerak, melainkan proses *draw* yang diulang-ulang di atas *canvas*. Ok mari kita menuju TKP.

Buat file **skrip-ku.js** dan **index.html**

Berikut ini isi file **index.html**

```


&lt;script type="text/javascript" src="skrip-ku.js"&gt;&lt;/script&gt;

&lt;canvas id="kanvasku" width="400" height="300" style="border: 1px solid #000000; background: #000;"&gt;
&lt;/canvas&gt;

```

Coba kita lihat, bagaimana di HTML 5 kita bisa membuat canvas.

```

&lt;canvas id="kanvasku" width="400" height="300" style="border: 1px solid #000000; background: #000;"&gt;
&lt;/canvas&gt;
```

Mari kita lihat isi *file* skrip-ku.js

```

var mykontek;
var x = 1; step = 1;
var lebar = 400;
var tinggi = 300;

function init(){
mykontek = document.getElementById("kanvasku").getContext('2d');
gerak()
}

function gerak(){
mykontek.beginPath();
mykontek.clearRect(0,0, lebar, tinggi); /* membersihkan area kanvas */
mykontek.arc(x, 100, 20, 0, Math.PI*2, false); /* membuat/ menggambar obyek lingkaran dg diameter 20 pixel */
mykontek.fillStyle = "#fff"; /* menentukan warna */
mykontek.fill(); /* mewarnai contect */

x = x + step; /* nilai x selalu bertambah sehingga posisi benda(x, 100) berubah */

if(x &gt;= lebar || x &lt;= 1) { /* jika x mencapai lebar kanvas, maka gerak benda berubah arah -step */
step = -step;
}

setTimeout('gerak()', 5); /* setTimeout('namafungsi()', interval);*/
```

Lihat demonya [disini](http://hangga.github.io/blog/demo/benda-bergerak.html)