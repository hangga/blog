---
id: 20240720
title: 'Kisi-Kisi Lengkap Technical Interview Application Security Engineer'
date: '2026-09-17T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
descriptions: 'Pelajari 100+ pertanyaan technical interview Application Security Engineer beserta jawabannya. Mulai dari OWASP, web pentesting, API security, secure coding, DevSecOps, hingga AI security dan LLM security'
slug: 'kisi-kisi-interview-application-security-engineer'
layout: post
image: /wp-content/uploads/2026/09/cyber-security-concept-digital-art.jpg
categories:
- Security
tags:
- 'Cybersecurity'
- 'Application Security'
- 'Career Development'
---

# Kisi-Kisi Technical Interview Application Security Engineer: 100+ Pertanyaan dan Jawaban Lengkap, dari Web Security hingga AI Security

Mau melamar sebagai Application Security Engineer dan sedang mempersiapkan technical interview?

Ada banyak materi yang mungkin ditanyakan saat interview, mulai dari SQL Injection dan XSS sampai keamanan API, cloud, pipeline CI/CD, bahkan keamanan aplikasi berbasis AI. Kalau semua istilah itu dipelajari sekaligus tanpa memahami dasarnya, persiapan interview bisa terasa membingungkan.

Artikel ini membahas berbagai pertanyaan yang relevan untuk persiapan interview Application Security Engineer, lengkap dengan contoh jawaban yang mudah dipahami. Materinya mencakup keamanan aplikasi web, API, autentikasi, secure coding, pengujian keamanan, DevSecOps, cloud, dan AI security.

Perlu diingat, pertanyaan interview berbeda-beda di setiap perusahaan. Tidak semua perusahaan akan menanyakan seluruh topik dalam artikel ini. Gunakan materi berikut sebagai panduan belajar, lalu prioritaskan topik yang sesuai dengan deskripsi pekerjaan yang kamu lamar.

# Bagian 1: Dasar-Dasar Application Security

## 1. Apa itu Application Security Engineer?

**Contoh jawaban:**

Application Security Engineer adalah orang yang membantu memastikan aplikasi aman sejak proses pembuatannya hingga digunakan oleh pengguna.

Misalnya, perusahaan memiliki aplikasi perbankan. Developer bertugas membangun fitur login, transfer uang, dan riwayat transaksi. AppSec Engineer membantu memeriksa apakah fitur-fitur tersebut memiliki kelemahan yang bisa dimanfaatkan penyerang.

Pekerjaannya bisa mencakup memeriksa kode program, menguji keamanan aplikasi, meninjau desain sistem, membantu developer memperbaiki celah, dan memastikan pengujian keamanan menjadi bagian dari proses pengembangan.

Jadi, tugasnya bukan hanya menemukan celah, tetapi juga membantu mencegah masalah serupa muncul kembali.

## 2. Apa bedanya Application Security Engineer dan Penetration Tester?

**Contoh jawaban:**

Penetration Tester biasanya berfokus pada pengujian sistem untuk menemukan dan membuktikan kelemahan keamanan. Application Security Engineer memiliki cakupan yang lebih luas dalam proses pengembangan aplikasi.

Contohnya, Penetration Tester menemukan bahwa pengguna bisa melihat data milik pengguna lain. AppSec Engineer dapat membantu memperbaiki pemeriksaan hak akses, memeriksa bagian kode lain yang memiliki pola serupa, dan memastikan ada pengujian otomatis untuk mencegah masalah tersebut terulang.

Namun, kedua pekerjaan ini bisa saling tumpang tindih. AppSec Engineer juga dapat melakukan penetration testing, sedangkan Penetration Tester dapat memberikan rekomendasi perbaikan yang mendalam.

## 3. Apa bedanya vulnerability, threat, dan risk?

**Contoh jawaban:**

Ketiganya saling berhubungan, tetapi memiliki arti berbeda.

- **Vulnerability:** kelemahan yang dapat dimanfaatkan untuk menyerang sistem.
- **Threat:** pihak, kejadian, atau kondisi yang berpotensi menimbulkan masalah.
- **Risk:** kemungkinan terjadinya masalah dan seberapa besar dampaknya.

Bayangkan sebuah rumah memiliki jendela yang tidak bisa dikunci. Jendela tersebut adalah vulnerability. Pencuri merupakan threat. Sementara itu, kemungkinan pencurian dan kerugian yang bisa terjadi merupakan bagian dari risk.

Dalam aplikasi, contohnya adalah endpoint yang tidak memeriksa hak akses. Kelemahan tersebut bisa dimanfaatkan pengguna untuk mengakses data yang bukan miliknya.

## 4. Apa perbedaan authentication dan authorization?

**Contoh jawaban:**

Authentication adalah proses memastikan identitas seseorang. Authorization adalah proses menentukan apa yang boleh dilakukan oleh orang tersebut.

Misalnya, ketika kamu login ke aplikasi perusahaan menggunakan akun pribadi, sistem sedang memeriksa identitasmu. Setelah login, sistem masih harus memastikan bahwa kamu hanya dapat melihat dokumen yang memang menjadi hakmu.

Jadi, berhasil login tidak berarti pengguna otomatis boleh mengakses seluruh data.

## 5. Apa yang dimaksud dengan CIA Triad?

**Contoh jawaban:**

CIA Triad adalah tiga prinsip dasar keamanan informasi:

- **Confidentiality:** data hanya boleh dilihat oleh pihak yang berhak.
- **Integrity:** data tidak boleh diubah secara tidak sah.
- **Availability:** sistem dan data harus tersedia ketika dibutuhkan.

Contohnya, aplikasi kesehatan harus menjaga agar rekam medis pasien tidak dibaca sembarang orang, tidak diubah tanpa izin, dan tetap bisa diakses oleh tenaga medis yang berwenang.

Ketiga prinsip ini membantu AppSec Engineer memahami dampak sebuah celah keamanan.

## 6. Apa itu attack surface?

**Contoh jawaban:**

Attack surface adalah seluruh bagian sistem yang bisa menjadi titik masuk serangan.

Contohnya, sebuah aplikasi memiliki halaman login, fitur upload dokumen, API untuk mengambil data pengguna, dan dashboard administrator. Semua bagian tersebut bisa menjadi attack surface karena berinteraksi dengan pengguna atau sistem lain.

Semakin banyak fitur, endpoint, dan integrasi yang tersedia, semakin banyak bagian yang perlu diperiksa keamanannya.

## 7. Apa itu threat modeling?

**Contoh jawaban:**

Threat modeling adalah proses memikirkan cara sebuah sistem bisa diserang sebelum atau selama sistem tersebut dibangun.

Misalnya, perusahaan sedang membuat fitur transfer uang. AppSec Engineer perlu memikirkan beberapa pertanyaan: bisakah pengguna mengirim uang dari rekening orang lain? Apa yang terjadi jika permintaan transfer dikirim dua kali? Bisakah pengguna mengubah jumlah transfer melalui API?

Dengan mengidentifikasi kemungkinan serangan sejak awal, tim bisa merancang kontrol keamanan sebelum masalah ditemukan di lingkungan produksi.

## 8. Apa itu security by design?

**Contoh jawaban:**

Security by design berarti keamanan dipertimbangkan sejak aplikasi dirancang, bukan baru diperiksa setelah aplikasi selesai dibuat.

Contohnya, saat merancang fitur berbagi dokumen, tim langsung menentukan siapa yang boleh melihat, mengunduh, atau mengubah dokumen tersebut.

Pendekatan ini biasanya lebih efektif daripada menunggu sampai aplikasi dirilis, lalu memperbaiki banyak bagian karena desain awalnya tidak mempertimbangkan keamanan.

# Bagian 2: OWASP dan Kerentanan Aplikasi Web

## 9. Apa itu OWASP Top 10?

**Contoh jawaban:**

OWASP Top 10 adalah daftar risiko keamanan aplikasi web yang penting untuk dipahami oleh developer dan profesional keamanan.

Daftar ini membantu tim mengenali masalah umum, seperti kesalahan kontrol akses, kelemahan konfigurasi, dan berbagai jenis injeksi.

Namun, OWASP Top 10 bukan daftar lengkap semua celah keamanan dan bukan pengganti pengujian keamanan. Sebuah aplikasi tetap bisa memiliki kerentanan yang tidak tercakup secara langsung dalam daftar tersebut.

## 10. Apa itu SQL Injection?

**Contoh jawaban:**

SQL Injection terjadi ketika input pengguna memengaruhi perintah SQL secara tidak aman.

Misalnya, sebuah halaman login menggunakan input username dan password untuk mencari akun di database. Jika aplikasi menyusun query dengan menggabungkan input mentah pengguna ke dalam teks SQL, penyerang mungkin bisa mengubah arti query tersebut.

Akibatnya, aplikasi dapat mengembalikan data yang tidak semestinya atau menjalankan operasi yang tidak diinginkan, tergantung pada kondisi dan hak akses database.

Pencegahan utamanya adalah menggunakan parameterized queries atau prepared statements. Dengan cara ini, database membedakan input sebagai data dari struktur perintah SQL.

## 11. Apa itu Cross-Site Scripting (XSS)?

**Contoh jawaban:**

XSS terjadi ketika aplikasi membuat browser pengguna menjalankan JavaScript yang tidak seharusnya dijalankan.

Misalnya, forum menyediakan kolom komentar. Jika komentar ditampilkan tanpa penanganan yang aman, penyerang mungkin bisa memasukkan konten yang menyebabkan browser pengguna lain menjalankan kode berbahaya.

Dampaknya bisa berupa manipulasi halaman atau tindakan yang dilakukan atas nama pengguna, bergantung pada konteks dan perlindungan yang tersedia.

Pencegahannya antara lain menggunakan output encoding sesuai konteks, menghindari API browser yang berbahaya tanpa kebutuhan yang jelas, dan menerapkan Content Security Policy sebagai lapisan pertahanan tambahan.

