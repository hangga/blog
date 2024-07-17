---
id: 000676767
title: 'Arch Linux : Set Auto Swap-On'
date: '2024-05-22T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=000676767'
permalink: /2024/05/22/arch-linux-set-auto-swap-on/
image: /wp-content/uploads/2024/05/arch-neofetch.jpg
categories:
    - Linux
tags:
    - 'Arch Linux'
    - 'Arch-Linux'
    - 'Archlinux'
    - 'Linux'
---

Kali ini cuma ingin sedikit berbagi catatan kecil tentang bagaimana caranya agar Arch Linux menjadi Auto Swap-On a.k.a secara otomatis mengaktifkan swap saat boot. 
## Qodarullah Tiba-tiba Ram Mati
Kebetulan ini saya perlukan untuk membackup 1 RAM saya yang mati. 
Jadi ceritanya saya punya pc cadangan (dulunya laptop yang dioprek menjadi pc. Tentu saja minta bantuan teman lah. 
Ndak berani sy oprek sendiri) untuk kerja sehari-hari dengan OS Arch Linux. 

Nah, tiba-tiba saya nyalakan ndak mau nyala dia. Mau bongkar sendiri juga ndak berani, karena bukan ahlinya.
Ketahuan kalo Ram 1 
mati setelah saya bawa ke Monster
Laptop(Jasa Service Laptop punya teman).

<p align="center">
<img src="https://raw.githubusercontent.com/hangga/blog/gh-pages/wp-content/uploads/2024/05/arch-linux-lenovo.jpeg" width="550"/>
</p>

Laptop ini lumayan menorehkan banyak cerita. Speknya pun lumayan garang pada masanya:

> Lenovo T440s, Intel Core i5, HDD 1 TB, DDR 3 RAM 2 x 8 GB

Sehingga meskipun sudah tua bangka, saya sangat _eman_ untuk membesituakannya. 

Meskipun udah ada <a target="_blank" href="https://hangga.github.io/blog/2021/03/03/setup-macbook-m1-2020-for-development/">Macbook Air M1, 2020</a> yang dibelikan sama mas Boss untuk kerjaan utama, namun kadang pc ini saya hidupkan untuk ngerjakan side project, atau sekedar oprek-oprek dll.

Nah, tiba-tiba beberapa waktu lalu 1 RAM-nya mati dan berakhir menjadi gantungan kunci.

<p align="center">
<img src="https://raw.githubusercontent.com/hangga/blog/gh-pages/wp-content/uploads/2024/05/ram-g-k.jpeg" width="440"/>
</p>

Akhirnya sementara pc hidup dengan 1 RAM dan menyalakan Swap Memory.

Oke, langsung to the point step-by-step membuat Arch Linux auto swap on:

### 1. Pastikan sudah punya partisi swap. 
Jika sudah punya, bisa cek partisi mana yang menjadi SWAP. Bisa cek dengan `lsblk`. Nanti akan muncul daftar partisi yang ada. 

Ini contoh punya saya:

```Bash
[hangga@hangga-ArchLinux ~]$ lsblk
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda       8:0    0 931,5G  0 disk 
├─sda3    8:3    0     1K  0 part 
├─sda5    8:5    0 170,2G  0 part 
├─sda6    8:6    0 155,8G  0 part 
├─sda7    8:7    0  49,8G  0 part [SWAP]
├─sda8    8:8    0 186,2G  0 part /run/media/hangga/DataB
├─sda9    8:9    0 186,2G  0 part 
└─sda10   8:10   0 183,4G  0 part /

```

Tapi jika belum punya partisi SWAP, maka kita bisa membuatnya dengan perintah `mkswap` dan menambahkannya ke file `/etc/fstab`.

### 2. Buka file /etc/fstab dengan editor teks idola, misalnya dengan `nano`:
```Bash
sudo nano /etc/fstab
```
### 3. Tambahkan baris berikut ke file `fstab`, menggantikan /dev/sdXY dengan lokasi partisi swap kita punya:
```Bash
/dev/sdXY none swap defaults 0 0
```
Contoh punya saya:
```Bash
/dev/sda7 none swap defaults 0 0
```
### 4. Kemudian simpan perubahan dengan menekan `Ctrl + O`, lalu tekan Enter. Keluar dari editor dengan menekan `Ctrl + X`.

Kalau langsung ingin mengaktifkan SWAP tanpa harus reboot, bisa gunakan perintah ini:
```
sudo swapon --all --verbose
```

Untuk membuktikan auto swap-on ketika boot, sekarang langsung coba `reboot`.

Kemudian untuk memastikan swap telah aktif, jalankan perintah:
```Bash
sudo swapon --show
```
Contoh status SWAP yang sudah aktif akan seperti ini ya manteman:
```
NAME      TYPE       SIZE USED PRIO
/dev/sda7 partition 49,8G   0B   -2
```

Atau bisa juga dengan htop
```Bash
htop
```
<p align="center">
<img src="https://raw.githubusercontent.com/hangga/blog/gh-pages/wp-content/uploads/2024/05/untung-ada-swap.jpg" width="550">
</p>

Nah, sekarang pc Arch Linux udah auto Swap-On.

Sekian, terimakasih. 
