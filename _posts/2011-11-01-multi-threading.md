---
id: 169
title: 'Contoh Pemrograman Multi Threading di Delphi'
date: '2011-11-01T06:52:25+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://web.omasastro.com/?p=49'
permalink: /2011/11/01/multi-threading/
post_views_count:
    - '366'
image: /wp-content/uploads/2011/11/165028826-data-stream-2-gettyimages_Mod2-250x165.jpg
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
    - Uncategorized
tags:
    - 'multi threading'
    - 'Multi Threading di Delphi'
    - 'Multi Threading in Delphi'
    - thread
    - 'thread delphi'
---

Oke teman’s para *programmer,* mungkin udah pernah denger tentang *multi threading.* ha3x..ak sendiri jg nggak bs menjelaskan secara definisi.

Oke begini saja untuk memudahkanya..

Misalkan kita membuat suatu program yg mana dalam program itu membutuhkan dua atau lebih proses yang berjalan secara terus menerus tanpa saling mengganggu, atau dengan kata lain proses-proses itu berjalan hampir bersamaan tanpa menghentikan proses lain yang sedang berjalan.

*Thread* sendiri terdiri dari proses-proses dimana setiap proses dapat berjalan tanpa mengganggu proses lain.

Langsung saja contohnya nih..

[![](http://darussalamnews.files.wordpress.com/2011/08/2011-08-05_132235.png?w=451&h=488 "2011-08-05_132235")](http://darussalamnews.files.wordpress.com/2011/08/2011-08-05_132235.png)

di dalam *tMemo* terdapat item yang ter *insert* secara terus menerus mulai dari Baris ke – 1, Baris ke – 2, ….. dst. dan ketika *Message dialog* muncul, proses *insert* baris tidak terganggu atau terhenti.

berikut ini *source codenya.*

```
<pre class="brush:delphi">unit Unit1;

interface

uses
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, StdCtrls;

type
TMyThread = class(TThread)
private
mmo : TMemo;
lbl : TLabel;
Fenabled : Boolean;
protected
procedure Execute; override;
public
procedure Test(mm : TMemo; frm : TForm);
property Enabled : Boolean read Fenabled write Fenabled;
end;

TForm1 = class(TForm)
mmo1: TMemo;
btnPlay: TButton;
btnStop: TButton;
btn1: TButton;
procedure btnPlayClick(Sender: TObject);
procedure btnStopClick(Sender: TObject);
procedure btn1Click(Sender: TObject);
private
{ Private declarations }
public
{ Public declarations }
end;

var
Form1: TForm1;
mt : TMyThread;

i : Integer;

implementation

{$R *.dfm}

{ MyThread }

procedure TMyThread.Execute;
begin
inherited;
FreeOnTerminate := true;
mt.Test(Form1.mmo1, Form1);
end;

procedure TMyThread.Test(mm : TMemo; frm : TForm);
begin
while Fenabled = True do
begin
i := i + 1;
mm.Lines.Add('Baris ke - '+inttostr(i));
frm.Caption := FormatDateTime('hh:mm:ss',Now);
Sleep(1000);
end;
end;

procedure TForm1.btnPlayClick(Sender: TObject);
begin
mt := TMyThread.Create(False);
mt.Enabled := True;
mt.Priority := tpIdle;
mt.Resume;
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
mt.Enabled := False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
ShowMessage('Tuh liat, thread-nya tetap jalan kan...');
end;

end.
```