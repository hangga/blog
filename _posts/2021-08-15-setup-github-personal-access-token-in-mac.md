---
id: 4827
title: 'Setup Github Personal Access Token in Mac'
date: '2021-08-15T03:12:04+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4827'
permalink: /2021/08/15/setup-github-personal-access-token-in-mac/
image: /wp-content/uploads/2016/01/jetpack-octocat-clouds-ab3c258e0b58dc8354ebb57139827a23dcf3849d14ee8c6795a67a7bcfde9fb4.jpg
categories:
    - Coding
    - 'Software Development'
tags:
    - git
    - github
    - 'Personal Access Token'
    - 'Personal Access Token on Github'
    - 'Support for password authentication was removed'
---

Tahun lalu sudah diumumkan [disini](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/) kalo semua git operations bakal pake *PAT a.k.a Personal Access Token* untuk *authentication*-nya. Jadi tidak lagi menggunakan username dan password.

Tapi dasarnya saya malas, dulu saya abai bahkan lupa sampai akhirnya *ketanggor dewe* dan bingung dewe. 😁 Saat mau *push* atau *pull* ke *remote*, meskipun *user* dan *password* sudah benar, tetap saja akan *return error* 403.

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/Screen-Shot-2021-08-15-at-05.21.02-700x82.png)

<figure class="wp-caption aligncenter" style="width: 400px">![](https://hsto.org/files/965/274/447/965274447f3b4ad1ab9263039ada2589.jpg)<figcaption class="wp-caption-text">Duh piye ki, wingi ki isa je..🧐</figcaption></figure>

1\. Segera Buat *Personal Access Token* seperti petunjuk [disini](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)

2\. Buka ***Keychain Access.*** Semua password tersimpan disini setiap kali anda mengakses *browser* kemudian *login, register* dan lain sebagainya dan anda memilih Opsi simpan kata sandi.

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/Screen-Shot-2021-08-15-at-09.46.30-700x499.png)![](https://hangga.github.io/blog/wp-content/uploads/2021/08/Screen-Shot-2021-08-14-at-20.32.21-700x395.png)Pada side menu, pilih menu **Login.** Kemudian search **github**.

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/Screen-Shot-2021-08-15-at-09.48.53-700x425.png)

Pilih, double click. Kemudian c*opy **Access Token*** anda, lalu *paste* disini.

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/github-PAT-700x448.png)  
Kemudian ***Save Changes***.

Selesai. Saat ini kita bisa kembali push, pull dsb.

Semoga bermanfaat. 😊