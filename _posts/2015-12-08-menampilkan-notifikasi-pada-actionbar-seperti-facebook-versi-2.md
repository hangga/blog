---
id: 2706
title: 'Menampilkan notifikasi pada ActionBar seperti Facebook (Versi 2)'
date: '2015-12-08T12:53:40+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2706'
permalink: /2015/12/08/menampilkan-notifikasi-pada-actionbar-seperti-facebook-versi-2/
post_views_count:
    - '40'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - android
    - 'Android notification menu'
    - 'notification count'
    - 'notification like facebook'
---

Pada postingan [sebelumnya](http://hangga.github.io/blog/2015/12/07/menampilkan-jumlah-notifikasi-pada-item-menu-actionbar-seperti-facebook/), telah dibahas cara menampilkan notifikasi pada *ActionBar menu* dengan menggunakan kelas *BadgeDrawable* yang merupakan turunan dari *drawable* dengan ditambahkan sedikit *behaviour*.

Pada postingan [kali ini](http://hangga.github.io/blog/2015/12/08/menampilkan-notifikasi-pada-actionbar-seperti-facebook-versi-2/), akan dibahas cara lain, yaitu dengan menggunakan *inflating view*. Langkah-langkahnya adalah sebagai berikut:

> 1. Mendefinisikan menu yang akan dipasangi notifikasi.
> 2. Membuat kelas ***NotifView*** yang meng-*extends* dari *RelativeLayout.* Kemudian ***NotifView**** inilah yang akan dijadikan *ActionView* dari menu yg sudah didefinisikan.

Mari menuju tekape sodara2…

1\. Mendefinisikan menu yang akan digunakan.

```
<pre class="brush:xml"><span style="color: #000080;"><strong>File name: <em>menu_main.xml</em></strong></span>
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">
    <item android:id="@+id/action_notif"
        android:title="@string/action_settings"
        android:icon="@android:drawable/ic_popup_reminder"
        app:showAsAction="always" />
</menu>
```

2\. Membuat kelas *NotifView.*

- Membuat *layout xml* untuk kelas *NofifView* dan *background shadow*nya.

```
<pre class="brush:xml"><strong><span style="color: #000080;">File name : <em>bg_red.xml </em></span></strong>

<?xml version="1.0" encoding="utf-8"?>
<shape
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">

    <!-- view background color -->
    <solid
        android:color="#FF0000" >
    </solid>

    <!-- If you want to add some padding -->
    <padding
        android:left="5dp"
        android:top="2dp"
        android:right="5dp"
        android:bottom="2dp"    >
    </padding>

    <!-- Here is the corner radius -->
    <corners
        android:radius="45dp"   >
    </corners>

</shape>
```

```
<pre class="brush:xml"><strong><span style="color: #000080;">File name: <em>layout_notifview.xml</em></span></strong>

<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="wrap_content" android:layout_height="wrap_content">
    <ImageView
        android:id="@+id/ic_launcher"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center_vertical"
        android:layout_marginLeft="2dp"
        android:layout_marginRight="2dp"
        android:orientation="horizontal"
        android:src="@android:drawable/ic_popup_reminder" >
    </ImageView>
    <TextView
        android:id="@+id/tvCount"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignRight="@+id/ic_launcher"
        android:ellipsize="end"
        android:maxLength="3"
        android:text="99"
        android:textColor="#ffffff"
        android:textSize="9sp"
        android:textStyle="bold"
        android:layout_alignParentTop="true"
        android:background="@drawable/bg_red"
        android:visibility="gone"/>
</RelativeLayout>
```

```
package com.research.hangga.dynamicnotifinflate;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;

/**
 * Copyright (C) PT. Sebangsa Bersama - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Originally written by Hangga Aji Sayekti, 08/12/15
 */
public class NotifView extends RelativeLayout {

    private TextView tvCount;
    private int count = 0;

    public void setCount(int count) {
        this.count = count;
        if (count < 1) {
            tvCount.setVisibility(View.GONE);
        } else {
            tvCount.setVisibility(View.VISIBLE);
            tvCount.setText(String.valueOf(count));
        }
    }

    public NotifView(Context context) {
        super(context);
        init(context);
    }

    private void init(Context context){
        LayoutInflater mInflater = LayoutInflater.from(context);
        mInflater.inflate(R.layout.layout_notifview, this);
        tvCount = (TextView) findViewById(R.id.tvCount);
    }
}
```

*Handling* pada *MainActivity.java.* Inisialisasikan notifView di dalam method onCreate().

```
notifView = new NotifView(MainActivity.this);
```

```
@Override public boolean onCreateOptionsMenu(Menu menu) {   getMenuInflater().inflate(R.menu.menu_main, menu); 
MenuItem itemNotif = menu.findItem(R.id.action_notif); itemNotif.setActionView(notifView); return true; 
}
```

Simulasi updating jumlah notifikasi

```
@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        notifView = new NotifView(MainActivity.this);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                notifView.setCount(notif_count++);
            }
        });
    }
```

![device-2015-12-08-195216](http://hangga.github.io/blog/wp-content/uploads/2015/12/device-2015-12-08-195216-510x808.png)

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2015/12/DynamicNotifInflate.7z” title=”Download Source Lengkap” desc=”by : Hangga Aji Sayekti”\]