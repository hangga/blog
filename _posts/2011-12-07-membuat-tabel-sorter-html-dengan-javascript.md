---
id: 815
title: 'Sorting Tabel HTML dengan JavaScript'
date: '2011-12-07T05:21:45+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=815'
permalink: /2011/12/07/membuat-tabel-sorter-html-dengan-javascript/
post_views_count:
    - '190'
image: /wp-content/uploads/2012/03/application_feature-250x112.jpg
categories:
    - Coding
    - 'Dunia IT'
    - 'JavaScript - Jquery'
    - Uncategorized
tags:
    - 'sorting html'
    - 'sorting javascript'
    - 'sorting table'
---

Teman-2 pernah menjumpai *table*  di sebuah halaman web yang data yang ada didalamnya bisa di *sorting* atau di urutkan berdasarkan kolom yang dipilih. Yah itulah yang saya maksud, entah apa namanya tapi saya menyebutnya dengan tabel *sorter****.***

Tabel *Sorter* ini sangat bermanfaat dan sering digunakan dalam aplikasi *web base.* Beberapa waktu lalu saya menemukan sebuah *script* yang berfungsi untuk men*sorting* tabel *html. Script* ini dibuat oleh seorang programmer yang baik hati dan boleh di [download](http://www.scriptiny.com/2009/03/table-sorter/) secara cuma-cuma.

Contoh sederhananya adalah seperti di bawah ini :

<link href="http://hangga.github.io/blog/sorting/style.css" rel="stylesheet"></link>| ### ID | ### Name | ### Phone | ### Email | ### Zip |
|---|---|---|---|---|
| 8 | Harper Bowen | (810) 652-6704 | [dis@duinec.ca](mailto:#) | 77110 |
| 9 | Caldwell Larson | (850) 562-3177 | [elit@dolor.com](mailto:#) | 87519 |
| 10 | Baker Osborn | (378) 371-0559 | [turpis.Nulla@ac.edu](mailto:#) | 69446 |
| 11 | Yael Owens | (465) 520-1801 | [nunc.ac.mattis@enim.com](mailto:#) | 93872 |
| 12 | Fletcher Briggs | (992) 962-9419 | [amet.ante@lentesque.edu](mailto:#) | 87282 |
| 13 | Maggy Murphy | (585) 210-0390 | [eu@Integer.com](mailto:#) | 98081 |
| 14 | Maggie Blake | (489) 101-5447 | [rutrum.non.hendrerit@iaculis.org](mailto:#) | 85131 |
| 15 | Ginger Bell | (934) 692-7294 | [erat.in.conetuer@pedenout.org](mailto:#) | 78878 |
| 16 | Iliana Ballard | (806) 835-7035 | [vel.sapien@mi.ca](mailto:#) | 84718 |
| 50 | Eden Burks | (576) 196-6013 | [lorem@magna.com](mailto:#) | 30822 |

<script src="http://hangga.github.io/blog/sorting/script.js" type="text/javascript"></script>  
<script type="text/javascript">// <![CDATA[
		var sorter = new TINY.table.sorter("sorter");
			sorter.head = "head";
			sorter.asc = "asc";
			sorter.desc = "desc";
			sorter.even = "evenrow";
			sorter.odd = "oddrow";
			sorter.evensel = "evenselected";
			sorter.oddsel = "oddselected";
			sorter.paginate = true;
			sorter.currentid = "currentpage";
			sorter.limitid = "pagelimit";
			sorter.init("table",1);

// ]]></script>  
sourcenya sebagai berikut :

```

&lt;link rel="stylesheet" href="http://hangga.github.io/blog/sorting/style.css" /&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;table cellpadding="0" cellspacing="0" border="0" id="table" class="sortable"&gt;
&lt;thead&gt;
&lt;tr&gt;
&lt;th class="nosort"&gt;&lt;h3&gt;ID&lt;/h3&gt;&lt;/th&gt;
&lt;th&gt;&lt;h3&gt;Name&lt;/h3&gt;&lt;/th&gt;
&lt;th&gt;&lt;h3&gt;Phone&lt;/h3&gt;&lt;/th&gt;
&lt;th&gt;&lt;h3&gt;Email&lt;/h3&gt;&lt;/th&gt;
&lt;th&gt;&lt;h3&gt;Zip&lt;/h3&gt;&lt;/th&gt;

&lt;/tr&gt;
&lt;/thead&gt;
&lt;tbody&gt;

&lt;tr&gt;
&lt;td&gt;8&lt;/td&gt;
&lt;td&gt;Harper Bowen&lt;/td&gt;
&lt;td&gt;(810) 652-6704&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;dis@duinec.ca&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;77110&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;9&lt;/td&gt;
&lt;td&gt;Caldwell Larson&lt;/td&gt;
&lt;td&gt;(850) 562-3177&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;elit@dolor.com&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;87519&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;10&lt;/td&gt;
&lt;td&gt;Baker Osborn&lt;/td&gt;
&lt;td&gt;(378) 371-0559&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;turpis.Nulla@ac.edu&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;69446&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;11&lt;/td&gt;
&lt;td&gt;Yael Owens&lt;/td&gt;
&lt;td&gt;(465) 520-1801&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;nunc.ac.mattis@enim.com&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;93872&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;12&lt;/td&gt;
&lt;td&gt;Fletcher Briggs&lt;/td&gt;
&lt;td&gt;(992) 962-9419&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;amet.ante@lentesque.edu&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;87282&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;13&lt;/td&gt;
&lt;td&gt;Maggy Murphy&lt;/td&gt;
&lt;td&gt;(585) 210-0390&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;eu@Integer.com&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;98081&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;14&lt;/td&gt;
&lt;td&gt;Maggie Blake&lt;/td&gt;
&lt;td&gt;(489) 101-5447&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;rutrum.non.hendrerit@iaculis.org&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;85131&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;15&lt;/td&gt;
&lt;td&gt;Ginger Bell&lt;/td&gt;
&lt;td&gt;(934) 692-7294&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;erat.in.conetuer@pedenout.org&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;78878&lt;/td&gt;

&lt;/tr&gt;
&lt;tr&gt;
&lt;td&gt;16&lt;/td&gt;
&lt;td&gt;Iliana Ballard&lt;/td&gt;
&lt;td&gt;(806) 835-7035&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;vel.sapien@mi.ca&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;84718&lt;/td&gt;

&lt;/tr&gt;

&lt;tr&gt;
&lt;td&gt;50&lt;/td&gt;
&lt;td&gt;Eden Burks&lt;/td&gt;
&lt;td&gt;(576) 196-6013&lt;/td&gt;
&lt;td&gt;&lt;a href="mailto:#"&gt;lorem@magna.com&lt;/a&gt;&lt;/td&gt;
&lt;td&gt;30822&lt;/td&gt;

&lt;/tr&gt;
&lt;/tbody&gt;
&lt;/table&gt;

&lt;script type="text/javascript" src="http://hangga.github.io/blog/sorting/script.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
var sorter = new TINY.table.sorter("sorter");
sorter.head = "head";
sorter.asc = "asc";
sorter.desc = "desc";
sorter.even = "evenrow";
sorter.odd = "oddrow";
sorter.evensel = "evenselected";
sorter.oddsel = "oddselected";
sorter.paginate = true;
sorter.currentid = "currentpage";
sorter.limitid = "pagelimit";
sorter.init("table",1);
&lt;/script&gt;
```