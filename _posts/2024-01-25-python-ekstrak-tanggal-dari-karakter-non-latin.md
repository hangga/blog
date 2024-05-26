---
id: 5219
title: 'Python : Ekstrak Tanggal dari Karakter Non Latin'
date: '2024-01-25T07:30:05+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=5219'
permalink: /2024/01/25/python-ekstrak-tanggal-dari-karakter-non-latin/
image: /wp-content/uploads/2024/01/articleocw-5c6632dd1fe9f.jpg
categories:
    - Coding
    - Python
---

Alhamdulillah, sebulan pegang Python dapet kasus yang sedikit menantang. Jadi begini problemnya, ada list berisi tanggal lahir, tempat lahir dan tahun lahir seseorang dengan karakter campuran latin dan non latin(kanji jepang). Yang lebih menarik/ menantang, formatnya tidak konsisten. Nah, seperti ini lengkapnya:

```
生 年 月 日
(a)1955年-1958年頃
(b)１945年-1950年頃
1963年頃
（a）1966年頃（b）1960年 （c）1953年
1961年頃
1965年頃
1968年頃
1969年
1953年頃
（a）1960年頃（b）1966年
1975年頃
1968年頃
1953年頃
1963年頃
1957年頃
1973年頃
（a）1953年頃 （b）1960年頃
（a）1968年頃 （b）1969年
1963年から1968年の間
1968年頃
（a）1958年から1963年の間 （b）1970年頃
1968年頃
1963年頃
1963年頃
1969年頃
1960年-1962年頃
1960年頃
（a）1942年頃
（b）1948年頃
1958年頃
（a）1966年頃（b）1969年頃 
（a）1963年頃（b）1955年頃 （c）1956年
1971年
1961年頃
1965年頃
1968年から1973年の間
1965年頃
1966年から1967年頃
1967年頃
（a）1975年頃（b）1971年
1962年-1963年頃
1968年から1973年の間
1953年から1958年の間
1968年頃
1958年頃
（a）1958年頃 （b）1967年1月1日
（a）1958年頃　（b）1953年頃
1968年から1973年の間
1963年頃
1954年
1963年から1968年の間
1960年頃
1968年頃
1958年から1963年の間
1963年頃
1956年から1957年の間
1973年頃
1965年頃
1966年から1967年頃
1958年頃
1923年頃
（a）1957年 （b）1953年
1958年頃
1972年から1973年までの間
1963年
1971年
1964年
1962年
（a）1970年 （b）1967年
1958年
1974年
1970年
1934年
1968年
1963年頃
1965-03-29 00:00:00
1954年-1955年
1972年
1940年-1941年
1951-06-19 00:00:00
（a）1963年4月11日（b）1960年4月11日
1960年
1965年
1947年
1975-01-01 00:00:00
1961年
1960-06-29 00:00:00
1963-03-15 00:00:00
不明
1971-11-19 00:00:00
1968-12-30 00:00:00
（a）1960年12月30日 
（b）1960年12月13日
1963年6月6日
1974年3月14日又は1974年4月13日又は1974年4月14日又は1970年8月1日
1960年4月10日
1935年
1937年～1945年
（a）1939年4月15日
（b）1938年
1930-05-05 00:00:00
1966年2月2日
1970-02-13 00:00:00
1962年12月26日
（a）1972年 
（b）1974年3月21日1974-04-03 00:00:00
（a）1972年5月1日 
（b）1973年9月16日
1975-07-15 00:00:00
1977年4月3日1964年4月4日
（a）1957年8月17日 
1969-12-18 00:00:00
1971年1月29日
1964-12-04 00:00:00
1962-09-03 00:00:00
1966-07-07 00:00:00
（a）1957年4月25日
（b）1967年4月25日
1967-06-20 00:00:00
1971-01-01 00:00:00
1964年8月11日
1968-04-11 00:00:00
1973 年1月15日
1977-10-21 00:00:00
1974年10月8日
1972-01-02 00:00:00
1975年11月20日
（a）1968年1月1日
（b）1968年4月24日
1965年12月14日
1962-02-01 00:00:00
1950年
1965-10-12 00:00:001961年11月17日
1981-04-24 00:00:00
1966年4月23日
1957年11月3日
1960年4月21日
1966年4月18日
（a）1961年3月1日 
（b）1960年6月16日
1966年3月18日又は1967年3月10日
1955年
1971-07-01 00:00:00
1938-08-17 00:00:00
1977-07-06 00:00:00
1974-08-19 00:00:00
1958年
1973-08-03 00:00:00
（a）1969年4月4日
（b）1960年4月4日
（c）1960年6月4日
1956年7月7日又は1963年6月17日
1980-06-01 00:00:00
1963年
1969年
1970-04-20 00:00:00
1977年または1978年の頃
1978-03-20 00:00:00
1981年7月19日
1963-11-04 00:00:00
1966-03-12 00:00:00
1958年頃
1971-04-13 00:00:00
1967-01-17 00:00:001978-11-04 00:00:00
1969-12-20 00:00:00
1950-06-05 00:00:00
1960-12-30 00:00:00
（a）1965年3月1日
（b）1955年
（a）1943年8月17日 
（b）1943年 
（c）1944年
1971-10-10 00:00:00
1944年頃
1961-03-12 00:00:00
(a)1967年頃
(b)1961年頃
(c)1973年頃
(a)1974年
(b)1975年
(a)1974年 
(b)1975年
1969年6月16日
1969年12月19日
1972年頃
1978年6月5日 
1972年頃
1970-1973年頃
1972年頃
(a)1971年4月21日
(b)1971年4月22日
(a)1963年10月15日
(b)1973年2月14日
(c)1967年
(d)1957年頃
(a)1962年頃
(b)1961年
(a)1966年1月1日
(b)1958年から1964年までの間
(a)1981年2月5日
(b)1972年1月1日
(a)1964年4月13日
(b)1965年4月13日
1964年5月12日　 (d)1955年
(a)1982年4月19日
(b)1982年4月18日
(c)1402年6月24日（ヒジュラ暦）
1979-05-27 00:00:00
(a)1977年11月16日
(b)1974年11月16日
1966-07-20 00:00:00
(a)1984年5月28日
(b)1979年12月3日
©1979年3月3日（偽造旅券より）
1977年頃
1981年頃
(a)1966年
(b)1961年
(c)1968年から1970年の間 
(d)1962年
(a)1957年
(b)1960年
(c)1963年1月1日
1969年
1971年
1974年
(a)1972年　
(b)1975年
1970年
1963年
1981年7月30日
1984年12月11日
1970年
(a)1974年1月5日
(b)1977年 
(c)1975年
(d)1973年1月24日
(a)1948年5月4日
(b)1946年5月4日
1974年1月31日
(a)1977年8月から9月の間
(b)1976年
1940年
1953年10月4日
1965年10月3日
1980年
1964年
1965年
(a)1966年 
(b)1964年 
(c)1969年 
(d)1971年
1986年8月3日
1969年から1971年の間
1975年から1976年の間
1978年5月9日
1977年-1982年
1970年
1958年
(a)1985年1月1日 
(b)1981年
(a)1970年 
(f)1975年
1975年から1979年の間
(a)1964年1月1日 
(b)1964年2月1日
1978年
1976年
1964年頃
1969年
(a)1982年　
(b)1978年
1982年
1958年
(a)1971年12月4日 
(b)1977年
1985-07-13 00:00:00
1977年頃
1987-08-10 00:00:00
1960-11-17 00:00:00
(a)1964年6月25日
(b)1965年12月5日
(a)1981年 
(b)1982年
1965-11-08 00:00:00
1954年
1973年3月6日
1986-04-07 00:00:00
1976-06-01 00:00:00
1973-01-01 00:00:00
(a)1959年　
(b)1957年
1984-12-09 00:00:00
1993-03-12 00:00:00
1975-08-05 00:00:00
1984年
1977年7月12日
(a)1986年1月11日 
(b)1982年
1985年3月4日
1975年4月5日
1975年7月14日
(a)1965年　
(b)1960年　
(c)1963年
1974年
1986年3月9日
1982年5月3日
1959年6月26日
1973年9月28日
1972年2月15日
1994年5月11日
1994年4月29日
1987年3月21日
1968年11月17日
1980年10月29日
（a）1960年
（b）1962年
（c）1965年頃
1966年2月7日 
（a）1975年5月14日
（b）1975年頃
（a）1971年9月26日
（b）1977年9月26日
1984年5月19日 
1993年2月26日
1973年
1975年
1983年5月10日
（a）1988年9月22日
（b）1989年9月22日
1980年7月6日
1969年2月7日
1986年1月19日
1977年5月3日
1958年9月
1974年10月22日
1977年3月27日
1981年3月9日
（a）1969年1月1日
（b）1971年頃
1974年
(a)1975年
(b)1970年
1989年2月18日
1983年12月13日
1988年7月16日
1983年9月6日
1992年3月14日
1970年1月15日
1972年1月5日
1986年2月22日
(a)1962年2月20日
(b)1959年
(a)1967年6月16日 
(b)1967年1月1日
1991年7月11日
(a)1965年3月3日 
(b)1965年1月1日
(c)1965年1月11日
1973年2月16日
1978-10-11 00:00:00
1966-06-03 00:00:00
1990-03-03 00:00:00
1967年1月18日
1965年から1969年の間
1989年5月9日
(a)1968年7月10日
(b)1968年6月10日
1983-05-25 00:00:00
(a)1958年1月1日
(b)1952年12月31日
(c)1956年10月28日
1958年頃
(a)1976年10月5
日 (b)1976年10月1日 (c)1976年1月6日
1978-06-26 00:00:00
(a)1972年8月17日 (b)1972年1月1日
(a)1983年10月1日 (b)1983年3月15日 (c)1980年1月1日
1967-07-04 00:00:00
1976年
1985年
```

