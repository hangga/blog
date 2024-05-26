---
id: 3909
title: 'Harapan agar error handling Tokopedia lebih baik'
date: '2018-10-19T06:43:14+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3909'
permalink: /2018/10/19/harapan-agar-error-handling-tokopedia-lebih-baik/
image: /wp-content/uploads/2017/12/image-keren-tokopedia-lengkapi-layanan-pembelian-pulsa-miliknya-dengan-pengisian-saldo-platform-game.jpg
categories:
    - 'Corat coret'
    - 'Dunia IT'
tags:
    - bug
    - error
    - 'error handling'
    - tokopedia
    - 'tokopedia error'
---

Satu lagi saya menemukan sesuatu yang saya rasa kurang nyaman pada [tokopedia.com](https://www.tokopedia.com). Bukan *major bug* sih, namun sepertinya butuh penanganan lebih baik mengingat budaya membaca bagi sebagian masyarakat indoesia masih belum baik, termasuk saya juga *he3x..*

## *Steps to reproduce*

1\. Saya memilih produk ini buat display dagangan-dagangan baju, daster dan gamis punya istri. Pilih, kemudian **klik tombol beli**.

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/produknya-700x394.png)  
2\. Masuk ke **keranjang belanja**, lalu ***checkout** s*eperti biasa, **pilih jasa kurir**.

## *Issue*

1\. Saat memuat data kurir terjadi *timeout*.

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/time-out-edit-700x394.png)  
2\. Kemudian muncul pesan <span style="color: #000080;">“Gagal mengambil data”</span>, namun lucunya ada *action link* untuk mencoba me*request* data lagi.

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/gagal-mengambil-data-700x378.png)  
3\. Poin 1 dan 2 terus menerus terulang sampai 2 hari hingga membuat saya penasaran. Padahal jika *field* ini kosong, muncul *hint error warnig* supaya wajib diisi.

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/wajib-diisi-toped-700x300.png)

## Identifikasi

Karena penasaran, sehingga sayapun mencoba mengidentifikasi apa penyebabnya.

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/tokopedia-inspect-700x394.png)

Terpantau *url* yang ditembak untuk mengambil data kurir berdasarkan kota tinggal saya adalah sebagai berukut:

```
https://gw.tokopedia.com/v2/rates?callback=jQuery19108977403708117607_1539919319473&service=sameday&names=gojek,grab&origin=1603|15211|-6.096146500000001,106.6889122&weight=7&from=client&token=Tokopedia+Kero:TYnvROYwESCmZuhClHAchPXdhmg=&ut=1539919319&insurance=1&product_insurance=0&order_value=60000&cat_id=2083&lang=id&destination=3613|55173|-7.824337850304216,110.40123481303452&_=1539919319475
```

Sedangkan *response json*-nya sebagai berikut:

![](http://hangga.github.io/blog/wp-content/uploads/2018/10/response-wagu-700x394.png)

```
{"errors":[{"id":"541","status":"400","title":"No data found."}]}
```

Yes, kode status 400 biasanya seputar kesalahan *request* dari *user.* Tapi aaapaa yaa, sudah coba *clear cookies browser* pada browser, jangan-jangan ada *param* yang nyangkut. Ternyata masih 400, ealah.

Usut punya usut, baca-baca di pusat resolusi tokopedia, eeh ternyata karena kurir yang tersedia untuk toko ini tidak menjangkau kota saya. Yes, sudah jelas penyebabnya.

## Saran.

1\. Alangkah baiknya penanganan error diklasifikasikan sesuai jenisnya.  
2\. Alangkah baiknya error status code mengacu pada standarisasi <https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html.>  
3\. Dari sisi *UX*, jika memang kurir diluar jangkauan, maka redaksi pesan *error*nya jangan <span style="color: #000080;">“gagal memuat data”</span>, misalkan <span style="color: #008000;">“kurir diluar jangkauan”</span> atau apa lah.

Saran ini sudah saya sampaikan ke FP Tokopedia.

Sekian.