## 12. Apa bedanya reflected, stored, dan DOM-based XSS?

**Contoh jawaban:**

Ketiganya merupakan bentuk XSS, tetapi berbeda dalam cara kode berbahaya mencapai browser.

- **Reflected XSS:** input berbahaya dikembalikan oleh server dalam respons, misalnya melalui parameter pencarian.
- **Stored XSS:** input berbahaya disimpan, misalnya sebagai komentar, lalu ditampilkan kepada pengguna lain.
- **DOM-based XSS:** masalah terjadi pada pemrosesan data oleh JavaScript di browser, ketika data yang tidak aman digunakan dalam operasi DOM yang berbahaya.

Cara mengujinya berbeda karena sumber data dan bagian aplikasi yang bermasalah bisa berbeda. Namun, prinsip pencegahannya tetap berpusat pada penanganan data yang aman sesuai konteks penggunaannya.

## 13. Apa itu Cross-Site Request Forgery (CSRF)?

**Contoh jawaban:**

CSRF terjadi ketika penyerang mencoba membuat browser pengguna yang sudah login mengirimkan permintaan yang tidak mereka inginkan.

Misalnya, pengguna sedang login ke aplikasi keuangan. Penyerang membuat halaman yang mencoba memicu permintaan ke aplikasi tersebut. Jika aplikasi hanya mengandalkan cookie sesi tanpa perlindungan yang memadai, permintaan itu mungkin diproses seolah-olah berasal dari pengguna.

Pencegahannya dapat mencakup CSRF token, pemeriksaan asal permintaan, penggunaan cookie `SameSite` yang sesuai, dan memastikan operasi sensitif tidak bisa dilakukan hanya melalui permintaan yang tidak terlindungi.

## 14. Apa itu Server-Side Request Forgery (SSRF)?

**Contoh jawaban:**

SSRF terjadi ketika penyerang bisa memengaruhi server agar mengirimkan permintaan ke alamat yang seharusnya tidak dapat diaksesnya.

Contohnya, sebuah aplikasi menerima URL untuk mengambil gambar dari internet. Jika aplikasi tidak membatasi alamat tujuan dengan benar, penyerang mungkin bisa membuat server mencoba mengakses layanan internal yang tidak ditujukan untuk publik.

Pencegahannya antara lain membatasi tujuan permintaan, memvalidasi URL dan alamat IP setelah resolusi DNS, mengendalikan redirect, serta menerapkan pembatasan jaringan agar server tidak bisa mengakses semua layanan internal.

## 15. Apa itu path traversal?

**Contoh jawaban:**

Path traversal adalah kelemahan yang memungkinkan pengguna mengakses file di luar direktori yang seharusnya diperbolehkan.

Misalnya, aplikasi hanya bermaksud mengizinkan pengguna mengunduh dokumen dari folder tertentu. Jika nama file bisa dimanipulasi tanpa validasi yang benar, aplikasi mungkin membaca file lain di sistem.

Pencegahannya meliputi penggunaan identifier file yang terkontrol, pembatasan direktori, canonicalization path, dan pemeriksaan otorisasi sebelum file disajikan.

## 16. Apa itu insecure deserialization?

**Contoh jawaban:**

Deserialization adalah proses mengubah data yang disimpan atau dikirim dalam format tertentu menjadi objek yang bisa digunakan program.

Masalah muncul ketika aplikasi memercayai data yang tidak tepercaya dan mengubahnya menjadi objek tanpa kontrol yang memadai. Dalam kondisi tertentu, hal ini dapat menyebabkan manipulasi data, penyalahgunaan fungsi, atau bahkan eksekusi kode.

Pencegahannya adalah tidak memproses objek kompleks dari sumber yang tidak tepercaya jika tidak diperlukan, menggunakan format data yang lebih sederhana, dan menerapkan validasi serta pembatasan tipe yang ketat.

## 17. Apa itu security misconfiguration?

**Contoh jawaban:**

Security misconfiguration adalah kesalahan pengaturan yang membuat aplikasi lebih mudah diserang.

Contohnya, dashboard administrator bisa diakses dari internet tanpa perlindungan yang memadai, pesan error menampilkan detail internal, atau layanan debug dibiarkan aktif di production.

Cara mencegahnya adalah menggunakan konfigurasi yang aman secara default, memisahkan lingkungan development dan production, menonaktifkan fitur yang tidak diperlukan, serta memeriksa konfigurasi secara berkala.

## 18. Apa itu IDOR atau Broken Access Control?

**Contoh jawaban:**

IDOR adalah kondisi ketika pengguna dapat mengakses objek milik orang lain karena aplikasi tidak memeriksa hak akses dengan benar. Istilah ini sering digunakan untuk menggambarkan salah satu bentuk Broken Access Control.

Misalnya, aplikasi menampilkan data pesanan melalui endpoint seperti `/orders/1001`. Jika pengguna bisa mengganti nomor tersebut menjadi `/orders/1002` dan melihat pesanan milik orang lain, kemungkinan terdapat masalah kontrol akses.

Solusinya bukan sekadar menyembunyikan nomor pesanan. Server harus memeriksa apakah pengguna yang sedang login memang berhak mengakses pesanan tersebut pada setiap permintaan.

## 19. Apa perbedaan validasi dan sanitasi input?

**Contoh jawaban:**

Validasi memeriksa apakah data sesuai dengan aturan yang ditetapkan. Sanitasi mengubah atau menghapus bagian data tertentu agar sesuai dengan tujuan penggunaannya.

Misalnya, kolom nomor telepon hanya boleh menerima format tertentu. Validasi digunakan untuk memeriksa format tersebut. Jika teks akan ditampilkan sebagai HTML, penanganan output yang tepat diperlukan agar teks itu tidak dianggap sebagai kode.

Keduanya tidak bisa menggantikan kontrol keamanan lain. Untuk mencegah SQL Injection, misalnya, prepared statements tetap menjadi pilihan utama daripada hanya menghapus karakter tertentu dari input.

## 20. Bagaimana menentukan tingkat keparahan sebuah celah?

**Contoh jawaban:**

Saya akan melihat beberapa hal: apa yang bisa dilakukan penyerang, seberapa mudah celah tersebut dieksploitasi, data atau fungsi apa yang terdampak, dan berapa banyak pengguna atau sistem yang berpotensi terkena dampaknya.

Misalnya, celah yang memungkinkan siapa pun mengambil data pribadi seluruh pelanggan biasanya lebih mendesak daripada masalah yang hanya memengaruhi informasi publik yang tidak sensitif.

Saya juga dapat menggunakan CVSS sebagai salah satu alat penilaian, tetapi prioritas perbaikan tetap perlu mempertimbangkan konteks bisnis, paparan sistem, dan kemungkinan eksploitasi di lingkungan nyata.

# Bagian 3: API Security

## 21. Apa itu API dan mengapa keamanannya penting?

**Contoh jawaban:**

API adalah cara bagi dua sistem untuk bertukar data atau meminta suatu fungsi dijalankan.

Misalnya, aplikasi mobile menggunakan API untuk mengambil riwayat transaksi dari server. Pengguna mungkin tidak pernah melihat endpoint tersebut secara langsung, tetapi aplikasi tetap mengirimkan permintaan melalui API.

Karena API sering menyediakan akses langsung ke data dan fungsi, kesalahan pada autentikasi, otorisasi, validasi input, atau pembatasan permintaan dapat berdampak besar.

## 22. Apa perbedaan autentikasi dan otorisasi pada API?

**Contoh jawaban:**

Autentikasi API memeriksa siapa yang mengirimkan permintaan. Otorisasi memeriksa apakah pihak tersebut berhak melakukan tindakan yang diminta.

Misalnya, token pengguna berhasil diverifikasi. Itu belum berarti pengguna boleh membaca seluruh data pelanggan. Server masih harus memeriksa hak akses untuk setiap objek dan fungsi.

Kesalahan yang sering terjadi adalah aplikasi hanya memeriksa apakah token valid, tetapi tidak memeriksa apakah pemilik token berhak mengakses resource yang diminta.

## 23. Apa itu Broken Object Level Authorization (BOLA)?

**Contoh jawaban:**

BOLA terjadi ketika API tidak memeriksa dengan benar apakah pengguna berhak mengakses objek tertentu.

Contohnya, API menyediakan endpoint untuk membaca profil pelanggan berdasarkan ID. Pengguna A mengirimkan ID milik pengguna B dan ternyata bisa melihat datanya.

Untuk mencegahnya, server harus memeriksa kepemilikan atau izin akses terhadap objek tersebut. Menggunakan UUID atau ID yang sulit ditebak bukan pengganti pemeriksaan otorisasi.

## 24. Apa itu Broken Function Level Authorization (BFLA)?

**Contoh jawaban:**

BFLA terjadi ketika pengguna dapat menjalankan fungsi yang seharusnya tidak boleh mereka akses.

Misalnya, aplikasi memiliki fungsi untuk menghapus akun pelanggan. Fungsi tersebut seharusnya hanya bisa digunakan oleh administrator, tetapi pengguna biasa ternyata juga dapat memanggil endpoint-nya.

Pencegahannya adalah menerapkan pemeriksaan hak akses pada setiap fungsi sensitif di sisi server. Menyembunyikan tombol administrator dari tampilan pengguna tidak cukup.

## 25. Apa itu rate limiting?

**Contoh jawaban:**

Rate limiting membatasi seberapa sering sebuah pengguna atau sistem boleh mengirim permintaan dalam periode tertentu.

Misalnya, API login membatasi jumlah percobaan login dalam waktu singkat. Pembatasan ini dapat mengurangi peluang brute-force dan membantu mengendalikan penyalahgunaan layanan.

Batasnya perlu disesuaikan dengan fungsi API. Sistem juga harus mempertimbangkan identitas pengguna, alamat IP, pola aktivitas, dan risiko memblokir pengguna sah.

