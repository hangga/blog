---
id: 2913
title: 'Error Reporting in Real Time'
date: '2016-03-28T23:16:44+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2913'
permalink: /2016/03/28/custom-error-reporting-in-android/
post_views_count:
    - '1057'
image: /wp-content/uploads/2016/03/error-1790611_1280.png
categories:
    - Android
    - Coding
tags:
    - 'avoid Force Close Error'
    - 'Force Close Error'
    - 'How to avoid Force Close Error in Android'
    - 'realtime error report android'
---

Hal terpenting yang harus dilakukan dalam pengembangan *mobile apps* ketika memasuki tahap testing adalah, bagaimana mengelola *error reporting* dengan baik. Tujuannya adalah agar setiap bug dapat segera dilaporkan dan kemudian dengan cepat diperbaiki. Di *platform* Android hal ini sangat terasa sekali karena banyaknya *vendor device* dengan *behaviour* yang berbeda-beda sehingga dapat terjadi *bug* yang berbeda pula. Bisa jadi di satu *device* tidak terjadi, tapi di lain *device* terjadi *error*.

> Tujuannya adalah agar setiap bug dapat segera dilaporkan dan kemudian dengan cepat diperbaiki.

*Error* yang relatif mudah di tangani secara teknis adalah *error* yang masuk ke dalam *Exception,* bukan *logic error* atau *flow error* sehingga kita dapat melihatnya dengan memasang *Log.e()*. Tapi masalahnya adalah*Exception* yang tidak tertangkap oleh blok *try catch* dan terlebih ketika *apk* sudah berada ditangan *Tester* dan terjadi *error* yang berbeda dengan *device* yang kita gunakan. Sehingga jalan terbaiknya adalah menampilkan *Log.error* ke dalam *Activity*. Nah, itu yang akan kita bahas.

1. Setiap *exception* yang tidak tertangkap, akan dilarikan ke dalam method UncaughtExceptionHandler. Jika ingin membuat behaviour yg berbeda, maka kita tinggal meng-implements darinya. ```
    package com.research.hangga.simplecrashreport;
    
    import android.app.Activity;
    import android.content.Intent;
    import android.os.Build;
    import android.util.Log;
    
    import java.io.PrintWriter;
    import java.io.StringWriter;
    
    /**
     * Created by hangga on 11/03/16.
     */
    public class MyExceptionHandler implements
            java.lang.Thread.UncaughtExceptionHandler {
    
        private final Activity context;
        private final String LINE_SEPARATOR = "\n";
    
        public MyExceptionHandler(Activity activity) {
            this.context = activity;
        }
    
        @Override
        public void uncaughtException(Thread thread, Throwable ex) {
            StringWriter stackTrace = new StringWriter();
            ex.printStackTrace(new PrintWriter(stackTrace));
            StringBuilder builder = new StringBuilder();
            builder.append("************ CAUSE OF ERROR ************\n\n");
            builder.append(stackTrace.toString());
            Log.e("ERROR", ""+stackTrace.toString());
            builder.append("\n************ DEVICE INFORMATION ***********\n");
            builder.append("Brand: ");
            builder.append(Build.BRAND);
            builder.append(LINE_SEPARATOR);
            builder.append("Device: ");
            builder.append(Build.DEVICE);
            builder.append(LINE_SEPARATOR);
            builder.append("Model: ");
            builder.append(Build.MODEL);
            builder.append(LINE_SEPARATOR);
            builder.append("Id: ");
            builder.append(Build.ID);
            builder.append(LINE_SEPARATOR);
            builder.append("Product: ");
            builder.append(Build.PRODUCT);
            builder.append(LINE_SEPARATOR);
            builder.append("\n************ FIRMWARE ************\n");
            builder.append("SDK: ");
            builder.append(Build.VERSION.SDK);
            builder.append(LINE_SEPARATOR);
            builder.append("Release: ");
            builder.append(Build.VERSION.RELEASE);
            builder.append(LINE_SEPARATOR);
            builder.append("Incremental: ");
            builder.append(Build.VERSION.INCREMENTAL);
            builder.append(LINE_SEPARATOR);
    
            Intent intent = new Intent(context, ActivityShowError.class);
            intent.putExtra("error", builder.toString());
            context.startActivity(intent);
    
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(10);
        }
    }
    ```
2. Siapkan Activity untuk menampilkan error. ```
    package com.research.hangga.simplecrashreport;
    
    import android.os.Bundle;
    import android.support.v7.app.AppCompatActivity;
    import android.widget.TextView;
    
    public class ActivityShowError extends AppCompatActivity {
    
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_activity_show_error);
    
            TextView txtError = (TextView) findViewById(R.id.txtError);
            <span style="color: #000080;">String error = getIntent().getStringExtra("error");
            int a = error.indexOf("Caused by");
            txtError.setText(error.substring(a));</span>
        }
    }
    ```
3. Pasang di setiap Activity, atau akan lebih mudah jika anda memiliki parent class Activity, tinggal pasang disana. ```
        private int mNotifCount = 0;
        private LayerDrawable icon;
    
        private GoogleApiClient client;
    
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            <span style="color: #000080;"><strong>Thread.setDefaultUncaughtExceptionHandler(new MyExceptionHandler(this));</strong></span>
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_main);
            Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
            setSupportActionBar(toolbar);
    
            FloatingActionButton fab = null;// = (FloatingActionButton) findViewById(R.id.fab);
            fab.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                            .setAction("Action", null).show();
                    setBadgeCount(icon, mNotifCount++);
                }
            });
            // ATTENTION: This was auto-generated to implement the App Indexing API.
            // See https://g.co/AppIndexing/AndroidStudio for more information.
            client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
        }
    ```
    
    ![device-2016-03-29-061022](http://hangga.github.io/blog/wp-content/uploads/2016/03/device-2016-03-29-061022.png)

![device-2016-03-29-062131](http://hangga.github.io/blog/wp-content/uploads/2016/03/device-2016-03-29-062131.png)

Tinggal *copy paste*, lalu kirim ke *developer*.