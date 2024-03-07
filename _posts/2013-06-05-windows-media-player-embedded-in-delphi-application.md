---
id: 1614
title: 'Windows Media Player embedded in Delphi Application'
date: '2013-06-05T04:17:32+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1614'
permalink: /2013/06/05/windows-media-player-embedded-in-delphi-application/
post_views_count:
    - '284'
image: /wp-content/uploads/2013/06/image1-250x250.jpg
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
tags:
    - delphi
    - embedded
    - media
    - player
    - windows
    - 'windows media player'
    - 'windows media player embedded'
---

Pernah melihat aplikasi delphi yang di dalam formnya terdapat window media player seperti ini.

![windows-media-player-1](http://hangga.github.io/blog/wp-content/uploads/2013/06/windows-media-player-1.jpg)

Di *Borland Delphi 7*, kita dapat membuat komponen dengan cara meng*import* *ActiveX* *library* milik *Windows*. Seperti pada postingan kali ini saya akan menunjukkan bagaimana membuat komponen *Windows Media Player* yang di *import* dari *ActiveX* milik *Windows*.

1\. Buka menu ***component*** -&gt; ***Import ActiveX*** **Control.**

[![step-1](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-1.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-1.png)

2\. Kemudian pilih ***Windows Media Player \[Version 1.0\].***  Sesuai versi yang terinstal di komputer kita. Klik *install*.

[  ](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-5.png)![step-2](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-2.png)

[![step-4](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-4.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-4.png)

[![step-5](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-5.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-5.png)

[![step-7](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-7.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-7.png)

3\. Sampai sini selesai.

Nah sekarang mari kita testing dengan membuat aplikasi.

1\. Seperti biasa, *File* -&gt; *New* -&gt; *Application.*

[![tes-1](http://hangga.github.io/blog/wp-content/uploads/2013/06/tes-1.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/tes-1.png)  
2\. Pada komponen Palete, Tab ActiveX sudah ada komponen *Windows Media Player.* Klik drag pada form.[![step-8](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-8.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/step-8.png)

[![tes-2](http://hangga.github.io/blog/wp-content/uploads/2013/06/tes-2.png)](http://hangga.github.io/blog/wp-content/uploads/2013/06/tes-2.png)

3\. Nah berhasil, tinggal coba di run..

Sekian, semoga bermanfaat.