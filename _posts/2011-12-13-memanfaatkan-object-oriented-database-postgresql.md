---
id: 886
title: 'Memanfaatkan Object Oriented Database PostgreSQL'
date: '2011-12-13T00:52:17+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=886'
permalink: /2011/12/13/memanfaatkan-object-oriented-database-postgresql/
post_views_count:
    - '226'
image: /wp-content/uploads/2012/03/application_feature-250x112.jpg
categories:
    - Database
    - 'Dunia IT'
    - Uncategorized
tags:
    - 'object oriented database'
    - postgre
---

<span style="color: #008080;">***[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/logo_postgres-791620-300x237.png "logo_postgres-791620")](http://hangga.github.io/blog/wp-content/uploads/2011/12/logo_postgres-791620.png)PostgreSQL***</span> adalah salah satu *database engine* faforit saya. Alasannya karena banyak kelebihan yg dimiliki oleh <span style="color: #008080;">***PostgreSQL.*** <span style="color: #000000;">Diantaranya adalah:</span></span>

1. **Cross platform** PostgreSQL dapat dijalankan hampir di setiap jenis Unix (34 platform yang paling baru dirilis), juga di Windows dengan menggunakan Cygwin.
2. **Desain database GUI dan administration tools**  
    Selain <span style="color: #008080;">**PgAdmin**</span> yang merupakan tool bawaan <span style="color: #008080;">***PostgreSQL,***<span style="color: #000000;"> banyak juga tool2 *database managament tool* lain dari perusahaan pihak ketiga seperti PgManager dan lain-lain. </span></span>
3. **Terpercaya dan stabil**  
    Banyak perusahaan yang melaporkan bahwa PostgreSQL tidak pernah, bahkan sekalipun, mengalami crashed pada saat melakukan operasi dengan tingkat aktivitas yang tinggi.
4. **Object Oriented**, Dan lain-lain.

Tapi, yang paling saya suka dari <span style="color: #008080;">***PostgreSQL*** </span>adalah nomor 4 yaitu *Object Oriented*-nya. Jika selama ini kita mengenal konsep *object oriented* dalam bahasa pemrograman. Maka di <span style="color: #008080;">***PostgreSQL*** </span>kita dapat melakukan hal yang sama. Kita dapat meng ***inherits** object-object* di ***<span style="color: #008080;">PostgreSQL</span>.***

Berikut ini contohnya :

```

CREATE TABLE "public"."customer" (
"id" INTEGER NOT NULL,
"nama" VARCHAR(300),
"email" VARCHAR(32),
"telp" VARCHAR(32),
CONSTRAINT "cusomer_pkey" PRIMARY KEY("id")
) WITHOUT OIDS;
```

Kemudian misalkan kita akan membuat turunan dari tabel “customer”, caranya sebagai berikut :

Kita beri nama misalnya “special\_customer”

```

CREATE TABLE "public"."special_customer" (
"level" INTEGER
) INHERITS ("public"."customer")
WITHOUT OIDS;
```

Jika kita query tabel “special\_customer”

```


select * from special_customer

```

Hasilnya sebagai berikut :

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/2011-12-13_074705-300x45.png "2011-12-13_074705")](http://hangga.github.io/blog/wp-content/uploads/2011/12/2011-12-13_074705.png)

Sedangkan jika kita query tabel “customer” maka hasilnya sebagai berikut :

```


select * from customer

```

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/customer-300x99.png "customer")](http://hangga.github.io/blog/wp-content/uploads/2011/12/customer.png)

Mari kita perhatikan. Isi record dari tabel special\_customer juga ikut muncul ketika tabel induknya “customer” di *select.*

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/customer-2-300x99.png "customer-2")](http://hangga.github.io/blog/wp-content/uploads/2011/12/customer-2.png)