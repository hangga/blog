---
id: 20240717
title: 'Matplotlib : Visualisasi Sederhana Riwayat Hidup 4 Imam Madzhab'
date: '2024-07-17T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=20240717'
permalink: /2024/07/22/imam-madzhab-lives-with-python/
image: /wp-content/uploads/2024/01/articleocw-5c6632dd1fe9f.jpg
categories:
- Linux
tags:
- 'Python'
- 'Py'
- 'Coding'
- 'Linux'
---

Visualisasi data adalah komponen penting dalam analisis data, memungkinkan kita untuk menggali wawasan yang mungkin tersembunyi dalam angka-angka mentah.
Pada artikel ini, kita akan membahas bagaimana Matplotlib dapat digunakan untuk memvisualisasikan data historis tentang kehidupan empat Imam besar dalam Islam.

## Matplotlib
Dalam ekosistem Python, salah satu library paling populer dan serbaguna untuk membuat grafik dan plot adalah Matplotlib. Library ini tidak hanya kuat, tetapi juga cukup fleksibel untuk menghasilkan visualisasi yang berkualitas tinggi dan interaktif. 

Matplotlib memungkinkan kita untuk membuat berbagai jenis plot, termasuk garis, batang, pie, histogram, dan banyak lagi. Dengan Matplotlib, kita dapat dengan mudah menyesuaikan setiap aspek dari grafik yang kita buat, mulai dari warna dan gaya garis hingga label dan legenda. Kemampuan ini sangat berguna ketika kita ingin menyampaikan informasi kompleks dengan cara yang lebih mudah dipahami dan menarik secara visual.

## Contoh Studi Kasus
Dalam contoh ini, kita akan fokus pada pembuatan timeline yang menggambarkan masa hidup empat Imam utama dalam tradisi Islam Sunni: Imam Abu Hanifah, Imam Malik bin Anas, Imam Syafi'i, dan Imam Ahmad bin Hanbal. Kita akan memanfaatkan fitur-fitur Matplotlib untuk menandai tahun kelahiran dan wafat mereka serta menambahkan informasi tentang tempat lahir dan wafat. Dengan pendekatan ini, kita dapat memberikan pandangan yang lebih lengkap dan informatif tentang kehidupan mereka.

## Install Matploitlib
### Install di Arch Linux
Kebetulan saya adalah pengguna Arch Linux. Untuk menginstal Matplotlib di Arch Linux, kita dapat menggunakan pacman, 
yang merupakan manajer paket default untuk Arch Linux.
```Bash
sudo pacman -S python-matplotlib
```
### Import Matploitlib di Python
```Python
import matplotlib.pyplot as plt
```
Kita bisa cek versi berapa yang kita install dengan cara ini:
```Python
print("Matplotlib terinstal dengan versi:", plt.__version__)
```

### Data Imam
Membuat buat variabel imams untuk menampung daftar imam yang berisi data empat Imam, termasuk nama, tahun lahir, tahun 
wafat, tempat lahir, dan tempat wafat:
```Python
imams = [
    {"name": "Imam Abu Hanifah", "birth": 699, "death": 767, "birthplace": "Kufa, Irak", "deathplace": "Baghdad, Irak"},
    {"name": "Imam Malik bin Anas", "birth": 711, "death": 795, "birthplace": "Madinah, Arab Saudi", "deathplace": "Madinah, Arab Saudi"},
    {"name": "Imam Syafi'i", "birth": 767, "death": 820, "birthplace": "Gaza, Palestina", "deathplace": "Fustat, Mesir"},
    {"name": "Imam Ahmad bin Hanbal", "birth": 780, "death": 855, "birthplace": "Baghdad, Irak", "deathplace": "Baghdad, Irak"}
]
```
### Membuat Figure
Kemudian kita buat sebuah figur baru dengan ukuran 14x6 inci untuk plot:
```Python
plt.figure(figsize=(14, 6))
```
### Ploting Data
Kemudian kita lanjut ke ploting datanya:
```Python
for imam in imams:
    plt.plot([imam['birth'], imam['death']], [imam['name'], imam['name']], marker='o')
    plt.text(imam['birth'] - 2, imam['name'], f"{imam['birth']} ({imam['birthplace']})", va='center', ha='right', fontsize=9, color='blue')
    plt.text(imam['death'] + 2, imam['name'], f"{imam['death']} ({imam['deathplace']})", va='center', ha='left', fontsize=9, color='red')
```
#### Penjelasan
1. Mengiterasi setiap imam dalam daftar `imams`.
2. Membuat garis horizontal dari tahun lahir (`birth`) hingga tahun wafat (`death`) dengan titik di kedua ujungnya 
   `(marker='o')`.
3. Menambahkan teks di dekat tahun lahir dengan informasi tahun dan tempat lahir, sedikit bergeser ke kiri (`birth - 2`),
   dan di dekat tahun wafat dengan informasi tahun dan tempat wafat, sedikit bergeser ke kanan (`death + 2`).
### Menambahkan Label dan Judul:
```Python
plt.xlabel('Year')
plt.title('Timeline of the Lives of the Four Imams with Birth and Death Places')
plt.yticks(range(len(imams)), [imam['name'] for imam in imams])
plt.grid(True)
plt.xlim(650, 900)
```
Kemudian untuk menampikan plot, kita panggil fungsi `plt.show()`:
```Python
plt.show()
```
<img src="https://github.com/hangga/imam-madzhab-lives/raw/main/Figure_1.png?raw=true"/>
## Kesimpulan
Matplotlib adalah alat yang sangat kuat untuk visualisasi data dalam Python. Dengan Matplotlib, kita dapat dengan mudah 
membuat grafik yang informatif dan menarik, yang sangat berguna dalam analisis data, presentasi, dan publikasi ilmiah.

Seperti biasa, kode lengkap bisa dilihat [disini](https://github.com/hangga/imam-madzhab-lives).