## 26. Apa perbedaan API key dan access token?

**Contoh jawaban:**

API key biasanya digunakan untuk mengenali aplikasi atau klien yang memanggil layanan. Access token umumnya mewakili hak akses yang diberikan kepada suatu pengguna atau klien.

Namun, penerapannya berbeda-beda antarproduk. API key juga dapat digunakan untuk autentikasi dalam konteks tertentu, dan access token tidak otomatis aman hanya karena namanya berbeda.

Keduanya perlu dilindungi, dibatasi hak aksesnya, diputar atau dicabut jika bocor, dan tidak boleh ditanamkan di aplikasi publik jika pengguna dapat mengekstraknya.

## 27. Apa yang perlu diperiksa saat menguji keamanan API?

**Contoh jawaban:**

Saya akan memeriksa apakah autentikasi dapat dilewati, apakah pengguna bisa mengakses data orang lain, apakah ada fungsi administrator yang dapat dipanggil pengguna biasa, serta apakah input diproses dengan aman.

Saya juga akan memeriksa rate limiting, pengelolaan token, validasi data, konfigurasi CORS, penanganan error, dan kemungkinan kebocoran informasi.

Pengujian dilakukan pada sistem yang memang diizinkan untuk diuji, dengan memperhatikan dampak terhadap data dan ketersediaan layanan.

# Bagian 4: Authentication, Session, dan Identity Security

## 28. Bagaimana cara kerja session cookie?

**Contoh jawaban:**

Setelah pengguna login, server biasanya membuat sesi dan mengirimkan cookie yang menjadi penanda sesi tersebut. Browser kemudian mengirimkan cookie saat membuat permintaan yang sesuai ke server.

Jika seseorang berhasil mencuri cookie sesi yang masih berlaku, ia mungkin bisa menggunakannya untuk bertindak sebagai pengguna tersebut.

Karena itu, cookie sesi perlu dilindungi menggunakan atribut yang sesuai, seperti `Secure`, `HttpOnly`, dan `SameSite`. Aplikasi juga perlu mengelola masa berlaku sesi dan mengakhiri sesi dengan benar ketika pengguna logout.

## 29. Apa itu JWT dan apa risikonya?

**Contoh jawaban:**

JWT adalah format token yang sering digunakan untuk membawa klaim, seperti identitas atau informasi hak akses.

JWT yang ditandatangani biasanya dapat diverifikasi untuk mengetahui apakah isinya telah diubah. Namun, tanda tangan tidak otomatis membuat isi token menjadi rahasia. Pada JWT yang menggunakan format JWS, payload umumnya dapat dibaca oleh pihak yang memperoleh token.

Risiko muncul jika aplikasi menerima token tanpa memverifikasi tanda tangan dan klaim yang diperlukan, atau jika token yang bocor memiliki hak akses luas dan masa berlaku panjang.

Pencegahannya mencakup validasi algoritma dan tanda tangan, pemeriksaan issuer, audience, dan expiration, serta penyimpanan token secara aman.

## 30. Apa itu Multi-Factor Authentication (MFA)?

**Contoh jawaban:**

MFA meminta pengguna membuktikan identitas menggunakan lebih dari satu faktor yang berbeda.

Contohnya, pengguna memasukkan password dan kemudian melakukan verifikasi melalui security key. Jika password bocor, penyerang masih perlu melewati faktor tambahan.

Namun, tidak semua metode MFA memiliki tingkat perlindungan yang sama. Metode yang tahan phishing, seperti FIDO2/WebAuthn, umumnya lebih kuat terhadap phishing dibandingkan kode OTP yang dapat diminta atau dicuri melalui rekayasa sosial.

## 31. Apa itu account enumeration?

**Contoh jawaban:**

Account enumeration terjadi ketika seseorang bisa mengetahui apakah suatu akun terdaftar berdasarkan respons aplikasi.

Contohnya, halaman login menampilkan pesan “email tidak ditemukan” untuk akun yang tidak terdaftar, tetapi “password salah” untuk akun yang terdaftar.

Penyerang dapat memanfaatkan perbedaan ini untuk mengumpulkan daftar akun valid. Aplikasi dapat mengurangi risiko tersebut dengan pesan yang konsisten, pembatasan percobaan, dan pemantauan aktivitas mencurigakan.

## 32. Bagaimana mengamankan fitur reset password?

**Contoh jawaban:**

Fitur reset password harus memastikan bahwa hanya pemilik akun yang sah yang dapat mengganti password.

Token reset sebaiknya sulit ditebak, memiliki masa berlaku terbatas, hanya dapat digunakan sekali, dan tidak bocor melalui log atau URL yang tersebar ke pihak lain.

Setelah password diubah, aplikasi perlu mempertimbangkan pencabutan sesi lama, memberi tahu pemilik akun, dan menerapkan pembatasan permintaan agar fitur ini tidak disalahgunakan.

# Bagian 5: Secure Coding dan Code Review

## 33. Apa itu secure code review?

**Contoh jawaban:**

Secure code review adalah proses memeriksa kode program untuk menemukan pola yang dapat menimbulkan masalah keamanan.

Contohnya, saya memeriksa apakah query database menggunakan parameterized queries, apakah endpoint memeriksa hak akses, dan apakah data sensitif masuk ke log.

Tujuannya bukan hanya menemukan baris kode yang bermasalah, tetapi memahami alur data dan memastikan bahwa perbaikan benar-benar menutup kelemahan tersebut.

## 34. Apa itu taint analysis?

**Contoh jawaban:**

Taint analysis melacak data yang berasal dari sumber yang tidak tepercaya, seperti input pengguna, hingga data tersebut digunakan oleh bagian aplikasi yang sensitif.

Misalnya, input pengguna masuk ke parameter pencarian, kemudian digunakan untuk membangun query database. Analisis ini membantu melihat apakah data tersebut mencapai query tanpa penanganan yang aman.

Taint analysis dapat dilakukan secara manual maupun dibantu alat analisis kode. Hasilnya tetap perlu ditinjau karena alat bisa menghasilkan false positive atau melewatkan masalah tertentu.

## 35. Apa itu SAST?

**Contoh jawaban:**

SAST adalah pengujian keamanan yang memeriksa kode sumber atau representasi program tanpa harus menjalankan aplikasi seperti pengguna biasa.

Contohnya, alat SAST dapat menemukan penggunaan fungsi yang berisiko atau pola query yang berpotensi menyebabkan SQL Injection.

SAST membantu menemukan masalah lebih awal, tetapi tidak selalu memahami seluruh konfigurasi dan perilaku aplikasi. Hasilnya perlu diverifikasi agar tim tidak menghabiskan waktu pada temuan yang tidak relevan.

## 36. Apa itu DAST?

**Contoh jawaban:**

DAST menguji aplikasi yang sedang berjalan dengan mengirimkan permintaan dan mengamati responsnya.

Contohnya, alat DAST mencoba berbagai input ke formulir dan endpoint untuk mencari perilaku yang mengindikasikan celah keamanan.

Kelebihannya, DAST dapat menemukan masalah yang bergantung pada konfigurasi atau perilaku runtime. Namun, alat ini tidak selalu bisa menjangkau semua alur aplikasi atau membuktikan penyebab masalah di kode.

## 37. Apa perbedaan SAST, DAST, dan SCA?

**Contoh jawaban:**

Ketiganya memeriksa aspek keamanan yang berbeda.

- **SAST:** mencari pola kode yang berpotensi tidak aman.
- **DAST:** menguji aplikasi yang sedang berjalan.
- **SCA:** memeriksa library dan dependency pihak ketiga, termasuk versi yang diketahui memiliki kerentanan.

Contohnya, sebuah aplikasi bisa memiliki kode buatan sendiri yang rentan SQL Injection, endpoint yang salah konfigurasi, dan library yang memiliki CVE. Ketiga jenis pengujian tersebut dapat membantu menemukan masalah yang berbeda.

## 38. Apa itu secrets management?

**Contoh jawaban:**

Secrets management adalah cara menyimpan dan mengelola informasi rahasia, seperti password database, API key, private key, dan credential layanan.

Informasi tersebut sebaiknya tidak ditulis langsung di source code atau dimasukkan ke repository yang bisa diakses banyak orang.

Organisasi dapat menggunakan secret manager, membatasi siapa yang bisa mengakses rahasia, melakukan rotasi credential, dan memindai repository untuk menemukan secret yang tidak sengaja terunggah.

## 39. Apa itu dependency vulnerability?

**Contoh jawaban:**

Aplikasi modern sering menggunakan library yang dibuat pihak lain. Jika salah satu library memiliki celah keamanan, aplikasi yang menggunakannya mungkin ikut terdampak.

Misalnya, aplikasi menggunakan versi library yang memiliki kerentanan dalam pemrosesan file. Penyerang bisa memanfaatkan masalah tersebut jika aplikasi memanggil fungsi yang terdampak dalam kondisi yang sesuai.

Saya akan memeriksa versi dependency, apakah kerentanan benar-benar memengaruhi penggunaan aplikasi, apakah tersedia versi perbaikan, dan apakah pembaruan dapat dilakukan dengan aman.

# Bagian 6: Security Testing dan Penetration Testing

## 40. Apa perbedaan vulnerability assessment dan penetration testing?

**Contoh jawaban:**

Vulnerability assessment berfokus pada mengidentifikasi dan menilai kelemahan. Penetration testing mencoba mengeksploitasi kelemahan secara terkontrol untuk mengetahui sejauh mana dampaknya.

Contohnya, vulnerability assessment menemukan endpoint yang diduga memiliki masalah otorisasi. Penetration testing dapat menguji apakah masalah itu benar-benar memungkinkan akses ke data pengguna lain.

Keduanya saling melengkapi. Pengujian harus dilakukan dalam ruang lingkup dan izin yang jelas.

## 41. Bagaimana memulai pengujian keamanan aplikasi web?

