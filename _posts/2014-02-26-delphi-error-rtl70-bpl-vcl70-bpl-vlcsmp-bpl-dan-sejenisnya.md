---
id: 1660
title: 'Delphi : Error rtl70.bpl, vcl70.bpl, vlcSmp.bpl dan sejenisnya.'
date: '2014-02-26T01:49:39+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1660'
permalink: /2014/02/26/delphi-error-rtl70-bpl-vcl70-bpl-vlcsmp-bpl-dan-sejenisnya/
post_views_count:
    - '272'
categories:
    - Coding
    - 'Pascal - Delphi'
tags:
    - delphi
    - 'error rtl70.bpl'
    - 'error vcl70.bpl'
    - 'error vclSmp70.bpl'
---

[![2014-02-26_045907](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-26_045907.png)](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-26_045907.png)

Ini adalah kasus yg saya temui beberapa waktu lalu. *Error* missing *VclSmp.bpl* ketika aplikasi dijalankan di komputer klien. Padahal ketika di *run* lewat IDE, tidak ada masalah.

**Penyebab**

Setelah browsing sana-sini ternyata penyebabnya adalah karena ada beberapa *runtime package* berupa (\*.bpl) yg tidak ikut ter*build* kedalam *exe* nya sehingga aplikasi yg kita buat tidak dapat dijalankan di kompuer lain.

Sebenarnya secara default, Delphi sudah menyetel konfigurasi agar semua *runtime package* yg dibutuhkan di*include* dalam *\*.EXE* yg kita *compile*.

Silahkan menuju *IDE Delphi,* lalu buka menu ***Project*** -&gt; ***Option..***

[![2014-02-25_162633](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-25_162633.png)](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-25_162633.png)

[![2014-02-25_162235](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-25_162235.png)](http://hangga.github.io/blog/wp-content/uploads/2014/02/2014-02-25_162235.png)

Kemudian anda bisa pilih setelan pada checkbox Build with runtime packages. Ternyata sepele bukan?

Referensi

http://programmersheaven.com/discussion/225895/rtl70-bpl-error-when-executable-run-on-different-machine

http://www.diskusiweb.com/discussion/16240/biar-exe-project-kecil/p1