**Tantangannya**

Nah, tantangannya begini manteman. Bagaimana caranya mengambil data tanggal dari tiap list tersebut dengan requirement berikut ini.

1. Jika terdapat format tanggal didalamnya, maka ambil lalu ubah ke format YYYY/MM/DD
2. Jika hanya terdapat tahun saja, maka tampilkan YYYY/01/01
3. Jika gagal atau tidak mengandung format yang diinginkan, maka tanpilkan None.

Berikut fungsi yang sudah kita buat. Tentu saja hasil *trial* &amp; *error*, comot sana-sini, *googling*, *stackoverflow* dll:

```python
import re
from datetime import datetime

def extract_dates(text):
    date_formats = [
        r'\b(?:\d{4}[-/]\d{1,2}[-/]\d{1,2}|\d{1,2}[-/]\d{1,2}[-/]\d{4})\b',
        r'\b(?:\d{4}[-/]\d{1,2}|\d{1,2}[-/]\d{4})\b',
        r'\b(?:\d{4})\b'
    ]

    extracted_dates = []

    for date_format in date_formats:
        matches = re.findall(date_format, text)
        for match in matches:
            try:
                # Jika hanya tahun, set bulan dan hari ke 1
                if len(match) == 4:
                    date_obj = datetime(int(match), 1, 1).date()
                else:
                    date_obj = datetime.strptime(match, "%Y-%m-%d").date()
                formatted_date = date_obj.strftime("%Y/%m/%d")
                extracted_dates.append(formatted_date)
            except ValueError:
                pass

    if extracted_dates:
        return extracted_dates[0]
    else:
        return None
```

