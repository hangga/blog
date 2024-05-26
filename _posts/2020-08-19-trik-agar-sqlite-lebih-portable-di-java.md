---
id: 4068
title: 'Portabilitas SQLite dan Penyebab Error java.sql.SQLException: path to &#8216;bla.. bla..&#8217; does not exist'
date: '2020-08-19T08:04:46+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=4068'
permalink: /2020/08/19/trik-agar-sqlite-lebih-portable-di-java/
ct_founder_last_updated:
    - default
image: /wp-content/uploads/2019/05/javanewfeat-1.jpeg
categories:
    - Coding
tags:
    - Java
    - JDBC
    - SQLite
---

Untuk membuat sebuah aplikasi ***desktop – Java***, dengan kebutuhan transaksi sederhana, tanpa hubungan *client-server* a.k.a hanya main *local*-an saja, SQLite adalah pilihan yang tepat karena performanya(cepat dan ringan).

Ketika menghubungkan aplikasi dengan SQLite umumnya pada tutorial-tutorial yang ada adalah dengan cara seperti ini.

```
Connection conn = DriverManager.getConnection( "jdbc:sqlite::resource:database/test.db" );
```

atau, seperti ini (tergantung nama file-nya).

```
Connection conn = DriverManager.getConnection( "jdbc:sqlite::resource:database/data.sqlite" );
```

Dalam kasus ini, sy menggunakan IDE faforit sy yaitu Intellij IDEA Community Edition.

Ketika project di `Run` dari IDE berjalan dengan lancar. Namun ketika di build menjadi `app.jar`, kemudian dijalankan, terjadi `error` kurang lebih semacam ini:

![](http://hangga.github.io/blog/wp-content/uploads/2020/08/err.png)

# Mengapa terjadi?

Ketika kita `run` dengan meng-klik tombol `run` dari IDE, `working directory`-nya berada pada direktori `project` atau sesuai konfig anda saat create project.

Namun ketika project sudah di build menjadi `app.jar`, `working directory`-nya bukan lagi di dalam `project directory`. Tapi berada di direktori dimana ***app.jar*** itu berada. Biasanya di `<project name>/out/artifacts/project\_name\_jar/`

Saya terbiasa mengatur *app* direktori seperti ini.

![](http://hangga.github.io/blog/wp-content/uploads/2020/08/data-edit.png)

# Bagaimana Triknya.. 🤓

Agar *data.sqllite* lebih *portable* mengikuti *working directory* *app.jar* berada, sy mengakalinya dengan trik berikut ini dan terbukti *LANCAR JAYAA..*

Pada kelas [*System Utilities*](https://docs.oracle.com/javase/tutorial/essential/environment/system.html) milik *Java,* ada sebuah method untuk mendapatkan *user directory* yaitu *[**System.getProperty(“user.dir”).**](https://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html)*

Nah, ini bisa kita manfaatkan.

```
Connection getSqlite() {

String dbdir = "file:" + System.getProperty("user.dir") + "/data/db/data.sqlite";

try {
return DriverManager.getConnection("jdbc:sqlite::resource:" + dbdir);
} catch (SQLException e) {
System.out.println(e.getMessage());
return null;
}
}
```

Run di laptop sy dg OS Linux Mint lancar jaya. Wal hamdulillah ‘ala ni’matillah..

Eiits, tapi urusanya belum selesai. Ternyata test di *Windows 7* masih ***error no such file or directory.***

Saya ubah jadi seperti ini:

```
String dbdir = new File(Utils.getDbPath()).toURI().toString(); // Stable on Windows & Linux
```

Wal hamdulillah, lantjar djaja. Nanti malam sudah bisa tidur nyenyak.

Semoga bermanfaat.

<span style="text-decoration: underline;">Referensi:</span>

- <https://stackoverflow.com/questions/47681195/java-sqlite-db-file-cannot-be-found>
- <https://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html>