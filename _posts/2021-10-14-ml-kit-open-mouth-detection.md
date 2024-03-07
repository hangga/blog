---
id: 4877
title: 'ML Kit: Open Mouth Detection'
date: '2021-10-14T08:26:55+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4877'
permalink: /2021/10/14/ml-kit-open-mouth-detection/
image: /wp-content/uploads/2021/10/green-face-shrek-with-open-mouth-sky-background-shrek-889x500.jpg
categories:
    - Android
    - Coding
tags:
    - 'machine learning'
    - 'machine learning on mobile'
    - 'machine learning on mobile device'
    - 'ml kit'
    - 'open mouth detection'
tags: [sticky]
---

*Open mouth detection* atau deteksi mulut terbuka adalah salah satu contoh pengembangan dari *face detection*. Dan biasanya menjadi bagian dari *liveness detection*.  
Alhamdulillah kali ini masih diberi kesempatan untuk ekperimen seputar *ML on Mobile Device*. Salah satu yang menjadi objek ekperimen saya saat ini adalah *Google ML Kit*.

### Open Mouth Detection di Google ML kit

Jika anda meng-enable-kan option *FaceDetectorOptions.CONTOUR\_MODE\_ALL,* maka anda dapat mengakses semua titik kontur wajah yang terdeteksi.

Gambar dibawah ini menunjukkan semua titik kontur wajah yang dihasilkan oleh *Google ML Kit – Face Detection.*

![](https://raw.githubusercontent.com/hangga/hangga.github.io/main/images/face_contours-800.png)

Kemudian kumpulan titik-titik yang jumlahnya ada 9 titik pada *UPPER\_LIP\_BOTTOM* dan bisa kita tampung dalam *List* seperti ini.

```
List upperLipBottomContour = face.getContour(FaceContour.UPPER_LIP_BOTTOM).getPoints();
```

Begitu juga dengan *LOWER\_LIP\_TOP*.

```
List lowerLipTopContour = face.getContour(FaceContour.LOWER_LIP_TOP).getPoints();
```

##### Menghitung Lebar Mulut

Salah satu cara termudah menghitung lebar mulut adalah menghitung jarak antara *UPPER\_LIP\_BOTTOM* (bibir atas bagian bawah) dan *LOWER\_LIP\_TOP* (bibir bawah bagian atas).

Hitung menggunakan formula/rumus jarak 2 titik.

> d = √\[(x2 − x1)<sup>2</sup> + (y2 − y1)<sup>2</sup>\]

Jika *UPPER\_LIP\_BOTTOM* dan *LOWER\_LIP\_TOP* memiliki 9 titik, maka kita asumsikan titik tengahnya ada di indek ke 4, sehingga, koordinat (x, y) yg diambil adalah index ke 4.

![](https://hangga.github.io/blog/wp-content/uploads/2021/10/Screen-Shot-2021-10-14-at-15.39.29-700x354.png)

```
float x1 = upperLipBottomContour.get(4).x;
float y1 = upperLipBottomContour.get(4).y;

float x2 = lowerLipTopContour.get(4).x;
float y2 = lowerLipTopContour.get(4).y;
```

Lalu tinggal implementasikan rumusnya.

```
Double d = Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
```

Agar bisa di-*reusable*, bisa dibuat *method* seperti ini

```
private boolean isMouthOpen(Face face) {
	double d;
    List upperLipBottomContour = face.getContour(FaceContour.UPPER_LIP_BOTTOM).getPoints();
    List lowerLipTopContour = face.getContour(FaceContour.LOWER_LIP_TOP).getPoints();
        
    float x1 = upperLipBottomContour.get(4).x;
    float y1 = upperLipBottomContour.get(4).y;
        
    float x2 = lowerLipTopContour.get(4).x;
    float y2 = lowerLipTopContour.get(4).y;
    d = Math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    return d > 30.0;
}
```

Berikut contoh hasilnya pada *real time face detection*.

![](https://hangga.github.io/images/about/liveness-new.gif)

Selamat mencoba.

Referensi:  
<https://developers.google.com/ml-kit/vision/face-detection>  
<https://www.cuemath.com/geometry/distance-between-two-points/>