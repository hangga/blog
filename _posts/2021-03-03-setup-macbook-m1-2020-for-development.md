---
id: 4473
title: 'Set Up MacBook M1 untuk Software Development'
date: '2021-03-03T04:44:12+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4473'
permalink: /2021/03/03/setup-macbook-m1-2020-for-development/
image: /wp-content/uploads/2021/03/MacBook-M1-series-1-1000x500.jpg
categories:
    - Coding
    - 'Corat coret'
tags:
    - 'apple silicon'
    - 'macbook air'
    - 'macbook air 2020'
    - 'macbook air 2020 m1'
    - 'macbook m1'
    - 'macbook m1 developer'
    - 'macbook m1 for developer'
---

Untuk pertamakalinya *Apple* membuat *processor* sendiri, setelah sebelumnya setia menggunakan *Intel*. Processor M1 ini berbasis ARM dan pada tahun 2020 dirilis untuk *MacBook Air (M1, 2020), Mac mini (M1, 2020),* dan *MacBook Pro (13 inci, M1, 2020)*.

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/M1-product-card-700x394.jpg)

*Apple M1* konon memiliki performa yang jauh lebih baik ketimbang prosesor Intel. Bahkan ketika dibandingkan dengan **Intel Core i7** pun masih jauh. Anda bisa melihatnya disini <https://www.notebookcheck.net/Apple-M1-vs-Intel-i7-Cherry-picked-benchmarks-and-shifting-Tiger-Lake-SKUs-leave-Intel-looking-revolutionary-rather-than-evolutionary.519176.0.html>

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/csm_Productivity_performance_5_2bb26b4cde-700x395.jpg)

Ingin tahu lebih banyak tentang *Apple Silicon M1*? Jangan tanya saya 😁, baca sendiri disini 👉🏼 <https://www.apple.com/mac/m1/> atau disini <https://carisinyal.com/kelebihan-dan-kekurangan-apple-macbook-air-m1/>

### Sempat Ragu

Dan *walhamdulillah ‘ala ni’matillah* saya pun diberi kesempatan untuk menjajalnya setelah kemarin dibeliin ***MacBook Air M1 2020*** sama mas Bos saya yang baik hati 😊.

Awalnya sih sempat ragu dengan *Macbook Air M1* ini karena sejak dulu saya penggemar berat *Lenovo*. Dan terakhir sangat naksir banget sama **Levovo Carbon X1 gen 8** dengan prosesor **Intel Core i7**nya. Tapi sayang, harganya kok mahal banget yah 😆. Namun setelah baca-baca, sana-sini, diskusi sama mas bos saya, akhirnya mantab untuk memilih M1. Insya Allah paling worth it.👍

### Setup-setup

Kesan pertama begitu mempesona hahaha 😆. Kemudian lanjut setup-setup sesuai kebutuhan. Karena pada saat postingan ini di posting, ada beberapa tools/aplikasi yang belum support Apple M1, sehingga perlu sedikit trik konfig.

##### 1. Install Git

Installasi Git insya Allah tidak menemukan kendala pada Apple M1. Tinggal buka terminal kemudian ketik *command* berikut

```
git --version
```

Nanti akan muncul *promt dialog*, kemudian tinggal ikuti saja insyaAllah lancar jaya.  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/git-osx-installer-700x508.png)  
Sesuai petunjuk. <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>

##### 2. Install Rest API Client

Selanjutnya adalah install Rest API Client untuk keperluan testing api. Silahkan pilih *PostMan* atau *Insomnia*. Tapi kalo saya pilih *Insomnia*.  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/insomnia-core-700x382.png)  
Bagi yang sehati silahkan donwload disini <https://insomnia.rest/download/>. Insya Allah *support* dan berjalan lancar di M1.

##### 3. Install XCode

Nah, ini dia. *XCode* adalah IDE untuk men-develop aplikasi di platform *iOS* dan *Mac*. Terus terang sudah seajak lama pengen nyoba belajar iOS. Tak kurang upaya, hanya terkendala oleh **daya** dan **dana** 😝. Nah, kini sudah saatnya. Dah pokoknya install dulu ajah.😆

> Tak kurang upaya, hanya terkendala oleh **daya** dan **dana 😝**

##### 4. Intellij IDEA

Programmer Java pasti tak asing, dan ini adalah IDE kesayangan saya. *Alhamdulillah* pada versi terbaru Intellij IDEA(CE) **2020.3.2** juga sudah *support Apple Silicon M1.*  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-03-at-11.37.54-700x405.png)  
Kemudian tinggal *download* ajah. <https://www.jetbrains.com/idea/download/#section=mac>

##### 5. Update Sqlite JDBC 3.34.0 keatas

Nah, masalah kecil mulai terjadi. Kebetulan ada salah satu *project* yang saya kerjakan menggunakan *sqlite 3.30.x* ketika di *run* terjadi *error* berikut ini.

