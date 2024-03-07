---
id: 2021
title: 'Cara nginstall Google Play Services di Genymotion'
date: '2014-09-12T10:41:19+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2021'
permalink: /2014/09/12/cara-nginstall-google-play-services-di-genymotion/
post_views_count:
    - '340'
categories:
    - Android
    - Coding
tags:
    - genymotion
    - 'Google Play Services'
    - 'install Google Play Services in genymotion'
---

***Genymotion*** bisa menjadi emulator *Android* alternatif untuk *developer.* Kelebihan *genymotion* salah satunya adalah lebih ringan, tapi kekurangannya adalah tdk *include google play services.* Sehingga untuk bisa men*debug* aplikasi yg didalamnya include *library* milik *Google,* terpaksa agan harus ng*install* *google play services* dulu. Ok, langsung ke **TeKaPe**  aja gan..

1\. Download *[Genymotion-ARM-Translation\_v1.1.zip](http://filetrip.net/dl?4SUOrdcMRv)*  
2\. Langsung Drag file ***Genymotion-ARM-Translation\_v1.1.zip*** ke jendela emulator *genymotion.*  
3\. Reboot adb.

```
sudo adb Reboot
```

4\. Download [Google Apps for Android 4.4](http://wiki.cyanogenmod.org/w/Google_Apps#gappsCM11)  
5\. Drag file ***gapps-kk-20140606-signed.zip*** ke jendela emulator *genymotion*.  
6\. Reboot adb.

Selesai, selamat mencoba, semoga lancar jaya…

[Referensi](http://stackoverflow.com/questions/20121883/how-to-install-google-play-services-in-a-genymotion-vm-with-no-drag-and-drop-su)