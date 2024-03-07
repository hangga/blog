---
id: 3118
title: 'Sedikit cerita tentang Arabic User Interface'
date: '2016-11-24T09:21:46+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3118'
permalink: /2016/11/24/secuil-cerita-tentang-arabic-user-interface/
post_views_count:
    - '116'
image: /wp-content/uploads/2016/11/arabic-ux-besar.png
categories:
    - Coding
    - 'Corat coret'
    - 'Software Development'
tags:
    - 'Arabic Front-End'
    - 'Arabic UI'
    - 'Arabic UI/UX'
    - 'Arabic UX'
    - 'Arabic UX/UI'
---

***Arabic User Interface*** a.k.a ***Arabic UI*** bisa menjadi sangat penting apabila Anda ingin mendistribusikan aplikasi Anda ke negara-negara Timur Tengah atau barangkali suatu saat Anda mendapat order *project* dari Negara Arab. Tujuannya adalah agar aplikasi lebih nyaman digunakan oleh *user* disana.

Nah, berikut ada beberapa poin penting pada *Arabic UI*. Tapi tidak banyak, kan saya bilang hanya **cerita dikit** sesuai judul postingan ini.

### Arabic word

Pastikan menggunakan *Arabic Font*. Saya menggunakan ***AGA RASHEEQ*** bisa Anda unduh disini <http://www.myfontfree.com/download-agarasheeqbold-zip119368.htm>  
Jika Anda bekerja di *platform **Android***, Anda bisa mengkustom *font* dengan cara seperti biasa.

```
Typeface tfArabic = Typeface.createFromAsset (getAssets (), "AGA-Rasheeq-Bold.ttf");

NextButton.setTypeface (tfArabic);
```

### Rata Kanan

Mungkin karena orang Arab terbiasa membaca tulisan dari kanan sehingga ketika menggunakan aplikasi-pun mereka terbawa suasana gitu kali ya. So, jangan lupa, prinsipnya seperti baca ***Qur’an***. *Yak* dari kanan, semua dari kanan.

Pastikan semua rata kanan.

```
<pre class="">align:right;
```

<figure aria-describedby="caption-attachment-3121" class="wp-caption aligncenter" id="attachment_3121" style="width: 450px">![arabic-ux-design](http://hangga.github.io/blog/wp-content/uploads/2016/11/Arabic-UX-Design.jpg)<figcaption class="wp-caption-text" id="caption-attachment-3121">Sumber: http://istizada.com/</figcaption></figure>### Numbering

Karena angka Latin dan Arab itu beda, sehingga kita juga harus memikirkan *support Arabic Number*-nya.

```
<pre class="">public static String numToArabic(String str){
        char[] arabicChars = {'٠','١','٢','٣','٤','٥','٦','٧','٨','٩'};
        StringBuilder builder = new StringBuilder();
        for(int i =0;i<str.length();i++){
            if(Character.isDigit(str.charAt(i))){
                builder.append(arabicChars[(int)(str.charAt(i))-48]);
            } else {
                builder.append(str.charAt(i));
            }
        }
        return builder.toString();
    }
```

Kalo Anda udah gede tapi masih bingung dengan *Arabic Number*, silahkan belajar dulu sama [*Zaky*](https://www.youtube.com/watch?v=5A9cz4zLYHk) bareng anak saya.

<figure aria-describedby="caption-attachment-3125" class="wp-caption aligncenter" id="attachment_3125" style="width: 616px">![sumber:https://i.ytimg.com/vi/5A9cz4zLYHk/maxresdefault.jpg](http://hangga.github.io/blog/wp-content/uploads/2016/11/maxresdefault-700x394.jpg)<figcaption class="wp-caption-text" id="caption-attachment-3125">sumber:https://i.ytimg.com/vi/5A9cz4zLYHk/maxresdefault.jpg</figcaption></figure>### Kalender

<figure aria-describedby="caption-attachment-3124" class="wp-caption aligncenter" id="attachment_3124" style="width: 599px">![sumber:http://www.halalcertificationturkey.com/en/2014/10/hijri-new-year-mubarak/](http://hangga.github.io/blog/wp-content/uploads/2016/11/timthumb.jpg)<figcaption class="wp-caption-text" id="caption-attachment-3124">sumber:http://www.halalcertificationturkey.com/en/2014/10/hijri-new-year-mubarak/</figcaption></figure>Kalender yang digunakan di negara Arab selain *Gregorian* adalah kalender *Hijriah* ya bro.  
Untuk *Hijriah*nya tak perlu susah-susah membuat algoritma sendiri, sudah banyak *enginer* baik hati yang telah meng*open-source*kan hasil karyanya untuk sesama *developer*.

Contohnya ini <https://gist.github.com/fatfingers/6492017>

Cukup sekian dulu. *Arabic UI Asyik*. Salam ketik.