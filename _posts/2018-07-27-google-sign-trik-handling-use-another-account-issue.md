---
id: 3823
title: 'Google sign in: Trik menangani stuck pada &#8220;Use another account&#8221; issue'
date: '2018-07-27T06:58:48+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3823'
permalink: /2018/07/27/google-sign-trik-handling-use-another-account-issue/
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - android
    - 'google oauth'
    - 'google sign in'
    - google+
---

Ini adalah *issue* yg terjadi pada *google sign in* dan belum di *solve* oleh *mbah* *google* sampai dengan postingan ini di*publish*.

## *Reproduce*

*Reproduce* dari *issue* ini adalah sebagai berikut:

1. *Login* menggunakan *google account*
2. Saat muncul dialog pilih akun, user memilih opsi *use another account*
3. Pilih *create new google account.*

<figure aria-describedby="caption-attachment-3827" class="wp-caption aligncenter" id="attachment_3827" style="width: 650px">![](http://hangga.github.io/blog/wp-content/uploads/2018/07/ca889f5f6fe999a5904f02579edfe4c60dbc18bc-700x580.png)<figcaption class="wp-caption-text" id="caption-attachment-3827">sumber: https://meta.discourse.org</figcaption></figure>## Issue

Nah, yang terjadi adalah tidak didapatkannya *response* *data* pada *onActivityResult(),* sehingga user mengalami *stuck* pada halaman login.

## Trik

Cara bodoh untuk mengakali issue ini bisa dilakukan dengan cara membandingkan jumlah akun *google* dalam *device* **sebelum** dan **sesudah** repro. Jika jumlah akun bertambah, maka *doSomething();*

```
public static int getGoogleAccountCount(Context context){
        AccountManager accMan = AccountManager.get(context);
        Account[] accArray = accMan.getAccountsByType("com.google");
        return accArray.length;
}
```

```
@Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        ButterKnife.bind(this);
        initialize();
        googleCountBefore = Utils.getGoogleAccountCount(this);
    }
```

```
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == RC_SIGN_IN) {
            isRegisterWithGoogle = true;

            @SuppressLint("RestrictedApi") Task<GoogleSignInAccount> task = GoogleSignIn.getSignedInAccountFromIntent(data);
            try {

                account = task.getResult(ApiException.class);
                firebaseAuthWithGoogle(account);

            } catch (Exception e) {
                // The ApiException status code indicates the detailed failure reason.
                // Please refer to the GoogleSignInStatusCodes class reference for more information.
                //showSnackbar(R.string.auth_failed);
            }
        }
        googleCountAfter = Utils.getGoogleAccountCount(this);
        if (googleCountAfter > googleCountBefore){
            showLoading(true);
            googleLoginBtn.performClick();
        }
    }
```

Alhamdulillah Solved.