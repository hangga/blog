---
id: 46
title: 'Layout dengan Rounded Corner'
date: '2014-02-19T08:38:45+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=46'
permalink: /2014/02/19/rounded-corner-tanpa-image/
post_views_count:
    - '78'
image: /wp-content/uploads/2014/02/47.gif
categories:
    - Android
---

1\. Buatlah sebuah file *xml* di folder drawable. Misal *rounded\_biru.xml.*

```
<pre class="brush:xml"><?xml version="1.0" encoding="UTF-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android" 
    android:shape="rectangle">
    <stroke 
        android:width="1dp" 
        android:color="#C7C7C7" />

    <corners 
        android:radius="5dp"/>

    <padding 
        android:left="10dp" 
        android:right="10dp" 
        android:top="10dp" 
        android:bottom="10dp"/>

    <solid 
        android:color="#DFF1F5"/>
</shape>
```

Perhatikan bagian ini

```
<pre class="brush:xml"><corners 
        android:radius="5dp"/>
```

Untuk menentukan tingkat kelengkungan sudut.

2\. Cara menggunakan. Misalkan kita hendak membuat *TextView* dengan *rounded corner.*

```
<pre class="brush:xml"><TextView
	    android:id="@+id/txtFact"
	    android:padding="10dp"
	    android:layout_alignParentLeft="true"
	    android:layout_alignParentBottom="true"
	    android:layout_width="wrap_content"
	    android:layout_height="fill_parent"
	    android:layout_margin="3dp"
	    android:gravity="top|left|fill_horizontal"
	    android:background="@drawable/rounded_biru"
	    android:text="Ini Sebuah TextView"/>
```