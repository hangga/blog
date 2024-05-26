---
id: 2728
title: 'Observer Pattern in Android'
date: '2015-12-17T07:31:23+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2728'
permalink: /2015/12/17/observer-pattern-in-android/
post_views_count:
    - '42'
image: /wp-content/uploads/2015/12/First-Language-Coding.jpg
categories:
    - Android
    - Coding
tags:
    - Observer
    - 'Observer Pattern'
    - 'Observer Pattern in Android'
    - Observer-observable
---

### Apa itu Observer Pattern

*Observer Pattern* adalah pola desain perangkat lunak di mana ada suatu *object*(disebut sebagai *Observable*) secara otomatis memberi notifikasi kepada semua *object* yang memiliki *dependency*(disebut *Observer*) setiap ada perubahan data pada *Observable*.

<figure aria-describedby="caption-attachment-2736" class="wp-caption aligncenter" id="attachment_2736" style="width: 500px">![https://en.wikipedia.org/wiki/Observer_pattern#Structure](http://hangga.github.io/blog/wp-content/uploads/2015/12/500px-Observer.svg_.png)<figcaption class="wp-caption-text" id="caption-attachment-2736">https://en.wikipedia.org/wiki/Observer\_pattern#Structure</figcaption></figure>Sedangkan di Android, Observable pattern sudah di *handle* oleh kelas bawaan *Java* yg sangat keren pada kelas ***java.util.Observable.*** Sehingga untuk dapat menggunakan fitur-fitur Observable dapat dilakukan dengan cara mengimport kelas ***java.util.Observable***.

```
import java.util.Observable;
```

### Contoh kasus

Untuk memudahkan dalam memahami Observer Pattern di Android, dapat dilihat pada skenario berikut ini:

1\. *ActivityMain, Activity 2* dan *Activity 3* adalah sama-sama *Observer*. *ActivityMain* dapat memanggil *Activity 2* dan *Activity 3*.

![skenario-1](http://hangga.github.io/blog/wp-content/uploads/2015/12/skenario-1-510x360.png)

2\. Berikutnya adalah simulasi *update value* pada *Observable* yaitu berupa jumlah notifikasi.

![skenario-2](http://hangga.github.io/blog/wp-content/uploads/2015/12/skenario-2-510x360.png)

3\. *Observable* akan memberi notifikasi kepada semua *Observer* secara otomatis setiap ada perubahan data.

![skenario-3](http://hangga.github.io/blog/wp-content/uploads/2015/12/skenario-3-510x361.png)

Object-object yg dibutuhkan antara lain:

1. *Observable object*  
    Bertindak sebagai object Observable adalah kelas ****Notif.java**** ```
    package com.research.hangga.myresearch.Objects;
    
    import android.util.Log;
    
    import java.util.Observable;
    
    /**
     * Copyright (C) PT. Sebangsa Bersama - All Rights Reserved
     * Unauthorized copying of this file, via any medium is strictly prohibited
     * Proprietary and confidential
     * Originally written by Hangga Aji Sayekti, 16/12/15
     */
    public class Notif extends Observable {
    
        private int count;
    
        public int getCount() {
            return count;
        }
    
        public int update(){
            this.count++;
            setChanged();
            notifyObservers();
            return this.count;
        }
    
        public void setCount(int count) {
            Log.d("SB", String.valueOf(this.count));
            this.count = count;
            setChanged();
            notifyObservers();
        }
    
    }
    ```
2. Observers object dalam hal ini adalah *ActivityMain, ActivitySecond* dan *ActivityThird* sehingga ketiganya harus meng*implements* **Observer.** ```
    package com.research.hangga.myresearch;
    
    import android.content.Intent;
    import android.os.Bundle;
    import android.support.v7.app.AppCompatActivity;
    import android.support.v7.widget.Toolbar;
    import android.view.Menu;
    import android.view.MenuItem;
    import android.view.View;
    import android.widget.Button;
    
    import com.research.hangga.myresearch.Objects.BaseApplication;
    
    import java.util.Observable;
    import java.util.Observer;
    
    public class MainActivity extends AppCompatActivity implements Observer {
        @Override
        public void update(Observable observable, Object data) {
            notifView.setCount(baseApplication.getNotif().getCount());
        }
    
        private BaseApplication baseApplication;
        private NotifView notifView;
    
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);
            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            toolbar.setTitle(R.string.activity_main);
            toolbar.setNavigationIcon(R.mipmap.reindeer_icon);
            setSupportActionBar(toolbar);
    
            baseApplication = (BaseApplication) getApplication();
            baseApplication.getNotif().addObserver(this);
    
            notifView = new NotifView(MainActivity.this);
    
            Button btnUpdate = (Button) findViewById(R.id.btnUpdate);
            btnUpdate.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    baseApplication.getNotif().update();
                }
            });
    
            Button btnSecond = (Button) findViewById(R.id.btnSecond);
            btnSecond.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    startActivity(new Intent(MainActivity.this,
                            SecondActivity.class));
                }
            });
    
            Button btnThird = (Button) findViewById(R.id.btnThird);
            btnThird.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    startActivity(new Intent(MainActivity.this,
                            ThirdActivity.class));
                }
            });
        }
    
        @Override
        public boolean onCreateOptionsMenu(Menu menu) {
            // Inflate the menu; this adds items to the action bar if it is present.
            getMenuInflater().inflate(R.menu.menu_main, menu);
            MenuItem itemNotif = menu.findItem(R.id.action_notif);
            itemNotif.setActionView(notifView);
            notifView.setCount(baseApplication.getNotif().getCount());
            return true;
        }
    
        @Override
        public boolean onOptionsItemSelected(MenuItem item) {
            // Handle action bar item clicks here. The action bar will
            // automatically handle clicks on the Home/Up button, so long
            // as you specify a parent activity in AndroidManifest.xml.
            int id = item.getItemId();
    
            //noinspection SimplifiableIfStatement
            if (id == R.id.action_notif) {
                return true;
            }
    
            return super.onOptionsItemSelected(item);
        }
    }
    ```

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2015/12/ObservablePattern.7z” title=”Download Source Lengkap” desc=”by : Hangga Aji Sayekti”\]