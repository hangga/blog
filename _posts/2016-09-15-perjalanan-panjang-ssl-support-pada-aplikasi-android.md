---
id: 2998
title: 'Perjalanan panjang autentikasi SSL pada Android.'
date: '2016-09-15T05:26:46+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2998'
permalink: /2016/09/15/perjalanan-panjang-ssl-support-pada-aplikasi-android/
post_views_count:
    - '62'
image: /wp-content/uploads/2016/09/maxresdefault.jpg
categories:
    - Android
    - Coding
    - 'Software Development'
tags:
    - android
    - coding
    - ssl
    - 'ssl support'
---

### Cerita dulu, apa itu SSL.

*SSL* aka *Secure Socket Layer* adalah protokol keamanan yang mengamankan segala bentuk lalu-lintas data atau transaksi pada sebuah *domain*. *SSL* disebut juga *TSL(Transport Socket Layer)*.

Manfaat dari *SSL* adalah untuk kerahasiaan dan *autentikasi*. Dengan *SSL*, data transaksi internet lebih sulit untuk di sadap, karena membutuhkan *authentication*.

Setiap *request* ke *domain*, *clien* akan meminta *Certificate* dari *server*. *Client* atau *browser* biasanya sudah menyimpan daftar *certificate* yg sudah di *approve* kemudian digunakan untuk memverifikasi keabsahan *Certificate*.

<figure aria-describedby="caption-attachment-2999" class="wp-caption aligncenter" id="attachment_2999" style="width: 616px">![howsslworkschart](http://hangga.github.io/blog/wp-content/uploads/2016/09/HowSSLWorksChart-700x196.png)<figcaption class="wp-caption-text" id="caption-attachment-2999">sumber: https://www.entrust.com/</figcaption></figure>Domain yg terlindungi *SSL* dapat dilihat dari *prefix*nya yaitu *https://*

![sslheroart](http://hangga.github.io/blog/wp-content/uploads/2016/09/sslheroart-700x294.jpg)

### Autentikasi SSL pada aplikasi Android.

Kalo di aplikasi *mobile*, mekanismenya beda lagi. Di *Android* misalnya, *certificate* harus di *download* dari *server* kemudian di simpan dan di *embed* ke dalam aplikasi. *Embeded* *certificate* ini berbentuk *keystore* kemudian akan divalidasi bersamaan dengan *httprequest*.

![sip](http://hangga.github.io/blog/wp-content/uploads/2016/09/sip.png)

![screenshot-certificate-viewer-github-com](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Certificate-Viewer-.github.com_.png)

![screenshot-certificate-viewer-github-com-1](http://hangga.github.io/blog/wp-content/uploads/2016/09/Screenshot-Certificate-Viewer-.github.com-1.png)

*Certificate* hasil *download*-an ini dapat disimpan dalam bentuk file berekstensi \*.pem.

Kemudian untuk menggenerate *certificate* menjadi sebuah *keystore* dapat dilakukan dengan menggunakan *keytool* *java* punya. Atau pake *tool* yg lebih *ciamik* namanya *portecle* yg udah pake GUI punya.

<http://portecle.sourceforge.net/>

Jika menggunakan OkHttp bisa lebih mudah lagi karena dapat menggunakan CertificatePinner.

```
CertificatePinner certificatePinner = new CertificatePinner.Builder()
                .add("domainkamu.com", "sha256/0mOSBPV1PLalshashahsaB/iYTuP/Cj+Qrw=").build();
        OkHttpClient.Builder b = new OkHttpClient.Builder().certificatePinner(certificatePinner);
```

### Trusting tanpa Autentikasi.

Boleh dibilang ini adalah metode yg tidak aman, karena langsung percaya saja tanpa identifikasi.

```
@SuppressWarnings("null")
    public static OkHttpClient configureClient(final OkHttpClient client) {
        final TrustManager[] certs = new TrustManager[]{new X509TrustManager() {

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            @Override
            public void checkServerTrusted(final X509Certificate[] chain,
                                           final String authType) throws CertificateException {
            }

            @Override
            public void checkClientTrusted(final X509Certificate[] chain,
                                           final String authType) throws CertificateException {
            }
        }};

        SSLContext ctx = null;
        try {
            ctx = SSLContext.getInstance("TLS");
            ctx.init(null, certs, new SecureRandom());
        } catch (final java.security.GeneralSecurityException ex) {
        }

        try {
            final HostnameVerifier hostnameVerifier = new HostnameVerifier() {
                @Override
                public boolean verify(final String hostname,
                                      final SSLSession session) {
                    return true;
                }
            };
            client.setHostnameVerifier(hostnameVerifier);
            client.setSslSocketFactory(ctx.getSocketFactory());
        } catch (final Exception e) {
        }

        return client;
    }
```

Referensi:

http://software.endy.muhardin.com/aplikasi/apa-itu-ssl/https://www.digicert.com/ssl.htmhttps://gist.github.com/Kursulla/0fd3549a99b8f594da8d