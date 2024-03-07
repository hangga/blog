---
id: 3711
title: 'Trik Tokopedia: Search berulang-ulang tanpa merubah urutan, filter dan kategorinya'
date: '2017-12-12T05:22:22+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3711'
permalink: /2017/12/12/trik-searching-produk-tokopedia-tanpa-reset-filter-dan-urutannya/
image: /wp-content/uploads/2017/12/image-keren-tokopedia-lengkapi-layanan-pembelian-pulsa-miliknya-dengan-pengisian-saldo-platform-game.jpg
categories:
    - 'Corat coret'
tags:
    - 'belanja di tokopedia'
    - 'pengalaman belanja di tokopedia'
    - tokopedia
    - 'Trik searching produk Tokopedia'
    - 'Trik searching Tokopedia'
---

Saya termasuk pelanggan setia tokopedia yang telah aktif bertransaksi sejak tahun 2014. Namun diantara kemudahan dan kenyamanan berbelanja yang saya dapatkan di tokopedia, ada salah satu fitur yang menurut saya agak kurang nyaman yaitu pada fitur pencarian.  
Berikut *step reproduce* problemnya:

1. Ketik kata kunci pada **field pencarian**, misalnya saya mencari dengan kata kunci ***niqab yaman***.
2. Urutkan dari yang **termurah**.
3. Filter hasil pencarian dengan rating **bintang 5**, hasilnya seperti berikut.![](http://hangga.github.io/blog/wp-content/uploads/2017/12/niqab-yaman-urut-700x394.png)
4. Lakukan pencarian lagi dengan kata kunci lain, misal **niqab mesir**. Hasilnya seperti berikut ![](http://hangga.github.io/blog/wp-content/uploads/2017/12/niqab-mesir-reset-urut-filter-700x394.png)
5. Nah perhatikan yang terjadi adalah **urutan dan filter ter-reset seperti kondisi *default***. Nah inilah yang menurut saya kurang nyaman.

Namun hal ini bisa saya akali. Caranya adalah sebagai berikut.

1\. Lakukan pencarian kemudian perhatikan url-nya

<span style="color: #0000ff;">https://www.tokopedia.com/search?st=product&amp;q=niqab+yaman</span>

Nah ketemu bahwa <span style="color: #0000ff;">**<span style="color: #000000;">q=</span>niqab+yaman**</span> adalah parameter kata kunci pencarian.

2\. Sekarang urutkan dari yang termurah, lalu perhatikan urlnya.

<span style="color: #0000ff;">https://www.tokopedia.com/search?st=product&amp;q=niqab+yaman&amp;ob=3</span>

Lihat ada tambahan parameter <span style="color: #0000ff;">**&amp;ob=3**</span> setelah kata kunci

3\. Nah sekarang coba urutkan mulai dari yang termahal

Perhatikan parameter <span style="color: #0000ff;">**&amp;ob=3**</span> berubah menjadi <span style="color: #0000ff;">**&amp;ob=4**</span>

4\. Sekarang coba filter untuk rating bintang 5 dan perhatikan urlnya

<span style="color: #0000ff;">https://www.tokopedia.com/search?st=product&amp;q=niqab+yaman&amp;ob=3&amp;rt=5</span>

ada tambahan parameter <span style="color: #0000ff;">**&amp;rt=5**</span>

Sehingga jika kita ingin mencari dengan kata kunci lain tanpa harus merubah posisi urutan dan filternya, kita **cukup mengganti parameter kata kuncinya saja**

<span style="color: #0000ff;"><span style="color: #000000;">q=</span>katakunci</span>  
<span style="color: #0000ff;"><span style="color: #000000;"> q=</span>katakunci1+katakunci2</span>  
<span style="color: #0000ff;"><span style="color: #000000;"> q=</span>katakunci1+katakunci2+katakunci3</span>

misalnya :

https://www.tokopedia.com/search?st=product&amp;q=<span style="color: #0000ff;">**niqab+yaman**</span>&amp;ob=3&amp;rt=5

https://www.tokopedia.com/search?st=product&amp;q=<span style="color: #0000ff;">**niqab+mesir**</span>&amp;ob=3&amp;rt=5

https://www.tokopedia.com/search?st=product&amp;q=<span style="color: #0000ff;">**sarung+anak**</span>&amp;ob=3&amp;rt=5

https://www.tokopedia.com/search?st=product&amp;q=<span style="color: #0000ff;">**kopiah**</span>&amp;ob=3&amp;rt=5

![](http://hangga.github.io/blog/wp-content/uploads/2017/12/searching-tokopedia-edited-700x220.png)

Cukup sekian semoga bermanfaat.