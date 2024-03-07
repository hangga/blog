---
id: 1772
title: 'Membuat Glow/Shadow tanpa Image'
date: '2014-03-05T07:31:02+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1772'
permalink: /2014/03/05/membuat-glowshadow-dengan-shape-berlapis/
post_views_count:
    - '241'
image: /wp-content/uploads/2014/03/bands.jpg
categories:
    - Android
    - 'Web Design'
tags:
    - android
    - 'android layout with glow'
    - 'android layout with shadow'
    - 'android shadow layout'
    - disain
    - 'source android'
    - 'source code android'
---

[![device-2014-03-05-020355](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-020355.png)![device-2014-03-05-020217](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-020217.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-020217.png)

*Glow* maupun *shadow* pada *layout* dapat dibuat tanpa memerlukan *image.* Yaitu diakali dengan menggunakan *shape* bertumpuk. Pada kasus ini saya menggunakan 6 lapis shape. Kemudian tingkat kita atur nilai prosentase *alpha* pada warna masing-masing shape sedemikian rupa sehingga seolah-olah warna semakin pudar.

[![bands](http://hangga.github.io/blog/wp-content/uploads/2014/03/bands.jpg)](http://hangga.github.io/blog/wp-content/uploads/2014/03/bands.jpg)

TKP

Membuat shape di *@drawable* dan saya beri nama ***shape\_gradient\_glow**.*

```
<pre class="brush:xml"><?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">

     <!-- Drop Shadow Stack -->
    <item>
    	<shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1dp" />
            <solid android:color="#00969696" />
        </shape>
    </item>
     <item>
        <shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1dp" />
            <solid android:color="#10969696" />
        </shape>
    </item>
     <item>
        <shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1dp" />
            <solid android:color="#20969696" />
        </shape>
    </item>
    <item>
        <shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1.5dp" />
            <solid android:color="#30969696" />
        </shape>
    </item>
    <item>
        <shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1dp" />
            <solid android:color="#50969696" />
        </shape>
    </item>
	<item>
        <shape>
            <padding android:top="1dp" android:right="1dp" android:bottom="1.5dp" android:left="1dp" />
            <solid android:color="#60969696" />
        </shape>
    </item>

    <!-- Background -->
    <item>
	<shape>
            <solid android:color="#969696" />
	    <corners android:radius="5dp" />
	</shape>
    </item>
</layer-list>
```

Nah sekarang tinggal pake ajah. Semisal dibawah ini.

```
<pre class="brush:xml"><RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity" >
	<ImageView
	    android:layout_width="fill_parent"
	    android:layout_height="wrap_content"
	    android:scaleType="centerCrop"
	    android:background="@drawable/appbg"/>

	<RelativeLayout
	    android:layout_width="200dp"
	    android:layout_height="300dp"
	    android:layout_centerInParent="true"
	    android:background="@drawable/shape_gradient_glow">
	    <RelativeLayout
	        android:layout_width="fill_parent"
	        android:layout_height="fill_parent"
	        android:background="@android:color/black"/>
	</RelativeLayout>

</RelativeLayout>
```

Terinspirasi dari sini : http://codebybrian.com/2013/05/05/adding\_dropshadow\_to\_android\_view.html