```
Exception in thread "main" java.sql.SQLException: 
[SQLITE_NOTADB] File opened that is not a database file (file is 
encrypted or is not a database)
at org.sqlite.DB.newSQLException(DB.java:383)
at org.sqlite.DB.newSQLException(DB.java:387)
at org.sqlite.DB.throwex(DB.java:374)
at org.sqlite.NestedDB.prepare(NestedDB.java:134)
at org.sqlite.DB.prepare(DB.java:123)
at org.sqlite.Stmt.executeQuery(Stmt.java:121)
at foo.Test.main(Test.java:16)
```

Setelah baca-baca, ternyata release SQLite yang support untuk Apple M1 adalah mulai versi 3.34.0 keatas. Sehingga solusinya adalah dengan meng*update* ke versi ***3.34.0 keatas*** yang insya Allah sudah *support* *Apple Silicon M1* <https://www.sqlite.org/changes.html.>

Stepnya gampang sih. Seperti add library jar biasa.  
*File -&gt; Project Structure -&gt; Modules*. Tambahkan *sqlite-jdbc-3.34.0.jar*, dan *remove* *sqlite* versi sebelumnya.  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-03-at-16.11.50-700x479.png)

**Uji Coba**

Tiba saatnya untuk uji coba menjalankan/ compile source code Java di mac. Bismillah..

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-01-at-17.37.57-700x438.png)  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-01-at-17.36.56-700x438.png)  
Alhamdulillah, berjalan lancar. Namun karena baru pertamakali *run* aplikasi *Java* di *Mac* sepertinya perlu improvement. Ha3x..

> write once, debug anywhere

##### 6. Android Studio + Emulator

Berikutnya adalah senjata andalan nomor 2 saya. Android Studio. Langsung meluncur ke halaman download, kemudian download file .dmg-nya. Installasi lancar, tak ada kendala. Kemudian ketika dijalankan, untuk sementara ini Android Studio punya saya(versi 4.1.2) berjalan lancar di *Mac M1* karena berjalan pada *translate* *Rosetta 2* yang yang *konon* katanya lebih baik dari pada *Mac Intel*.

**Build Test.**

Sayapun penasaran dengan kecepatan build gradlenya. Langsung checkout project yang sebelumnya saya kerjakan di Lenovo E440, lalu build.

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/IMG_20210302_175121-700x363.jpg)

Project ini jika di build di laptop lama saya *(Lenovo Thinkpad e440, i5 16 Gb Ram, 500 GB HDD SATA),* bisa memakan waktu **4 – 6 menit**. Namun **di M1 cukup sekitar 7 detik saja**. Sedangkan build signed apk sekitar 22 detik saja. *Walhamdulillah ‘ala ni’matillah.*

Untuk membuktikan lebih jauh, mungkin anda bisa nonton video berikut ini.

<iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="203" loading="lazy" src="https://www.youtube.com/embed/VcN1RbFHtII?feature=oembed" title="M1 Macbook Air for Android Studio [Build Test] & AVD" width="360"></iframe>

Namun ketika menjalankan emulator akan terjadi stuck loading, dan juga tidak bisa membuka AVD manager.  
![](https://hangga.github.io/blog/wp-content/uploads/2021/03/1AS9AYZsxfFmnjIBfSt0faQ-300x128.png)  
Sebenarnya google sudah merelease android emulator untuk M1 ini, namun belum *include* pada Android-SDK karena masih versi beta. Namun anda tetap bisa menggunakannya.  
Android Emulator M1 Preview dapat anda *download* disini <https://androidstudio.googleblog.com/2020/12/android-emulator-apple-silicon-preview.html> dan ikuti petunjuknya.  
Insya Allah lancar kalo berhasil. ha3x..

**Test Android Emulator M1 Preview**

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-01-at-17.22.30-700x438.png)

Sayangnya *Emulator M1 Preview* ini memakan memori yang cukup besar. Hampir mendekati 4 GB. Bahkan lebih besar dari IDE Android Studio sendiri yang hanya sekitar 3,6-an GB. Sehingga sangat disarankan untuk *run on device*. Saya sendiri juga merasa lebih nyaman *run on device*.

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-04-07-at-15.05.40-700x468.png)

##### 7. Install FileZilla

Oh ya, satu lagi. Sebagai seorang *Full Snack* *Developer* 🍔🍟 😁, kadang mendadak jadi *backend abal-abal* juga. Kalo *real Backend Dev* mungkin mainannya *kubernetes* atau *docker.* Nah, saya cukup ***FileZilla*** ini saja andalan saya 😁.  
Oh ya, jangan *install* lewat *AppStore* ya, karena disana hanya tersedia ***FileZilla Pro***. Silahkan *dowload* disini untuk yang *free* <https://filezilla-project.org/download.php?type=client>

**Test, Run..**

![](https://hangga.github.io/blog/wp-content/uploads/2021/03/Screen-Shot-2021-03-03-at-11.56.48-700x438.png)  
Nah, begitulah. Untuk sementara aman dan sudah memenuhi kebutuhan untuk mencari nafkah. Nanti selanjutnya bisa sambung lagi. Selamat mencoba.