**Contoh jawaban:**

Saya akan memahami ruang lingkup dan fungsi aplikasi terlebih dahulu, lalu memetakan halaman, endpoint, jenis pengguna, dan alur data yang penting.

Setelah itu, saya mengidentifikasi area berisiko, seperti login, reset password, upload file, pengelolaan akun, dan endpoint yang memproses data sensitif.

Pengujian kemudian dilakukan berdasarkan risiko, dengan menggabungkan pengujian manual dan alat bantu. Temuan perlu divalidasi, didokumentasikan, dan disertai rekomendasi perbaikan.

## 42. Apa fungsi Burp Suite?

**Contoh jawaban:**

Burp Suite adalah alat yang banyak digunakan untuk menguji keamanan aplikasi web. Alat ini membantu melihat dan memodifikasi HTTP request serta response sehingga penguji dapat memahami cara aplikasi berkomunikasi.

Misalnya, saya bisa memeriksa parameter yang dikirim saat membuka profil pengguna, lalu menguji apakah perubahan parameter dapat menyebabkan akses ke data yang tidak semestinya.

Burp Suite membantu proses pengujian, tetapi tidak otomatis memahami seluruh konteks bisnis aplikasi. Penguji tetap perlu menganalisis hasilnya.

## 43. Apa itu false positive dan false negative?

**Contoh jawaban:**

False positive berarti alat melaporkan masalah yang ternyata bukan kerentanan yang valid dalam konteks tersebut. False negative berarti masalah sebenarnya ada, tetapi tidak terdeteksi.

Misalnya, scanner melaporkan suatu parameter rentan terhadap XSS, tetapi setelah diperiksa ternyata output sudah ditangani dengan aman. Itu bisa menjadi false positive.

Sebaliknya, aplikasi memiliki kelemahan otorisasi yang hanya muncul pada alur tertentu, tetapi scanner tidak menemukannya. Itu bisa menjadi false negative.

Karena itu, hasil pemindaian perlu diverifikasi dan tidak boleh dianggap sebagai gambaran lengkap keamanan aplikasi.

## 44. Bagaimana menulis laporan temuan keamanan yang baik?

**Contoh jawaban:**

Laporan sebaiknya menjelaskan apa masalahnya, di mana lokasinya, bagaimana masalah dapat direproduksi dalam ruang lingkup yang diizinkan, apa dampaknya, dan bagaimana memperbaikinya.

Saya juga akan menyertakan bukti yang cukup tanpa mengumpulkan atau menyebarkan data sensitif secara tidak perlu.

Tujuannya agar developer dapat memahami masalah dan memperbaikinya tanpa harus menebak-nebak apa yang ditemukan penguji.

# Bagian 7: DevSecOps dan Secure SDLC

## 45. Apa itu Secure SDLC?

**Contoh jawaban:**

Secure SDLC adalah proses memasukkan keamanan ke seluruh tahapan pengembangan software, mulai dari perencanaan, desain, coding, testing, sampai deployment dan pemeliharaan.

Contohnya, tim mendiskusikan risiko sebelum membangun fitur baru, melakukan code review, menjalankan pemindaian dependency, dan menguji keamanan sebelum aplikasi dirilis.

Dengan pendekatan ini, keamanan bukan hanya tanggung jawab tim AppSec di akhir proyek. Developer dan tim operasional juga ikut berperan.

## 46. Apa itu DevSecOps?

**Contoh jawaban:**

DevSecOps adalah pendekatan yang mengintegrasikan keamanan ke dalam proses pengembangan dan operasi aplikasi.

Misalnya, setiap kali developer mengirim perubahan kode, pipeline dapat menjalankan unit test, pemeriksaan dependency, dan pemindaian keamanan tertentu secara otomatis.

Namun, tidak semua temuan harus selalu menghentikan proses build. Organisasi perlu menentukan aturan berdasarkan tingkat risiko, keandalan deteksi, dan konteks sistem.

## 47. Bagaimana menentukan security gate dalam CI/CD?

**Contoh jawaban:**

Security gate adalah aturan yang menentukan apakah suatu perubahan boleh melanjutkan proses build atau deployment.

Misalnya, organisasi dapat memblokir rilis jika ditemukan secret yang valid di repository atau kerentanan kritis yang telah diverifikasi dan tidak memiliki pengecualian yang disetujui.

Saya akan memastikan aturan tersebut jelas, temuan dapat ditindaklanjuti, dan ada mekanisme pengecualian yang terdokumentasi. Jika semua temuan langsung memblokir build tanpa mempertimbangkan kualitas deteksi, tim bisa kehilangan kepercayaan terhadap proses keamanan.

## 48. Apa itu Software Bill of Materials (SBOM)?

**Contoh jawaban:**

SBOM adalah daftar komponen software yang digunakan oleh suatu aplikasi, seperti library dan dependency.

Jika muncul kerentanan baru pada sebuah library, SBOM membantu organisasi mengetahui aplikasi mana yang menggunakan komponen tersebut.

SBOM bukan jaminan bahwa software aman. Nilainya terletak pada kemampuan organisasi mengetahui isi software dan merespons masalah supply chain dengan lebih cepat.

# Bagian 8: Cloud dan Infrastructure Security

## 49. Apa risiko jika cloud storage salah konfigurasi?

**Contoh jawaban:**

Cloud storage yang salah konfigurasi bisa membuat file sensitif dapat diakses publik atau oleh pihak yang tidak berwenang.

Contohnya, perusahaan menyimpan dokumen pelanggan di object storage, tetapi bucket atau kebijakan aksesnya terlalu terbuka. Orang di luar perusahaan mungkin bisa membaca file tersebut.

Pencegahannya mencakup kebijakan akses minimum, blokir akses publik jika tidak dibutuhkan, enkripsi, audit konfigurasi, dan pemantauan akses.

## 50. Apa itu least privilege?

**Contoh jawaban:**

Least privilege berarti setiap pengguna, aplikasi, atau layanan hanya diberikan hak akses minimum yang diperlukan untuk menjalankan tugasnya.

Misalnya, aplikasi yang hanya perlu membaca data pelanggan tidak seharusnya memiliki izin untuk menghapus seluruh database.

Prinsip ini mengurangi dampak jika akun atau layanan berhasil disalahgunakan.

## 51. Apa itu SSRF dalam lingkungan cloud?

**Contoh jawaban:**

SSRF di lingkungan cloud menjadi berbahaya ketika server yang dapat dipengaruhi penyerang juga memiliki akses ke layanan internal atau metadata cloud.

Jika kontrol jaringan dan validasi tujuan lemah, penyerang mungkin mencoba menggunakan server sebagai perantara untuk menjangkau layanan yang tidak terbuka ke internet.

Mitigasinya perlu berlapis: validasi tujuan, pembatasan egress, kontrol akses metadata, serta identitas layanan dengan izin minimum. Tidak cukup hanya mengandalkan satu filter URL.

## 52. Bagaimana mengamankan secret di cloud?

**Contoh jawaban:**

Saya akan menggunakan layanan pengelolaan secret yang sesuai, membatasi akses menggunakan identity dan policy, serta menghindari penyimpanan credential permanen jika tersedia mekanisme identitas sementara.

Secret juga perlu dirotasi, diaudit, dan tidak dicatat ke log. Jika credential bocor, organisasi harus dapat mencabutnya dan menyelidiki apakah sudah disalahgunakan.

# Bagian 9: AI Security dan LLM Security

Bagian ini penting jika perusahaan menggunakan chatbot, AI assistant, RAG, AI agent, atau layanan yang terhubung ke model bahasa besar (*Large Language Model* atau LLM).

AI Security memiliki beberapa persamaan dengan AppSec tradisional, tetapi ada perbedaan penting: model AI dapat menghasilkan respons yang tidak terduga, menerima instruksi dari berbagai sumber, dan dalam beberapa aplikasi diberi kemampuan untuk memanggil tools atau mengakses data.

Karena itu, mengamankan aplikasi AI bukan hanya soal membuat prompt yang bagus. Sistem di sekeliling model juga harus dirancang dengan kontrol keamanan yang tepat.

## 53. Apa itu AI Security dan apa hubungannya dengan Application Security?

**Contoh jawaban:**

AI Security adalah upaya melindungi sistem AI, model, data, dan komponen yang terhubung dengannya dari penyalahgunaan atau serangan.

Application Security berfokus pada keamanan aplikasi. Ketika aplikasi menggunakan AI, kedua bidang ini bertemu.

Misalnya, perusahaan membuat chatbot yang dapat menjawab pertanyaan berdasarkan dokumen internal. Selain mengamankan login, API, dan database, tim juga harus memastikan chatbot tidak memberikan dokumen rahasia kepada pengguna yang tidak berhak.

Jadi, AppSec pada aplikasi AI tetap memerlukan kontrol tradisional, ditambah pengujian khusus untuk risiko AI.

## 54. Apa perbedaan AI Security, ML Security, dan LLM Security?

**Contoh jawaban:**

Ketiganya saling berhubungan, tetapi cakupannya berbeda.

- **AI Security** mencakup keamanan sistem AI secara luas, termasuk aplikasi, model, data, dan infrastrukturnya.
- **ML Security** berfokus pada risiko sistem machine learning, misalnya manipulasi data pelatihan atau serangan terhadap model prediksi.
- **LLM Security** berfokus pada model bahasa besar dan aplikasi yang menggunakannya, termasuk prompt injection, kebocoran informasi, dan penyalahgunaan tools.

Contohnya, sistem deteksi penipuan berbasis machine learning dapat menghadapi manipulasi data. Sementara itu, chatbot perusahaan dapat menghadapi prompt injection yang mencoba membuatnya mengungkapkan informasi rahasia.

## 55. Apa itu prompt injection?

**Contoh jawaban:**

Prompt injection terjadi ketika seseorang memberikan instruksi yang mencoba memengaruhi model AI agar bertindak di luar tujuan atau batasan yang seharusnya.

