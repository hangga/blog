---
id: 2643
title: 'Optimasi Layout dengan ViewStub'
date: '2015-11-24T11:46:04+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2643'
permalink: /2015/11/24/optimasi-layout-dengan/
post_views_count:
    - '68'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - 'Optimasi Layout'
    - 'Optimasi Layout Android'
    - ViewStub
---

### Apa itu &lt;ViewStub/&gt;

*ViewStub* adalah sebuah *view* yang tak terlihat dan berukuran nol dan sangat cocok untuk *lazily inflate layout resources* saat run time. Jadi ViewStub ini sangatlah irit memori sehingga sangat pas sekali untuk optimasi layout. Begitulah kira-kira.

### Perbedaan &lt;ViewStub/&gt; dan &lt;Include/&gt;

Lalu apa bedanya dengan include. Sekilas memang sama, tapi *sakjane* beda lah.

> The ***&lt;include /&gt;*** will just include the xml contents in your base xml file as if the whole thing was just a single big file. It’s a nice way to share layout parts between different layouts.
> 
> <span class="para_break">  
> </span>The ***&lt;ViewStub/&gt;*** is a bit different because it is not directly included, and will be loaded only when you actually use it/need it, ie, when you set its visibility to VISIBLE (actually visible) or INVISIBLE (still not visible, but its size isn’t 0 anymore). This a nice optimization because you could have a complex layout with tons of small views or headers anywhere, and still have your Activity load up really fast. Once you use one of those views, it’ll be loaded.

Kemudian gambaran betapa ngiritnya ViewStub ini dapat kita lihat pada gambar berikut:

<figure aria-describedby="caption-attachment-2644" class="wp-caption aligncenter" id="attachment_2644" style="width: 510px">![Sumber: http://android-developers.blogspot.co.id/](http://hangga.github.io/blog/wp-content/uploads/2015/11/view-stub1-510x431.png)<figcaption class="wp-caption-text" id="caption-attachment-2644">Sumber: http://android-developers.blogspot.co.id/</figcaption></figure><figure aria-describedby="caption-attachment-2645" class="wp-caption aligncenter" id="attachment_2645" style="width: 510px">![Sumber : http://android-developers.blogspot.co.id/](http://hangga.github.io/blog/wp-content/uploads/2015/11/view-stub2-510x431.png)<figcaption class="wp-caption-text" id="caption-attachment-2645">Sumber : http://android-developers.blogspot.co.id/</figcaption></figure>### Penggunaan ViewStub

```
<pre class="brush:xml"><ViewStub android:id="@+id/stub"
               android:inflatedId="@+id/subTree"
               android:layout="@layout/mySubTree"
               android:layout_width="120dip"
               android:layout_height="40dip" />
```

Dengan ViewStub ini kita dapat melakukan inflating ketika dibutuhkan saja.

```
ViewStub stub = (ViewStub) findViewById(R.id.stub);
View inflated = stub.inflate();
```

Referensi:  
[http://developer.android.com/reference/android/view/ViewStub.html](http://developer.android.com/reference/android/view/ViewStub.html "http://developer.android.com/reference/android/view/ViewStub.html")  
[http://android-developers.blogspot.co.id/2009/03/android-layout-tricks-3-optimize-with.html](http://android-developers.blogspot.co.id/2009/03/android-layout-tricks-3-optimize-with.html "http://android-developers.blogspot.co.id/2009/03/android-layout-tricks-3-optimize-with.html")