---
id: 000676767
title: 'Arch Linux : Set Auto Swap-On'
date: '2024-05-22T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=000676767'
permalink: /2024/05/22/arch-linux-set-auto-swap-on/
image: /wp-content/uploads/2024/05/arch-btw.png
categories:
    - Linux
tags:
    - 'Arch Linux'
    - 'Arch-Linux'
    - 'Archlinux'
    - 'Linux'
---

Kali ini cuma ingin sedikit berbagi catatan kecil tentang bagaimana caranya agar Arch Linux menjadi Auto Swap-On a.k.a secara otomatis mengaktifkan swap saat boot. 
Kebetulan ini saya perlukan untuk membackup 1 RAM saya yang mati. 
Jadi ceritanya saya punya pc cadangan (dulunya laptop yang dioprek menjadi pc) untuk kerja sehari-hari dengan OS Arch Linux. 
Laptop ini lumayan menorehkan banyak cerita. Speknya pun lumayan garang pada masanya:
Lenovo T440s, Intel Core i5, HDD 1 TB, DDR 3 RAM 2 x 8 GB
Sehingga meskipun sudah tua bangka, saya sangat eman untuk membesituakannya. Meskipun udah ada Macbook Air M1, 2020 yang dibelikan sama mas Boss untuk kerjaan utama, namun kadang pc ini saya hidupkan untuk ngerjakan side project, atau sekedar oprek-oprek dll.
Nah, tiba-tiba beberapa waktu lalu 1 RAM-nya mati. Akhirnya sementara hidup dengan 1 RAM dan menyalakan Swap Memory.
Oke, langsung to the point.

### 1. Pastikan kita sudah punya partisi swap yang sudah dibuat. 
Jika belum, maka kita bisa membuatnya dengan perintah mkswap dan menambahkannya ke file /etc/fstab.

### 2. Buka file /etc/fstab dengan editor teks, misalnya dengan perintah:
```bBash
sudo nano /etc/fstab
```
### 3. Tambahkan baris berikut ke file fstab, menggantikan /dev/sdXY dengan lokasi partisi swap kita punya:
```Bash
/dev/sdXY none swap defaults 0 0
```
Contoh punya saya:
```Bash
/dev/sda2 none swap defaults 0 0
```
### 4. Kemudian simpan perubahan dengan menekan Ctrl + O, lalu tekan Enter. Keluar dari editor dengan menekan Ctrl + X.
Sekarang coba reboot.
Kemudian untuk memastikan swap telah diaktifkan, jalankan perintah:
```Bash
sudo swapon --show
```
Atau bisa juga dengan htop
```Bash
htop
```

Nah, sekarang pc Arch Linux kita udah auto Swap-On. 