Misalnya, chatbot perusahaan dirancang untuk menjawab pertanyaan berdasarkan dokumen internal. Pengguna kemudian mencoba memerintahkannya agar mengabaikan instruksi awal dan menampilkan informasi rahasia.

Masalah ini tidak bisa diselesaikan hanya dengan menambahkan kalimat “jangan membocorkan data” ke system prompt. Model bisa saja tetap mengikuti instruksi yang berbahaya.

Pertahanan yang lebih kuat adalah membatasi data yang dapat diakses model, menerapkan pemeriksaan otorisasi di sisi aplikasi, membatasi tools, dan memeriksa tindakan sensitif sebelum dijalankan.

## 56. Apa perbedaan direct dan indirect prompt injection?

**Contoh jawaban:**

Direct prompt injection terjadi ketika pengguna sendiri memasukkan instruksi yang mencoba memanipulasi model.

Indirect prompt injection terjadi ketika instruksi berbahaya berasal dari konten lain yang dibaca atau diproses oleh AI, misalnya halaman web, email, atau dokumen.

Contohnya, AI assistant diminta merangkum sebuah halaman web. Halaman tersebut berisi instruksi tersembunyi yang meminta AI mengirimkan informasi rahasia ke tempat lain.

Karena itu, sistem tidak boleh menganggap semua konten yang dibaca AI sebagai instruksi yang tepercaya. Konten eksternal harus diperlakukan sebagai data yang tidak tepercaya, sementara tindakan yang dapat mengubah sistem tetap harus dikontrol oleh aplikasi.

## 57. Apakah system prompt bisa menjadi mekanisme keamanan utama?

**Contoh jawaban:**

Tidak. System prompt dapat membantu mengarahkan perilaku model, tetapi bukan pengganti kontrol keamanan di tingkat aplikasi.

Misalnya, system prompt menyatakan bahwa chatbot tidak boleh mengakses data pelanggan lain. Jika backend tetap memberikan akses luas ke database dan tidak memeriksa identitas peminta, chatbot mungkin tetap dapat mengambil data yang tidak seharusnya tersedia.

Karena itu, hak akses harus ditegakkan oleh sistem yang deterministik, seperti backend dan policy enforcement. Model tidak boleh menjadi satu-satunya penjaga akses terhadap data sensitif.

## 58. Apa itu sensitive information disclosure pada aplikasi LLM?

**Contoh jawaban:**

Ini adalah kondisi ketika aplikasi AI mengungkapkan informasi yang seharusnya tidak diberikan kepada pengguna.

Informasi tersebut bisa berupa data pribadi, dokumen perusahaan, token akses, detail internal, atau data pengguna lain.

Contohnya, chatbot layanan pelanggan menerima pertanyaan dari dua pengguna, tetapi mekanisme pencarian dokumennya tidak membatasi hasil berdasarkan hak akses masing-masing. Chatbot kemudian dapat memasukkan data pengguna A ke jawaban untuk pengguna B.

Pencegahannya mencakup pembatasan akses pada sumber data, pemisahan data antar pengguna, penyaringan informasi sensitif, dan pengujian kebocoran lintas sesi serta lintas pengguna.

## 59. Apa itu RAG dan apa risiko keamanannya?

**Contoh jawaban:**

RAG adalah singkatan dari *Retrieval-Augmented Generation*. Pendekatan ini membuat AI mengambil informasi dari sumber eksternal, seperti dokumen perusahaan, sebelum menyusun jawaban.

Misalnya, chatbot internal mencari dokumen kebijakan perusahaan, lalu menggunakan isi dokumen tersebut untuk menjawab pertanyaan karyawan.

Risikonya antara lain dokumen rahasia ikut terambil untuk pengguna yang tidak berhak, dokumen berisi instruksi berbahaya memengaruhi jawaban, atau informasi yang sudah tidak berlaku tetap digunakan.

Untuk mengamankannya, hak akses perlu diperiksa sebelum dokumen diberikan kepada model. Sistem juga perlu mengelola sumber dokumen, metadata, proses pengindeksan, dan penghapusan data secara benar.

## 60. Bagaimana cara mengamankan vector database?

**Contoh jawaban:**

Vector database menyimpan representasi numerik dari data agar sistem dapat mencari konten yang mirip secara semantik. Sistem RAG sering menggunakannya untuk menemukan dokumen yang relevan.

Keamanan tidak cukup hanya dengan melindungi database dari akses internet. Sistem juga perlu memastikan hasil pencarian hanya mencakup dokumen yang boleh diakses oleh pengguna.

Contohnya, dokumen HR dan dokumen umum perusahaan disimpan dalam sistem yang sama. Ketika karyawan bertanya kepada chatbot, pencarian harus menerapkan pembatasan akses agar dokumen HR tidak ikut diberikan kepada pengguna yang tidak berhak.

Metadata dan filter dapat membantu, tetapi pemeriksaan otorisasi harus dirancang agar tidak bisa dilewati melalui manipulasi parameter pencarian.

## 61. Apa itu insecure output handling pada aplikasi AI?

**Contoh jawaban:**

Insecure output handling terjadi ketika hasil dari model AI digunakan oleh aplikasi tanpa pemeriksaan yang sesuai.

Misalnya, model menghasilkan teks yang kemudian langsung dimasukkan ke halaman web sebagai HTML. Jika hasil tersebut tidak ditangani dengan aman, aplikasi dapat membuka peluang XSS.

Contoh lain, model menghasilkan argumen untuk suatu perintah, lalu backend menjalankannya tanpa validasi.

Solusinya adalah memperlakukan output model sebagai input yang belum tepercaya. Validasi, encoding, pembatasan format, dan kontrol otorisasi tetap harus dilakukan sebelum output digunakan oleh komponen lain.

## 62. Apa itu excessive agency pada AI agent?

**Contoh jawaban:**

Excessive agency terjadi ketika AI agent diberi kemampuan atau kebebasan bertindak yang terlalu besar dibandingkan kebutuhan tugasnya.

Misalnya, AI assistant hanya perlu membaca dokumen, tetapi ternyata juga memiliki izin menghapus file dan mengirim email ke pihak luar. Jika model salah memahami instruksi atau termanipulasi, dampaknya bisa lebih besar.

Untuk mencegahnya, berikan hanya tools dan izin yang benar-benar diperlukan. Tindakan berisiko tinggi sebaiknya membutuhkan persetujuan manusia atau pemeriksaan kebijakan tambahan.

AI agent tidak boleh otomatis dipercaya hanya karena terlihat mampu menyelesaikan tugas dengan baik.

## 63. Bagaimana mengamankan tools yang dapat dipanggil oleh AI agent?

**Contoh jawaban:**

Saya akan memperlakukan setiap tool sebagai endpoint aplikasi yang perlu diamankan secara terpisah.

Misalnya, AI agent dapat memanggil tool untuk membaca data pelanggan dan tool lain untuk mengubah status pesanan. Setiap tool harus memeriksa identitas, hak akses, jenis input, dan dampak tindakan yang diminta.

Jangan hanya mengandalkan model untuk menentukan apakah suatu tindakan diizinkan. Backend harus menerapkan kebijakan akses sendiri, membatasi parameter yang diterima, dan mencatat tindakan penting.

Untuk operasi yang sensitif, sistem dapat meminta konfirmasi sebelum menjalankan tindakan.

## 64. Apa itu data poisoning pada AI?

**Contoh jawaban:**

Data poisoning terjadi ketika data yang digunakan untuk melatih, menyempurnakan, atau membangun komponen AI dimanipulasi sehingga hasilnya menjadi tidak aman atau tidak dapat diandalkan.

Misalnya, sistem AI menggunakan kumpulan dokumen internal untuk membangun indeks pencarian. Jika seseorang memasukkan dokumen palsu atau berbahaya ke dalam sumber tersebut, sistem mungkin memberikan jawaban yang keliru atau terpengaruh oleh konten tersebut.

Pencegahannya meliputi kontrol akses terhadap sumber data, pemeriksaan asal data, proses review, pemantauan perubahan, dan evaluasi hasil model secara berkala.

## 65. Apa itu model denial of service?

**Contoh jawaban:**

Model denial of service terjadi ketika penyerang membuat layanan AI menghabiskan terlalu banyak sumber daya atau tidak mampu melayani pengguna secara normal.

Contohnya, penyerang mengirimkan permintaan dalam jumlah besar atau meminta pemrosesan yang sangat mahal sehingga biaya layanan meningkat dan pengguna lain mengalami gangguan.

Pencegahannya dapat mencakup rate limiting, batas ukuran input, batas penggunaan token, timeout, kuota per pengguna, dan pemantauan biaya serta performa.

## 66. Apa itu model inversion dan model extraction?

**Contoh jawaban:**

Model inversion adalah keluarga teknik yang mencoba menyimpulkan informasi tentang data atau karakteristik yang dipelajari model melalui akses terhadap model tersebut.

Model extraction adalah upaya merekonstruksi atau meniru perilaku model melalui banyak permintaan atau cara lain untuk memperoleh informasi tentang model.

Dampaknya bergantung pada jenis model, data yang digunakan, dan tingkat akses penyerang. Tidak semua serangan ini otomatis berhasil mengembalikan data pelatihan secara persis.

Mitigasinya dapat mencakup pembatasan akses, pemantauan pola permintaan, perlindungan terhadap model dan endpoint, serta pengelolaan data pelatihan yang tepat.

## 67. Apa itu adversarial example dalam machine learning?

**Contoh jawaban:**

Adversarial example adalah input yang sengaja dimodifikasi untuk membuat model memberikan prediksi yang salah atau tidak diharapkan.

Misalnya, sistem pengenalan gambar salah mengklasifikasikan suatu gambar setelah gambar tersebut dimodifikasi dengan cara tertentu.

