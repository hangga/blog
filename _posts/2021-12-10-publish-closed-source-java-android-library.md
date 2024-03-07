---
id: 4923
title: 'Publish Closed-Source Java/Android Library'
date: '2021-12-10T13:03:40+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4923'
permalink: /2021/12/10/publish-closed-source-java-android-library/
image: /wp-content/uploads/2021/12/adobestock_document_library-828x500.jpeg
categories:
    - Android
    - Coding
    - 'Software Development'
    - 'source code'
tags:
    - Java
    - maven
    - publish
    - 'publish android library'
    - 'publish closed-source android library'
    - 'publish closed-source java library'
    - 'publish closed-source library'
    - 'publish java library'
    - 'publish library'
tags: [featured]
---

### Maven

Sebagai Java Developer, tentu tidak asing dengan *Maven*, yaitu salah satu *Build tool* yang berfungsi untuk menangani *build, release, manage* *dependensi* dll secara terotomatisasi.

Adapun contoh *Build Tool* yang lain yang juga familiar adalah *Gradle*, seperti pada *Android Studio* atau pada sebagian besar *IDE* modern yang ada saat ini.

### Maven Repository

Sedangkan *Maven* *Repository* adalah *direktori/hosting/server* tempat di mana semua *artifak*/ *library/ plugin* disimpan dan nantinya dapat diakses oleh *local build tool(Maven/Gradle)*.

<figure class="wp-caption alignnone" style="width: 700px">![](https://www.cloudrepo.io/assets/Public-Maven-Repositories-efe205689a590308a257733da1f14c45834fc47b4fde9e7c3432e1c17c378421.png)<figcaption class="wp-caption-text">Source: https://www.cloudrepo.io</figcaption></figure>

Adapun *file* *artifak* *library* biasanya berupa *file* .*jar* untuk *Java library* dan .*aar* untuk *Android library*.

Bagi seorang *Java/Android developer*, tentu tidak asing dengan *Gradle script* seperti dibawah ini.

```
repositories {
    ...
    google()
    mavenCentral()
    maven { url "https://developer.huawei.com/repo/" }
    ...
}
```

*Script* diatas artinya project yang di develop akan menggunakan *library-library* yang ada di repositori yang dideklarasikan, yaitu *GoogleMaven, Maven Central* dan *Maven Repo Huawei*.

Sehingga bagi seorang *Java Library Developer*, kebutuhan akan *hosting Maven Repository* sangatlah penting, yaitu untuk mem*publish* *ibrary* yang telah di*develop.* Dan yang jelas pasti akan lebih keren, karena nanti deklarasinya akan seperti ini 😎 haha.

```
repositories {
    ...
    maven { url "< Url repository anda >" }
    ...
}
```

### Publish Library ke Maven Repository

Sebelum masuk ke pembahasan tentang *publishing*, perlu diketahui ada beberapa alternatif *Maven Repository* yang bisa digunakan antara lain (ini sebatas yang saya tahu saja lho 😁✌️, mungkin masih banyak alternatif lainya):

##### 1. [jitpack.io](https://jitpack.io)

Kelebihan *jitpack* adalah terintegrasi dengan *Github* untuk *open source library*. Caranyapun gampang banget, tinggal ketik *url github*nya, kemudian akan tergenerate *gradle script*nya.

Sedangkan untuk library yang *non opensource* atau *closed-source* harus pilih yang berbayar lur… 😎

##### 2. [packagecloud.io](https://packagecloud.io)

Gratis namun dibatasi 2GB Storage dan 10GB Transfer. Lumayan keren, namun sepertinya masih ingin melirik yang lain.

##### 3. [Repsy.io](https://repsy.io)

Gratis sampai dengan 3 GB Storage dan Unlimited Repositories, dan inilah yang saya gunakan.

##### 4. Self-hosted Maven Repository

A.k.a Bikin *Maven repo* di *hosting/server* sendiri. Sebenarnya ini pilihan paling keren. Tapi sayangnya, beberapa teman DevOps yang saya tanya, kurang familiar dengan JVM.

##### 5. Maven Central

Pilihan yang keren, tapi [requirement](https://maven.apache.org/repository/guide-central-repository-upload.html)nya kok ribet banget ya. Bakal panjang perjalanannya.

##### 6. Google Cloud – Artifact Registry

Siapa yang ragu akan layanan Google Cloud. Tapi ya jelas ada harga, ada rupa. Bila berminat, bisa lihat sendiri [pricingnya](https://cloud.google.com/artifact-registry/pricing).

##### 7. Azure DevOps Service

Layanan milik Microsoft ini ada fitur Azure Artifact dan fitur-fitur keren lainya. Tapi, lihat [rincian biaya](https://azure.microsoft.com/en-us/pricing/details/devops/azure-devops-services/)nya saya kok pusing ya.

### Publish library ke [Repsy.io](https://repsy.io)

Dari beberapa alternatif *Maven Hosting* yang ada, setelah sekian lama explorasi, baca referensi sana-sini, singkat cerita akhirnya pilihan saya jatuh pada [Repsy.io](https://repsy.io). 😁

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-19.50.29-700x438.png)

Repsy ini tidak hanya untuk *Maven Repository* saja, tapi juga *NPM Regisrty* dan *Python Regisrty.*

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-19.52.52-700x339.png)  
Oke, kita mulai step by stepnya.

###### 1. Register.

Yak, silahkan daftar dulu gan.😊 kalo belum punya akun. Langsung saja Buka <https://repsy.io> lalu klik menu *register*. Nah, setelah berhasil *register*, kemudian silahkan *login*.

###### 2. Membuat repository.

Kemudian bagian side menu kiri, pilih menu ***Maven.***

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-18.45.03.png)

Kemudian buat repositori baru dengan nama sesuai nama *module* dalam *project* anda. Caranya, tinggal ketik nama repo, laku klik tombol plus.

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-18.48.28-300x148.png)

###### 3. Set sebagai Publik Repository.

Agar dapat diakses secara umum, maka repositori harus di*set* sebagai *public repository*. Sebagai contoh, repository yang saya buat ini bernama ***gampil.*** Klik menu setting warna merah di sisi kanan. Lalu pada option <span style="color: #0000ff;">**Private repository**</span>, silahkan ubah menjadi <span style="color: #0000ff;">*disable*</span> .

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-18.51.40-700x266.png)

