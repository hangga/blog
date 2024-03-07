---
id: 1935
title: 'Generate Unique Random in Delphi 7'
date: '2014-08-27T04:34:29+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1935'
permalink: /2014/08/27/generate-unique-random-in-delphi-7/
diarjolite_template:
    - full
post_views_count:
    - '289'
categories:
    - Coding
    - 'Pascal - Delphi'
    - Uncategorized
tags:
    - 'generate unique random'
    - 'unique random'
    - 'unique random in delphi 7'
---

Apa itu ***Unique Random**?*

*Unique Random* adalah bilangan acak yang tidak boleh berulang alias *unique.*

Memang agak repot untuk membuat *unique random* di *Delphi 7*. Salah satunya karena tidak ada *List&lt;Integer&gt;* seperti di *Java*.

Salah satu contoh implementasi *unique random* adalah untuk mengacak soal seperti di *CAT(Computer Assisted Test)* milik BKN(Badan Kepegawaian Negara) yg dipakai untuk Tes CPNS. Tujuannya adalah untuk meminimalisir terjadinya saling contek jawaban antar peserta.

***Source Code***

```
<pre class="brush:delphi">procedure Shuffle(var aArray; aItemCount: Integer; aItemSize: Integer);
var
  Inx: Integer;
  RandInx: Integer;
  SwapItem: PByteArray;
  A: TByteArray absolute aArray;
begin
  Randomize;
  if (aItemCount > 1) then
  begin
    GetMem(SwapItem, aItemSize);
    try
      for Inx := 0 to (aItemCount - 2) do
      begin
        RandInx := Random(aItemCount - Inx);
        Move(A[Inx * aItemSize], SwapItem^, aItemSize);
        Move(A[RandInx * aItemSize], A[Inx * aItemSize], aItemSize);
        Move(SwapItem^, A[RandInx * aItemSize], aItemSize);
      end;
    finally
      FreeMem(SwapItem, aItemSize);
    end;
  end;
end;

procedure TForm1.btnGenerateClick(Sender: TObject);
begin
  goRandom(se1.Value);
end;
```

**Implementasi**

```
<pre class="brush:delphi">procedure TForm1.goRandom(x : Integer);
var
  a: array[1..100] of Integer;
  i: Shortint;
begin
  lst1.Clear;

  Randomize;
  for i := Low(a) to x {High(a)} do a[i] := i;
  Shuffle(a, x{High(a)}, SizeOf(Integer));

  for i := 1 to {High(a)} x - 1 do
    lst1.Items.Add(IntToStr(i)+' | '+IntToStr(a[i]));
end;
```

[![2014-08-27_101110](http://hangga.github.io/blog/wp-content/uploads/2014/08/2014-08-27_101110.png)](http://hangga.github.io/blog/wp-content/uploads/2014/08/2014-08-27_101110.png)  
\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2014/08/UniqueRandom.rar” title=”Download Source Lengkap” desc=”Tolles Archiv”\]

Referensi: [http://www.swissdelphicenter.ch/en/showcode.php?id=1006](http://www.swissdelphicenter.ch/en/showcode.phpid=1006)