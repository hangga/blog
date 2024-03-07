---
id: 5210
title: 'Solusi SSLCertVerificationError Pada Python Pandas'
date: '2024-01-20T15:38:50+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=5210'
permalink: /2024/01/20/solusi-sslcertverificationerror-pada-python-pandas/
image: /wp-content/uploads/2024/01/articleocw-5c6632dd1fe9f.jpg
categories:
    - Coding
    - Python
---

Error ini kadang terjadi saat kita menggunakan pandas untuk membaca html dari sebuah url, misalnya seperti ini:

```
import pandas as pd
dfs = pd.read_html(url)
df = dfs[0]
```

Nah, kadang ini menyebabkan error seperti ini:

```
---------------------------------------------------------------------------
SSLCertVerificationError                  Traceback (most recent call last)
/usr/lib/python3.10/urllib/request.py in do_open(self, http_class, req, **http_conn_args)
   1347             try:
-> 1348                 h.request(req.get_method(), req.selector, req.data, headers,
   1349                           encode_chunked=req.has_header('Transfer-encoding'))

22 frames
SSLCertVerificationError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1007)

During handling of the above exception, another exception occurred:

URLError                                  Traceback (most recent call last)
/usr/lib/python3.10/urllib/request.py in do_open(self, http_class, req, **http_conn_args)
   1349                           encode_chunked=req.has_header('Transfer-encoding'))
   1350             except OSError as err: # timeout error
-> 1351                 raise URLError(err)
   1352             r = h.getresponse()
   1353         except:

URLError: 
```

Error `SSLCertVerificationError` muncul ketika Python tidak dapat memverifikasi sertifikat SSL dari server saat melakukan permintaan HTTPS. Ini sering kali terjadi ketika sertifikat SSL yang digunakan oleh server tidak dapat diverifikasi oleh Python, yang mungkin disebabkan oleh beberapa masalah yang mungkin terjadi. Berikut adalah penjelasan detil dan beberapa penyebab umum:

1. **Tidak Dapat Menemukan Sertifikat Otoritas Sertifikat (CA):**
    - Python menggunakan daftar Sertifikat Otoritas Sertifikat (CA) lokal untuk memverifikasi sertifikat SSL server. Jika tidak dapat menemukan atau memverifikasi sertifikat otoritas sertifikat yang diperlukan, maka kesalahan ini dapat terjadi.
    - Solusi: Pastikan bahwa sistem Python Anda memiliki sertifikat otoritas sertifikat yang diperlukan. Anda dapat memperbarui sertifikat otoritas sertifikat dengan menginstal paket sertifikat CA yang diperlukan.
2. **Sertifikat SSL Server Tidak Valid atau Kadaluarsa:**
    - Sertifikat SSL yang digunakan oleh server mungkin tidak valid atau telah kedaluwarsa.
    - Solusi: Periksa validitas dan masa berlaku sertifikat SSL server. Jika sertifikat tidak valid, hubungi administrator server atau penyedia sertifikat SSL untuk memperbarui atau mendapatkan sertifikat yang valid.
3. **Masalah Konfigurasi SSL pada Server:**
    - Konfigurasi SSL pada server mungkin tidak benar atau tidak lengkap.
    - Solusi: Periksa konfigurasi SSL pada server untuk memastikan bahwa semuanya dikonfigurasi dengan benar.
4. **Penggunaan IP Address Daripada Nama Domain:**
    - Jika Anda menggunakan alamat IP server daripada nama domain, sertifikat SSL mungkin terkait dengan nama domain dan bukan IP.
    - Solusi: Gunakan nama domain server daripada alamat IP.
5. **Nonaktifkan Verifikasi SSL (Tidak Disarankan):**
    - Tindakan ini sangat tidak aman karena memungkinkan sambungan ke server tanpa verifikasi sertifikat SSL. Sebaiknya hindari tindakan ini kecuali untuk keperluan pengembangan atau debugging.
    - Solusi (Hati-hati): Nonaktifkan verifikasi SSL, namun pastikan untuk memahami risikonya dan hanya gunakan di lingkungan pengembangan.

### Solusi

```
def get_data():

  response = requests.get(url, verify=False) # handle Error -> SSLCertVerificationError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1007)

  # Jika request berhasil, baru load HTML pake pandas
  if response.ok:
      html_content = response.text
      dfs = pd.read_html(html_content)
      df = dfs[0]
  else:
      print("Eror")
  return df
```

