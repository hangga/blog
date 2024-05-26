---
id: 2695
title: 'Menampilkan notifikasi pada ActionBar seperti Facebook (Versi 1)'
date: '2015-12-07T10:10:57+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2695'
permalink: /2015/12/07/menampilkan-jumlah-notifikasi-pada-item-menu-actionbar-seperti-facebook/
post_views_count:
    - '71'
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

Bagaimana cara menampilkan *notification count* pada *ActionBar menu* seperti di Facebook. Simak langkah berikut ini:

> 1. Membuat kelas ***BadgeDrawable***, yang menangani perhitungan jumlah notifikasi dan *background* lingkaran berwarna merah beserta *shadow*nya.
> 2. Mendefinisikan ***LayerDrawable***, pada *xml* yaitu berupa layer-list. Dimana layer bottom akan dijadikan ikon menu, sedangkan layer atas berupa ***BadgeDrawable***.
> 3. Update jumlah notifikasi dan menampilkannya pada ***BadgeDrawable***.

Yak, langsung menjuju tekape..

1\. Membuat kelas ***BadgeDrawable.***

```
package Objects;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

import com.myexperimen.hangga.dynamicnotification.R;

/**
 * Copyright (C) PT. Sebangsa Bersama - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Originally written by Hangga Aji Sayekti, 07/12/15
 */
public class BadgeDrawable extends Drawable {

    private float mTextSize;
    private Paint mBadgePaint;
    private Paint mTextPaint;
    private Rect mTxtRect = new Rect();

    private String mCount = "";
    private boolean mWillDraw = false;

    public BadgeDrawable(Context context) {
        mTextSize = context.getResources().getDimension(R.dimen.txt_notif_size);

        mBadgePaint = new Paint();
        mBadgePaint.setColor(Color.RED);
        mBadgePaint.setAntiAlias(true);
        mBadgePaint.setStyle(Paint.Style.FILL);

        mTextPaint = new Paint();
        mTextPaint.setColor(Color.WHITE);
        mTextPaint.setTypeface(Typeface.DEFAULT_BOLD);
        mTextPaint.setTextSize(mTextSize);
        mTextPaint.setAntiAlias(true);
        mTextPaint.setTextAlign(Paint.Align.CENTER);
    }

    @Override
    public void draw(Canvas canvas) {
        if (!mWillDraw) {
            return;
        }

        Rect bounds = getBounds();
        float width = bounds.right - bounds.left;
        float height = bounds.bottom - bounds.top;

        // Position the badge in the top-right quadrant of the icon.
        float radius = ((Math.min(width, height) / 2) - 1) / 2;
        float centerX = width - radius - 1;
        float centerY = radius + 1;

        // Draw badge circle.
        canvas.drawCircle(centerX, centerY, radius, mBadgePaint);

        // Draw badge count text inside the circle.
        mTextPaint.getTextBounds(mCount, 0, mCount.length(), mTxtRect);
        float textHeight = mTxtRect.bottom - mTxtRect.top;
        float textY = centerY + (textHeight / 2f);
        canvas.drawText(mCount, centerX, textY, mTextPaint);
    }

    /*
    Sets the count (i.e notifications) to display.
     */
    public void setCount(int count) {
        mCount = Integer.toString(count);

        // Only draw a badge if there are notifications.
        mWillDraw = count > 0;
        invalidateSelf();
    }

    @Override
    public void setAlpha(int alpha) {
        // do nothing
    }

    @Override
    public void setColorFilter(ColorFilter cf) {
        // do nothing
    }

    @Override
    public int getOpacity() {
        return PixelFormat.UNKNOWN;
    }
}
```

2\. Mendefinisikan LayerDrawable berupa layer-list. Kemudian berkas *xml*-nya sy beri nama ***ic\_menu\_notif.***

```
<pre class="brush:xml"><?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item
        android:id="@+id/ic_notification"
        android:drawable="@android:drawable/ic_popup_reminder"
        android:gravity="center" />

    <!-- set a place holder Drawable so android:drawable isn't null -->
    <item
        android:id="@+id/ic_badge"
        android:drawable="@android:drawable/ic_popup_reminder" />
</layer-list>
```

Kemudian isilah ***icon*** \[*attribute value\]* pada menu dengan ***ic\_menu\_notif.***

```
<strong>android:icon="@drawable/ic_menu_notif"</strong>
```

```
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools" tools:context=".MainActivity">
    <item android:id="@+id/action_notif"
        android:title="@string/action_notif"
        <span style="color: #ff0000;"><strong>android:icon="@drawable/ic_menu_notif"</strong></span>
        android:orderInCategory="100"
        app:showAsAction="always" />
</menu>
```

<menu></menu>Buka kelas MainActivity.java, kemudian ***override*** method *onCreateOptionsMenu()*;

```
private LayerDrawable icon;
```

```
@Override
public boolean onCreateOptionsMenu(Menu menu) {
 // Inflate the menu; this adds items to the action bar if it is present.
 getMenuInflater().inflate(R.menu.menu_main, menu);
 MenuItem item = menu.findItem(R.id.action_notif);
 icon = (LayerDrawable) item.getIcon();
 return true;
}
```

3\. Simulasi, update jumlah notifikasi.

```
FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
fab.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View view) {
        Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                .setAction("Action", null).show();
        setBadgeCount(icon, mNotifCount++);
    }
});
```

![device-2015-12-07-163515](http://hangga.github.io/blog/wp-content/uploads/2015/12/device-2015-12-07-163515-510x731.png)

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2015/12/DynamicNotification.7z” title=”Download Source Lengkap” desc=”by : Hangga Aji Sayekti”\]

**Referensi:**

[http://www.jmhend.me/layerdrawable-menuitems](http://www.jmhend.me/layerdrawable-menuitems "http://www.jmhend.me/layerdrawable-menuitems")