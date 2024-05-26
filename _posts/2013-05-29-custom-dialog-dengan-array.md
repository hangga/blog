---
id: 1564
title: 'Custom Dialog dengan Array'
date: '2013-05-29T03:11:50+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1564'
permalink: /2013/05/29/custom-dialog-dengan-array/
post_views_count:
    - '214'
categories:
    - Android
    - Coding
    - 'Dunia IT'
tags:
    - android
    - 'android custom dialog'
    - 'custom dialog'
    - 'custom dialog array'
---

Di Android, kita juga dapat membuat alert dialog yang bentuknya seperti pada gambar diatas. Yuk, langsung menuju TKP.

![custom-dialog](http://hangga.github.io/blog/wp-content/uploads/2013/05/custom-dialog.png)

```
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
```

<span style="line-height: 1.5em;">Kemudian saya membuat method baru yg saya beri nama </span>***ShowCustomDialog()***

```
private void ShowCustomDialog(){
final CharSequence[] pilihChar = {"Satu", "Dua", "Tiga"};

AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);

builder.setTitle("Pilihan").setItems(pilihChar, new DialogInterface.OnClickListener() {
public void onClick(DialogInterface dialog, int which) {
switch(which){
case 0 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[0], Toast.LENGTH_SHORT).show();
break;
case 1 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[1], Toast.LENGTH_SHORT).show();
break;
case 2 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[2], Toast.LENGTH_SHORT).show();
break;
}
}
});
builder.setOnCancelListener(new OnCancelListener() {
@Override
public void onCancel(DialogInterface dialog) {

}
});
builder.create();
builder.show();
}
[/code]

Berikut Source lengkapnya

[code language="java"]package com.nyekrip.buttonevent;

import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;

public class MainActivity extends Activity {

private Button myButton;

@Override
protected void onCreate(Bundle savedInstanceState) {
super.onCreate(savedInstanceState);
setContentView(R.layout.activity_main);

myButton = (Button) findViewById(R.id.myButton);
myButton.setOnClickListener(ButtonKlik);
}

private OnClickListener ButtonKlik = new OnClickListener() {

@Override
public void onClick(View v) {
ShowCustomDialog();
}
};

private void ShowCustomDialog(){
final CharSequence[] pilihChar = {"Satu", "Dua", "Tiga"};

AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);

builder.setTitle("Setting").setItems(pilihChar, new DialogInterface.OnClickListener() {
public void onClick(DialogInterface dialog, int which) {
switch(which){
case 0 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[0], Toast.LENGTH_SHORT).show();
break;
case 1 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[1], Toast.LENGTH_SHORT).show();
break;
case 2 :
Toast.makeText(MainActivity.this, "Pilih : "+pilihChar[2], Toast.LENGTH_SHORT).show();
break;
}
}
});
builder.setOnCancelListener(new OnCancelListener() {
@Override
public void onCancel(DialogInterface dialog) {

}
});
builder.create();
builder.show();
}

}
```

<input class="myButton" type="button" value="Download Source"></input>