---
id: 172
title: 'Memanfaatkan library microsoft speech untuk mengubah tulisan menjadi suara'
date: '2008-11-01T08:26:10+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://web.omasastro.com/?p=72'
permalink: /2008/11/01/memanfaatkan-library-microsoft-speech-untuk-mengubah-tulisan-menjadi-suara/
post_views_count:
    - '227'
image: /wp-content/uploads/2008/11/5min-speech1-250x124.jpg
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
tags:
    - 'microsoft speech'
    - suara
    - 'teks ke suara'
    - 'teks to suara'
---

Iseng-seng ni, ingin mengubah tulisan teks menjadi suara..  
Haloo teman-teman, pernah kepikir ngga, mbuat aplikasi yang bs ngubah tulisan menjadi suara. He2x ternyata mudah dan berikut ini *sourcecode* nya

```

uses
Comobj;

procedure TForm1.Button1Click(Sender: TObject);
var
voice: OLEVariant;
begin
voice := CreateOLEObject('SAPI.SpVoice');
voice.Speak('Hello World!', 0);
end;
```

contoh, download di [sini](http://www.ziddu.com/errortracking.php?msg=File%20not%20found)