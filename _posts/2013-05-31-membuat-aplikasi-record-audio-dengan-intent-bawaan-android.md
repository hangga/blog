---
id: 1590
title: 'Membuat Aplikasi Record Audio dengan Intent bawaan Android'
date: '2013-05-31T02:38:52+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1590'
permalink: /2013/05/31/membuat-aplikasi-record-audio-dengan-intent-bawaan-android/
post_views_count:
    - '201'
categories:
    - Android
    - Coding
    - 'Dunia IT'
tags:
    - android
    - 'android record audio'
    - 'android record audio example'
    - 'android record audio example code'
    - 'record audio'
---

Ada dua cara untuk membuat Record Audio. Menggunakan Intent Bawaan Android. atau mau Coding sendiri. Nah berikut ini jika kita menggunakan intent bawaan Android.

1\. Buat ***Activity*** Baru *MainActivity* sajalah namanya.  
2\. Buatlah layout xml nya, kira2 seperti ini:

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

<Button
android:id="@+id/record"
android:layout_width="fill_parent"
android:layout_height="wrap_content"
android:text="Record"
/>

</RelativeLayout>
```

3\. Kita hanya perlu memanggil intent RECORD\_SOUND\_ACTION bawaan Android.

```
Intent intent = new Intent(MediaStore.Audio.Media.RECORD_SOUND_ACTION);
startActivityForResult(intent, RECORD_REQUEST);
```

<span style="line-height: 1.5;">Oh ya, jangan lupa buat variabel konstanta</span>

```
final static int RECORD_REQUEST = 1;
```

4\. Kemudian di tangkap melalui onActivityResult.

```
@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
if(requestCode == RECORD_REQUEST){
if (resultCode == RESULT_OK){
savedUri = data.getData();
Toast.makeText(MainActivity.this,"Saved: " + savedUri.getPath(), Toast.LENGTH_LONG).show();
}
}
}
```

<span style="line-height: 1.5;">5. Kalau mau liha source lengkapnya.</span>

```
package com.hangga.audiorecordtest;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {

final static int RECORD_REQUEST = 1;

Uri savedUri;
Button btnRecord;

@Override
public void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);
btnRecord = (Button)findViewById(R.id.record);
btnRecord.setOnClickListener(new Button.OnClickListener(){

@Override
public void onClick(View arg0) {
Intent intent = new Intent(MediaStore.Audio.Media.RECORD_SOUND_ACTION);
startActivityForResult(intent, RECORD_REQUEST);
}
});
}

@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
if(requestCode == RECORD_REQUEST){
if (resultCode == RESULT_OK){
savedUri = data.getData();
Toast.makeText(MainActivity.this,"Saved: " + savedUri.getPath(), Toast.LENGTH_LONG).show();
}
}
}
}
```

6\. Hasilnya.[![device-2013-05-30-225910](http://hangga.github.io/blog/wp-content/uploads/2013/05/device-2013-05-30-225910.png)](http://hangga.github.io/blog/wp-content/uploads/2013/05/device-2013-05-30-225910.png)  
[![device-2013-05-30-060228](http://hangga.github.io/blog/wp-content/uploads/2013/05/device-2013-05-30-060228.png)](http://hangga.github.io/blog/wp-content/uploads/2013/05/device-2013-05-30-060228.png)