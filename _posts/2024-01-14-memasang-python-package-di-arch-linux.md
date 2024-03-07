---
id: 5177
title: 'Memasang Python Package di Arch Linux'
date: '2024-01-14T09:36:18+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=5177'
permalink: /2024/01/14/memasang-python-package-di-arch-linux/
image: /wp-content/uploads/2024/01/articleocw-5c6632dd1fe9f.jpg
categories:
    - Linux
---

Alhamdulillah di awal tahun 2024 ini akhirnya kesampaian juga nyobain ***Python*** di project nyata. Dulu cuma bisa baca-baca dan coba-coba. Tapi saya mungkin termasuk orang yang tidak bisa belajar optimal khususnya bahasa pemrograman tanpa mencobanya di pekerjaan nyata. Jadi tantangannya harus benar-benar nyata. Haha.

Nah, alhamdulillah kebetulan sekali dapet tugas baru di kantor buat bermain-main dengan ular besar ini. Salah satu tantangan kerja di startup ya gini, harus siap untuk *multi role* macam pesawat F-16. Tapi bagi saya ini tantangan yang menyenangkan.

Nah, sebagai pengguna Arch Linux(maksudnya terlanjur pake dan sayang kalo mau ganti. Xixixi), memang harus terbiasa dengan ***Pacman***.

Jika cara yang umum dilakukan untuk menginstal atau memasang paket Python adalah dengan menggunakan ***pip*** misalnya

```
pip install nama_paket
```

Tapi jika kalian lakukan ini di Arch Linux, nanti pasti akan muncul error seperti ini:

![](https://hangga.github.io/blog/wp-content/uploads/2024/01/must-using-pacman.png)

Disini awalnya saya mencoba menjalankan file Python yang membutuhkan modul bernama **requests**. Lalu saya coba install pake pip dan muncul error tersebut.

Nah, untungnya pesan error tersebut sekaligus ngasih solusi yaitu mau install ***system-wide*** pake pacman, mau install di ***venv (virtual* environment)** atau mau pake **pipx**.

Nah, saya milih system-wide artinya kita menginstal paket tersebut di Python yang ada di OS, sehingga paket tersebut dapat digunakan oleh semua program atau skrip Python di komputer. Jadi nanti ketika saya menjalankan script lain dan membutuhkan paket tersebut, saya tidak perlu menginstal lagi karena sudah ada.

### 1. Install system-wide

Cara install system-wide sebenarnya juga sudah ada di pesan error itu tadi:

```
sudo pacman -S python-namapaketnya
```

Nah, langsung kita praktekkan untuk menginstall paket ***Beautifulsoup***:

```
[hangga@hangga-ArchLinux ~]$ sudo pacman -S python-beautifulsoup4
[sudo] password for hangga: 
resolving dependencies...
looking for conflicting packages...

```

Nanti akan lanjut seperti ini. Ada pesan tentang dependensi yang harus include beserta ukurannya. Kita pilih \[y\] saja.

```
Packages (2) python-soupsieve-2.5-1  python-beautifulsoup4-4.12.2-1

Total Download Size:   0,35 MiB
Total Installed Size:  2,13 MiB

:: Proceed with installation? [Y/n] y
:: Retrieving packages...
 python-soupsieve...    86,3 KiB  84,6 KiB/s 00:01 [######################] 100%
 python-beautiful...   271,9 KiB   192 KiB/s 00:01 [######################] 100%
 Total (2/2)           358,2 KiB   213 KiB/s 00:02 [######################] 100%
(2/2) checking keys in keyring                     [######################] 100%
(2/2) checking package integrity                   [######################] 100%
(2/2) loading package files                        [######################] 100%
(2/2) checking for file conflicts                  [######################] 100%
:: Processing package changes...
(1/2) installing python-soupsieve                  [######################] 100%
(2/2) installing python-beautifulsoup4             [######################] 100%
Optional dependencies for python-beautifulsoup4
    python-chardet: to autodetect character encodings
    python-lxml: alternative HTML parser
    python-html5lib: alternative HTML parser
:: Running post-transaction hooks...
(1/1) Arming ConditionNeedsUpdate...
[hangga@hangga-ArchLinux ~]$ 

```

### 2. Install di Virtual Environment

Jika kita ingin menginstall paket di virtual environment, maka kita bisa pake cara berikut ini:

```
python -m venv path/to/venv
```

Keuntungan cara ini, kita bisa mengelola dependensi proyek dan menginstal paket Python tanpa mengubah instalasi global Python di OS. *Virtual environment* sangat berguna untuk menghindari konflik versi antar proyek dan memastikan kebersihan dan portabilitas kode.

Selain itu, sebenarnya masih ada satu cara lagi yaitu menggunakan ***pipx***. Tapi tidak untuk dibahas kali ini karena saya sendiri belum pernah menggunakannya.

Sekian, Barangkali bermanfaat.

Terimakasih.