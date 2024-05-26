---
id: 2768
title: 'Adding an existing project to GitHub'
date: '2016-01-05T04:05:38+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2768'
permalink: /2016/01/05/adding-an-existing-project-to-github/
post_views_count:
    - '63'
image: /wp-content/uploads/2016/01/jetpack-octocat-clouds-ab3c258e0b58dc8354ebb57139827a23dcf3849d14ee8c6795a67a7bcfde9fb4.jpg
categories:
    - Linux
    - 'Software Development'
    - Uncategorized
tags:
    - git
    - github
---

Postingan ini hanyalah sekedar catatan agar mudah untuk diingat dan dilihat kembali jika lupa. Baiklah mari menuju TKP.

1. Buat *Repository*nya dulu jika belum punya![repo-create](http://hangga.github.io/blog/wp-content/uploads/2016/01/repo-create.png).
2. Masuk ke *local project directory,* via *terminal* tentunya.
3. Inisialisasikan direktori tersebut sebagai **local repository**```
    $ git init<em>.</em>
    ```
4. *Add* semua file yg ada di *local repository,* lalu **commit.**```
    $ git add .
    ```
    
    ```
    $ git commit -m "First commit"
    ```
5. Tambahkan *URL repository* yg akan di **push.** ```
    $ git remote add origin https://github.com/hangga/ObservableSample.git
    ```
6. *Push* ke *remote repository*. Jangan lupa nge-*pull* dulu. ```
    $ git pull origin master
    $ git push origin master
    ```

Referensi : [https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/](https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/ "Open Link")