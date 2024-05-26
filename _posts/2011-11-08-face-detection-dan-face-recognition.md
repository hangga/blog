---
id: 218
title: 'Face Detection dan Face Recognition'
date: '2011-11-08T04:25:37+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=218'
permalink: /2011/11/08/face-detection-dan-face-recognition/
post_views_count:
    - '353'
categories:
    - Coding
    - 'Dunia IT'
    - 'JavaScript - Jquery'
tags:
    - face
    - 'face detection'
    - 'face detection jquery'
    - 'face recognition'
    - jquery
---

*[![](http://hangga.github.io/blog/wp-content/uploads/2011/11/pic_031.jpg "pic_03")](http://hangga.github.io/blog/wp-content/uploads/2011/11/pic_031.jpg)Face detection* adalah sebuah algoritma untuk mendeteksi apakah di dalam sebuah gambar terdapat unsur-unsur wajah(mata, hidung, telinga dan mulut, jarak 2 mata, jarak antara mulut dan hidung dan lain2) atau tidak. Sedangkan *Face Recognition* atau pengenalan wajah adalah teknologi kelanjutanya, yaitu mencocokan hasil *face detection* dengan data yang tersimpan dalam database.

Saat ini teknologi *face recognition* ini telah banyak dimanfaatkan dalam berbagai bidang misalnya dalam sistem presensi karyawan. Dengan teknologi ini, perusahaan khususnya yang memiliki banyak karyawan dapat meminimalisir terjadinya *titip presensi(*seperti teman2 kuliah saya dulu yang tukang bolos*).*

[![](http://hangga.github.io/blog/wp-content/uploads/2011/11/car_photo_221259_7-150x150.jpg "car_photo_221259_7")](http://hangga.github.io/blog/wp-content/uploads/2011/11/car_photo_221259_7.jpg)Algoritma ini telah banyak di implementasikan di berbagai bahasa pemrograman. Nah tahukah teman2 bahwa ada *developer* baik hati yang telah membuat *plugin face detection jquery* dan gratis untuk di [download](https://github.com/jaysalvat/jquery.facedetection/zipball/release). Sehingga kita dapat membuat aplikasi *face detection* dengan mudah.

Oke teman2 langsung ke TKP saja..

Langkah2-nya adalah sebagai berikut :

1\. download *plugin*nya di [sini](https://github.com/jaysalvat/jquery.facedetection/zipball/release),

2\. *Extract* filenya, hasil *extract-*annya sebagai berikut :

[![](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_1233411.png "2011-11-08_123341")](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_1233411.png)

buka folder <span style="color: #800000;">js, <span style="color: #000000;">isinya adalah sbb: </span></span>

[![](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_125334.png "2011-11-08_125334")](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_125334.png)

kemudian kalau folder facedetection dibuka, isinya sbb :

[![](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_1253441.png "2011-11-08_125344")](http://hangga.github.io/blog/wp-content/uploads/2011/11/2011-11-08_1253441.png)

3\. Ambil folder js dan letakkan pada direktori web Anda. Terserah dimana, bebas.

4\. Coding.

Sisipkan semua file di dalam folder js tadi di dalam tag &lt;head&gt;…&lt;/head&gt;.

```

&lt;script src=&quot;js/jquery-1.6.2.min.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;js/facedetection/ccv.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;js/facedetection/face.js&quot;&gt;&lt;/script&gt;
&lt;script src=&quot;js/jquery.facedetection.js&quot;&gt;&lt;/script&gt;
```

Lalu buat fungsi untuk event onclicknya

```

$(function() {
$('#tombol').click(function() {
		var $this = $(this);

	var coords = $('img').faceDetection({
		complete:function() {
			$this.text('Done!');
		},
		error:function(img, code, message) {
			$this.text('error!');
			alert('Error: '+message);
		}
	});
	for (var i = 0; i &lt; coords.length; i++) {
		$('&lt;div&gt;', {
			'class':'face',
			'css': {
				'position':'absolute',
				'left'  : coords[i].positionX +'px',
				'top'   : coords[i].positionY +'px',
				'width' : coords[i].width +'px',
				'height': coords[i].height +'px'
			}
		}).appendTo('#content');
	}
	});
	return false;
});
```

```
&lt;a href=&quot;#&quot; id=&quot;tombol&quot;&gt;Klik Disini&lt;/a&gt;
```

Kemudian image atau file gambar yang akan di deteksi

```
&lt;img src=&quot;img/faces.jpg&quot; id=&quot;myPicture&quot;/&gt;
```

Adapun contoh aplikasi yang telah saya buat dengan menggunakan *plugin face detection jquery* dapat teman2 lihat di [sini](http://hangga.github.io/blog/deteksiwajah).  
<script type="text/javascript">// <![CDATA[
      /**  **/ var sitti_pub_id = "BC0016648"; var sitti_ad_width = "468"; var sitti_ad_height = "60"; var sitti_ad_type = "9"; var sitti_ad_number = "2"; var sitti_ad_name = ""; var sitti_dep_id = "40358";
// ]]></script>  
<script src="http://stat.sittiad.com/delivery/sittiad.b1.js" type="text/javascript"></script>