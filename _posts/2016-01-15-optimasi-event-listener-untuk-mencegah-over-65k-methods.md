---
id: 2806
title: 'Optimasi Event Listener untuk mencegah Over 65K Methods.'
date: '2016-01-15T10:59:53+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=2806'
permalink: /2016/01/15/optimasi-event-listener-untuk-mencegah-over-65k-methods/
post_views_count:
    - '32'
image: /wp-content/uploads/2016/03/android-app-banner.jpg
categories:
    - Android
    - Coding
tags:
    - 'optimasi event listener'
    - 'over 65K methods'
---

Optimasi *Event Listener* selain berdampak terhadap alokasi memori seperti yg pernah dibahas oleh Om Jane Velger di [sini](http://blog.tapreason.com/2013/10/30/android-onclicklistener-memory-optimization-micro-optimizations/), ternyata juga berdampak pada jumlah *method*.

Mari perhatikan perbandingan berikut ini:

### 1. Tanpa memanggil object ***new** OnClickListener().*

```
btnFirst = (Button) findViewById(R.id.btnFirst);
btnSecond = (Button) findViewById(R.id.btnSecond);
btnThird = (Button) findViewById(R.id.btnThird);
```

Total methods count: 15594

### 2. Memanggil 1 object ***new** OnClickListener().*

```
btnFirst = (Button) findViewById(R.id.btnFirst);
btnFirst.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
    	Toast.makeText(MainActivity.this, "Click", Toast.LENGTH_SHORT).show();
    }
});
btnSecond = (Button) findViewById(R.id.btnSecond);
btnThird = (Button) findViewById(R.id.btnThird);
```

Total methods count: 15596

### 2. Memanggil 2 object ***new** OnClickListener().*

```
btnFirst = (Button) findViewById(R.id.btnFirst);
btnFirst.setOnClickListener(new View.OnClickListener() {
	@Override
    public void onClick(View v) {
    	Toast.makeText(MainActivity.this, "Click", Toast.LENGTH_SHORT).show();
    }
});
btnSecond = (Button) findViewById(R.id.btnSecond);
btnSecond.setOnClickListener(new View.OnClickListener() {
	@Override
    public void onClick(View v) {
    	Toast.makeText(MainActivity.this, "Click 2", Toast.LENGTH_SHORT).show();
	}
});
btnThird = (Button) findViewById(R.id.btnThird);
```

Total methods count: 15598

### 3. Setiap *Button* memanggil satu *object onClicklistener* dengan pengkondisian

```
@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnFirst = (Button) findViewById(R.id.btnFirst);
        btnFirst.setOnClickListener(onClickListener);
        btnSecond = (Button) findViewById(R.id.btnSecond);
        btnSecond.setOnClickListener(onClickListener);
        btnThird = (Button) findViewById(R.id.btnThird);
        btnThird.setOnClickListener(onClickListener);

    }

    View.OnClickListener onClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            switch (v.getId()){
                case R.id.btnFirst :
                    Toast.makeText(MainActivity.this, getString(R.string.btn_first), Toast.LENGTH_SHORT).show();
                    break;

                case R.id.btnSecond :
                    Toast.makeText(MainActivity.this, getString(R.string.btn_second), Toast.LENGTH_SHORT).show();
                    break;

                case R.id.btnThird :
                    Toast.makeText(MainActivity.this, getString(R.string.btn_third), Toast.LENGTH_SHORT).show();
                    break;
            }
        }
    };
```

Total methods count: 15596

### Mengapa bisa demikian.

Karena setiap kita memanggil ***new** View.OnClickListener()* itu berarti kita sedang membuat *object onClickListener* sekaligus memanggil *override* method *onClick()* yang ada didalamnya.  
CMIIW.. 🙂