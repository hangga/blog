---
id: 3935
title: 'Fitur Baru JAVA 7 : Object.requireNonNull()'
date: '2019-05-16T06:10:27+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3935'
permalink: /2019/05/16/fitur-baru-java-7/
wpb_post_views_count:
    - '0'
image: /wp-content/uploads/2019/05/javanewfeat-1.jpeg
categories:
    - Android
    - Coding
tags:
    - 'Android Studio'
    - 'Fitur Baru Java 7'
    - Java
    - 'Java 7'
    - null-safe
    - NullPointerException
    - object.requireNonNull()
    - requireNonNull
---

Pada <span style="color: #800080;">*Java 7*</span> ketas atau <span style="color: #800080;">*JDK 1.7*</span> keatas, anda akan menemukan salah satu fitur baru, yaitu *method* <span style="color: #800080;">*requireNonNull()*</span>. *Method* ini terdapat pada kelas <span style="color: #800080;">*Objects*</span> yang merupakan turunan  dari kelas <span style="color: #800080;">*Object*</span>.

Saya sendiri baru mengetahuinya padahal saat postingan ini di*publish*, <span style="color: #800080;">*Java 10*</span> *s*udah *release*. *Ha3x* betapa *kudet*nya saya.

#### Lalu apa kegunaan method Objects.requireNonNull()?

Nah, bagi programmer <span style="color: #800080;">*Java*</span> atau pengembang aplikasi <span style="color: #800080;">*android*</span>, selama ini kita tentu familiar dengan <span style="color: #800080;">*NullPointerException*</span>. Yaitu <span style="color: #800080;">*throwable exception*</span> yang dilemparkan ketika kita tak sengaja mengakses referensi objek yang bernilai <span style="color: #800080;">*null*</span>. Sungguh butuh ketelitian untuk menangani atau mengantisipasi terjadinya <span style="color: #800080;">*NullPointerException*</span>.

He3x jujur saja, pasti anda juga sering melakukan hal berikut ini untuk mengantisipasi <span style="color: #800080;">*NullPointerException*</span>.

 ```
if (viewMain == null) {
     viewMain = inflater.inflate(R.layout.fragment_main, container, false);
     ButterKnife.bind(this, viewMain);
     initialize();
}
```

 ```
if (mentions == null || mentions.isEmpty()) {
     throw new IllegalArgumentException("Appended Mentions cannot be null nor empty.");
}
```

Nah, jadi <span style="color: #800080;">*Objects.requireNonNull()*</span> ini gunanya adalah untuk <span style="color: #800080;">*null-safe*</span> atau dengan kata lain penanganan <span style="color: #800080;">*null*</span> yang lebih baik.

Jadi, jika misalkan

 ```
this.bar = Objects.requireNonNull(bar, "bar must not be null");
```

maka dijamin <span style="color: #800080;">***this.bar***</span> ini tidak akan null.

Lumayan kan? paling tidak, kode anda jadi lebih irit baris. *Ha3x.*

Nah, bagi yang menggunakan<span style="color: #800080;"> *Android Studio 3.3.x*</span> ketas akan terasa terbantu sekali dengan adanya <span style="color: #800080;">*Lint Warning*</span>. Cara gampangnya tinggal ikuti saran dari *<span style="color: #800080;">Android Studio</span>.* Tinggal klik balon kuning, lalu *<span style="color: #800080;">value</span>* atau <span style="color: #800080;">*object*</span> yang berpotensi <span style="color: #800080;">*null*</span> akan terbungkus oleh <span style="color: #800080;">*Objects.requireNonNull()*</span> dengan sendirinya.

 <figure class="wp-block-image">![](http://hangga.github.io/blog/wp-content/uploads/2019/05/ikih_null.png) <figcaption>*Lint Warnin*g</figcaption> </figure>Selamat mencoba, semoga bermanfaat.

Referensi:  
<https://stackoverflow.com/questions/45632920/why-should-one-use-objects-requirenonnull>  
<https://docs.oracle.com/javase/7/docs/api/java/util/Objects.html#requireNonNull(T)>  
<https://developer.android.com/reference/java/util/Objects.html#nonNull(java.lang.Object)>