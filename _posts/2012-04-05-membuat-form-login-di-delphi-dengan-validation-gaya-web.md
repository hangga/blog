---
id: 1185
title: 'Membuat Form Login di Delphi dengan Validation Gaya Web'
date: '2012-04-05T04:15:17+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1185'
permalink: /2012/04/05/membuat-form-login-di-delphi-dengan-validation-gaya-web/
post_views_count:
    - '462'
categories:
    - Coding
    - 'Dunia IT'
    - 'Pascal - Delphi'
    - Uncategorized
tags:
    - 'form login'
    - 'form login delphi'
    - login
    - 'login delphi'
---

[  ](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-05_105225.png)Jumpa lagi teman, sekedar sharing nih. Lagi2 berlatar belakang kasus yg saya alami sendiri.

![](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-05_105225.png "2012-04-05_105225")

Seorang klien meminta saya membuat aplikasi desktop. Ok tanpa pikir panjang sy langsung pilih Tool favorit saya, **Borland Delphi 7.**

Kebanyakan pada setiap aplikasi desktop yang didalamnya terdapat proses login, jika login gagal maka muncul kotak dialog. Lebih aneh lagi setelah muncul kotak dialog berisi pesan “maaf, *username* dan *password* tidak valid” lalu tiba2 *close* atau *application terminate*. Ternyata client sy satu ini tidak menyukai hal ini. “Masa setiap kali login gagal harus buka lagi programnya dari awal sih, bgmn ni mas hangga, yang praktis donk. seperti di web itu lho..” Kata klien sy.

Tanpa basa-basi langsung sy jawab “Ooo Bisaa..”.

Oke deh sedikit memutar otak. Sy pun tahu maksud klien sy agar tiap kali login gagal tak perlu membuka aplikasi kembali. Sevhingga pesan login gagal sy tampilkan dalam *form login* seperti validasi form dalam web.

Sy buat form login sy beri nama *frmLogin,* lalu sy simpan unitnya dg nama *Login.pas*(sy memang kurang disiplin dalam aturan standarisasi *coding*). Lalu sy buat *function* di dalam unit *login.pas* tapi diluar *class TfrmLogin* agar fungsi ini bisa di akses dari luar unit. Ini fungsinya.

```
<pre class="brush:plain">function Proses_login(var btResult : Boolean; sRes : string) : Boolean;
var
id : Integer;
begin
id := 0;
Result := False;
with TFormLogin.Create(Application) do
try
lblCaps.Visible:=CapsLock_on;
Caption := 'Login';
lblLogin.Caption := 'Login';
lblPesan.Caption := sRes;

if ShowModal=mrOk then
begin
with ibqryLogin do
begin
SQL.Text:='select count(*),id_pengguna from PENGGUNA where '+
' ID_PENGGUNA=:pe and PASS=:pas '+
' group by id_pengguna';
ParamByName('pe').AsString:=Trim(edtUsername.Text);
ParamByName('pas').AsString:=MD5Str(Trim(edtPass.Text));
Open;
id :=Fields[0].AsInteger;
User := Trim(Fields[1].AsString);

if id > 0 then Result := True
else Result := False;
end;
btResult := True;

end else btResult := False;
finally
Free;
end;
end;
```

Keterangan  
variabel ***sRes*** = Untuk menampilkan Pesan jika login gagal;  
variabel ***btResult*** = Untuk menyimpan hasil *ModalResultnya*, jika ***MrOk*** hasilnya *true* selain itu *false*;  
Resultan fungsi ini adalah *bolean* berisi hasil *query* di tabel **PENGGUNA** di database

lalu sy buka file *dpr* nya dan sy modifikasi sedikit. Seperti biasa, hilangkan semua *Application.CreateForm( )* dan sisakan yg perlu saja. Kemudian sy buat *procedure **GoLogin*** yg didalamnya ada *function proses\_login()* yg dipanggil dari unit *login.pas* tadi.

```
<pre class="brush:plain">program Toko;

uses
Forms,
SysUtils,
MainUnit in 'MainUnit.pas' {FormMain},
AboutUs in 'AboutUs.pas' {AboutBox},
AnakUnit in 'AnakUnit.pas' {FormAnak},
AnakDataUnit in 'AnakDataUnit.pas' {FormAnakData},
EntryUnit in 'EntryUnit.pas' {FormEntry},
EditPenggunaUnit in 'EditPenggunaUnit.pas',
ItemUnit in 'ItemUnit.pas' {FormItem},
Login in 'Login.pas' {FormLogin},
ModUnit in 'ModUnit.pas' {DataMod: TDataModule},
PenggunaUnit in 'PenggunaUnit.pas',
Routines in 'Routines.pas',
SMTDlgs in 'SMTDlgs.pas' {frmSMTDlg},
TembakUnit in 'TembakUnit.pas' {FormTembak},
AnakCilikUnit in 'AnakCilikUnit.pas' {FormAnakCilik},
CariUnit in 'CariUnit.pas' {FormCari},
PropertiesUnit in 'PropertiesUnit.pas' {FormProperties},
Exel_Dhab in 'Exel_Dhab.pas',
PrintMemoUnit in 'PrintMemoUnit.pas' {FormPrintMemo},
QReportUnit in 'QReportUnit.pas' {FormQReport},
MenuUnit in 'MenuUnit.pas' {FormMenu},
CuapUnit in 'CuapUnit.pas' {FormCuap},
fb_embedded in 'fb_embedded.pas',
Alamat in 'Alamat.pas' {FormAlamat},
EditAlamat in 'EditAlamat.pas' {FormEditAlamat},
uTransaksi in 'uTransaksi.pas' {FormTransaksi},
uPersediaan in 'uPersediaan.pas' {FormPersediaan},
uSelang in 'uSelang.pas' {FormSelang},
uLaporan in 'uLaporan.pas' {FormLaporan},
uJenis in 'uJenis.pas' {FormJenis},
uDaftarHarga in 'uDaftarHarga.pas' {FormDaftarHarga},
uEditBarang in 'uEditBarang.pas' {FormEditBarang},
uGantiSatuan in 'uGantiSatuan.pas' {FormGantiSatuan},
uManajemenHarga in 'uManajemenHarga.pas' {FormManajemenHarga},
uEditHarga in 'uEditHarga.pas' {FormEditHarga},
uInOut in 'uInOut.pas' {FormInOut},
uKasir in 'uKasir.pas' {FormKasir},
uAddBarang in 'uAddBarang.pas' {FormAddBarang},
CurIndonesiaToFloat in 'CurIndonesiaToFloat.pas',
uRetur in 'uRetur.pas' {FormRetur},
uTentangKita in 'uTentangKita.pas' {AboutTentangKita},
uNota in 'uNota.pas' {FormNota};

{$R *.res}
var
btRes : Boolean;
sRes : string;

procedure GoLogin;
begin
while Proses_login(btRes, sRes) = False do
begin
if btRes = True then sRes := 'Akses ditolak, silahkan ulangi.' else
begin
Putus;
Application.Terminate;
Exit;
end;
end;

if (btRes = True) then
begin
Application.CreateForm(TFormMain, FormMain);
FormMain.Show;
Application.Run;
end;
end;

begin
Application.Initialize;
Application.Title := 'Aplikasi Toko';
Application.CreateForm(TDataMod, DataMod);
Splash;

if blank = True then New_Admin;
GoLogin;
end.
```

<span style="line-height: 1.5;">Saya coba dan Alhamdulillah berhasil.</span>

[![](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-05_113010-1024x545.png "2012-04-05_113010")](http://hangga.github.io/blog/wp-content/uploads/2012/04/2012-04-05_113010.png)