Serangan ini berbeda dari prompt injection. Adversarial example biasanya membahas manipulasi input terhadap perilaku model machine learning, sedangkan prompt injection berfokus pada manipulasi instruksi dalam aplikasi yang menggunakan model bahasa.

Pengujian dan mitigasinya bergantung pada jenis model, data, dan konteks penggunaannya.

## 68. Apa yang perlu diperiksa saat melakukan AI red teaming?

**Contoh jawaban:**

AI red teaming adalah pengujian terencana untuk menemukan cara sistem AI dapat disalahgunakan atau gagal memenuhi batas keamanan yang ditetapkan.

Saya akan menguji apakah sistem dapat membocorkan informasi, mengikuti instruksi berbahaya, melewati kontrol akses, menghasilkan output yang tidak aman, atau menyalahgunakan tools yang tersedia.

Pengujian juga harus mencakup skenario lintas pengguna, dokumen eksternal, integrasi API, dan tindakan yang mengubah data.

Hasilnya perlu dicatat dengan bukti yang dapat direproduksi, tingkat risiko, dan rekomendasi perbaikan. Pengujian dilakukan dalam lingkungan dan ruang lingkup yang diizinkan.

## 69. Bagaimana cara menguji prompt injection secara sistematis?

**Contoh jawaban:**

Saya akan mulai dengan memetakan sumber instruksi dan data yang diproses aplikasi: input pengguna, system prompt, dokumen RAG, hasil pencarian web, serta respons dari tools.

Kemudian saya menguji apakah konten yang tidak tepercaya dapat membuat model mengabaikan batasan, mengungkapkan data, atau memicu tindakan yang tidak semestinya.

Saya juga menguji apakah dampaknya berbeda antara pengguna dengan hak akses berbeda dan apakah backend tetap menolak tindakan yang tidak diizinkan.

Pengujian tidak berhenti ketika model menolak satu prompt. Saya perlu memastikan kontrol aplikasi tetap efektif meskipun model memberikan respons yang tidak diharapkan.

## 70. Bagaimana mencegah kebocoran data antara pengguna dalam chatbot AI?

**Contoh jawaban:**

Saya akan memastikan setiap permintaan memiliki identitas dan konteks akses yang jelas, lalu membatasi data yang dapat diambil sesuai hak akses pengguna tersebut.

Saya juga akan memeriksa pengelolaan riwayat percakapan, cache, retrieval, log, dan penyimpanan data agar informasi dari satu pengguna tidak terbawa ke sesi pengguna lain.

Pengujian perlu mencakup percakapan baru, sesi lama, pengguna dengan peran berbeda, serta perubahan hak akses.

Yang terpenting, pemisahan data harus ditegakkan oleh backend dan sistem penyimpanan, bukan hanya mengandalkan instruksi kepada model agar tidak membocorkan informasi.

## 71. Bagaimana mengamankan aplikasi AI yang menggunakan data pribadi?

**Contoh jawaban:**

Saya akan memetakan data pribadi yang dikumpulkan, alasan penggunaannya, lokasi penyimpanan, pihak yang dapat mengaksesnya, dan apakah data tersebut dikirim ke penyedia model eksternal.

Setelah itu, saya akan menerapkan minimisasi data, kontrol akses, perlindungan saat penyimpanan dan pengiriman, kebijakan retensi, serta penghapusan data sesuai kebutuhan.

Saya juga akan memastikan log dan data evaluasi tidak menyimpan informasi sensitif secara berlebihan. Jika menggunakan layanan AI pihak ketiga, persyaratan pemrosesan data dan konfigurasi privasinya harus diperiksa.

## 72. Bagaimana menangani hallucination dari sisi keamanan?

**Contoh jawaban:**

Hallucination terjadi ketika model memberikan informasi yang salah atau tidak didukung sumber yang memadai.

Dalam konteks keamanan, masalahnya bukan hanya jawaban yang keliru. Jika model terhubung dengan tools, jawaban yang salah dapat memicu tindakan yang tidak diinginkan.

Misalnya, AI assistant salah mengidentifikasi penerima email dan mencoba mengirimkan dokumen kepada orang yang keliru.

Untuk mengurangi risikonya, tindakan sensitif harus melewati validasi deterministik, pemeriksaan izin, dan konfirmasi bila diperlukan. Informasi penting juga perlu diverifikasi dengan sumber yang dapat dipercaya.

## 73. Apakah guardrails cukup untuk mengamankan aplikasi AI?

**Contoh jawaban:**

Tidak. Guardrails membantu mengurangi perilaku yang tidak diinginkan, tetapi tidak menjamin bahwa semua serangan akan ditolak.

Misalnya, filter prompt dapat memblokir beberapa instruksi berbahaya, tetapi penyerang mungkin menemukan variasi input yang tidak dikenali filter tersebut.

Karena itu, guardrails perlu dilengkapi kontrol keamanan tradisional, seperti autentikasi, otorisasi, validasi input dan output, pembatasan tools, pemisahan data, serta logging dan monitoring.

Prinsipnya, keamanan tidak boleh bergantung pada satu lapisan saja.

## 74. Apa itu AI supply chain security?

**Contoh jawaban:**

AI supply chain security adalah upaya mengamankan seluruh komponen yang digunakan dalam pengembangan dan pengoperasian sistem AI.

Komponennya dapat mencakup model pihak ketiga, dataset, library, framework, plugin, model weights, dan layanan hosting.

Misalnya, tim mengunduh model dari sumber eksternal tanpa memeriksa asal-usul atau formatnya. Model atau file yang tidak tepercaya dapat membawa risiko keamanan, tergantung pada format dan cara pemuatannya.

Organisasi perlu memeriksa sumber, integritas, lisensi, dependency, serta mekanisme distribusi komponen AI sebelum menggunakannya.

## 75. Apa itu MCP dan apa risiko keamanannya?

**Contoh jawaban:**

MCP, atau Model Context Protocol, adalah protokol yang memungkinkan aplikasi AI terhubung dengan sumber data dan tools melalui pola integrasi yang terstruktur.

Misalnya, AI assistant menggunakan integrasi MCP untuk membaca dokumen atau menjalankan fungsi pada layanan lain.

Risikonya bergantung pada server, tools, data, dan izin yang diberikan. Server yang tidak tepercaya, kredensial yang bocor, atau kontrol akses yang lemah dapat membuat AI mengakses atau mengubah data secara tidak semestinya.

Untuk mengamankannya, saya akan memeriksa identitas dan kepercayaan terhadap server, hak akses, pengelolaan token, validasi input, batasan tools, serta persetujuan untuk tindakan sensitif.

## 76. Bagaimana menguji keamanan aplikasi AI secara end-to-end?

**Contoh jawaban:**

Saya akan menguji keseluruhan alur, bukan hanya modelnya.

Misalnya, pengguna mengirim pertanyaan ke chatbot. Backend memeriksa identitas, sistem retrieval mencari dokumen, model menyusun jawaban, lalu aplikasi menampilkan hasilnya.

Setiap tahap memiliki risiko sendiri: autentikasi yang lemah, retrieval yang mengambil data tidak semestinya, prompt injection melalui dokumen, atau output yang diproses tanpa validasi.

Pengujian end-to-end memastikan kontrol keamanan tetap berjalan di seluruh alur dan tidak dapat dilewati hanya karena satu komponen AI memberikan hasil yang tidak terduga.

# Bagian 10: Skenario Praktis AI Security

## 77. Chatbot internal membocorkan dokumen rahasia. Apa yang akan kamu lakukan?

**Contoh jawaban:**

Pertama, saya akan memastikan dampak dan ruang lingkup masalah tanpa menyebarkan data sensitif lebih jauh. Jika kebocoran masih berlangsung, saya akan bekerja sama dengan tim terkait untuk membatasi akses yang terdampak.

Selanjutnya, saya akan menelusuri alur pengambilan dokumen, identitas pengguna, filter akses, penyimpanan percakapan, dan log yang relevan.

Saya ingin mengetahui apakah penyebabnya adalah otorisasi pada retrieval yang lemah, kesalahan konfigurasi, konten berbahaya, atau masalah lain.

Setelah penyebab ditemukan, saya akan memperbaiki kontrol akses di backend, menambahkan pengujian regresi, dan menguji ulang skenario lintas pengguna untuk memastikan kebocoran tidak terulang.

## 78. AI agent bisa menghapus file. Bagaimana kamu mengamankannya?

**Contoh jawaban:**

Saya akan memeriksa apakah kemampuan menghapus file memang dibutuhkan. Jika tidak, izin tersebut harus dihilangkan.

Jika dibutuhkan, akses harus dibatasi berdasarkan pengguna, direktori, dan jenis file. Sistem juga perlu memvalidasi setiap permintaan sebelum dijalankan oleh tool.

Untuk tindakan yang berisiko tinggi, saya akan mempertimbangkan persetujuan manusia, pencatatan aktivitas, dan mekanisme pemulihan. Saya juga akan menguji apakah prompt injection bisa membuat agent mencoba menghapus file yang tidak semestinya.

## 79. Model AI menghasilkan SQL dan aplikasi menjalankannya. Apa risikonya?

**Contoh jawaban:**

Risikonya adalah model dapat menghasilkan query yang salah, terlalu luas, atau tidak sesuai dengan hak akses yang seharusnya.

Misalnya, pengguna meminta laporan penjualan, tetapi query yang dihasilkan mencoba membaca tabel lain yang berisi data pribadi.

Saya akan menghindari memberikan akses database yang luas kepada model. Jika penggunaan SQL dinamis memang diperlukan, sistem harus menggunakan akun database dengan hak minimum, membatasi query yang diizinkan, memvalidasi struktur query, dan menerapkan kontrol akses pada data.

Untuk operasi yang sensitif, query harus diperiksa sebelum dieksekusi. Output model tidak boleh dianggap aman hanya karena sintaksnya valid.

