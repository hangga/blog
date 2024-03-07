---
id: 2336
title: 'Android: Embed a custom font'
date: '2015-08-10T13:28:37+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2336'
permalink: /2015/08/10/android-embed-a-custom-font/
post_views_count:
    - '50'
image: /wp-content/uploads/2015/08/custom-font-miui7-dadroird.jpg
categories:
    - Android
    - Coding
tags:
    - android
    - 'custom font android'
    - 'Embed a custom font'
    - 'Embed font'
    - font
---

Ada banyak cara jika kita mau berusaha. Nah, berikut ini hanyalah salah satu dari berbagaimacam cara meng-embed *font* kedalam *TextView.*

1\. Siapkan *font* yg kita miliki.

![Screenshot-1](http://hangga.github.io/blog/wp-content/uploads/2015/08/Screenshot-1.png)

2\. Copy ke dalam resource direktori */raw*

[![Screenshot](http://hangga.github.io/blog/wp-content/uploads/2015/08/Screenshot-150x150.png)](http://hangga.github.io/blog/wp-content/uploads/2015/08/Screenshot.png)

3\. Buat sebuah kelas turunan dari *TextView*. Misal kelas ini saya beri nama ***RabbitTextView.***

```
public class RabbitTextView extends TextView {
    public RabbitTextView(Context context) {
        super(context);
        init();
    }

    public RabbitTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RabbitTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init(){
        Typeface tf = Typeface.createFromAsset(getContext().getAssets(),
         "rabbit.ttf");
        setTypeface(tf);
    }
}
```

4\. Tinggal comot di *xml*nya, misalnya

```
<com.hangga.smaipa.object.RabbitTextView
        android:layout_marginLeft="10dp"
        android:layout_marginRight="10dp"
        android:layout_alignParentTop="true"
        android:layout_width="fill_parent"
        android:gravity="center"
        android:text="@string/judul"
        android:layout_height="wrap_content"
        android:textColor="@color/putih"
        android:textSize="24dp"
        android:textStyle="bold"
        android:padding="10dp"
        />
```

Hasilnya

![menu-apel](http://hangga.github.io/blog/wp-content/uploads/2015/08/menu-apel.png)

Selamat mencoba…