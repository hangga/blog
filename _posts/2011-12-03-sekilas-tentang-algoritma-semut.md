---
id: 772
title: 'Sekilas tentang Algoritma Semut'
date: '2011-12-03T14:40:21+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=772'
permalink: /2011/12/03/sekilas-tentang-algoritma-semut/
post_views_count:
    - '158'
categories:
    - 'Dunia IT'
    - Islam
    - Sains
    - Uncategorized
tags:
    - algoritma
    - 'algoritma semut'
    - semut
---

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/antColonyOptimization_small.png "antColonyOptimization_small")](http://hangga.github.io/blog/wp-content/uploads/2011/12/antColonyOptimization_small.png)Pada dunia nyata, semut berkeliling secara acak, dan ketika menemukan makanan mereka kembali ke koloninya sambil memberikan tanda dengan jejak [feromon](http://id.wikipedia.org/wiki/Feromon "Feromon"). Jika semut-semut lain menemukan jalur tersebut, mereka tidak akan bepergian dengan acak lagi, melainkan akan mengikuti jejak tersebut, kembali dan menguatkannya jika pada akhirnya merekapun menemukan makanan.

Seiring waktu, bagaimanapun juga jejak feromon akan menguap dan akan mengurangi kekuatan daya tariknya. Lebih lama seekor semut pulang pergi melalui jalur tersebut, lebih lama jugalah feromon menguap. Sebagai perbandingan, sebuah jalur yang pendek akan berbaris lebih cepat, dan dengan demikian kerapatan feromon akan tetap tinggi karena terletak pada jalur secepat penguapannya. Penguapan feromon juga mempunyai keuntungan untuk mencegah konvergensi pada penyelesaian optimal secara lokal. Jika tidak ada penguapan sama sekali, jalur yang dipilih semut pertama akan cenderung menarik secara berlebihan terhadap semut-semut yang mengikutinya. Pada kasus yang demikian, eksplorasi ruang penyelesaian akan terbatasi.

Oleh karena itu, ketika seekor semut menemukan jalur yang bagus (jalur yang pendek) dari koloni ke sumber makanan, semut lainnya akan mengikuti jalur tersebut, dan akhirnya semua semut akan mengikuti sebuah jalur tunggal. Ide algoritma koloni semut adalah untuk meniru perilaku ini melalui ‘semut tiruan’ berjalan seputar grafik yang menunjukkan masalah yang harus diselesaikan.

Algoritma optimisasi koloni semut telah digunakan untuk menghasilkan penyelesaian yang mendekati optimal pada masalah salesman yang melakukan perjalanan. Algoritma semut lebih menguntungkan daripada pendekatan penguatan tiruan (simulaten annealing) dan [algoritma genetik](http://id.wikipedia.org/wiki/Algoritma_Genetik "Algoritma Genetik") saat grafik mungkin berubah secara dinamis; algoritma koloni semut [![](http://hangga.github.io/blog/wp-content/uploads/2011/12/a1.png "a1")](http://hangga.github.io/blog/wp-content/uploads/2011/12/a1.png)dapat berjalan secara kontinyu dan menyesuaikan dengan perubahan secara [waktu nyata](http://id.wikipedia.org/wiki/Waktu_nyata "Waktu nyata") *(real time)*. Hal ini menarik dalam *routing* jaringan dan sistem transportasi urban.

**Algoritma semut** diperkenalkan oleh [Moyson](http://id.wikipedia.org/w/index.php?title=Moyson&action=edit&redlink=1 "Moyson (halaman belum tersedia)") dan [Manderick](http://id.wikipedia.org/w/index.php?title=Manderick&action=edit&redlink=1 "Manderick (halaman belum tersedia)") dan secara meluas dikembangkan oleh [Marco Dorigo](http://id.wikipedia.org/w/index.php?title=Marco_Dorigo&action=edit&redlink=1 "Marco Dorigo (halaman belum tersedia)"), merupakan teknik probabilistik untuk menyelesaikan masalah komputasi dengan menemukan jalur terbaik melalui grafik. [Algoritma](http://id.wikipedia.org/wiki/Algoritma "Algoritma") ini terinspirasi oleh perilaku [semut](http://id.wikipedia.org/wiki/Semut "Semut") dalam menemukan jalur dari koloninya menuju makanan.

sumber : [http://id.wikipedia.org/wiki/Algoritma\_semut](http://id.wikipedia.org/wiki/Algoritma_semut)

Uraian diatas membuat kita semakin kagum. Bukan kepada semut, tetapi kepada yang menciptakan semut. Allah ta’ala sang maha pencipta.