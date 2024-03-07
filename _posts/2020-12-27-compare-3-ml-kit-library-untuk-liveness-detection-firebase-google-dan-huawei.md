---
id: 4262
title: 'Membandingkan 3 Library ML Kit untuk Liveness Detection : Firebase, Google dan Huawei'
date: '2020-12-27T05:38:18+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4262'
permalink: /2020/12/27/compare-3-ml-kit-library-untuk-liveness-detection-firebase-google-dan-huawei/
image: /wp-content/uploads/2020/12/ml-illustration.png
categories:
    - Coding
    - 'Software Development'
tags:
    - ai
    - 'artificial intelligence'
    - firebase
    - 'firebase ml kit'
    - 'google ml kit'
    - google+
    - huawei
    - 'huawei ml kit'
    - 'machine learning'
    - ml
    - 'ml kit'
---

*ML(Machine Learning)* adalah salah satu cabang dari *AI(Artificial Intellegence =* kecerdasan buatan). Sesuai namanya, *machine* = mesin, *learning =* belajar/pembelajaran, sehingga boleh dikatakan *ML(Machine Learning)* adalah sebuah rekayasa teknologi yang memungkinkan mesin bisa belajar layaknya manusia.

Akhir-akhir ini *ML(Machine Learning)* nge-*trend* karena memang terbukti manfaatnya untuk kehidupan manusia seperti bidang kedokteran, bisnis dan lain-lain. Tak ketinggalan perusahaan-perusahaan raksasa seperti *Google* dan *Huawei* pun berlomba-lomba mengembangkan teknologi ini.

> Tulisan ini membantu anda untuk memilih sesuai dengan kebutuhan dan budget Anda

Nah, pada postingan kali ini saya mencoba membandingkan 3 vendor penyedia *API* *Machine Learning Kit* untuk kebutuhan ***Liveness Detection****,* yang intinya adalah membedakan mana *Live Face*, mana *Spoofing Face* sehingga diharapkan dapat mencegah aksi penipuan atau kecurangan dalam transaksi online.

Proses Liveness Detection pada umumnya adalah dengan perhitungan total score *smilling probability*, kedipan mata, gerak kepala, rotasi kepala dan lain-lain tergantung kebutuhan. Adapun contoh implementasi *Liveness Detection* dapat kita jumpai pada verifikasi ojol, lamaran kerja online, verifikasi akun *payment* dan lain sebagainya.

<iframe allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" frameborder="0" height="473" loading="lazy" src="https://www.youtube.com/embed/FWrb-Hz5pxg?feature=oembed" title="Prototyping Liveness Detection with ML" width="840"></iframe>

Ketiga API tersebut adalah ***ML Kit for Firebase***, ***Google ML Kit*** dan ***Huawei ML Kit***. Semua bagus, namun masing-masing memiliki kelebihan dan kekurangan. Tulisan ini mungkin dapat membantu anda untuk memilih sesuai dengan kebutuhan dan budget Anda.

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/ml-kit-700x394.png)

## 1. Firebase: [ML Kit for Firebase](https://firebase.google.com/docs/ml-kit)

***Firebase*** merupakan salah satu layanan *cloud service* yang dikembangkan oleh ***Mbah Google***. ***Firebase ML Kit*** yang tersedia saat ini adalah *beta version* atau boleh dikatakan masih dalam rangka project uji coba, sehingga jangan heran jika masih banyak fungsi yang belum lengkap.

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/beta.jpg)

*Library* ini bersifat ***on device delivered***, artinya semua komputasi/ML dilakukan secara *standalone*, namun data model yg dibutuhkan akan di*download* saat pertama kali *install app.* Keuntungan model *on device delivered* ini adalah tidak menyebabkan ukuran apk membengkak.

Namun kekurangan dari layanan *Firebase* pada umumnya adalah proses integrasi yang lumayan panjang dan *ribet*. Berikut sekilas *step-by-step* nya.

1. Create ***SignConfig***.
2. Build ***Signed Apk***.
3. Generete ***SHA-1*** from ***Signed Apk***.
4. Create Project in Firebase Console..
5. Add ***SHA-1*** on *Firebase project*.
6. Download file ***services.json***(berisi api key, package id dan data credential lainya).
7. Put ***services.json*** to ***app*** directory.
8. Add package dependency on gradle.
9. Build sync gradle.

Nah, lumayan panjang dan ribet bukan?

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/mlkit-logo-1024x642-1-700x439.jpeg)

## 2. Google : [ML Kit](https://developers.google.com/ml-kit)

*Library* ini sama-sama dikembangkan oleh *Google* dan merupakan penyempurnaan *ML Kit for Firebase*. Bahkan *Google* sendiri sangat menyarankan pengguna *ML Kit for Firebase* untuk migrasi ke ***Google ML Kit***.

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/saran-simbah-700x302.png)

Proses integrasinya sederhana, cukup *add* *package dependency* di *gradle*, kemudian *build &amp; sync*. Kemudian library ini juga tidak ada validasi *API Key* dan semacamnya.

Ada **dua pilihan** API Service dalam Google ML Kit:

- ##### ***On Device Bundle***

Semua komputasi/ML dilakukan secara *standalone*. Semua model yang dibutuhkan akan di *embed* ke dalam *apk*, sehingga dampaknya ukuran **apk menjadi besar**.

- ##### ***On Device Delivered (by Google Play Service)***

Semua komputasi/ML dilakukan secara standalone, namun data model yang dibutuhkan akan ditangani oleh *Google Play Service*, sehingga **ukuran apk kecil**.

