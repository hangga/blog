---
id: 4236
title: 'Optical Character Recognition(OCR) dengan Google Vision'
date: '2020-11-19T09:29:09+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=4236'
permalink: /2020/11/19/optical-character-recognitionocr-dengan-google-vision/
image: /wp-content/uploads/2020/11/1200px-Portable_scanner_and_OCR_video.webm-889x500.jpg
categories:
    - Android
    - Coding
    - 'Dunia IT'
tags:
    - 'aplikasi mencontek'
    - 'Google Vision'
    - 'Image to text'
    - OCR
    - 'Optical Character Recognition'
---

#### Sekilas tentang OCR

*Optical Character Recognition* atau disingkat menjadi *OCR* adalah sebuah proses pengenalan atau pememindaian karakter secara optical. Atau boleh dibilang *OCR* ini merupakan rekayasa teknologi yang mampu mengenali teks dari sebuah gambar seperti foto, hasil *scan* dokumen.

Sehingga teknologi *OCR* ini bisa menjawab kebutuhan pemindaian dan penyalinan teks dalam waktu singkat. Kalau anda sering memindai/scan dokumen, software dan aplikasi *OCR* bisa mempersingkat waktu untuk mengedit berkas yang tidak memiliki *soft copy*.

Diantara manfaat *OCR* antara lain  
– *Data entry* secara otomatis.  
– Menyalin/meng*edit* atau men*contek(*ha3x) buku hasil *scan*  
– Mengkonversi tulisan tangan ke dokumen digital.  
– Membuat dokumen tulis tangan agar bisa di-*index*  
– Dan masih banyak lagi.

#### Teknologi Lawas

Sebenarnya *OCR* ini adalah teknologi lawas a.k.a sudah ditemukan sejak lama. Tahun 1914 ilmuwan ***Emanuel Goldberg*** sudah mampu membuat mesin yang mampu mengubah karakter tercetak ke dalam kode standard telegraf. Kemudian ***Edmund Fourier*** mengembangkan ***Optophone*** yang merupakan mesin pemindai jinjing yang mampu menghasilkan bunyi sesuai dengan karakter khusus yang tercetak di dokumen.

Baru pada dekade 1990an, *OCR* banyak dimanfaatkan oleh perpustakaan-perpustakaan untuk mendigitalkan surat kabar bersejarah. Proyek digitalisasi buku-buku bersejarah dan sumber referensi primer ini mulai menjamur memasuki abad 21 karena didukung oleh perkembangan pesat di bidang perangkat keras, perangkat lunak dan Internet.

#### Proses OCR

Adapun proses OCR ini umumnya ada 4 tahap.

1. Extraction of Character boundaries from Image,
2. Building a Convolutional Neural Network(ConvNet) in remembering the Character images,
3. Loading trained Convolutional Neural Network(ConvNet) Model,
4. Consolidating ConvNet predictions of characters.

#### Menggunakan library/ API

Cara termudah dalam membuat aplikasi OCR adalah dengan menggunakan API atau library. Dengan cara ini kita tidak perlu pusing membuat algoritmanya karena sudah dilakukan oleh API atau library. He3x enak kan. Diantara contoh yang saya tahu adalah Tesseract dan Google Vision.

#### Google Vision untuk Android

![](https://raw.githubusercontent.com/hangga/PaijemOCR/main/device-2020-11-14-162235.png)

Seperti biasa, buka gradle lalu tambahkan pada dependency

```
implementation 'com.google.android.gms:play-services-vision:11.8.0'
```

Kita buat *attach camera*, kemudian *convert* menjadi *bitmap*.  
Kemudian kita perlu men*create instance* sebuah *frame* dengan image data berupa *bitmap* tersebut. Kemudian *frame* ini nanti akan di*detect* oleh *TextRecognizer* milik *Google Vision* lalu hasilnya ditampung dalam *StringBuilder*.

Sederhana sekali bukan.

Main *logic*nya ada disini:

```
    private void goProcess() {
        TextRecognizer txtRecognizer = new TextRecognizer.Builder(getApplicationContext()).build();
        if (!txtRecognizer.isOperational()) {
            txtView.setText(R.string.error_prompt);
        } else {
            Frame frame = new Frame.Builder().setBitmap(bitmap).build();
            SparseArray items = txtRecognizer.detect(frame);
            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < items.size(); i++) {
                TextBlock item = (TextBlock) items.valueAt(i);
                strBuilder.append(item.getValue());
                strBuilder.append("\n");
              
            }
            txtView.setText(strBuilder.toString().substring(0, strBuilder.toString().length() - 1));
        }
    }
```

Atau mau langsun coba di Android Studio bisa *checkout* disini  
<https://github.com/hangga/PaijemOCR>

Referensi:  
<https://mti.binus.ac.id/2017/07/03/optical-character-recognition-ocr/>  
<https://review.bukalapak.com/techno/mengenal-teknologi-ocr-bisa-mengekstrak-teks-dari-gambar-17503>  
[https://id.wikipedia.org/wiki/Pengenalan\_karakter\_optis](https://id.wikipedia.org/wiki/Pengenalan_karakter_optis)  
<https://medium.com/datadriveninvestor/4-simple-steps-in-building-ocr-1f41c66099c1>