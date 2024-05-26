---
id: 1834
title: 'Crash on Viewpager inside ScrollView'
date: '2014-03-12T16:15:56+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1834'
permalink: /2014/03/12/crash-pada-viewpager-di-dalam-horizontalscrollview/
post_views_count:
    - '276'
image: /wp-content/uploads/2014/03/Untitled-250x250.png
categories:
    - Android
    - Coding
tags:
    - ScrollView
    - 'source android gratis'
    - viewpager
    - 'ViewPager in ScrollView'
---

Kali ini(Rabu, 12-03-14) saya kembali menjumpai kasus yg cukup menarik yaitu Crash antara aksi *swipe* kekanan/kiri milik *viewPager* dan aksi *scroll* kebawah/keatas milik *Scrollview*.

Crash ini terjadi ketika *ViewPager* berada di dalam *ScrollView(hirizontal)* seperti ilustrasi dibawah ini.

[![Untitled](http://hangga.github.io/blog/wp-content/uploads/2014/03/Untitled.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/Untitled.png)

Dari sisi User, aksi *swipe* ke kanan dan ke kiri akan terasa seperti tersendat atau tidak mulus atau apalah istilahnya, yg jelas user bakal merasa tidak nyaman.

Tapi jika permasalahan ini dapat tertangani dengan baik, maka *swipe* ke kanan dan ke kiri pada *ViewPager* akan berjalan dengan mulus seperti pada halaman *user profile* milik *twit\*\*r*.

***Step by step***

1. Salah satu *method* yg dapat *mencerahkan* saya adalah ```
    getParent().requestDisallowInterceptTouchEvent();
    ```
    
    yang berfungsi untuk mencegah aksi *scroll* pada *ScrollView*.
2. Pencegatan aksi *Scroll* milik *ScrollView* dilakukan apabila panjang *swipe*(arah Y) lebih besar dari panjang *Scroll*(arah X).
3. Selain 2, aksi *scroll* di allow kembali.

```
			viewPager.setOnTouchListener(new OnTouchListener() {

			    int dragthreshold = 30;
			    int downX;
			    int downY;

			    @Override
			    public boolean onTouch(View v, MotionEvent event) {

			        switch (event.getAction()) {
			        case MotionEvent.ACTION_DOWN:
			            downX = (int) event.getRawX();
			            downY = (int) event.getRawY();
			            break;
			        case MotionEvent.ACTION_MOVE:
			            int distanceX = Math.abs((int) event.getRawX() - downX);
			            int distanceY = Math.abs((int) event.getRawY() - downY);

			            if (distanceY > distanceX && distanceY > dragthreshold) {
			            	viewPager.getParent().requestDisallowInterceptTouchEvent(false);
			            	scrollContainer.getParent().requestDisallowInterceptTouchEvent(true);
			            } else if (distanceX > distanceY && distanceX > dragthreshold) {
			            	viewPager.getParent().requestDisallowInterceptTouchEvent(true);
			            	scrollContainer.getParent().requestDisallowInterceptTouchEvent(false);
			            }
			            break;
			        case MotionEvent.ACTION_UP:
			        	scrollContainer.getParent().requestDisallowInterceptTouchEvent(true);
			            viewPager.getParent().requestDisallowInterceptTouchEvent(false);
			            break;
			        }
			        return false;
			    }
			});
```

Terinspirasi dari  
http://www.michaelevans.org/blog/2013/10/13/using-a-viewpager-in-a-scrollview/  
http://stackoverflow.com/questions/8381697/viewpager-inside-a-scrollview-does-not-scroll-correclty/16224484#16224484