*Google Play Service* sendiri merupakan API penghubung berbagai macam *services* yang disediakan oleh *Google*.

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/0L14gGsW5tiBMQEQS-700x237.jpeg)

## 3. [Huawei ML Kit](https://developer.huawei.com/consumer/en/hms/huawei-mlkit/)

*Huawei ML Kit* dikembangkan oleh *Huawei*. Jika dibandingkan dengan *Firebase* dan *Google*, *Huawei* memiliki **fungsi yang lebih lengkap**. Ada *Emotional Probability, Gender Probability , Age Probability* dan lain sebagainya. Bagi saya ini benar-benar keren.

![](https://hangga.github.io/blog/wp-content/uploads/2020/12/device-2020-12-31-123935.png)

Namun sayangnya, khusus untuk ***Face Detection***, *library* ini hanya menyediakan pilihan ***on device bundle*** sehingga dampaknya ukuran **apk menjadi bengkak.** Sepertinya masih butuh *exploring* lebih dalam lagi untuk me*reduce* ukuran apk-nya.

Proses integrasinya memang tidak se-*ribet* *Firebase*, namun tetap ada validasi *api key* saat build.

## 4. Comparison Table

| <span style="color: #000080;">**ML Kit API Comparisons**</span> |
|---|
| **Comparison items** | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/firebase-logo-315.png) | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) | <span style="color: #800000;">**Win**</span> |
| **Head Angle** |  |  |  |  |  |
| ~ Euler Angle X | ❌ | ✅ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| ~ Euler Angle Y | ✅ | ✅ | ✅ |
| ~ Euler Angle Z | ✅ | ✅ | ✅ |
|  |  |  |  |  |  |
| **Emotion Probability** |  |  |  |  |  |
| ~ Smiling | ✅ | ✅ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| ~ Neutral | ❌ | ❌ | ✅ |
| ~ Angry | ❌ | ❌ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| ~ Fear | ❌ | ❌ | ✅ |
| ~ Sad | ❌ | ❌ | ✅ |
| ~ Disgust | ❌ | ❌ | ✅ |
| ~ Surprise | ❌ | ❌ | ✅ |
|  |  |  |  |  |  |
| **Eye** |  |  |  |  |  |
| ~ Open Right Eye | ✅ | ✅ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| ~ Open Left Eye | ✅ | ✅ | ✅ |
|  |  |  |  |  |  |
| **Gender Probability** | ❌ | ❌ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
|  |  |  |  |  |  |
| **Age Probability** | ❌ | ❌ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
|  |  |  |  |  |  |
| **Other** |  |  |  |  |  |
| ~ Hat | ❌ | ❌ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| ~ Moustache | ❌ | ❌ | ✅ |
| ~ Sun Glass | ❌ | ❌ | ✅ |
|  |  |  |  |  |  |
| **API Services** |  |  |  |  |  |
| **~ On Device Bundle** | ❌ | ✅ | ✅ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/huawei-logo-png-6999.png) |
| Semua model yang dibutuhkan di download bersama library saat build sync via gradle dan akan di embed ke dalam apk, sehingga ukuran apk jadi besar |
|  |  |  |  |  |  |
| **~ On Device Delivered** | ✅ | ❌ | ❌ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/firebase-logo-315.png) |
| Saat build gradle hanya mendownload library. Sedangkan model didownload dari cloud saat pertama kali install apk |
|  |  |  |  |  |  |
| **~ On Device Delivered by Google Play Service** | ❌ | ✅ | ❌ | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) |
| Saat build gradle hanya mendownload library, sedangkan model akan di handle oleh Google Play Service |
|  |  |  |  |  |  |
| **~ API Key validation on Gradle Build** | 👎🏽 | 👍 | 👎🏽 | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) |
| Validasi API Key(Firebase API Key/ Huawei API Key) saat build gradle/ build apk dengan file json services. Konfigurasi di gradle harus benar dan valid. Selain lumayan ribet bagi client, file json services ini seharusnya rahasia karena berisi data credential seperti api key, package id dll. | ✅ | ❌ | ✅ |
|  |  |  |  |  |  |
| **Apk Size (di build dari Prototype/ Sample project)** | 👍 | 👍 | 👎🏽 | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/firebase-logo-315.png) | ![](https://hangga.github.io/blog/wp-content/uploads/2020/12/google-ml-kit.png) |
| ~ Delivered API Services | **4,4 MB** | **4,1 MB** | ❌ |
| ~ Bundle APK | ❌ | **23,6 MB** | **22,3 MB** |

## 5. Kesimpulan

- Dalam hal **ketersediaan fungsi**, Huawei menang banyak. Namun kekurangannya, ukuran **apk jadi bengkak**, perlu diteliti lebih dalam untuk mereduce ukuran apk-nya.
- Firebase **kurang recomended** untuk komersial, karena masih beta dan Google Sendiri menyarankan migrasi.
- Google ML Kit, untuk fungsi-fungsi sederhana seperti deteksi smile, eye blink dan face direction sudah **cukup memenuhi**. Ukuran apk juga bisa di reduce dengan memilih yang *on device delivered(by Google Play Service)*.

#### Referensi:

- <https://android-developers.googleblog.com/2020/06/mlkit-on-device-machine-learning-solutions.html>
- <https://firebase.google.com/docs/ml-kit>
- [https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/service-introduction-0000001050040017#EN-US\_TOPIC\_0000001050710154\_\_section119422313385](https://developer.huawei.com/consumer/en/doc/development/HMSCore-Guides/service-introduction-0000001050040017#EN-US_TOPIC_0000001050710154__section119422313385)
- <https://support.google.com/googleplay/answer/9037938>