---
id: 4728
title: 'Spring Boot : Import Excel into MySQL dengan Apache POI'
date: '2021-08-05T09:23:12+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=4728'
permalink: /2021/08/05/spring-boot-import-excel-into-mysql-dengan-apache-poi/
image: /wp-content/uploads/2019/05/javanewfeat-1.jpeg
categories:
    - Coding
    - Database
tags:
    - hibernate
    - 'import excel into mysql'
    - 'import excel mysql'
    - Java
    - jpa
    - 'jpa hibernate'
    - spring
    - 'spring boot'
---

Postingan ini sebenarnya seperti biasa, catatan pribadi namun sengaja saya *share* siapa tahu berguna bagi pembaca, karena saya sendiri juga sering lupa 😁. Yaitu import data dari *file* *Excel* ke tabel *MySQL* yang kebetulan ada salah satu fitur yang ada dalam project kecil saya, yaitu **API Data Jamaah**(*project* non-komersial lho ini, atau lebih tepatnya *project* *sinahu. xixixi* 😁).

Adapun library yang saya gunakan adalah [*Apache POI*](https://poi.apache.org/).

### Apa itu Apache POI

*Apache POI* adalah sebuah *library* *Java* untuk mengelola(membuat, membaca dan meng*edit*) dokumen *Microsoft Office* seperti *Word (.docx), Excel, (.xlsx) dan PowerPoint (.pptx).* Ingin tahu lebih banyak, bisa anda baca sendiri [disini](https://poi.apache.org/).

Dalam kasus ini, fungsi yang akan kita gunakan adalah membaca *file* *Excel*, kemudian nanti hasilnya berupa List&lt;JamaahEntity&gt; kita *insert all* ke dalam tabel *MySQL*.

### Setup Apache POI

Karena saya menggunakan *gradle*, sehingga untuk meng*install [Apache POI](https://poi.apache.org/)* tinggal menambahkan dependensi berikut ini. Oh ya, saat postingan ini ditulis, versi Apache POI erbaru adalah versi 5.0.0.

```
implementation 'org.apache.poi:poi-ooxml:5.0.0'
```

Kemudian *Sync* gradle.

### Siapkan Entity/Tabel-nya

Entity untuk menyimpan datanya adalah *JamaahEntity*, dengan *table name* =”jamaah” yang saya simpan dalam *package* ***models.entities***.

```
@Entity
@Table(name = "jamaah")
public class JamaahEntity {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String nama;
    private String alamat;
    private String status;
    private String skill;
    private String sex;

    private String photoUrl;

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    private boolean aktif;

    public boolean isAktif() {
        return aktif;
    }

    public void setAktif(boolean aktif) {
        this.aktif = aktif;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    @Override
    public String toString() {
        return "JamaahEntity{" +
                "id=" + id +
                ", nama='" + nama + '\'' +
                ", alamat='" + alamat + '\'' +
                ", status='" + status + '\'' +
                ", skill='" + skill + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
```

### Membuat *Helper*.

Sebelum membuat helper, mari kita perhatikan *file* *Excel*nya. *Cell* yang akan kita ambil hanya kolom A, B, C dan E, sedangkan kolom D tidak. Sehingga boleh dibilang *column* *index* ke 0, 1, 2 dan 4.

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/data-excel-700x294.png)

Kemudian saya membuat kelas ***JamaahExcelHelper.java*** yang didalamnya akan kita buat *static method* yaitu ***excelToJamaahEntitys()*** untuk membaca sekaligus menggenerate *List&lt;JamaahEntity&gt;* sehingga nanti pada kelas *JamaahSerice* tinggal dipanggil.

```
public class JamaahExcelHelper {
    public static final String TYPE = "application/vnd.openxmlformats
-officedocument.spreadsheetml.sheet";
    static final String SHEET = "Sheet1"; // <-- Sheet Name

    public static boolean isExcelFormat(MultipartFile file) {
        return TYPE.equals(file.getContentType());
    }

    public static List excelToJamaahEntitys(InputStream is) {
        try {
            Workbook workbook = new XSSFWorkbook(is);

            Sheet sheet = workbook.getSheet(SHEET);
            Iterator rows = sheet.iterator();

            List JamaahEntitys = new ArrayList<>();

            int rowNumber = 0;
            while (rows.hasNext()) {
                Row currentRow = rows.next();

                // skip header
                if (rowNumber == 0) {
                    rowNumber++;
                    continue;
                }

                Iterator cellsInRow = currentRow.iterator();

                // Entitas/ tabel
                JamaahEntity jamaahEntity = new JamaahEntity();

                int columnIndex = 0;
                while (cellsInRow.hasNext()) {
                    Cell currentCellInRow = cellsInRow.next();
                    switch (columnIndex) {
                        case 0:
                            jamaahEntity.setNama(currentCellInRow.getStringCellValue());
                            break;

                        case 1:
                            jamaahEntity.setSex(currentCellInRow.getStringCellValue());
                            break;

                        case 2:
                            jamaahEntity.setAlamat(currentCellInRow.getStringCellValue());
                            break;

                        case 4:
                            jamaahEntity.setStatus(String.valueOf(currentCellInRow
.getNumericCellValue()));
                            break;

                        default:
                            break;
                    }

                    jamaahEntity.setSkill("");

                    columnIndex++;
                }

                JamaahEntitys.add(jamaahEntity);
            }

            workbook.close();

            return JamaahEntitys;
        } catch (IOException e) {
            throw new RuntimeException("fail to parse Excel file: " + e.getMessage());
        }
    }
}
```

Kelas helper ini saya simpan jadi satu *package* dengan *JamaahService.java* dan *JamaahServiceImpl.java*, yaitu di *package* ***models.services***.

### Implementasi di *Controller*

Kemudian dari *controller*, tempat dimana terdapat *ResquestMapping* atau method yang akan dipanggil oleh *Front-End* *Dev.* Nah, kita bisa memanggil method *importExcel* yang ada di kelas *JamaahService*.

```
@PostMapping(value = "upload")
public ResponseEntity uploadExcelFile(@RequestParam("file") MultipartFile file) {
    String message;
    // Upload and import Excel
    if (JamaahExcelHelper.isExcelFormat(file)) {
        try {
                jamaahService.importExcel(file);
                message = "Uploaded the file successfully: " + file.getOriginalFilename();
                return ResponseEntity
                        .status(HttpStatus.OK)
                        .body(new CommonResponse(message, 200, null));
        } catch (IOException e) {
                e.printStackTrace();
                return ResponseEntity
                        .status(HttpStatus.EXPECTATION_FAILED)
                        .body(new CommonResponse(e.getMessage(), 500, null));
        }
    }

    message = "Please upload an excel file!";
    return ResponseEntity
        .status(HttpStatus.BAD_REQUEST)
        .body(new CommonResponse(message, 400, null));

}
```

### Siap di Tes

Siap di test. Silahkan pake Rest Client yang anda suka misal PostMan atau Insomnia. Saya pake Insomnia. Hehe..

![](https://hangga.github.io/blog/wp-content/uploads/2021/08/Screen-Shot-2021-08-05-at-16.21.13-700x341.png)

Mau lihat *full Source Code* boleh unduh [disini](https://github.com/hangga/apijamaah). Selamat mencoba, terimakasih.