---
id: 2006
title: 'Android app development: Connect your device on Ubuntu/Linuxmint'
date: '2014-09-10T11:45:34+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2006'
permalink: /2014/09/10/android-app-development-connect-your-device-on-ubuntulinuxmint/
post_views_count:
    - '263'
image: /wp-content/uploads/2014/09/linux_mint_13_wallpaper_by_nightrampage-d59zh75-889x500.jpg
categories:
    - Android
    - Coding
    - Linux
    - Uncategorized
tags:
    - 'android development on linux'
    - 'android linux'
    - 'Connect your device on Linuxmint'
    - 'Connect your device on Ubuntu'
    - 'Connect your device on Ubuntu/ Linuxmint'
    - 'install android linux'
---

Ini adalah masalah pertama saya dulu saat men*develop* aplikasi *Android*. Idealnya sih *compiling* ya sekalian *run on real device* (kalo punya) karena emulator bawaan *Sdk Android* cukup berat.

#### **Permasalahan**

Kebetulan saya menggunakan *Linux Mint* dan permasalahan terjadi. Permasalahannya adalah, *device* tidak terdeteksi… 🙂 sehingga tidak bisa langsung *run on device* dari *Eclipse IDE*. Maklum, *device* kw dan pinjaman lagi…

#### **Penyebab**

Sebenarnya, penyebab masalah ini adalah *USB Vendor ID* milik device kita belum terdaftar di file konfigurasi ***51-android.rules***. Jika file ***51-android.rules*** belum ada, maka kita perlu membuatnya.

#### **Solusi**

Login sebagai administrator, lalu buat file di <span style="color: #008000;">/etc/udev/rules.d/51-android.rules. <span style="color: #000000;">Formatnya seperti di bawah ini.</span></span>

<span style="color: #000000;"></span>

```
SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="plugdev"
```

Kemudian *edit* pake *nano*, seperti ini.

```
sudo nano <span style="color: #008000;">/etc/udev/rules.d/51-android.rules. </span>
```

![Screenshot-Terminal](http://hangga.github.io/blog/wp-content/uploads/2014/09/Screenshot-Terminal.png)

![Screenshot-Terminal-1](http://hangga.github.io/blog/wp-content/uploads/2014/09/Screenshot-Terminal-1.png)

Sedangkan *USB Vendor ID* dapat kita lihat dengan memanggil *lsusb*.

![Screenshot-Terminal-dab](http://hangga.github.io/blog/wp-content/uploads/2014/09/Screenshot-Terminal-dab.png)

Setelah itu, *restart adb* nya.

Selesai..