## 80. Bagaimana jika AI agent menerima instruksi berbahaya dari sebuah halaman web?

**Contoh jawaban:**

Saya akan memperlakukan konten halaman web sebagai data tidak tepercaya, bukan sebagai instruksi yang otomatis boleh diikuti oleh agent.

Agent seharusnya tidak dapat mengubah kebijakan keamanan hanya karena halaman web memintanya. Tools yang tersedia juga harus dibatasi sesuai tugas.

Jika agent perlu melakukan tindakan eksternal, seperti mengirim email atau mengubah data, backend harus memeriksa otorisasi dan meminta persetujuan sesuai tingkat risikonya.

Saya juga akan menambahkan pengujian untuk indirect prompt injection dan memeriksa apakah kontrol tersebut tetap efektif pada berbagai variasi konten.

# Bagian 11: Testing, Observability, dan Tata Kelola AI

## 81. Apa perbedaan evaluasi kualitas model dan pengujian keamanan model?

**Contoh jawaban:**

Evaluasi kualitas memeriksa apakah model memberikan jawaban yang benar, relevan, dan sesuai tujuan.

Pengujian keamanan memeriksa apakah model atau aplikasi dapat disalahgunakan, membocorkan informasi, melewati batas akses, atau memicu tindakan berbahaya.

Keduanya bisa beririsan. Misalnya, jawaban yang salah merupakan masalah kualitas, tetapi jika jawaban itu menyebabkan AI agent menghapus data, masalahnya juga menyangkut keamanan.

## 82. Apa itu AI security regression testing?

**Contoh jawaban:**

Regression testing memastikan bahwa perbaikan yang sudah dibuat tidak rusak akibat perubahan kode, model, prompt, data, atau konfigurasi.

Misalnya, tim memperbaiki kebocoran dokumen pada chatbot. Setelah model atau sistem retrieval diperbarui, pengujian perlu memastikan pengguna tetap tidak bisa memperoleh dokumen yang bukan haknya.

Pengujian sebaiknya menggunakan kumpulan skenario yang terdokumentasi dan diperbarui ketika ditemukan teknik serangan baru.

## 83. Mengapa logging dan monitoring penting pada aplikasi AI?

**Contoh jawaban:**

Logging dan monitoring membantu tim mengetahui apa yang terjadi ketika sistem digunakan, mendeteksi aktivitas mencurigakan, dan menyelidiki insiden.

Pada aplikasi AI, hal yang perlu diperhatikan antara lain pola penggunaan tools, kegagalan otorisasi, lonjakan penggunaan token, dan permintaan yang mencoba mengakses data di luar hak pengguna.

Namun, logging juga harus dirancang dengan hati-hati. Prompt, dokumen, dan respons bisa berisi data pribadi atau rahasia. Log harus dibatasi, dilindungi, dan disimpan sesuai kebutuhan.

## 84. Apa itu AI governance?

**Contoh jawaban:**

AI governance adalah aturan, tanggung jawab, dan proses yang digunakan organisasi untuk mengelola penggunaan AI secara aman dan bertanggung jawab.

Contohnya, perusahaan menentukan data apa yang boleh dikirim ke penyedia model eksternal, siapa yang boleh merilis fitur AI, bagaimana risiko dievaluasi, dan siapa yang bertanggung jawab jika terjadi insiden.

Dari sisi AppSec, governance membantu memastikan bahwa persyaratan keamanan tidak hanya bergantung pada keputusan masing-masing developer.

## 85. Framework apa yang relevan untuk AI Security?

**Contoh jawaban:**

Saya akan mempertimbangkan framework sesuai tujuan penggunaannya.

- **OWASP Top 10 for LLM Applications:** membantu mengidentifikasi risiko keamanan yang spesifik pada aplikasi LLM.
- **NIST AI Risk Management Framework:** membantu organisasi mengelola risiko AI sepanjang siklus hidup sistem.
- **NIST Generative AI Profile:** memberikan panduan tambahan untuk mengidentifikasi dan mengelola risiko generative AI.
- **OWASP GenAI Security Project:** menyediakan berbagai panduan terkait keamanan generative AI, AI agent, dan pengelolaan risiko.

Framework bukan pengganti pengujian teknis. Saya akan menggunakannya untuk menyusun cakupan penilaian risiko, kontrol yang dibutuhkan, dan bukti pengujian.

# Bagian 12: Pertanyaan Behavioral dan Komunikasi

## 86. Apa yang kamu lakukan jika developer tidak setuju dengan temuan keamanan?

**Contoh jawaban:**

Saya akan menjelaskan temuan berdasarkan bukti, bukan hanya meminta developer mempercayai penilaian saya.

Saya akan menunjukkan alur yang bermasalah, kondisi yang memungkinkan eksploitasi, dan dampaknya terhadap sistem. Jika perlu, saya akan membuat proof of concept yang aman di lingkungan pengujian yang diizinkan.

Jika masih ada perbedaan pendapat, saya akan membahas risiko dan pilihan mitigasi bersama tim terkait, lalu mendokumentasikan keputusan yang diambil.

Tujuannya bukan memenangkan perdebatan, melainkan memastikan risiko dipahami dan ditangani secara proporsional.

## 87. Bagaimana menentukan prioritas ketika ada banyak temuan keamanan?

**Contoh jawaban:**

Saya akan mempertimbangkan dampak, kemudahan eksploitasi, paparan sistem, sensitivitas data, dan kemungkinan adanya eksploitasi aktif.

Misalnya, kelemahan yang memungkinkan akses tidak sah ke data pelanggan dalam jumlah besar perlu diprioritaskan dibandingkan masalah dengan dampak sangat terbatas.

Saya juga akan mempertimbangkan apakah ada mitigasi sementara dan berapa lama perbaikan dapat dilakukan. Prioritas akhir harus berdasarkan risiko nyata, bukan hanya angka severity dari scanner.

## 88. Bagaimana menjelaskan celah keamanan kepada orang nonteknis?

**Contoh jawaban:**

Saya akan menjelaskan dampaknya menggunakan bahasa yang berhubungan dengan proses bisnis.

Misalnya, daripada hanya mengatakan bahwa aplikasi memiliki Broken Access Control, saya akan menjelaskan bahwa pengguna yang sudah login bisa melihat dokumen milik pelanggan lain karena server tidak memeriksa kepemilikan dokumen.

Setelah itu, saya akan menjelaskan kemungkinan dampaknya dan tindakan yang dibutuhkan. Istilah teknis tetap bisa disebutkan, tetapi harus disertai penjelasan yang mudah dipahami.

## 89. Apa yang kamu lakukan jika belum mengetahui jawaban sebuah pertanyaan teknis?

**Contoh jawaban:**

Saya akan menjelaskan apa yang sudah saya pahami, menyampaikan bagian yang belum saya pastikan, dan menguraikan bagaimana saya akan mencari jawabannya.

Misalnya, jika ditanya tentang teknik serangan yang belum pernah saya temui, saya akan mencoba memahami alur sistem, aset yang terancam, kemungkinan dampak, dan kontrol keamanan yang relevan.

Saya tidak akan mengarang jawaban hanya agar terdengar meyakinkan. Dalam pekerjaan keamanan, mengakui ketidakpastian dan memverifikasi asumsi merupakan bagian penting dari proses analisis.

# Bagian 13: Pertanyaan Teknis Tingkat Lanjut

## 90. Bagaimana mengamankan file upload?

**Contoh jawaban:**

Saya akan memeriksa jenis file yang diizinkan, ukuran file, cara aplikasi memproses file, dan lokasi penyimpanannya.

Validasi tidak cukup dengan memeriksa ekstensi nama file karena ekstensi dapat dimanipulasi. Aplikasi perlu memeriksa karakteristik file sesuai kebutuhan, menggunakan nama penyimpanan yang terkontrol, dan menghindari eksekusi file yang diunggah.

Untuk dokumen yang berisiko, pemindaian malware dan pemrosesan dalam lingkungan terisolasi juga dapat dipertimbangkan.

## 91. Apa itu Content Security Policy (CSP)?

**Contoh jawaban:**

CSP adalah kebijakan browser yang membatasi sumber konten yang boleh dimuat atau dijalankan oleh halaman web.

Misalnya, perusahaan ingin mengurangi risiko JavaScript dari sumber yang tidak diizinkan dijalankan pada situsnya. CSP dapat membantu menetapkan aturan tersebut.

CSP merupakan lapisan pertahanan tambahan, bukan pengganti penanganan XSS yang benar. Kebijakan yang terlalu longgar mungkin memberikan perlindungan terbatas, sedangkan kebijakan yang terlalu ketat dapat merusak fungsi situs jika tidak diuji dengan baik.

## 92. Apa itu CORS dan apakah CORS merupakan mekanisme autentikasi?

**Contoh jawaban:**

CORS adalah mekanisme browser yang menentukan apakah JavaScript dari suatu origin boleh membaca respons dari origin lain.

CORS bukan mekanisme autentikasi dan bukan pengganti otorisasi di server.

Misalnya, API perusahaan hanya boleh dibaca oleh situs tertentu melalui browser. CORS membantu mengatur akses baca lintas origin, tetapi endpoint API tetap harus memverifikasi identitas dan hak akses pemanggilnya.

Konfigurasi CORS yang salah dapat menambah risiko, terutama jika digabungkan dengan penggunaan credential dan kontrol akses yang lemah.

## 93. Apa itu race condition?

**Contoh jawaban:**

Race condition terjadi ketika hasil operasi bergantung pada urutan atau waktu beberapa proses yang berjalan hampir bersamaan.

Misalnya, aplikasi memiliki saldo Rp100.000 dan menerima dua permintaan pembelian secara bersamaan. Jika keduanya membaca saldo sebelum salah satunya mengurangi saldo, sistem mungkin memproses transaksi yang seharusnya ditolak.

Pencegahannya dapat mencakup transaksi database yang benar, locking, operasi atomik, dan pemeriksaan konsistensi di sisi server.

