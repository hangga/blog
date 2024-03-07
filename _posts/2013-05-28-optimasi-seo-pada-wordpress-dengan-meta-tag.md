---
id: 1533
title: 'Optimasi SEO pada WordPress dengan memanfaatkan meta tag'
date: '2013-05-28T07:31:37+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1533'
permalink: /2013/05/28/optimasi-seo-pada-wordpress-dengan-meta-tag/
post_views_count:
    - '294'
categories:
    - 'Dunia IT'
    - 'Komputer Info'
tags:
    - 'meta description'
    - 'meta keywords'
    - 'meta tag'
    - 'Optimasi SEO'
    - 'Search Engine Optimization'
    - SEO
    - wordpress
    - 'wordpress SEO'
---

[![12925_514616348568130_1984462092_n](http://hangga.github.io/blog/wp-content/uploads/2013/05/12925_514616348568130_1984462092_n.jpg)](http://hangga.github.io/blog/wp-content/uploads/2013/05/12925_514616348568130_1984462092_n.jpg)Salah satu teknik Optimasi *SEO* pada *website* kita adalah dengan memanfaatkan *meta tag*.

## Apa itu ***meta tag?***

***Meta tag*** adalah sebuah tag HTML yang dapat berisi deskripsi atau kata kunci dari sebuah website. *Meta tag* tidak dapat dilihat oleh pengunjung *website* namun terbaca oleh mesin pencari. Oleh karena itu dengan pemanfaatan meta tag yang benar, kita dapat menaikkan index website/ blog kita di mesin pencari.

Meta tag description dapat kita isi dengan deskripsi tentang website/ blog kita. Sedangkan meta tag keyword dapat kita isi dengan kata kunci/ keyword yang sering digunakan oleh pengunjung untuk mencari informasi.

## Optimasi ***Meta*** tag pada ***WordPress***

Nah pada *wordpress*, kita dapat melakukan optimasi *meta tag*  dengan cara sebagai berikut.

1. <span style="line-height: 13px;">Masuk ke *Dashboard*, kemudian Buka menu ***Apperance** -&gt; **Editor***.</span>
2. Lihat menu ***Templates*** di sisi kanan, pilih *Header (header.php).*
3. Di bawah tag header \[code language=”html”\]&lt;head&gt;\[/code\] Tambahkan *script*   
    berikut ini : ```
    <pre class="brush:xml"><meta name="DESCRIPTION" content="<?php echo get_the_title($ID); ?> " />
    ```
    
    Script diatas berfungsi menampilkan tag Description yang berisi sesuai judul postingan kita secara dinamis.
    
    Kemudian tambahkan juga script berikut ini
    
    ```
    <pre class="brush:php"><meta name="KEYWORDS" content="<?php $posttags = get_the_tags();
    if ($posttags) {
    foreach($posttags as $tag) {
    echo ' ,'.$tag->name;
    }
    }
    ?>">
    ```
    
    Berfungsi untuk menampilkan meta tag keywords yang berisi tags yang sesuai dengan postingan kita.

Selamat mencoba, semoga bermanfaat…