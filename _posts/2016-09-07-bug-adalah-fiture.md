---
id: 2982
title: 'Kiat Bersahabat dengan Bug'
date: '2016-09-07T23:37:23+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2982'
permalink: /2016/09/07/bug-adalah-fiture/
post_views_count:
    - '89'
image: /wp-content/uploads/2016/09/wallpaper-884306.jpg
categories:
    - Coding
    - 'Corat coret'
    - 'Software Development'
tags:
    - 'bersahabat dengan bug'
    - 'bug adalah fiture'
    - 'bug fixing'
    - bugs
    - 'memaafkan bug'
---

*Bug* atau kutu dalam *Software Development* merupakan hal biasa, karena developernya adalah manusia, مَحَلُّ الْخَطَاءِ وَالنِّسْيَانِ a.k.a tempatnya salah(jamak) dan lupaa(jamak). Jadi maklum kalo banyak lupa dan banyak salah. Eeaa..

Namun demikian, bug yang kita anggap biasa tersebut bisa menjadi luar biasa kalau tidak di *manage* dengan baik. Ibarat mati satu tumbuh seribu. Hari ini dic*lose* satu, besoknya ada 10 bug di*reopen*.

Nah, apa saja yang dapat kita lakukan, mari simak poin-poin berikut ini.

### Mengantisipasi *bug*.

Sebenarnya *bug* itu bisa diantisipasi lho. Salah satu usahanya adalah dengan membuat arsitektur yang baik, standarisasi kode sesuai *best practice*, memperhatikan dokumentasi dan *Design Guide* dengan detil dan teliti. Itu semua bisa dilakukan dalam rangka mengantisipasi(lebih tepatnya meminimalisir terjadinya) *bug*.

### Menganalisa penyebab *bug*.

