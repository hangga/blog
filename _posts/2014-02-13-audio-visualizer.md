---
id: 15
title: 'Membuat Record Audio dengan efek Audio visualizer'
date: '2014-02-13T08:46:06+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=15'
permalink: /2014/02/13/audio-visualizer/
post_views_count:
    - '142'
suevafree_template:
    - full
image: /wp-content/uploads/2014/02/Audio-peak-indicator-630x210.jpg
categories:
    - Android
    - Coding
tags:
    - amplitudometer
    - android
    - audiowave
---

<span style="line-height: 1.5em;">Bismillah..</span>

Pada kasus berikut ini, yg menjadi bahan bahasan adalah bagaimana mebuat aplikasi *record audio* dengan efek *audiovisualizer* dengan input *microphone.*  Akhirnya saya mengakalinya dengan cara yg boleh dibilang bodoh. Yaitu dengan menggunakan *RelativeLayout* yang dirubah-rubah tinggi atau ukuranya selama proses *record* berlangsung.

Saya memanfaatkan kelas *RecorderTask* yang meng*extends* dari kelas *TimerTask.* Kemudian dikelas inilah proses perubahan tinggi *RelativeLayout* selama proses *record* berlangsung dimana tinggi *Relativelayout* sesuai dengan nilai *amplitudo*nya.

```
private class RecorderTask extends TimerTask{
        private MediaRecorder recorder;
        public RecorderTask(MediaRecorder recorder){
            this.recorder = recorder;
        }
        public void run(){
            runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    yAmplitudo = recorder.getMaxAmplitude()/ 100;
                    RelativeLayout.LayoutParams param = (RelativeLayout.LayoutParams) relativeMeter.getLayoutParams();
                    param.height = yAmplitudo;
                    relativeMeter.setLayoutParams(param);
                }
            });
        }
    }
```

Berikut kode selengkapnya. Silahkan Anda bisa mengembangkannya sendiri.

[![device-2014-02-13-034349](http://hangga.github.io/blog/wp-content/uploads/2014/02/device-2014-02-13-034349.png)](http://hangga.github.io/blog/?p=15)1. Layout xmlnya adalah seperti dibawah ini.

```
<pre class="brush:xml"><RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:paddingBottom="@dimen/activity_vertical_margin"
    android:paddingLeft="@dimen/activity_horizontal_margin"
    android:paddingRight="@dimen/activity_horizontal_margin"
    android:paddingTop="@dimen/activity_vertical_margin"
    tools:context=".RecordAudioActivity" >

    <Button
        android:id="@+id/btnStart"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_alignParentBottom="true"
        android:layout_marginBottom="185dp"
        android:textSize="12sp"
        android:text="Start" />

    <Button
    	android:id="@+id/btnStop"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_toRightOf="@+id/btnStart"
        android:layout_alignParentBottom="true"
        android:layout_marginBottom="185dp"
        android:textSize="12sp"
        android:enabled="false"
        android:text="Stop" />

    <RelativeLayout
        android:layout_width="22dp"
        android:layout_height="120dp"
        android:padding="2dp"
        android:layout_above="@+id/btnStop"
        android:layout_centerHorizontal="true"
        android:background="#000000"
        android:layout_marginBottom="18dp">
    	<RelativeLayout
	        android:id="@+id/relativeMeter"
	        android:layout_width="fill_parent"
	        android:layout_height="0dp"
	        android:background="#19FF34"
	        android:layout_alignParentBottom="true" >
	    </RelativeLayout>
    </RelativeLayout>

</RelativeLayout>
```

2\. Kemudian *source* lengkap nya.

```
package com.hangga.amplitudometer;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Timer;
import java.util.TimerTask;

import android.media.MediaRecorder;
import android.os.Bundle;
import android.app.Activity;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

public class RecordAudioActivity extends Activity {

	RelativeLayout relativeMeter;

	MediaRecorder recorder;
	Timer timer;

	TextView risultato;
	Button btnStart;
	Button btnStop;

	String filePath = null;

	int yAmplitudo; 

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		relativeMeter = (RelativeLayout) findViewById(R.id.relativeMeter);

		btnStart = (Button) findViewById(R.id.btnStart);
		btnStop = (Button) findViewById(R.id.btnStop);

		recorder = new MediaRecorder();
	    recorder.setAudioSource(MediaRecorder.AudioSource.MIC);
	    recorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
	    recorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
	    //recorder.setOutputFile("/dev/null"); 
	    filePath = "/sdcard/"+getRandomString()+".m4a";
	    recorder.setOutputFile(filePath);

	    try {
			recorder.prepare();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	    btnStart.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				recorder.start();
				timer = new Timer();
				timer.scheduleAtFixedRate(new RecorderTask(recorder), 0, 300);
				btnStart.setEnabled(false);
				btnStop.setEnabled(true);
			}
		});

	    btnStop.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				goStop();
			}
		});

	}

	private void goStop(){
		recorder.stop();
		recorder.release();
		timer.cancel();
		timer.purge();
		btnStart.setEnabled(true);
		btnStop.setEnabled(false);
		Toast.makeText(getApplicationContext(), "Saved : "+filePath, Toast.LENGTH_SHORT).show();
		finish();
	}

	private class RecorderTask extends TimerTask{
	    private MediaRecorder recorder;
	    public RecorderTask(MediaRecorder recorder){
	        this.recorder = recorder;
	    }
	    public void run(){
	        runOnUiThread(new Runnable() {
	            @Override
	            public void run() {
	            	yAmplitudo = recorder.getMaxAmplitude()/ 100;
	                RelativeLayout.LayoutParams param = (RelativeLayout.LayoutParams) relativeMeter.getLayoutParams();
	                param.height = yAmplitudo;
	                relativeMeter.setLayoutParams(param);
	            }
	        });
	    }
	}

	public String getRandomString() {
        SecureRandom random = new SecureRandom();
        String randomString = new BigInteger(130, random).toString(32);
        return(randomString);
    }
}
```