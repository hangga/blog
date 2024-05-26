---
id: 1812
title: 'Contoh Penggunaan Fragment'
date: '2014-03-07T04:44:07+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1812'
permalink: /2014/03/07/contoh-penggunaan-fragment/
post_views_count:
    - '266'
diarjolite_template:
    - full
image: /wp-content/uploads/2014/03/device-2014-03-06-232159-480x270.png
categories:
    - Android
    - Coding
    - Uncategorized
tags:
    - 'contoh fragment'
    - fragment
    - viewpager
---

[![device-2014-03-06-232132](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232132-180x300.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232132.png)[![device-2014-03-06-232151](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232151-180x300.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232151.png)[![device-2014-03-06-232159](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232159-180x300.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232159.png)[![device-2014-03-06-232206](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232206-180x300.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-06-232206.png)

Salah satu kegunaan *Fragment* adalah untuk menangani *Activity* dengan multi konten. Biasanya dikombinasikan dengan *ViewPager.* Sehingga untuk berpindah-pindah konten tinggal di slide ke kanan atau kekiri. Ok, langsung ke TKP saja.

1\. Gunakan *android-support-v13.jar*

[![Screenshot](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot.png)

2\. Buat dua buah kelas *Fragment*. *FragmentSatu* dan *FragmentDua*.

```
<pre class="brush:xml"><?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="@android:color/holo_blue_light" >

	<TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="Fragment Satu"
        android:textColor="@android:color/white"
        android:textSize="20sp"/>
</RelativeLayout>
```

```
package com.hangga.ikifragment.fragment;

import com.hangga.ikifragment.R;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class FragmentSatu extends Fragment {

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.lay_satu, container, false);
		return view;
	}

}
```

```
<pre class="brush:xml"><?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:background="@android:color/holo_orange_dark" >
    <TextView
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="Fragment Dua"
        android:textColor="@android:color/white"
        android:textSize="20sp"/>

</LinearLayout>
```

```
package com.hangga.ikifragment.fragment;

import com.hangga.ikifragment.R;

import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class FragmentDua extends Fragment{

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		View view = inflater.inflate(R.layout.lay_dua, container, false);
		return view;
	}

}
```

3\. Kemudian membuat *Fragment Adapter*.

```
package com.hangga.ikifragment.fragment;

import android.support.v13.app.FragmentPagerAdapter; 

public class FragmentAdapter extends FragmentPagerAdapter{

	FragmentSatu fragmentSatu;
	FragmentDua fragmentDua;

	public FragmentAdapter(android.app.FragmentManager fm) {
		super(fm);
	}

	@Override
	public android.app.Fragment getItem(int index) {
		switch (index) {
		case 0:
			fragmentSatu = new FragmentSatu();
			return fragmentSatu;

		case 1:
			fragmentDua = new FragmentDua();
			return fragmentDua;
		}
		return null;
	}

	@Override
	public int getCount() {
		return 2;
	}

}
```

4\. Pasang di *Activity* menggunakan *ViewPager*.

```
<pre class="brush:xml"><RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:paddingBottom="@dimen/activity_vertical_margin"
    android:paddingLeft="@dimen/activity_horizontal_margin"
    android:paddingRight="@dimen/activity_horizontal_margin"
    android:paddingTop="@dimen/activity_vertical_margin"
    tools:context=".MainActivity" >
	<android.support.v4.view.ViewPager
    	android:id="@+id/myPager"
    	android:layout_below="@+id/indicator"
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"
        android:layout_marginTop="0dp"
        >
    </android.support.v4.view.ViewPager>

</RelativeLayout>
```

```
package com.hangga.ikifragment;

import com.hangga.ikifragment.fragment.FragmentAdapter;

import android.os.Bundle;
import android.app.Activity;
import android.support.v4.view.ViewPager;
import android.view.Menu;

public class MainActivity extends Activity {

	ViewPager myPager;
	FragmentAdapter fragmentAdapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		myPager = (ViewPager) findViewById(R.id.myPager);
		fragmentAdapter = new FragmentAdapter(getFragmentManager());
		myPager.setAdapter(fragmentAdapter);
		myPager.setCurrentItem(0);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
```

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2014/03/ikifragment.7z” title=”Download Source Lengkap” desc=”Tolles Archiv”\]