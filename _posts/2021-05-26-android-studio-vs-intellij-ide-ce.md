---
id: 4676
title: 'Android Studio 4.2.1 vs Intellij IDEA CE 2021.1 on Macbook Air M1'
date: '2021-05-26T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4676'
permalink: /2021/05/26/android-studio-vs-intellij-ide-ce/
image: /wp-content/uploads/2021/05/intellij_vs_android_studio-889x500.png
categories:
    - Android
    - Coding
tags:
    - 'Android Studio'
    - 'android studio vs intellij idea'
    - 'apple silicon'
    - 'apple silicon for development'
    - 'intellij vs android studio'
    - 'm1 for development'
    - 'maacbook m1'
    - 'macbook m1 for development'
---

Boleh dibilang ini adalah lanjutan dari [Set Up MacBook M1 untuk Software Development](https://hangga.github.io/blog/2021/03/03/setup-macbook-m1-2020-for-development/) yang saya posting beberapa waktu lalu.

Singkat cerita setelah 3 bulan menggunakan ***Macbook Air M1 2020*** untuk *coding* khususnya *Android*, akhirnya merasakan beberapa hal yang kurang nyaman, seperti misalnya setelah *coding* lebih dari 5 jam kadang nge*-lag* dan *lag* ini lumayan terasa ketika *switch* dari satu *tab* ke *tab* lainnya atau ketika *edit* *xml file*.

Meskipun hal ini masih jauh lebih cepat dan ringan dibanding menggunakan laptop lama saya yang *Intel i5* dulu, namun rasanya tetap kurang puas dan penasaran tentunya.

#### *Android Studio 4.2.1* Belum Optimal di M1

Ya, memang benar. Setelah *browsing*, baca sana-sini ternyata ***Android Studio 4.2.1*** saat ini yang saya gunakan masih ***based on Intel*** dan berjalan pada [*Rosseta*](https://support.apple.com/en-au/HT211861). Jadi ya memang belum benar-benar berjalan dengan optimal di M1.

[*Rosseta*](https://support.apple.com/en-au/HT211861) ini semacam translator yang berjalan di *background* *service* yang bertugas menerjemahkan aplikasi *based on Intel* agar dapat berjalan pada arsitektur *Apple Silicon*.

![](https://hangga.github.io/blog/wp-content/uploads/2021/05/activity_manager_android-700x465.png)

Bisa dilihat pada *Activity Monitor* bahwa Android Studio masih *based on Intel*. Prosentase *CPU usage*nya juga lebih besar ketimbang *Intellij IDEA* meskipun masih relatif kecil, yaitu dibawah 10%.

#### Alternatif

Nah, berikut ini bisa jadi jalan alternatif yang mungkin dapat menolong anda untuk lebih nyaman *coding* *Android* di *Mac M1*.

#### 1. Pakai *Intellij IDEA – Community Edition*

![](https://hangga.github.io/blog/wp-content/uploads/2021/05/Screen-Shot-2021-06-01-at-09.15.44-700x438.png)  
Tinggalkan *Android Studio 4.2.1* dan ganti pake *Intellij IDEA CE*. Anda boleh coba dan **rasakan sendiri bedanya**. Saya sudah mencobanya menggunakan *Intellij IDEA CE* v ***2021.1.1***, coding dari pagi sampai sore tidak pernah nge*-lag* sama sekali.👍👍👍😊

Namun tentu saja ada kelebihan dan kekurangan menggunakan *Intellij IDEA* *CE,* diantaranya adalah sebagai berikut:

###### (+) Sudah support M1

*Intellij IDEA CE(Community Edition)* ini sudah tersedia versi *Apple Silicon*, bisa dilihat di halaman [*download*](https://www.jetbrains.com/idea/download/#section=mac). Anda dapat melihat pilihan *.dmg file* yang *Intel* atau yang *Apple Silicon*. Tentu saja pilih yang *Apple Silicon* lah.

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-03-at-11.37.54-700x405.png)

###### (+) *CPU usage* lebih kecil

![](https://hangga.github.io/blog/wp-content/uploads/2021/05/activity_manager_intellij-700x465.png)

Terpantau di *Activity Monitor,* bahwa *Intellij IDEA* berjalan pada *Apple Silicon* dengan prosentase *CPU usage* yang lebih kecil ketimbang *Android Studio* *4.2.1* (test coding 3-5 jam). Benar-benar ringan, silahkan coba sendiri.

###### (+) *One IDE for all*

Salah satu keuntungan yang saya rasakan adalah bisa sekalian untuk *coding* pada *project* *Java* lainnya. Karena kebetulan untuk beberapa project, saya menggunakan *Intellij*, jadi malah bisa sekalian beberapa pulau terlampaui dalam sekali dayung.

![](https://hangga.github.io/blog/wp-content/uploads/2021/05/intellij-blur-700x438.png)

###### (-) Setup Android SDK sendiri

Berbeda dengan Android Studio yang sudah bundling dengan *Android SDK*, meskipun sama-sama based on *Intellij*, namun di *Intellij IDEA CE* ini anda harus *setup* sendiri *Android SDK*-nya. Anda bisa baca petunjuknya [disini](https://www.jetbrains.com/help/idea/create-your-first-android-application.html).

#### 2. Menunggu Release *Android Studio Arctic Fox*

Konon ***Android Studio Arctic Fox*** ini bakal *full support* untuk *Apple Silicon,* namun sayangnya saat ini baru tersedia versi *beta-nya*. Namun demikian, anda tetap bisa mencobanya, sekalian ikut *testing* dan *report* kalo ada *bug.*![](https://raw.githubusercontent.com/dsa28s/android-studio-apple-m1/main/screenshot.png)Oke, paling tidak untuk saat ini coding android jadi lebih nyaman dengan *Intellij IDEA CE, s*ambil menunggu *release* versi *stable*-nya [*Android Studio Arctic Fox*](https://android-developers.googleblog.com/2021/05/android-studio-arctic-fox-beta.html) yang sudah ramai dan konon bakal *full support* untuk *Apple Silicon*. Saat ini baru tersedia versi *beta*. Mari kita tunggu kehadirannya.

Selamat mencoba, semoga bermanfaat.

Rujukan:

- <https://medium.com/mobile-app-development-publication/first-view-for-android-development-on-apple-m1-chip-device-e9d3d52b27aa>
- <https://www.jetbrains.com/help/idea/create-your-first-android-application.html>
- <https://support.apple.com/en-au/HT211861>
- <https://android-developers.googleblog.com/2021/05/android-studio-arctic-fox-beta.html>