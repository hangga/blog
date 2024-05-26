---
id: 3088
title: 'Portecle: GUI alternative untuk keytool yang ciamik.'
date: '2016-09-30T10:32:43+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3088'
permalink: /2016/09/30/portecle-gui-alternative-untuk-keytool-yg-ciamik/
post_views_count:
    - '88'
image: /wp-content/uploads/2016/09/1497208880_firms-should-help-authorities-hack-encrypted-messages.jpg
categories:
    - Android
    - Coding
    - Linux
tags:
    - keytool
    - 'keytool alternative'
    - 'keytool alternative gui'
---

Pernah beberapa kali menggunakan *keytool* untuk menggenerate *SHA1* *fingeprint* dari *keystore* aplikasi. Kalo ndak salah waktu registrasi *facebook SDK* autentikasi untuk mendapatkan *app\_id* juga *Google Sign In*.

![google_si-android_3](http://hangga.github.io/blog/wp-content/uploads/2016/09/google_si-android_3.jpg)

Sakjane *keytool* sendiri merupakan utility yg sangat keren sekali dan saya tak meragukan itu. Hanya saja untuk menggunakannya harus paham beberapa *command*nya.  
Lihat saja [Keytool](http://docs.oracle.com/javase/6/docs/technotes/tools/solaris/keytool.html).

<figure aria-describedby="caption-attachment-3100" class="wp-caption aligncenter" id="attachment_3100" style="width: 616px">![http://android-er.blogspot.co.id/2012/12/displaying-sha1-certificate-fingerprint.html](http://hangga.github.io/blog/wp-content/uploads/2016/09/release_fingerprints-700x534.png)<figcaption class="wp-caption-text" id="caption-attachment-3100">http://android-er.blogspot.co.id/2012/12/displaying-sha1-certificate-fingerprint.html</figcaption></figure>Sampai kemudian pada suatu hari menemukan *tool* yg ciamik, cocok untuk *lazy coder* spt saya yg males *CLI*-an. Namanya toolnya adalah *portecle*.  
[Download portecle](portecle.sourceforge.net)

Setelah berhasil *download* langsung masuk direktori *portecle-1.9*(saat sy download versinya masih 1.9) di terminal.

```
$ java -jar portecle.jar
```

Langsung ***Open Keystore file*** atau bisa ***Ctrl+O***

![screenshot-portecle-1](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Portecle-1.png)

![screenshot-open-keystore-file-2](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Open-Keystore-File-2.png)

Masukkan password *keystore*nya.

![screenshot-password-for-keystore-medpress_ips-jks-3](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Password-for-Keystore-medpress_ips.jks-3.png)

Jika berhasil, kita akan mendapati item list keystore yg telah kita *import*. Untuk mendapatka informasi detilnya langsung di dobel klik ajah.

![screenshot-home-hangga-desktop-keystore-medpress-medpress_ips-jks-portecle-4](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-home-hangga-Desktop-Keystore-Medpress-medpress_ips.jks-Portecle-4.png)

Komplit sekali informasinya mulai dari *subject*, *version*, *serial number* sampai *SHA-1 Fingerprint*nya yg kita inginkan.

Kalu sudah ya tinggal *kopi paste* saja.

![screenshot-certificate-5](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Certificate-5.png)

Atau bisa juga di simpan dalam bentuk teks. Berkut caranya.

Pilih menu **Tools** -&gt; **Keystore Report** atau bisa **Ctrl+R**

![screenshot-home-hangga-desktop-keystore-medpress-medpress_ips-jks-portecle-6](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-home-hangga-Desktop-Keystore-Medpress-medpress_ips.jks-Portecle-6.png)

Tinggal klik **Copy**, lalu paste di editor dsb.

![screenshot-keystore-report-7](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Keystore-Report-7.png)

Hasilnya seperti ini.

```
Type: JKS
Provider: SUN
Entries: 1

Entry Alias: medpress_ips
Creation Date: Aug 13, 2015 5:51:41 PM WIB
Type: Key Pair
Certificates: 1

	Certificate 1 of 1
	Version: 3
	Subject: CN=Hangga Aji Sayekti
	Issuer: CN=Hangga Aji Sayekti
	Serial Number: 7F14 387C
	Valid From: Aug 13, 2015 5:51:41 PM
	Valid Until: Aug 6, 2040 5:51:41 PM
	Public Key: RSA (2,048 bits)
	Signature Algorithm: SHA256withRSA
	SHA-1 Fingerprint: C4:DE:95:1A:59:13:59:87:1F:1E:39:F5:8B:73:7D:ED:EF:6F:D1:F1
	MD5 Fingerprint: 57:39:21:3A:25:ED:BB:8D:9D:25:1D:30:05:A8:B9
```

Sudah itu saja, semoga bermanfaat.