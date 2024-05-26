---
id: 741
title: 'Beberapa cara membuat Format Rupiah di Delphi'
date: '2011-11-18T03:35:16+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=741'
permalink: /2011/11/18/beberapa-cara-membuat-format-rupiah-di-delphi/
post_views_count:
    - '460'
image: /wp-content/uploads/2011/11/Indonesian-Rupiah-512-250x250.png
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
    - Uncategorized
tags:
    - delphi
    - 'format rupiah'
    - 'format rupiah di delphi'
    - rupiah
---

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/Untitled.png "Untitled")](http://hangga.github.io/blog/wp-content/uploads/2011/12/Untitled.png)Di *Delphi* kita mengenal fungsi-fungsi untuk menampilkan format *string* sesuai yg kita inginkan.

Nah untuk menampilakan format mata uang Rupiah, ternyata kita bisa menggunakan berbagai macam cara. Diantaranya adalah sebagai berikut:

1. Menggunakan fungsi *formatfloat().* Misalnya sbb : 
    - ```
        
        EdtHarga.text := formatfloat('Rp. ##,###,###',sHarga);
        ```
2. Menggunakan fungsi *AnsiReplaceStr().* Misalnya sbb 
    - ```
        
        EdtHarga.text := AnsiReplaceStr(FormatFloat('#,###',sHarga),',','.');
        ```
3. Dengan memodifikasi fungsi yang sudah ada di *delphi.* Misalnya sbb : 
    - ```
        function sMataUangRP(nHarga:  Currency) : String;
        var
        n: String;
        begin
        n:= 'Rp.' + AnsiReplaceStr(FormatFloat('#,###',nHarga),',','.');
        if nilai &lt;= 0 then n:= 'Rp.0';
        Result:= n;
        end;
        ```
4. Dengan membuat fungsi sendiri. Misalnya sbb : 
    - ```
        function rupiah(sNilai : string): string;
        var
        i, j, p : Integer;
        sHasil, sKi : string;
        begin
        p := Length(Trim(sNilai));
        while (p mod 3 &lt;&gt; 0) do
        begin
        sNilai := '0'+ sNilai;
        p := Length(sNilai);
        end;
        sHasil := '';
        for i := 1 to p do
        begin
        if (i mod 3 = 0) then
        begin
        sHasil := shasil + '.'+Copy(sNilai, i - 2, 3);
        end;
        end;
        p := Length(sHasil);
        sHasil := Copy(sHasil, 2, p);
        sKi := Copy(sHasil, 1, 3);
        sKi := IntToStr(StrToInt(sKi));
        sHasil := sKi + Copy(sHasil, 4, p);
        Result := sHasil;
        end;
        ```

Contoh penggunaan fungsi pada program

[![](http://hangga.github.io/blog/wp-content/uploads/2011/12/2011-12-02_104945.png "2011-12-02_104945")](http://hangga.github.io/blog/wp-content/uploads/2011/12/2011-12-02_104945.png)

```

unit Unit1;

interface

uses
Windows, Messages, SysUtils, Variants, Classes,
Graphics, Controls, Forms, Dialogs, StdCtrls,
StrUtils, XPMan;

type
TForm1 = class(TForm)
edt1: TEdit;
procedure edt1Change(Sender: TObject);
private
{ Private declarations }
public
{ Public declarations }
end;

var
Form1: TForm1;

function rupiah(sNilai : string): string;

implementation

{$R *.dfm}

function rupiah(sNilai : string): string;
var
i, j, p : Integer;
sHasil, sKi : string;
begin
p := Length(Trim(sNilai));
while (p mod 3 &lt;&gt; 0) do
begin
sNilai := '0'+ sNilai;
p := Length(sNilai);
end;
sHasil := '';
for i := 1 to p do
begin
if (i mod 3 = 0) then
begin
sHasil := shasil + '.'+Copy(sNilai, i - 2, 3);
end;
end;
p := Length(sHasil);
sHasil := Copy(sHasil, 2, p);
sKi := Copy(sHasil, 1, 3);
sKi := IntToStr(StrToInt(sKi));
sHasil := sKi + Copy(sHasil, 4, p);
Result := sHasil;
end;

procedure TForm1.edt1Change(Sender: TObject);
var
param : string;
begin
param := AnsiReplaceStr(edt1.Text,'.','');
edt1.Text := rupiah(param);
end;

end.
```

Oke Silahkan mencoba.