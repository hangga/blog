---
id: 1980
title: 'Socket Programming Delphi (Part 1)'
date: '2014-09-05T21:25:37+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1980'
permalink: /2014/09/05/socket-programming-delphi/
post_views_count:
    - '389'
image: /wp-content/uploads/2014/09/network-250x162.jpg
categories:
    - Coding
    - 'Pascal - Delphi'
tags:
    - delphi
    - 'delphi socket'
    - 'socket programming'
    - 'socket programming delphi'
---

*Socket* merupakan mekanisme komunikasi yang memungkinkan terjadinya pertukaran data antar program atau proses antar kommputer. Di *Delphi*, kita dapat mengimplementasikannya dengan komponen ***TServerSocket*** dan ***TClientSocket.*** Jika di Delphi belum ada, maka kita dapat mengimport dari file *dclsockets70.bpl* yang ada di direktori ***..\\Program Files\\Borland\\Delphi7\\Bin\\***

Persiapan, *Install* ***Borland Socket Components***.

1\. Pilih menu *Component -&gt; Install Packages*

![2014-09-06_040711](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_040711.png)

2\. Klik tombol *Add* jika *Borland Socket Components* belum ada.

![2014-09-06_040814](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_040814.png)

3\. Kita bisa mengambil file *dclsockets70.bpl* yang ada di direktori ***..\\Program Files\\Borland\\Delphi7\\Bin\\***

![2014-09-06_041005](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_041005.png)

Nah, sekarang sudah ada *Borland Socket Components.*

![2014-09-06_041040](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_041040.png)

![2014-09-06_041115](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_041115.png)

Jika installasi berhasil, maka komponen *socket* akan berada di tab *Internet* pada *component pallete*.

![2014-09-06_041300](http://hangga.github.io/blog/wp-content/uploads/2014/09/2014-09-06_041300-1024x47.png)

Sekian dulu. Tunggu lanjutannya di Part 2 yah..