###### 4. Build artifak.

Buka *library project* anda, kemudian silahkan *build* *library* *module* anda. Setelah berhasil build, akan menghasilkan *file* artifak, biasanya berekstensi *.aar* atau *.jar di direktori <span style="color: #0000ff;">*build/outputs/aar/&lt; namafile-release.aar &gt;* </span>.*  Nah, file artifak ini yang bakal kita publish ke Repsy.io. Oh iya, di project ini saya menggunakan ***Intellij IDEA Community Edition***, bisa juga dengan ***Android Studio***.

###### ![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-18.57.03-700x710.png)  
5. Membuat publishing script pada gradle.

Cara untuk mempublish artifak adalah mengunakan *gradle script* seperti berikut ini.

```
plugins {
    id 'com.android.library'
    id 'maven-publish' // <-- Plugin Maven Publish
}

group = 'id.hangga.gampil' // <-- Full package name
version = '1.0.3'
archivesBaseName = "gampil" // <-- nama artifak

publishing {

    publications {
        aar(MavenPublication) {
            groupId group
            artifactId archivesBaseName
            version project.version
            artifact("$buildDir/outputs/aar/${archivesBaseName}-release.aar") 
            // Lokasi artifak hasil build
        }
    }

    repositories {
        maven {
            url 'https://repo.repsy.io/mvn//'
            credentials {
                username '< usernamenya >'
                password '< passwordnya >'
            }
        }
    }
}
```

Jika tidak ada *error* pada saat *synchronize*, maka tinggal klik menu ***publish*** yang berada dibawah nama modul library anda.

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-19.04.44-700x619.png)

Jika *publishing* berhasil, maka akan muncul pesan berikut ini pada *IDE Android Studio* atau *Intellij IDEA*.

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-19.05.48-700x251.png)

Nah, sekarang buka kembali halaman repsy.io, kemudian cek version terbaru apakah sesuai dengan publish terbaru.

![](https://hangga.github.io/blog/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-19.11.57-edited-700x179.png)

Jika sudah muncul versi terbaru, maka artinya *library* anda sudah *update* dan siap digunakan oleh *user/ developer*.

###### 6. Testing

Setelah berhasil publish, untuk sekedar quick testing, bisa dicoba install library pada project seperti biasa.

Tambahkan remote maven repo pada *build script*

```
allprojects {
    repositories {
        google()
        mavenCentral()
        maven {url 'https://repo.repsy.io/mvn/hangga/gampil'}
    }
}
```

Kemudian tambahkan dependensi seperti biasa. haha..

```
dependencies {
   ...
   implementation 'id.hangga.gampilcamera:gampil:1.0.4'
   ...
   ...
}
```

Selamat ber*experimen.* 😎