<div class="w-full text-token-text-primary" data-testid="conversation-turn-115"><div class="px-4 py-2 justify-center text-base md:gap-6 m-auto"><div class="flex flex-1 text-base mx-auto gap-3 md:px-5 lg:px-1 xl:px-5 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem] group"><div class="relative flex w-full flex-col lg:w-[calc(100%-115px)] agent-turn"><div class="flex-col gap-1 md:gap-3"><div class="flex flex-grow flex-col max-w-full"><div class="min-h-[20px] text-message flex flex-col items-start gap-3 whitespace-pre-wrap break-words [.text-message+&]:mt-5 overflow-x-auto" data-message-author-role="assistant" data-message-id="ff720e30-2a7c-4ab4-af59-3f3a2b7079f0"><div class="markdown prose w-full break-words dark:prose-invert dark">1. **Permintaan HTTP:**
    - `requests.get(url, verify=False)`: Membuat permintaan HTTP GET ke `url` dengan parameter `verify=False`. Pengaturan `verify=False` nonaktifkan verifikasi sertifikat SSL, yang dapat berguna dalam kasus seperti yang Anda tunjukkan di mana ada masalah verifikasi sertifikat.
2. **Pengecekan Keberhasilan Permintaan:**
    - `if response.ok`: Memeriksa apakah permintaan berhasil dengan memeriksa apakah status respons HTTP adalah 2xx (sukses).
    - Jika permintaan berhasil (`response.ok` bernilai `True`), maka lanjut ke langkah berikutnya untuk membaca HTML.
    - Jika permintaan gagal (`response.ok` bernilai `False`), cetak pesan “Eror”.
3. **Membaca HTML dengan Pandas:**
    - `html_content = response.text`: Mengambil isi HTML dari respons permintaan.
    - `dfs = pd.read_html(html_content)`: Membaca tabel HTML dari isi HTML menggunakan fungsi `pd.read_html()`. Fungsi ini akan mengembalikan list dari DataFrame berdasarkan tabel-tabel yang ditemukan di HTML.
    - `df = dfs[0]`: Mengambil DataFrame pertama dari list hasil pembacaan HTML. Anda mungkin perlu menyesuaikan indeks ini tergantung pada struktur HTML dan tabel yang ingin Anda baca.
4. **Penanganan Kesalahan Verifikasi SSL:**
    - Pengaturan `verify=False` pada permintaan HTTP memberikan solusi darurat dengan menonaktifkan verifikasi sertifikat SSL. Ini adalah tindakan yang tidak aman dan sebaiknya hanya digunakan dalam keadaan darurat atau untuk keperluan pengembangan.
    - Jika verifikasi sertifikat SSL dinonaktifkan, itu berarti tidak ada verifikasi keaslian atau keamanan pada koneksi ke server, sehingga berpotensi membuka pintu untuk serangan Man-in-the-Middle (MITM) di lingkungan yang tidak aman.

Penting untuk dicatat bahwa menonaktifkan verifikasi SSL adalah solusi darurat dan tidak disarankan untuk penggunaan di lingkungan produksi, terutama jika data yang dikirim atau diterima sensitif. Sebaiknya, identifikasi dan perbaiki penyebab masalah sertifikat SSL untuk memastikan keamanan koneksi Anda.

</div></div></div><div class="mt-1 flex justify-start gap-3 empty:hidden"><div class="text-gray-400 flex self-end lg:self-center justify-center lg:justify-start mt-0 -ml-1 visible"><div class="flex"></div></div></div></div></div></div></div></div><div class="w-full text-token-text-primary" data-testid="conversation-turn-116"><div class="px-4 py-2 justify-center text-base md:gap-6 m-auto"><div class="flex flex-1 text-base mx-auto gap-3 md:px-5 lg:px-1 xl:px-5 md:max-w-3xl lg:max-w-[40rem] xl:max-w-[48rem] group"><div class="flex-shrink-0 flex flex-col relative items-end"><div><div class="pt-0.5"><div class="gizmo-shadow-stroke flex h-6 w-6 items-center justify-center overflow-hidden rounded-full"></div></div></div></div></div></div></div>