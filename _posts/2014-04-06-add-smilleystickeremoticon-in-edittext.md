---
id: 1849
title: 'Add Smilley/Sticker/Emoticon in EditText'
date: '2014-04-06T07:57:44+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1849'
permalink: /2014/04/06/add-smilleystickeremoticon-in-edittext/
post_views_count:
    - '220'
image: /wp-content/uploads/2014/04/device-2014-04-06-132659-150x250.png
categories:
    - Android
    - Coding
tags:
    - android
    - 'android emoticon'
    - 'Emoticon in edittext'
    - 'smilley in edittext'
    - 'sticker in edittext'
---

**Bismillah..**

Jumpa lagi kawan. Kasus menarik lagi nih. Yaitu menambahkan *Emoticon* di dalam sebuah *EditText* seperti pada aplikasi2 *chating* yg kita jumpai.

Trik yg saya gunakan kali ini adalah dengan menggunakan ***Spannable String.*** Apa itu Spannable String silahkan baca sendiri disini [SpannableString](http://developer.android.com/reference/android/text/SpannableString.html).

[![device-2014-04-06-132659](http://hangga.github.io/blog/wp-content/uploads/2014/04/device-2014-04-06-132659.png)](http://hangga.github.io/blog/wp-content/uploads/2014/04/device-2014-04-06-132659.png)[![device-2014-04-06-132602](http://hangga.github.io/blog/wp-content/uploads/2014/04/device-2014-04-06-132602.png)](http://hangga.github.io/blog/wp-content/uploads/2014/04/device-2014-04-06-132602.png)

**Go TKP…**

**1 Mendefinisikan kode-kode *EmotIcon***

```
private static final String KODE_SMILLE = "[:)]";
private static final String KODE_SWEET = "[:3]";
private static final String KODE_SURPRISE = "[:/]";
private static final String KODE_SPOOK = "[:(]";
private static final String KODE_SHOUT = "[:8]";
private static final String KODE_MIAO = "[:9]";
private static final String KODE_LOVE = "[(v)]";
private static final String KODE_COOL = "[::]";
private static final String KODE_FIRE = "[==]";
```

**2. Mendefinisikan Icon-icon bertipe *Drawable*,** yang akan kita sisipkan ke dalam *EditText.*

```
icSmille = getResources().getDrawable(R.drawable.smile);
icSmille.setBounds(5,5,60,60);

icSweet = getResources().getDrawable(R.drawable.sweat);
icSweet.setBounds(5,5,60,60);

icSurprise = getResources().getDrawable(R.drawable.surprise);
icSurprise.setBounds(5,5,60,60);

icSpook = getResources().getDrawable(R.drawable.spook);
icSpook.setBounds(5,5,60,60);

icShout = getResources().getDrawable(R.drawable.shout);
icShout.setBounds(5,5,60,60);

icMiao = getResources().getDrawable(R.drawable.miao);
icMiao.setBounds(5,5,60,60);

icLove = getResources().getDrawable(R.drawable.love);
icLove.setBounds(5,5,60,60);

icCool = getResources().getDrawable(R.drawable.cool);
icCool.setBounds(5,5,60,60);

icFire = getResources().getDrawable(R.drawable.fire);
icFire.setBounds(5,5,60,60);
```

**3. Membuat *method* untuk meng*handling* *SpannableString***. Method ini saya beri nama *emotSpannable.*

```
private void emotSpannable(Spannable spannable) {
        int length = spannable.length();
        int position = 0;
        int tagStartPosition = 0;
        int tagLength = 0;
        StringBuilder buffer = new StringBuilder();
        boolean inTag = false;

        if(length <= 0)
            return;

        do {
            String c = spannable.subSequence(position, position + 1).toString();

            if (!inTag && c.equals("[")) {
                buffer = new StringBuilder();
                tagStartPosition = position;
                inTag = true;
                tagLength = 0;
            }

            if (inTag) {
                buffer.append(c);
                tagLength ++;

                if (c.equals("]")) {
                    inTag = false;

                    String tag = buffer.toString();
                    int tagEnd = tagStartPosition + tagLength;

                    if (tag.equals(KODE_SMILLE)) {
                        ImageSpan imageSpan = new ImageSpan(icSmille, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }

                    if (tag.equals(KODE_SWEET)) {
                        ImageSpan imageSpan = new ImageSpan(icSweet, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_SURPRISE)) {
                        ImageSpan imageSpan = new ImageSpan(icSurprise, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_SPOOK)) {
                        ImageSpan imageSpan = new ImageSpan(icSpook, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_SHOUT)) {
                        ImageSpan imageSpan = new ImageSpan(icShout, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_MIAO)) {
                        ImageSpan imageSpan = new ImageSpan(icMiao, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_LOVE)) {
                        ImageSpan imageSpan = new ImageSpan(icLove, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_COOL)) {
                        ImageSpan imageSpan = new ImageSpan(icCool, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }
                    if (tag.equals(KODE_FIRE)) {
                        ImageSpan imageSpan = new ImageSpan(icFire, ImageSpan.ALIGN_BASELINE);
                        spannable.setSpan(imageSpan, tagStartPosition, tagEnd, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);    // Spannable#setSpan applies the xxxxSpan to characters n1...n2
                    }

                }
            }

            position++;
        } while (position < length);
    }
```

**4. EmotIcon Dialog**, Adalah *Custom Layout Dialog* yg saya gunakan untuk menampilkan *EmotIcon2* yang akan di sisipkan ke dalam *EditText*.

```
private void emotDialog(){
		final Dialog dia = new Dialog(this);
		dia.setContentView(R.layout.emot_dialog);
		dia.setTitle("Pick");
		dia.setCancelable(true);
		ImageButton btnSmille = (ImageButton) dia.findViewById(R.id.btnSmille);
		btnSmille.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_SMILLE);
				dia.dismiss();
			}
		});

		ImageButton btnSweat = (ImageButton) dia.findViewById(R.id.btnSweat);
		btnSweat.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_SWEET);
				dia.dismiss();
			}
		});

		ImageButton btnSurprise = (ImageButton) dia.findViewById(R.id.btnSurprise);
		btnSurprise.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_SURPRISE);
				dia.dismiss();
			}
		});

		ImageButton btnSpook = (ImageButton) dia.findViewById(R.id.btnSpook);
		btnSpook.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_SPOOK);
				dia.dismiss();
			}
		});

		ImageButton btnShout = (ImageButton) dia.findViewById(R.id.btnShout);
		btnShout.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_SHOUT);
				dia.dismiss();
			}
		});

		ImageButton btnFire = (ImageButton) dia.findViewById(R.id.btnFire);
		btnFire.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_FIRE);
				dia.dismiss();
			}
		});

		ImageButton btnMiao = (ImageButton) dia.findViewById(R.id.btnMiao);
		btnMiao.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_MIAO);
				dia.dismiss();
			}
		});

		ImageButton btnLove = (ImageButton) dia.findViewById(R.id.btnLove);
		btnLove.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_LOVE);
				dia.dismiss();
			}
		});

		ImageButton btnCool = (ImageButton) dia.findViewById(R.id.btnCool);
		btnCool.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				InsertKode(KODE_COOL);
				dia.dismiss();
			}
		});
		dia.show();
	}
```

**5. Handling *TextWatcher* pada *EditText*.** Menerapkan *emotSpannable()* di *EditText* pada *Event* *TextWatcher*.

```
textPost.addTextChangedListener(new TextWatcher() {

			@Override
			public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
				Editable buffer = textPost.getText();
			    // If the cursor is at the end of a RecipientSpan then remove the whole span
			    int start = Selection.getSelectionStart(buffer);
			    int end = Selection.getSelectionEnd(buffer);
			    if (start == end) {
			    	ImageSpan[] link = buffer.getSpans(start, end, ImageSpan.class);
			        if (link.length > 0) {
			            buffer.replace(
			                    buffer.getSpanStart(link[0]),
			                    buffer.getSpanEnd(link[0]),
			                    ""
			            );
			            buffer.removeSpan(link[0]);
			        }
			    }
			}

			@Override
			public void beforeTextChanged(CharSequence s, int start, int count,
					int after) {
			}

			@Override
			public void afterTextChanged(Editable s) {
				emotSpannable(s);
			}
		});
```

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2014/04/Emot.tar.gz” title=”Download Source Lengkap” desc=”Tolles Archiv”\]