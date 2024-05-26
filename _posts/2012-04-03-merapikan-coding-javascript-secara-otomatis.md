---
id: 1147
title: 'Merapikan Coding JavaScript secara Otomatis'
date: '2012-04-03T06:21:21+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1147'
permalink: /2012/04/03/merapikan-coding-javascript-secara-otomatis/
post_views_count:
    - '489'
categories:
    - Coding
    - 'Dunia IT'
    - 'JavaScript - Jquery'
    - Uncategorized
tags:
    - javascript
    - 'javascript beautifier'
    - 'merapikan javascript'
---

[![](http://hangga.github.io/blog/wp-content/uploads/2012/04/JavaScript-Web-300x225.jpg "JavaScript-Web")](http://hangga.github.io/blog/wp-content/uploads/2012/04/JavaScript-Web.jpg)Mungkin teman2 pernah mengalami apa yg sy alami. Ketika kita mendevelop sebuah aplikasi berbasis web dimana kita harus menggunakan berbagai macam *library jquery* untuk mempercantik dan menambah interaktifitas *user interface*. Tetapi bukannya tambah cantik tapi malah terjadi *crash.* Nah terpaksa kita harus membongkar *script* satu persatu, baris demi baris untuk mencari penyebab *crash*.

Alangkah sialnya ketika kita membuka file .js yg berisi script seperti ini

```

&lt;pre&gt;(function(i){var l,t,r,q,a,p,h,o,j,w,b={boxId:&quot;superbox&quot;,boxClasses:&quot;&quot;,overlayOpacity:0.8,boxWidth:&quot;600&quot;,boxHeight:&quot;400&quot;,loadTxt:&quot;Loading...&quot;,closeTxt:&quot;Close&quot;,prevTxt:&quot;Previous&quot;,nextTxt:&quot;Next&quot;,beforeShow:function(){}},x={},m=false,s=i([]);
i.superbox=function(){w=i.extend({},b,i.superbox.settings);if(i.browser.msie&amp;&amp;i.browser.version&lt;7){s=s.add(&quot;select&quot;)
}n();z()};function z(){i(&quot;a[rel^=superbox],area[rel^=superbox]&quot;).each(function(){var D=i(this),F=D.attr(&quot;rel&quot;),B=F.match(/^superbox[([^#.]]+)/)[1],E=F.replace(&quot;superbox&quot;,&quot;&quot;).match(/([#.][^#.]]+)/g)||[],C=w.boxId,A=w.boxClasses;
this._relSettings=F.replace(&quot;superbox[&quot;+B+E.join(&quot;&quot;)+&quot;]&quot;,&quot;&quot;);i.each(E,function(G,H){if(H.substr(0,1)==&quot;#&quot;){C=H.substr(1)
}else{if(H.substr(0,1)==&quot;.&quot;){A+=&quot; &quot;+H.substr(1)}}});if(B.search(/^image|gallery|iframe|content|ajax$/)!=-1){D.superbox(B,{boxId:C,boxClasses:A})
}})}i.fn.superbox=function(B,A){A=i.extend({},w,A);i.superbox[B](this,A)};i.extend(i.superbox,{image:function(C,A,B){var E=f(C.get(0)),D=false;
if(E&amp;&amp;B==&quot;gallery&quot;){D=E[1]}else{if(E){D=E[0]}}C.click(function(F){F.preventDefault();
k();if(B==&quot;gallery&quot;){c(C,E[0])}y(function(){var H=false,G;if(D){H=D.split(&quot;x&quot;)}G=i('&lt;img src=&quot;'+C.attr(&quot;href&quot;)+'&quot; title=&quot;'+(C.attr(&quot;title&quot;)||C.text())+'&quot; /&gt;');
G.load(function(){g(G,H);e({boxClasses:&quot;image &quot;+A.boxClasses,boxId:A.boxId});u()}).appendTo($innerbox)
})})},gallery:function(B,A){var C=f(B.get(0));if(!x[C[0]]){x[C[0]]=[]}x[C[0]].push(B);
B.get(0)._superboxGroupKey=(x[C[0]].length-1);i.superbox.image(B,A,&quot;gallery&quot;)},iframe:function(B,A){var C=f(B.get(0));
B.click(function(D){D.preventDefault();k();y(function(){var F=false,E;if(C){F=C[0].split(&quot;x&quot;)
}A=i.extend({},A,{boxWidth:F[0]||A.boxWidth,boxHeight:F[1]||A.boxHeight});E=i('&lt;iframe src=&quot;'+B.attr(&quot;href&quot;)+'&quot; name=&quot;'+B.attr(&quot;href&quot;)+'&quot; frameborder=&quot;0&quot; scrolling=&quot;auto&quot; hspace=&quot;0&quot; width=&quot;'+A.boxWidth+'&quot; height=&quot;'+A.boxHeight+'&quot;&gt;&lt;/iframe&gt;');
E.load(function(){q.width(A.boxWidth+&quot;px&quot;);$innerbox.height(A.boxHeight+&quot;px&quot;);e({boxClasses:&quot;iframe &quot;+A.boxClasses,boxId:A.boxId});
u()}).appendTo($innerbox)})})},content:function(B,A){var C=f(B.get(0));B.click(function(D){D.preventDefault();&lt;/pre&gt;
```

Ternyata *script* tersebut sudah di kompres oleh si pembuatnya. Boro-boro mau merapikan, melihat saja pusing. Tapi tenanglah teman2, ternyata ada *tool* yg bisa kita gunakan untuk merapikan *script javascript* secara *online* dan otomatis.

Silahkan buka <http://jsbeautifier.org/>

*Copy script* Anda, lalu *paste.* Kemudian klik tombol \[***Beautify JavaScript and HTML\]*** di atas.

[![](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-03_133745-1024x500.png "2012-04-03_133745")](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-03_133745.png)

Selesailah sudah, sekarang *script* Anda sudah rapi..