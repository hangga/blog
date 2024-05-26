---
id: 3379
title: 'Beberapa trik mengatasi OutOfMemoryError Bitmap'
date: '2017-04-21T09:18:03+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3379'
permalink: /2017/04/21/beberapa-trik-mengatasi-outofmemoryerror-bitmap/
post_views_count:
    - '110'
image: /wp-content/uploads/2017/04/1.jpg
categories:
    - Android
    - Coding
tags:
    - BItmap
    - outofmemory
    - OutOfMemoryError
---

Saat bermain-main *image processing* menggunakan *bitmap*, saya sering menemukan log error seperti ini

> E/AndroidRuntime﹕ FATAL EXCEPTION: main  
> java.lang.OutOfMemoryError  
> at android.graphics.BitmapFactory.nativeDecodeStream(Native Method)  
> at android.graphics.BitmapFactory.decodeStream(BitmapFactory.java:623)  
> at android.graphics.BitmapFactory.decodeFile(BitmapFactory.java:378)  
> …  
> …

Penyebabnya tidak lain tidak bukan adalah karena ukuran memori terlalu besar sehingga mesin tidak mampu menangani dan terjadi *hang*. Biasanya terjadi pada *device* dengan spek rendah seperti punya saya. Nah berikut ini adalah beberapa trik untuk mengatasi *OutOfMemoryError:*

#### 1. Turunkan ukuran dengan skala menggunakan Option -&gt; inSampleSize

Sample size adalah jumlah pixel dalam kedua dimensi yang sesuai dengan pixel tunggal dalam bitmap yang didecode.

Misalnya:  
inSampleSize == 2 mengembalikan gambar berukuran 1/2 ukuran(width x height) asli, dan 1/4 jumlah pixel gambar asli.  
inSampleSize == 4 mengembalikan gambar berukuran 1/4 ukuran(width x height) asli, dan 1/16 jumlah pixel gambar asli.

Code:

```
BitmapFactory.Options options = new BitmapFactory.Options();
options.inSampleSize = 2;
Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
```

#### 2. Atau bisa juga dengan inisiasi ukuran secara manual:

```
BitmapFactory.Options options = new BitmapFactory.Options();
options.inJustDecodeBounds = true;
bitmap = BitmapFactory.decodeStream(stream, null, options);
int imageHeight = options.outHeight;
int imageWidth = options.outWidth;

options.inJustDecodeBounds = false;
// recreate the stream
// make some calculation to define inSampleSize
options.inSampleSize = ?;
Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
```

#### 3. Pilih Color Scheme sesuai kebutuhan.

Di kelas ***BitmapFactory.java*** sudah tersedia beberapa *Color Scheme* yang dapat digunakan sesuai kebutuhan.

Adapun beberapa penjelasan setiap *Color Scheme* adalah sebagai berikut:

***ALPHA\_8***  
Setiap pixel disimpan sebagai saluran translucency (alpha) tunggal. Ini sangat berguna untuk menyimpan masker secara efisien misalnya. Tidak ada informasi warna yang disimpan. Dengan konfigurasi ini, setiap pixel membutuhkan 1 byte memori.

***RGB\_565***  
Setiap pixel disimpan pada 2 byte dan hanya chanel RGB yang dikodekan: merah disimpan dengan presisi 5 bit (32 nilai yang mungkin), hijau disimpan dengan 6 bit presisi (64 nilai yang mungkin) dan biru disimpan dengan 5 bit Presisi.

Konfigurasi ini bisa menghasilkan sedikit artifak visual tergantung dari konfigurasi sumbernya. Misalnya, tanpa dithering, hasilnya mungkin menunjukkan warna kehijauan. Untuk mendapatkan hasil yang lebih baik dithering sebaiknya diaplikasikan.

Konfigurasi ini mungkin berguna bila menggunakan bitmap yang buram yang tidak memerlukan keakuratan warna tinggi.

***ARGB\_4444***  
Setiap pixel disimpan pada 2 byte. Tiga chanel warna RGB dan saluran alfa (tembus) disimpan dengan presisi 4 bit (16 nilai yang mungkin.).  
Konfigurasi ini sebagian besar berguna jika aplikasi perlu menyimpan informasi tembus tetapi juga perlu untuk menghemat memori. Dianjurkan untuk menggunakan {@link # ARGB\_8888} alih-alih konfigurasi ini.

Catatan: seperti {@link android.os.Build.VERSION\_CODES # KITKAT}, semua bitmap yang dibuat dengan konfigurasi ini akan dibuat menggunakan {@link # ARGB\_8888}. @deprecated Karena kualitas konfigurasi yang buruk ini, disarankan untuk menggunakan {@link # ARGB\_8888}.

***ARGB\_8888***  
Setiap pixel disimpan pada 4 byte. Setiap saluran (RGB dan alpha for translucency) disimpan dengan 8 bit presisi (256 nilai yang mungkin.).  
Konfigurasi ini sangat fleksibel dan menawarkan kualitas terbaik. Ini harus digunakan bila memungkinkan.

Code:

```
BitmapFactory.Options options = new BitmapFactory.Options();
options.inPreferredConfig = Config.RGB_565;
Bitmap bitmap = BitmapFactory.decodeStream(stream, null, options);
```

Sekian semoga bermanfaat.

Referensi :  
<http://developer.android.com/reference/android/graphics/Bitmap.Config.html>  
<https://developer.android.com/reference/android/graphics/BitmapFactory.Options.html>