Mari kita bahas alurnya.

**Pattern Format Tanggal**

```python
date_formats = [
    r'\b(?:\d{4}[-/]\d{1,2}[-/]\d{1,2}|\d{1,2}[-/]\d{1,2}[-/]\d{4})\b',
    r'\b(?:\d{4}[-/]\d{1,2}|\d{1,2}[-/]\d{4})\b',
    r'\b(?:\d{4})\b'
]
```

Ini adalah beberapa format tanggal yang mungkin ditemui dalam teks. Format tersebut menggunakan regular expression untuk mencocokkan pola-pola tertentu yang dapat mewakili tanggal.

**Pengecekan dan Konversi Tanggal**

```python
try:
    if len(match) == 4:
        date_obj = datetime(int(match), 1, 1).date()
    else:
        date_obj = datetime.strptime(match, "%Y-%m-%d").date()
    formatted_date = date_obj.strftime("%Y/%m/%d")
    extracted_dates.append(formatted_date)
except ValueError:
    pass
```

- Jika panjang tanggal adalah 4 (hanya tahun), maka diasumsikan bulan dan hari adalah 1.
- Jika tidak, mencoba untuk mengonversi tanggal menjadi objek datetime dan kemudian memformatnya ke dalam format yang diinginkan (“%Y/%m/%d”).
- Menangani exception `ValueError` jika ada tanggal yang tidak dapat diuraikan.

**Pengecekan Hasil Ekstraksi:**

```python
if extracted_dates:
    return extracted_dates[0]
else:
    return None
```

Ini akan mengembalikan tanggal pertama yang berhasil diekstrak jika ada, atau None jika tidak ada tanggal yang ditemukan.  
Sekarang mari kita uji coba.

```python
sample_inputs = sample.split()

for date in sample_inputs:
    print(extract_dates(date))
```

Walhamdulillah, outputnya sesuai dengan yang diharapkan.

![](https://hangga.github.io/blog/wp-content/uploads/2024/01/Screenshot_2024-01-25_14-29-01-300x252.png)

Nah, begitu saja manteman.

Sekian, terimakasih.