![](https://hangga.github.io/blog/wp-content/uploads/2017/10/1-Eve-Igae-ujQAQO_NDfUdA.gif)

Butuh pengalaman dan jam terbang yg tinggi untuk bisa menganalisa *bug* dengan baik. Dalam hal ini yang biasa dilakukan adalah dengan mengecek *response* dari API, memasang *log* di tempat yg tepat, cek kompatibilitas, mencegat *exception*. Intinya *skill* koding saja belum cukup. Seorang *programmer/developer* haruslah memiliki kemampuan *problem solving* yg baik dalam hal ini.

### Mengklasifikasikan *bug*.

<figure aria-describedby="caption-attachment-2985" class="wp-caption alignnone" id="attachment_2985" style="width: 497px">![src: http://systemsemantics.com/](http://hangga.github.io/blog/wp-content/uploads/2016/09/bug_chart.png)<figcaption class="wp-caption-text" id="caption-attachment-2985">src: http://systemsemantics.com/</figcaption></figure>Ini termasuk salah satu usaha dalam rangka memberantas *bug*. *Bug* dapat dipilah-pilah dan dikelompokkan berdasarkan jenisnya, *reproduce*nya, penyebabnya atau fitur tempat munculnya *bug*. Hal ini perlu dilakukan agar kita dapat membuat **skala proritas**, *bug-bug* mana dulu yang akan dikerjakan berdasarkan *effort*nya.

### Memprioritaskan *bug*.

Entah mengapa saya lebih suka **mengerjakan mulai dari yg gampang-gampang dulu** **baru kemudian yg susah-susah**. Karena yg gampang itu pasti cepat selesai dikerjakan, sehingga jika pait-paite hampir *due date* dan *bug* belum habis, itu ya tinggal sisa yg susah-susah. Jadi ketika PM tanya kok belum selesai jawabnya gampang, “sulit bos, he3x”. Jangan terlalu *taqlid* pada pepatah bersusah-susah dahulu bersenang-senang kemudian.

> Jangan terlalu *taqlid* pada pepatah bersusah-susah dahulu bersenang-senang kemudian

Jangan malah kebalik, karena *bug* yang sulit itu biasanya memakan waktu, harus *googling* sana-sini, *nyetek overflow*, tau-tau ketika hampir due date jebul masih banyak bug yg belum di *fix,* dyarrr.

Kecuaaliii… jika ada yg *critical* atau *major* dan *nyolok* mata tentu saja **harus diprioritaskan** karena harus segera *release*.

<figure aria-describedby="caption-attachment-2986" class="wp-caption alignnone" id="attachment_2986" style="width: 510px">![src: https://airbrake.io](https://hangga.github.io/blog/wp-content/uploads/2016/09/fumigating_-510x361.jpg)<figcaption class="wp-caption-text" id="caption-attachment-2986">src: https://airbrake.io</figcaption></figure>### Jangan pernah meremehkan bug.

Bagaimanapun juga *bug* adalah *bug*(lho piye to ki). Karena *bug* yang mungkin terlihat remeh dimata developer bisa jadi adalah masalah besar di mata user.

<figure aria-describedby="caption-attachment-4436" class="wp-caption alignnone" id="attachment_4436" style="width: 700px">![](https://hangga.github.io/blog/wp-content/uploads/2016/09/2965699584.jpeg)<figcaption class="wp-caption-text" id="caption-attachment-4436">Source: https://www.pikiran-rakyat.com/internasional/pr-01599079/seperti-mimpi-buruk-jadi-nyata-inilah-sosok-kecoa-laut-terbesar-di-dunia</figcaption></figure>Kadang saya dapat laporan *major bug* dari QA atau dari user, tapi ternyata penyebabnya hanya karena salah *config* atau kesalahan sepele lainnya yang tentunya hanya butuh *effort* kecil.

<figure class="wp-caption alignnone" style="width: 750px">![](https://asset.kompas.com/crops/GDahdsQCluvSMy1_CKtmF-ndMcI=/0x66:1000x732/750x500/data/photo/2020/04/17/5e991fadd3363.jpg)<figcaption class="wp-caption-text">Source: https://asset.kompas.com/crops/GDahdsQCluvSMy1\_CKtmF-ndMcI=/0x66:1000×732/750×500/data/photo/2020/04/17/5e991fadd3363.jpg</figcaption></figure>Namun bisa juga sebaliknya, ada juga bug yang mungkin dianggap sepele oleh user, semisal bug tampilan. Namun ternyata, untuk nge-*fix* *bug* tersebut membutuhkan effort yang besar, bahkan harus migrasi *library*. Wkwkwk.

<figure aria-describedby="caption-attachment-4435" class="wp-caption alignnone" id="attachment_4435" style="width: 700px">![](https://hangga.github.io/blog/wp-content/uploads/2016/09/alien_bug_monster_by_deepcore1_d3hoezb-fullview-700x526.jpeg)<figcaption class="wp-caption-text" id="caption-attachment-4435">Source: https://www.deviantart.com/deepcore1/art/Alien-bug-monster-211091159</figcaption></figure>### Memafkan *bug*.

![kecoak-minta-maaf](http://hangga.github.io/blog/wp-content/uploads/2016/09/kecoak-minta-maaf.png)

Diantara *bug-bug* yg ada pastilah ada yg tidak terlalu mencolok, sifatnya *minor*, prosentase kejadiannya kecil. Akhirnya dilabeli *FNR(Fixes Next Release)*, sementara dipending lama-lama jadi *semenTahun* ha3x.

### Bersahabat dengan *bug*.

Yah begitulah kira-kira, karena sesungguhnya kesempurnaan hanyalah milik **Allah ta’ala** sehingga sudah sewajarnya apabila segala yg ada pada diri makhluk**Nya** penuh dengan kekurangan dan kelemahan. *\*Duh, melenceng adoh*.

Pada akhirnya, marilah kita mencoba bersahabat dengan *bug*, karena dalam setiap fitur itu terdapat bug, sehingga bug adalah bagian dari fitur dengan kata lain ***bug* adalah fitur** *ha3x.* \*menghibur diri.