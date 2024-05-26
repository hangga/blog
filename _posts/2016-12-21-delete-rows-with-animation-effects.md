---
id: 3132
title: 'Delete rows with animation effects.'
date: '2016-12-21T10:13:01+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3132'
permalink: /2016/12/21/delete-rows-with-animation-effects/
post_views_count:
    - '110'
image: /wp-content/uploads/2016/12/5454_xd-ui-ux-design_1408x792.jpg
categories:
    - Android
    - Coding
tags:
    - 'android animation'
    - 'animation effects'
    - 'delete row'
---

Ini hanyalah salah satu trik agar proses *remove* *view* pada *LinearLayout* tampak lebih menarik dimata *user* dan tidak kaku.

![](https://github.com/hangga/DeleteRowAnimation/raw/master/delete-row_1.gif)

Saya membuat satu kelas untuk menangani hal ini yaitu ***DeleteRowAnimation*** turunan dari kelas ***Animation.***

```
package id.web.hangga.deleterowanim;

import android.os.Handler;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.widget.LinearLayout;

/**
 * Created by hangga on 21/12/16.
 */

public class DeleteRowAnimation extends Animation {

    public static int ALPHA = 0;
    public static int SWIPE_LEFT = 1;
    public static int SWIPE_UP = 2;

    public void setAnimType(int animType) {
        this.animType = animType;
    }

    private int animType = ALPHA; // default

    final int startWidth;
    final int targetWidth;

    final int startHeight;
    final int targetHeight;

    final float startAlpha;
    final float targetAlpha;

    private DeleteRowAnimation deleteRowAnimation;
    private View view;



    public DeleteRowAnimation(final View view) {
        deleteRowAnimation = this;
        this.view = view;
        this.targetHeight = 0;
        this.startHeight = view.getHeight();
        this.targetWidth = 0;
        this.startWidth = view.getWidth();
        this.startAlpha = view.getAlpha();
        this.targetAlpha = 0;
        this.setAnimationListener(new AnimationListener() {
            @Override
            public void onAnimationStart(Animation animation) {

            }

            @Override
            public void onAnimationEnd(Animation animation) {
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        ((LinearLayout)view.getParent()).removeView(view);
                    }
                }, deleteRowAnimation.getDuration());
            }

            @Override
            public void onAnimationRepeat(Animation animation) {

            }
        });
    }

    @Override
    protected void applyTransformation(float interpolatedTime, Transformation t) {
        if (this.animType == ALPHA) {
            float newAlpha = (startAlpha + (targetAlpha - startAlpha) * interpolatedTime);
            view.setAlpha(newAlpha);
        } else if (this.animType == SWIPE_LEFT){
            int newWidth = (int) (startWidth + (targetWidth - startWidth) * interpolatedTime);
            view.getLayoutParams().width = newWidth;
            view.requestLayout();
        } else if (this.animType == SWIPE_UP){
            int newHeight = (int) (startHeight + (targetHeight - startHeight) * interpolatedTime);
            view.getLayoutParams().height = newHeight;
            view.requestLayout();
        }
    }

    @Override
    public void initialize(int width, int height, int parentWidth, int parentHeight) {
        super.initialize(width, height, parentWidth, parentHeight);
    }

    @Override
    public boolean willChangeBounds() {
        return true;
    }

    @Override
    public boolean hasStarted() {
        return super.hasStarted();
    }

}
```

Contoh implementasinya adalah sebagai berikut :

### Alpha

```
DeleteRowAnimation anim = new DeleteRowAnimation(child);
anim.setAnimType(DeleteRowAnimation.ALPHA);
anim.setDuration(1000);
child.startAnimation(anim);
```

### Swipe Left

```
DeleteRowAnimation anim = new DeleteRowAnimation(child);
anim.setAnimType(DeleteRowAnimation.SWIPE_LEFT);
anim.setDuration(1000);
child.startAnimation(anim);
```

### Swipe Up

```
DeleteRowAnimation anim = new DeleteRowAnimation(child);
anim.setAnimType(DeleteRowAnimation.SWIPE_UP);
anim.setDuration(1000);
child.startAnimation(anim);
```

\[dl url=”https://github.com/hangga/DeleteRowAnimation” title=”Download Source Lengkap” desc=”by : Hangga Aji Sayekti”\]