---
id: 171
title: 'Membuat fungsi &#8220;explode&#8221; di Pascal'
date: '2011-11-01T08:21:21+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://web.omasastro.com/?p=69'
permalink: /2011/11/01/mmbuat-fungsi-explode-di-pascal/
post_views_count:
    - '212'
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
tags:
    - explode
    - 'fungsi explode'
    - pascal
---

Untuk memecah variabel string berdasar delimiter ke dalam variabel array kita dapat melakukanya dengan mudah di PHP. tetapi di Pascal, kita harus mengutak atik sendiri.  
misalkan  
variable a=1,3,5,2,4  
kalo di explode tanda koma pake (,) akan menjadi :  
b\[0\] = 1  
b\[1\] = 2  
b\[2\] = 3  
b\[3\] = 4  
b\[4\] = 5

```
berikut ini fungsi explode di Pascal

function Explode(const str: string; const separator: string): TStrings;
var
n: integer;
p, q, s: PChar;
item: string;
begin
Result := TStringList.Create;
try
p := PChar(str);
s := PChar(separator);
n := Length(separator);
repeat
q := StrPos(p, s);
if q = nil then q := StrScan(p, #0);
SetString(item, p, q - p);
Result.Add(item);
p := q + n;
until q^ = #0;
except
item := '';
Result.Free;
raise;
end;
end;

```