## 94. Apa itu SSRF dan bagaimana membedakannya dari CSRF?

**Contoh jawaban:**

SSRF membuat server mengirimkan permintaan ke tujuan yang dapat dipengaruhi penyerang. CSRF mencoba membuat browser pengguna mengirimkan permintaan yang tidak diinginkan menggunakan konteks sesi pengguna tersebut.

Jadi, pada SSRF, server menjadi pihak yang dimanfaatkan untuk mengakses tujuan lain. Pada CSRF, browser korban menjadi pihak yang mengirimkan permintaan ke aplikasi tempat korban memiliki sesi aktif.

Keduanya membutuhkan pendekatan pencegahan yang berbeda karena titik serangan dan konteks kepercayaannya berbeda.

## 95. Apa yang dimaksud dengan security champion?

**Contoh jawaban:**

Security champion adalah anggota tim produk atau engineering yang membantu membawa praktik keamanan ke pekerjaan sehari-hari timnya.

Ia tidak selalu menggantikan AppSec Engineer. Perannya bisa membantu melakukan review awal, menyebarkan pengetahuan keamanan, dan memastikan masalah yang ditemukan ditangani.

Model ini membantu tim AppSec bekerja lebih efektif, terutama ketika perusahaan memiliki banyak tim developer.

# Bagian 14: Studi Kasus Technical Interview

## 96. Kamu menemukan endpoint yang membocorkan data pengguna lain. Apa langkahmu?

**Contoh jawaban:**

Saya akan memvalidasi temuan dalam ruang lingkup yang diizinkan, memastikan data yang terdampak, dan menghindari pengambilan data lebih banyak dari yang diperlukan.

Setelah itu, saya akan mengidentifikasi apakah penyebabnya adalah pemeriksaan kepemilikan objek yang tidak ada atau aturan otorisasi yang salah.

Saya akan merekomendasikan pemeriksaan hak akses di sisi server pada setiap permintaan yang relevan, kemudian membuat pengujian regresi agar pengguna tidak dapat mengakses objek milik pengguna lain.

## 97. Sebuah aplikasi menggunakan library yang memiliki CVE kritis. Apakah harus langsung diperbarui?

**Contoh jawaban:**

Saya akan segera menilai risikonya, tetapi tidak menganggap setiap CVE otomatis memiliki dampak yang sama terhadap semua aplikasi.

Saya akan memeriksa apakah versi tersebut benar-benar digunakan, apakah bagian yang rentan dapat dijangkau, apakah ada eksploitasi yang diketahui, dan apakah tersedia versi perbaikan.

Jika risikonya tinggi, tim perlu memprioritaskan pembaruan atau mitigasi sementara. Setelah itu, pengujian regresi diperlukan untuk memastikan pembaruan tidak merusak fungsi aplikasi.

## 98. Sebuah chatbot menjawab dengan data rahasia yang bukan milik pengguna. Apa dugaan awalmu?

**Contoh jawaban:**

Saya akan menyelidiki beberapa kemungkinan: kontrol akses pada sistem retrieval tidak berjalan, data antar pengguna tercampur, cache tidak dipisahkan dengan benar, atau informasi sensitif sudah masuk ke konteks model.

Saya tidak akan langsung menyimpulkan bahwa model menghafal data tersebut. Penyebabnya harus ditelusuri dari alur data dan arsitektur aplikasi.

Langkah berikutnya adalah membatasi dampak, mengumpulkan bukti yang aman, memperbaiki sumber masalah, dan menguji ulang skenario lintas pengguna.

## 99. Pipeline CI/CD menemukan kerentanan kritis menjelang rilis. Apa yang kamu lakukan?

**Contoh jawaban:**

Saya akan memverifikasi temuan, memahami dampaknya, dan menentukan apakah rilis perlu ditahan sesuai kebijakan organisasi.

Jika kerentanan valid dan berisiko tinggi, saya akan merekomendasikan perbaikan atau mitigasi yang memadai sebelum rilis. Jika ada alasan bisnis untuk melanjutkan, keputusan harus melalui proses pengecualian yang terdokumentasi dan disetujui oleh pihak yang berwenang.

Setelah itu, saya akan memastikan temuan ditangani dan pemeriksaan yang sesuai tetap berjalan pada rilis berikutnya.

## 100. Bagaimana menyusun program Application Security untuk perusahaan yang baru memulainya?

**Contoh jawaban:**

Saya akan mulai dengan memahami aplikasi yang dimiliki perusahaan, data yang diproses, arsitektur sistem, dan risiko bisnisnya.

Selanjutnya, saya akan menentukan kontrol dasar yang paling berdampak, seperti standar secure coding, pengelolaan secret, pemeriksaan dependency, pengujian autentikasi dan otorisasi, serta proses pelaporan dan perbaikan kerentanan.

Saya juga akan bekerja sama dengan developer untuk mengintegrasikan pengujian ke dalam proses pengembangan. Program perlu diukur melalui indikator yang berguna, seperti waktu perbaikan, temuan berulang, cakupan pengujian, dan risiko yang berhasil dikurangi.

## 101. Bagaimana menyusun program keamanan untuk produk AI?

**Contoh jawaban:**

Saya akan memulai dengan memetakan bagaimana produk AI digunakan, model yang dipakai, sumber data, integrasi eksternal, tools yang tersedia, dan jenis tindakan yang bisa dilakukan sistem.

Setelah itu, saya akan menilai risiko seperti prompt injection, kebocoran data, penyalahgunaan tools, ketergantungan pada komponen pihak ketiga, dan penyalahgunaan sumber daya.

Saya akan menerapkan kontrol pada level aplikasi, menguji skenario serangan yang relevan, dan memastikan ada monitoring serta proses respons insiden. Program juga perlu dievaluasi setiap kali model, sumber data, tools, atau arsitektur berubah.

# Bagian 15: Cara Belajar dan Checklist Sebelum Interview

Tidak semua kandidat perlu menguasai seluruh topik dengan kedalaman yang sama. Prioritas belajar sebaiknya disesuaikan dengan posisi yang dilamar.

## Jika melamar AppSec Engineer umum

Fokuskan persiapan pada:

- [ ] HTTP, browser, cookies, dan session.
- [ ] Authentication dan authorization.
- [ ] OWASP Top 10 dan kerentanan web.
- [ ] API security dan kontrol akses.
- [ ] Secure code review.
- [ ] SAST, DAST, SCA, dan dependency security.
- [ ] Threat modeling dan Secure SDLC.
- [ ] Dasar-dasar cloud dan secrets management.
- [ ] Pelaporan temuan dan prioritas perbaikan.

## Jika melamar posisi yang banyak menguji aplikasi secara langsung

Tambahkan materi:

- [ ] Reconnaissance dan pemetaan attack surface.
- [ ] Burp Suite dan pengujian HTTP.
- [ ] Pengujian autentikasi dan session management.
- [ ] Pengujian akses lintas pengguna.
- [ ] Pengujian input dan output.
- [ ] Validasi temuan dan proof of concept yang aman.
- [ ] Penyusunan laporan teknis.

## Jika melamar posisi yang berkaitan dengan AI Security

Tambahkan materi:

- [ ] Dasar LLM, prompt, context window, dan token.
- [ ] Prompt injection, baik langsung maupun tidak langsung.
- [ ] Kebocoran data dan pemisahan konteks antar pengguna.
- [ ] RAG, embedding, dan vector database.
- [ ] Insecure output handling.
- [ ] AI agent dan keamanan tools.
- [ ] AI supply chain dan data poisoning.
- [ ] AI red teaming dan regression testing.
- [ ] Logging, monitoring, dan tata kelola AI.

## Referensi resmi untuk belajar lebih lanjut

Berikut beberapa referensi yang dapat digunakan untuk memperdalam materi:

1. [OWASP Top 10](https://owasp.org/www-project-top-ten/) — risiko keamanan aplikasi web.
2. [OWASP API Security](https://owasp.org/www-project-api-security/) — risiko keamanan API.
3. [PortSwigger Web Security Academy](https://portswigger.net/web-security) — materi dan laboratorium praktik keamanan web.
4. [NIST Secure Software Development Framework](https://csrc.nist.gov/projects/ssdf) — panduan pengembangan software yang aman.
5. [OWASP GenAI Security Project](https://genai.owasp.org/) — panduan keamanan generative AI dan aplikasi berbasis LLM.
6. [OWASP Top 10 for LLM Applications](https://genai.owasp.org/llm-top-10/) — risiko utama aplikasi LLM dan langkah mitigasinya.
7. [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) — kerangka kerja untuk mengelola risiko AI.
8. [NIST Generative AI Profile](https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence) — panduan pengelolaan risiko generative AI.

# Penutup

Persiapan interview Application Security Engineer tidak harus dimulai dengan menghafal ratusan istilah. Mulailah dari cara kerja aplikasi, pahami bagaimana data berpindah antar komponen, lalu pelajari apa yang bisa salah dan bagaimana memperbaikinya.

Untuk setiap topik, cobalah menjawab empat pertanyaan sederhana:

1. Apa masalah keamanannya?
2. Bagaimana masalah itu bisa terjadi?
3. Apa dampaknya bagi aplikasi atau pengguna?
4. Bagaimana cara mencegah dan mengujinya?

Jika melamar posisi yang berhubungan dengan AI, jangan berhenti pada prompt injection. Pelajari juga bagaimana data diambil, bagaimana hak akses diterapkan, bagaimana tools dijalankan, dan bagaimana aplikasi tetap aman ketika model memberikan output yang tidak terduga.

**Tujuan interview bukan menunjukkan bahwa kamu hafal semua istilah. Tujuannya adalah menunjukkan bahwa kamu bisa berpikir seperti seorang security engineer: memahami risiko, menguji asumsi, membuktikan temuan, dan membantu tim memperbaiki masalah secara efektif.**