---
id: 2889
title: 'Beberapa issue saat mengaktifkan Proguard(1).'
date: '2016-03-22T07:49:38+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2889'
permalink: /2016/03/22/beberapa-issue-saat-mengaktifkan-proguard1/
post_views_count:
    - '28'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - proguard
    - 'proguard problem'
---

Sekedar catatan pengingat, siapa tahu bermanfaat bagi pemirsa sekalian. he3x.. Karena beberapa waktu lalu mengalami masalah setelah mengaktifkan *ProGuard*.

### 1. *Depencency* pada Google Play Service.

Jika ini terjadi, maka *project* anda tidak akan bisa di *build.* Biasanya ini sering terjadi pada package ***com.google.android.gms*** jika anda menggunakan *google play service* dan *google analytics*. Solusinya anda harus meng-exclude *package* ***com.google.android.gms.***

```
<pre class="">compile('com.google.android.gms:play-services-maps:7.3.0') {
    exclude group: 'com.google.android.gms'
}

compile 'com.google.android.gms:play-services-analytics:7.3.0'
```

### 2. Duplicate *resource files*

Error ini juga menyebabkan project anda tidak dapat di build. Penyebab error ini adalah adanya duplikasi nama *file* di dalam *project* Anda entah di dalam *package* anda sendiri, atau dalam *library* yang Anda gunakan. Sehingga anda harus rajin *metani* ha3x.. rasain..

```
Note: there were 110 duplicate class definitions.
      (http://proguard.sourceforge.net/manual/troubleshooting.html#duplicateclass)
Warning:can't write resource [.readme] (Duplicate zip entry [classes.jar:.readme])
Warning:can't write resource [META-INF/LICENSE.txt] (Duplicate zip entry [commons-lang3-3.2.1.jar:META-INF/LICENSE.txt])
Warning:can't write resource [META-INF/NOTICE.txt] (Duplicate zip entry [commons-lang3-3.2.1.jar:META-INF/NOTICE.txt])
Warning:can't write resource [META-INF/LICENSE.txt] (Duplicate zip entry [commons-io-1.3.2.jar:META-INF/LICENSE.txt])
Warning:can't write resource [META-INF/NOTICE.txt] (Duplicate zip entry [commons-io-1.3.2.jar:META-INF/NOTICE.txt])
Warning:can't write resource [.readme] (Duplicate zip entry [classes.jar:.readme])
:app:proguardAppRelease FAILED
Error:Execution failed for task ':app:proguardAppRelease'.
> java.io.IOException: Can't write [/Users/me/Projects/myProject/app/build/intermediates/classes-proguard/app/release/classes.jar] (Can't read [/Users/me/Projects/myProject/app/build/intermediates/exploded-aar/myProject/mySubProject/unspecified/jars/libs/retrofit-1.3.0.jar(;;;;;;!META-INF/MANIFEST.MF)] (Duplicate zip entry [b/a/a.class == retrofit-1.3.0.jar:retrofit/android/AndroidApacheClient.class]))
```

Saya pernah mengalaminya dan Alhamdulillah *solved* dengan cara meng-*exclude* file2 yang terindikasi terjadi duplikasi:

```
android {
     packagingOptions { 
         exclude 'META-INF/LICENSE.txt' 
         exclude 'META-INF/NOTICE.txt' 
     }
 }
```

<http://stackoverflow.com/questions/16357959/proguard-fails-with-cant-write-resource-meta-inf-manifest-mf-duplicate-zip>

Bersambung…