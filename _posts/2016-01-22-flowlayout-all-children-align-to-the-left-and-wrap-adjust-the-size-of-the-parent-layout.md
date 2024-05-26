---
id: 2836
title: 'FlowLayout : All children align to left, and wrap adjust parent size.'
date: '2016-01-22T04:30:30+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2836'
permalink: /2016/01/22/flowlayout-all-children-align-to-the-left-and-wrap-adjust-the-size-of-the-parent-layout/
post_views_count:
    - '36'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - 'ajust parent size'
    - 'android flowlayout'
    - 'auto align to left'
    - 'wrap child'
---

### Apa itu FlowLayout

*FlowLayout* adalah sebuah *layout* yang memiliki behaviour seperti ini:

- Semua *child* otomatis *align rigt* atau *align left*.
- Semua *child* *auto wrap* menyesuaikan ukuran *parent-*nya

Lebih jelasnya seperti gambar dibawah.

### Screenshot

![device-2016-01-21-194050](http://hangga.github.io/blog/wp-content/uploads/2016/01/device-2016-01-21-194050-510x808.png)

### Membuat kelas FlowLayout

Kelas *FlowLayout* bisa diturunkan dari *ViewGroup,* kemudian ditambahkan *custom behaviour* pada beberapa Override methodnya.

```
package com.research.hangga.autoalign;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

/**
 * Created by hangga on 21/01/16.
 */

public class FlowLayout extends ViewGroup {

    private int paddingHorizontal;
    private int paddingVertical;

    public FlowLayout(Context context) {
        super(context);
        init();
    }

    public FlowLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
        init();
    }

    public FlowLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        paddingHorizontal = this.getPaddingLeft();
        paddingVertical = this.getPaddingTop();
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int mHeight = 0;

        int childLeft = getPaddingLeft();
        int childTop = getPaddingTop();
        int myWidth = resolveSize(getWidth(), widthMeasureSpec);
        int wantedHeight = 0;

        for (int i = 0; i < getChildCount(); i++) {

            final View thisChild = getChildAt(i);
            if (thisChild.getVisibility() == View.GONE) {
                continue;
            }

            thisChild.measure(getChildMeasureSpec(widthMeasureSpec, 0, thisChild.getLayoutParams().width),
                    getChildMeasureSpec(heightMeasureSpec, 0, thisChild.getLayoutParams().height));

            int childWidth = thisChild.getMeasuredWidth();
            int childHeight = thisChild.getMeasuredHeight();

            mHeight = Math.max(childHeight, mHeight);

            if (childWidth + childLeft + getPaddingRight() > myWidth) {
                childLeft = getPaddingLeft();
                childTop += paddingVertical + mHeight;
                mHeight = childHeight;
            }

            childLeft += childWidth + paddingHorizontal;
        }
        wantedHeight += childTop + mHeight + getPaddingBottom();
        setMeasuredDimension(myWidth, resolveSize(wantedHeight, heightMeasureSpec));
    }

    @Override
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int childLeft = getPaddingLeft();
        int childTop = getPaddingTop();
        int lineHeight = 0;

        int myWidth = right - left;

        for (int i = 0; i < getChildCount(); i++) {
            final View child = getChildAt(i);
            if (child.getVisibility() == View.GONE) {
                continue;
            }
            int childWidth = child.getMeasuredWidth();
            int childHeight = child.getMeasuredHeight();
            lineHeight = Math.max(childHeight, lineHeight);
            if (childWidth + childLeft + getPaddingRight() > myWidth) {
                childLeft = getPaddingLeft();
                childTop += paddingVertical + lineHeight;
                lineHeight = childHeight;
            }
            child.layout(childLeft, childTop, childLeft + childWidth, childTop + childHeight);
            childLeft += childWidth + paddingHorizontal;
        }
    }
}

```

### How to use

```
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:paddingLeft="@dimen/activity_horizontal_margin"
    android:paddingRight="@dimen/activity_horizontal_margin"
    android:paddingTop="@dimen/activity_vertical_margin"
    android:paddingBottom="@dimen/activity_vertical_margin"
    tools:context="com.research.hangga.autoalign.MainActivity">

    <com.research.hangga.autoalign.FlowLayout
        android:layout_width="fill_parent"
        android:layout_height="match_parent">
        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="kungfu"/>
        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Pechak Silat"/>

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Krav Maga"/>

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Shaolin Kungfu"/>

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Cimande"/>

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Mixed Martial Art"/>

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="American Kick Boxing"/>

        </com.research.hangga.autoalign.FlowLayout>
</RelativeLayout>
```

\[dl url=”https://github.com/MabulJaya/FloatLayoutSample” title=”Download Source Lengkap” desc=”by : Hangga Aji Sayekti”\]