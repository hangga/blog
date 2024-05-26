---
id: 2880
title: 'Mencegah multiple Click'
date: '2016-02-19T14:26:46+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2880'
permalink: /2016/02/19/mencegah-multiple-click/
post_views_count:
    - '39'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - android
    - 'multiple click'
    - 'prevent multiple click'
---

Agar tidak terjadi ***multiple click*** atau pemanggilan *event click* berkali-kali, maka perlu sebuah trik untuk mencegahnya.

Sebenarnya ada banyak cara untuk mengakali trik ini, namun yg saya gunakan disini adalah trik yang sangat sederhana yaitu **menghentikan aksi** pada ***method*** ***onClick()*** dalam **selang waktu tertentu** yg kita tentukan.

1\. Buat sebuah *<span class="pl-k">abstract</span> <span class="pl-k">class </span>*<span class="pl-k">yang mengimplements <span class="pl-e">View</span>.<span class="pl-e">OnClickListener.</span></span>

```
package com.hangga.research;

import android.os.SystemClock;
import android.view.View;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Created by hangga on 18/02/16.
 */
public abstract class SingleClickListener implements View.OnClickListener {

    private final long minimumInterval;
    private Map<View, Long> lastClickMap;

    /**
     * Implement this in your subclass instead of onClick
     * @param v The view that was clicked
     */
    public abstract void onSingleClick(View v);

    /**
     * The one and only constructor
     * @param minimumIntervalMsec The minimum allowed time between clicks - any click sooner than this after a previous click will be rejected
     */
    public SingleClickListener(long minimumIntervalMsec) {
        this.minimumInterval = minimumIntervalMsec;
        this.lastClickMap = new WeakHashMap<View, Long>();
    }

    public SingleClickListener() {
        this.minimumInterval = 2000; // 2 second
        this.lastClickMap = new WeakHashMap<View, Long>();
    }

    @Override public void onClick(View clickedView) {
        Long previousClickTimestamp = lastClickMap.get(clickedView);
        long currentTimestamp = SystemClock.uptimeMillis();

        lastClickMap.put(clickedView, currentTimestamp);
        if(previousClickTimestamp == null || (currentTimestamp - previousClickTimestamp.longValue() > minimumInterval)) {
            onSingleClick(clickedView);
        }
    }
}
```

2\. How to use

```
txtEdan.setOnClickListener(new SingleClickListener() {
        @Override
        public void onSingleClick(View v) {
        	Intent intent;
            intent = new Intent(getContext(), UserActivity.class);
            intent.putExtra("userName",groupName);
            intent.putExtra("userId", groupId);
            getContext().startActivity(intent);
     	}
```

\[dl url=”https://github.com/MabulJaya/Utils” title=”Lihat Source Lengkap” desc=”by : Hangga Aji Sayekti”\]