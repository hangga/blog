---
id: 5112
title: 'Mencoba Javalin : Membuat REST-API Data Santri'
date: '2023-08-14T23:19:18+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=5112'
permalink: /2023/08/14/membuat-rest-api-data-santri-dengan-javalin/
image: /wp-content/uploads/2023/08/javalin.png
categories:
    - Coding
tags:
    - api
    - backend
    - Java
    - javalin
    - kotlin
    - rest-api
---

Halo manteman. Setelah sekian lama tidak posting di blog ini(bukan karena malas, tapi karena sebagian ide nulis saya tuangkan di [sini](https://hangga-aji-sayekti.medium.com/)), kali ini ingin share sedikit tentang salah satu *framework* yang tak kalah keren yaitu [***Javalin***](https://javalin.io/).

Javalin adalah sebuah *framework* atau tepatnya *micro framework* yang dirancang untuk memudahkan pembuatan aplikasi web dengan menggunakan *Java* dan *Kotlin*. Framework ini membantu pengembang dalam membangun aplikasi web dengan lebih cepat dan efisien, terutama untuk proyek-proyek yang tidak memerlukan kompleksitas yang terlalu besar.

Sederhananya, *Javalin* adalah seperangkat alat dan aturan yang telah disusun sebelumnya untuk mempermudah proses pembuatan aplikasi web. Ketika kita ingin membuat halaman web atau API, kita bisa menggunakan Javalin untuk mengatur bagaimana permintaan (request) dari pengguna diterima dan direspons oleh server.

### Keuntungan Menggunakan ***Javalin***

Keuntungan dari menggunakan ***Javalin*** adalah:

1. **Sederhana**: Javalin didesain untuk menjadi sederhana dan mudah dimengerti. Ini cocok bagi pengembang yang tidak ingin terjebak dalam kerumitan framework yang lebih besar.
2. **Ringan**: Javalin memiliki ukuran yang relatif kecil dan tidak banyak menggunakan sumber daya, sehingga cocok untuk proyek-proyek kecil hingga menengah.
3. **Cepat**: Karena Javalin adalah kerangka kerja mikro, ia biasanya memiliki performa yang lebih cepat dibandingkan dengan kerangka kerja yang lebih besar dan kompleks.
4. **Mudah Diintegrasikan**: Javalin memungkinkan integrasi dengan berbagai alat dan pustaka lain dalam ekosistem Java.
5. **Mendukung Kotlin**: Selain Java, Javalin juga mendukung pemrograman dengan bahasa Kotlin, yang semakin mempermudah proses pengembangan.
6. **Fleksibel**: Meskipun sederhana, Javalin tetap memberikan fleksibilitas dalam mengatur cara aplikasi web kita berperilaku.

Jadi, secara keseluruhan, Javalin adalah alat yang membantu pengembang dalam membuat aplikasi web dengan bahasa Java atau Kotlin dengan lebih mudah, cepat, dan sederhana. Ia fokus pada tugas-tugas dasar dalam pembuatan aplikasi web, memberikan kerangka kerja yang minimalis namun efektif untuk proyek-proyek tertentu.

### Studi Kasus Sederhana : Membuat REST-API Data Santri

**Langkah 1: Environtment**

Sebelum memulai, pastikan Anda memiliki perangkat lunak yang diperlukan terpasang di komputer Anda:

1. **Intellij IDEA**: Integrated Development Environment (IDE) yang kuat dan populer untuk pengembangan Java. Silahkan pilih yang Community Edition untuk yang gratis.
2. **Gradle**: Alat manajemen proyek yang akan membantu mengelola dependensi dan build proyek.
3. **MySQL Database**: Pastikan Anda memiliki database MySQL yang sudah diinstal dan berjalan.

**Langkah 2: Membuat Project**

Buka Intellij IDEA dan buat proyek baru seperti biasa:

1. Pilih “New Project”.
2. Pilih “Gradle” dari sisi kiri dan pastikan Anda memilih “Java” sebagai bahasa proyek.
3. Berikan nama proyek, misalnya “SantriAPI”, dan tentukan lokasi penyimpanan proyek.
4. Klik “Finish” untuk membuat proyek.

**Langkah 3: Menambahkan Dependensi Javalin**

1\. Buka file `build.gradle` dalam proyek Anda.  
2\. Tambahkan dependensi Javalin ke dalam blok `dependencies`:

```java
dependencies {
    implementation 'io.javalin:javalin:3.15.0'
}
```

3\. Klik “Sync Now” untuk mengunduh dan mengintegrasikan dependensi Javalin ke proyek Anda.

**Langkah 4: Membuat API Endpoint**

1. Buat package baru dalam direktori `src/main/java` dengan nama `com.example.santriapi`.
2. Dalam package tersebut, buat file bernama `SantriApp.java`.

```java
package com.example.santriapi;

import io.javalin.Javalin;

public class SantriApp {
    public static void main(String[] args) {
        Javalin app = Javalin.create().start(7000);

        app.get("/", ctx -> ctx.result("Selamat datang di API Santri"));

        // Tambahkan endpoint-endpoint lain di sini
    }
}
```

**Langkah 5: Konek ke Database MySQL**

Tambahkan dependensi JDBC MySQL ke file `build.gradle`:

```java
dependencies {
    implementation 'io.javalin:javalin:3.15.0'
    implementation 'mysql:mysql-connector-java:8.0.26'
}
```

Kemudian, buat file Database.java dalam package yang sama dengan SantriApp.java:

```java
package com.example.santriapi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                String url = "jdbc:mysql://localhost:3306/your_database_name";
                String user = "your_username";
                String password = "your_password";
                connection = DriverManager.getConnection(url, user, password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
```

**Langkah 6: Membuat Endpoints CRUD**

```java
package com.example.santriapi;

import io.javalin.Javalin;
import io.javalin.http.Context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SantriApp {
    public static void main(String[] args) {
        Javalin app = Javalin.create().start(7000);

        app.get("/", ctx -> ctx.result("Selamat datang di API Santri"));

        app.get("/santri", SantriApp::getAllSantri);
        app.get("/santri/:id", SantriApp::getSantriById);
        app.post("/santri", SantriApp::createSantri);
        app.put("/santri/:id", SantriApp::updateSantri);
        app.delete("/santri/:id", SantriApp::deleteSantri);
    }

    private static void getAllSantri(Context ctx) {
        List santriList = new ArrayList<>();
        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM santri");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nama = resultSet.getString("nama");
                String alamatAsal = resultSet.getString("alamat_asal");
                String tanggalLahir = resultSet.getString("tgl_lahir");

                santriList.add(new Santri(id, nama, alamatAsal, tanggalLahir));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ctx.json(santriList);
    }

    private static void getSantriById(Context ctx) {
        int santriId = Integer.parseInt(ctx.pathParam("id"));
        Santri santri = null;

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM santri WHERE id = ?");
            statement.setInt(1, santriId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nama = resultSet.getString("nama");
                String alamatAsal = resultSet.getString("alamat_asal");
                String tanggalLahir = resultSet.getString("tgl_lahir");

                santri = new Santri(id, nama, alamatAsal, tanggalLahir);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (santri != null) {
            ctx.json(santri);
        } else {
            ctx.status(404).result("Santri not found");
        }
    }

    private static void createSantri(Context ctx) {
        Santri newSantri = ctx.bodyAsClass(Santri.class);

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO santri (nama, alamat_asal, tgl_lahir) VALUES (?, ?, ?)"
            );
            statement.setString(1, newSantri.getNama());
            statement.setString(2, newSantri.getAlamatAsal());
            statement.setString(3, newSantri.getTanggalLahir());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ctx.status(201).result("Santri created");
    }

    private static void updateSantri(Context ctx) {
        int santriId = Integer.parseInt(ctx.pathParam("id"));
        Santri updatedSantri = ctx.bodyAsClass(Santri.class);

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = connection.prepareStatement(
                "UPDATE santri SET nama = ?, alamat_asal = ?, tgl_lahir = ? WHERE id = ?"
            );
            statement.setString(1, updatedSantri.getNama());
            statement.setString(2, updatedSantri.getAlamatAsal());
            statement.setString(3, updatedSantri.getTanggalLahir());
            statement.setInt(4, santriId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ctx.result("Santri updated");
    }

    private static void deleteSantri(Context ctx) {
        int santriId = Integer.parseInt(ctx.pathParam("id"));

        try {
            Connection connection = Database.getConnection();
            PreparedStatement statement = connection.prepareStatement("DELETE FROM santri WHERE id = ?");
            statement.setInt(1, santriId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ctx.result("Santri deleted");
    }
}
```

**Langkah 7: Menjalankan Aplikasi**

Klik kanan pada `SantriApp.java` dan pilih “Run ‘SantriApp.main()'”.

### Uji Coba

Berikut adalah contoh pengujian endpoint-endpoint yang telah kita buat menggunakan Postman atau Insomnia:

**1. Mengambil Semua Data Santri (GET)**

- Method: GET
- URL: <http://localhost:7000/santri>

**2. Mengambil Data Santri Berdasarkan ID (GET)**

- Method: GET
- URL: <http://localhost:7000/santri/1>

**3. Menambahkan Data Santri Baru (POST)**

- Method: POST
- URL: <http://localhost:7000/santri>
- Body (JSON):

```json
{
    "nama": "Ahmad",
    "alamatAsal": "Bandung",
    "tanggalLahir": "2000-03-15"
}
```

**4. Mengupdate Data Santri Berdasarkan ID (PUT)**

- Method: PUT
- URL: <http://localhost:7000/santri/1>
- Body (JSON):

```json
{
    "nama": "Ali",
    "alamatAsal": "Jakarta",
    "tanggalLahir": "1998-08-10"
}
```

**5. Menghapus Data Santri Berdasarkan ID (DELETE)**

- Method: DELETE
- URL: <http://localhost:7000/santri/1>

Pastikan Anda menjalankan aplikasi `SantriApp` di Intellij IDEA atau IDE lainnya sebelum melakukan pengujian menggunakan Postman atau Insomnia. Selanjutnya, ikuti langkah-langkah di atas untuk menguji setiap endpoint. Ingatlah untuk menyesuaikan URL dan payload JSON sesuai dengan data yang ingin Anda gunakan dalam pengujian.

Setelah melakukan pengujian, Anda dapat melihat hasil respon dari masing-masing endpoint dan memastikan bahwa operasi CRUD berjalan dengan benar sesuai yang diharapkan.

Sekian temanteman, selamat mencoba. Terimakasih