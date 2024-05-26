---
id: 2159
title: 'Membuat Drag and Drop Object di Android'
date: '2014-11-14T04:32:35+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2159'
permalink: /2014/11/14/membuat-dragable-object-di-android/
post_views_count:
    - '1615'
diarjolite_template:
    - full
image: /wp-content/uploads/2015/01/jquery-ui-drag-n-drop-reverting.png
categories:
    - Android
    - Coding
tags:
    - android
    - 'android dragable layout'
    - 'android programming'
    - 'dragable layout'
    - 'dragable object'
---

Jumpa lagi teman. Setelah sekian lama tersibukkan dg aktivitas nguli, akhirnya ada kesempatan untuk berbagi ilmu yg *seupil* ini lagi.

# Draggable Object

***Draggable Object*/** ***Draggable Layout*** atau entah apa Anda mau menyebutnya, yg jelas definisinya adalah sebuah *custom* *object* di *Android* yg dapat dipindah-pindah dengan cara di-*drag*.

# Lihat videonya..

[https://www.youtube.com/watch?v=rEeLeEdgKfs&amp;feature=youtu.be](https://www.youtube.com/watch?v=rEeLeEdgKfs&feature=youtu.be)

# Caranya

Banyak cara, tapi yg saya lakukan cukup sederhana. Intinya tinggal ng*ekstends* dari *layout* yg sudah ada kemudian tambahkan *behaviour* yg kita inginkan.

# Menuju TKP

1\. Buat kelas baru, tak kasih nama *Dragable* aja lah.

![Menu_011](http://hangga.github.io/blog/wp-content/uploads/2015/01/Menu_011.png)![New Java Class _013](http://hangga.github.io/blog/wp-content/uploads/2015/01/New-Java-Class-_013.png)

2\. *Extends* *RelativeLayout*

```
public class Dragable extends RelativeLayout{
        public Dragable(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
	}

	public Dragable(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	public Dragable(Context context) {
		super(context);
	}
}
```

3\. Variabel yg dibutuhkan beserta method *getter*-nya

```
private int delta_x;
	private int delta_y;
	private int px;
	private int py;

	public int getPx() {
		return px;
	}

	public int getPy() {
		return py;
	}
```

4\. Tambahkan *behaviour Drag* pada *OnTouchListener.* Inisiasi delta\_x dan delta\_y pada ***MotionEvent.ACTION\_DOWN***, kemudian memindah posisi *object* saat ***MotionEvent.ACTION\_MOVE.***

```
OnTouchListener onTouchListener = new OnTouchListener() {

		@Override
		public boolean onTouch(View v, MotionEvent event) {

			final int X = (int) event.getRawX();
			final int Y = (int) event.getRawY();

			switch (event.getAction() & MotionEvent.ACTION_MASK) {

			case MotionEvent.ACTION_DOWN:
				RelativeLayout.LayoutParams lParams = (RelativeLayout.LayoutParams) v.getLayoutParams();
				delta_x = X - lParams.leftMargin;
				delta_y = Y - lParams.topMargin;
				break;

			case MotionEvent.ACTION_MOVE:
				Log.d("SX", String.valueOf(event.getRawX()+"|"+event.getRawY()));

				RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) v.getLayoutParams();
				px = X - delta_x;
				py = Y - delta_y;
				layoutParams.leftMargin = px;
				layoutParams.topMargin = py;
				layoutParams.rightMargin = -250;
				layoutParams.bottomMargin = -250;
				v.setLayoutParams(layoutParams);
	            break;
			}

			return true;
		}
	};
```

5\. Source lengkap

```
package com.qiya.dragdrop;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.RelativeLayout;

public class Dragable extends RelativeLayout{

	private int delta_x;
	private int delta_y;
	private int px;
	private int py;

	public int getPx() {
		return px;
	}

	public int getPy() {
		return py;
	}

	public Dragable(Context context, AttributeSet attrs, int defStyle) {
		super(context, attrs, defStyle);
		init();
	}

	public Dragable(Context context, AttributeSet attrs) {
		super(context, attrs);
		init();
	}

	public Dragable(Context context) {
		super(context);
		init();
	}

	private void init(){
		this.setOnTouchListener(onTouchListener);
	}

	OnTouchListener onTouchListener = new OnTouchListener() {

		@Override
		public boolean onTouch(View v, MotionEvent event) {

			final int X = (int) event.getRawX();
			final int Y = (int) event.getRawY();

			switch (event.getAction() & MotionEvent.ACTION_MASK) {

			case MotionEvent.ACTION_DOWN:
				RelativeLayout.LayoutParams lParams = (RelativeLayout.LayoutParams) v.getLayoutParams();
				delta_x = X - lParams.leftMargin;
				delta_y = Y - lParams.topMargin;
				break;

			case MotionEvent.ACTION_MOVE:
				Log.d("SX", String.valueOf(event.getRawX()+"|"+event.getRawY()));

				RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) v.getLayoutParams();
				px = X - delta_x;
				py = Y - delta_y;
				layoutParams.leftMargin = px;
				layoutParams.topMargin = py;
				layoutParams.rightMargin = -250;
				layoutParams.bottomMargin = -250;
				v.setLayoutParams(layoutParams);
	            break;
			}

			return true;
		}
	};

}
```

# Tinggal pakai..

Jika kelas Dragable sudah berhasil dibuat, biasanya akan muncul di pallete.

![Selection_019--](http://hangga.github.io/blog/wp-content/uploads/2015/01/Selection_019-.png)

Contoh penggunaan di layoutnya

```
<pre class="brush:xml"><com.qiya.dragdrop.Dragable
        android:id="@+id/siji"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:background="@android:drawable/btn_star">
    </com.qiya.dragdrop.Dragable>

    <com.qiya.dragdrop.Dragable
        android:id="@+id/loro"
        android:layout_width="40dp"
        android:layout_height="40dp"
        android:layout_alignParentLeft="true"
        android:layout_alignParentTop="true"
        android:layout_marginLeft="102dp"
        android:layout_marginTop="30dp"
        android:background="@drawable/ic_launcher" >
    </com.qiya.dragdrop.Dragable>
```