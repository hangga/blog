---
id: 1783
title: 'Kombinasi PreferenceFragment dan ViewPager'
date: '2014-03-05T11:03:07+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1783'
permalink: /2014/03/05/kombinasi-preferencefragment-dan-viewpager/
post_views_count:
    - '230'
image: /wp-content/uploads/2014/03/device-2014-03-05-052427.png
categories:
    - Android
    - Coding
tags:
    - prefferenceFragment
    - 'prefferencefragment and viewpager'
    - 'slide prefference'
    - 'source code android'
---

![device-2014-03-05-052427](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-052427.png)[![device-2014-03-05-052409](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-052409.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-052409.png)

[![device-2014-03-05-052442](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-052442.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/device-2014-03-05-052442.png)

Ini adalah sebuah halaman *Prefference* yang biasa dipakai untuk halaman *setting* pada aplikasi-aplikasi *Android.* Bukan mustahil menerapkan *slide to left/ slide to right* untuk berpindah ke *prefference* yg berbeda. Caranya adalah mengkombinasika *PrefferenceFragment, ViewPager* dan *ViewPagerIndicator*.

***Step by step***

1\. Pastikan Anda sudah menggunakan *library ActionbarSherlock* dan *ViewPagerIndicator.*

[![Screenshot-Properties for SlidePreffDemo](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot-Properties-for-SlidePreffDemo-1.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot-Properties-for-SlidePreffDemo-1.png)

dan *android-support-v13.jar*

[![Screenshot](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot.png)](http://hangga.github.io/blog/wp-content/uploads/2014/03/Screenshot.png)

2\. Kita perlu membuat kelas *PreferenceFragment* di abstract dari *PreferenceFragment* milik Android. Lalu simpan di *package* kita.

```
package com.hangga.slidepreffdemo;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import org.xmlpull.v1.XmlPullParser;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Base64;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnKeyListener;
import android.widget.ListView;

@SuppressLint("NewApi")
public abstract class PreferenceFragment extends Fragment {

    private static final String PREFERENCES_TAG = "android:preferences";

    private PreferenceManager mPreferenceManager;
    private ListView mList;
    private boolean mHavePrefs;
    private boolean mInitDone;

    /**
     * The starting request code given out to preference framework.
     */
    private static final int FIRST_REQUEST_CODE = 100;

    private static final int MSG_BIND_PREFERENCES = 1;
    @SuppressLint("HandlerLeak")
    private Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {

                case MSG_BIND_PREFERENCES:
                    bindPreferences();
                    break;
            }
        }
    };

    final private Runnable mRequestFocus = new Runnable() {
        public void run() {
            mList.focusableViewAvailable(mList);
        }
    };

    /**
     * Interface that PreferenceFragment's containing activity should
     * implement to be able to process preference items that wish to
     * switch to a new fragment.
     */
    public interface OnPreferenceStartFragmentCallback {
        /**
         * Called when the user has clicked on a Preference that has
         * a fragment class name associated with it.  The implementation
         * to should instantiate and switch to an instance of the given
         * fragment.
         */
        boolean onPreferenceStartFragment(PreferenceFragment caller, Preference pref);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // FIXME: mPreferenceManager = new PreferenceManager(getActivity(), FIRST_REQUEST_CODE);
        mPreferenceManager = callConstructor(PreferenceManager.class,
            new Class[] { Activity.class, int.class },
            new Object[] { getActivity(), FIRST_REQUEST_CODE });
        // FIXME: mPreferenceManager.setFragment(this);
    }

    public static final String LAYOUT =
        "AwAIABgEAAABABwA0AEAABQAAAAAAAAAAAEAAGwAAAAAAAAAAAAAAA4AAAAeAAAALQAAADoAAAA/" +
        "AAAATwAAAFwAAABsAAAAegAAAIkAAACaAAAAqgAAAL4AAADPAAAA8gAAAPwAAAApAQAALAEAAEoB" +
        "AAALC29yaWVudGF0aW9uAA0NbGF5b3V0X2hlaWdodAAMDGxheW91dF93aWR0aAAKCmJhY2tncm91" +
        "bmQAAgJpZAANDWxheW91dF93ZWlnaHQACgpwYWRkaW5nVG9wAA0NcGFkZGluZ0JvdHRvbQALC3Bh" +
        "ZGRpbmdMZWZ0AAwMcGFkZGluZ1JpZ2h0AA4Oc2Nyb2xsYmFyU3R5bGUADQ1jbGlwVG9QYWRkaW5n" +
        "ABERZHJhd1NlbGVjdG9yT25Ub3AADg5jYWNoZUNvbG9ySGludAAgIHNjcm9sbGJhckFsd2F5c0Ry" +
        "YXdWZXJ0aWNhbFRyYWNrAAcHYW5kcm9pZAAqKmh0dHA6Ly9zY2hlbWFzLmFuZHJvaWQuY29tL2Fw" +
        "ay9yZXMvYW5kcm9pZAAAAAAbG2FuZHJvaWQud2lkZ2V0LkxpbmVhckxheW91dAAXF2FuZHJvaWQu" +
        "d2lkZ2V0Lkxpc3RWaWV3AIABCABEAAAAxAABAfUAAQH0AAEB1AABAdAAAQGBAQEB1wABAdkAAQHW" +
        "AAEB2AABAX8AAQHrAAEB/AABAQEBAQFpAAEBAAEQABgAAAACAAAA/////w8AAAAQAAAAAgEQAHQA" +
        "AAACAAAA//////////8SAAAAFAAUAAQAAAAAAAAAEAAAAAAAAAD/////CAAAEAEAAAAQAAAAAwAA" +
        "AP////8IAAABDQAGARAAAAACAAAA/////wgAABD/////EAAAAAEAAAD/////CAAAEP////8CARAA" +
        "KAEAAAgAAAD//////////xMAAAAUABQADQAAAAAAAAAQAAAADgAAAP////8IAAAS/////xAAAAAK" +
        "AAAA/////wgAABEAAAACEAAAAAQAAAD/////CAAAAQoAAgEQAAAACAAAAP////8IAAAFARAAABAA" +
        "AAAGAAAA/////wgAAAUBAAAAEAAAAAkAAAD/////CAAABQEQAAAQAAAABwAAAP////8IAAAFAQAA" +
        "ABAAAAALAAAA/////wgAABIAAAAAEAAAAAIAAAD/////CAAAEP////8QAAAAAQAAAP////8IAAAF" +
        "AAAAABAAAAAMAAAA/////wgAABIAAAAAEAAAAA0AAAD/////CAAAAQ0ABgEQAAAABQAAAP////8I" +
        "AAAEAACAPwMBEAAYAAAAFAAAAP//////////EwAAAAMBEAAYAAAAFgAAAP//////////EgAAAAEB" +
        "EAAYAAAAFgAAAP////8PAAAAEAAAAA==";

    /**
     * return XmlPullParser
     * @param xml compiled XML encoded in base64
     * @return XmlPullParser
     */
     public static XmlPullParser getParser(String xml) {
        try {
            byte[] data = Base64.decode(xml, Base64.DEFAULT);

            // XmlBlock block = new XmlBlock(LAYOUT.getBytes("UTF-8"));
            Class<?> clazz = Class.forName("android.content.res.XmlBlock");
            Constructor<?> constructor = clazz.getDeclaredConstructor(byte[].class);
            constructor.setAccessible(true);
            Object block = constructor.newInstance(data);

            // XmlPullParser parser = block.newParser();
            Method method = clazz.getDeclaredMethod("newParser");
            method.setAccessible(true);
            return (XmlPullParser) method.invoke(block);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (java.lang.InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState) {
        return inflater.inflate(getParser(LAYOUT), container, false);
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        if (mHavePrefs) {
            bindPreferences();
        }

        mInitDone = true;

        if (savedInstanceState != null) {
            Bundle container = savedInstanceState.getBundle(PREFERENCES_TAG);
            if (container != null) {
                final PreferenceScreen preferenceScreen = getPreferenceScreen();
                if (preferenceScreen != null) {
                    preferenceScreen.restoreHierarchyState(container);
                }
            }
        }
    }

    @Override
    public void onStart() {
        super.onStart();
        // FIXME: mPreferenceManager.setOnPreferenceTreeClickListener(this);
        try {
            Class<?> clazz = Class.forName("android.preference.PreferenceManager$OnPreferenceTreeClickListener");
            Object proxy = Proxy.newProxyInstance(clazz.getClassLoader(), new Class[] { clazz }, new InvocationHandler() {
                @Override
                public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                    if (method.getName().equals("onPreferenceTreeClick")) {
                        return onPreferenceTreeClick((PreferenceScreen) args[0], (Preference) args[1]);
                    }
                    return null;
                }
            });
            callVoidMethod(mPreferenceManager, "setOnPreferenceTreeClickListener", new Class[] { clazz }, new Object[] { proxy });
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onStop() {
        super.onStop();
        // FIXME: mPreferenceManager.dispatchActivityStop();
        callVoidMethod(mPreferenceManager, "dispatchActivityStop", null, null);
        // FIXME: mPreferenceManager.setOnPreferenceTreeClickListener(null);
        try {
            Class<?> clazz = Class.forName("android.preference.PreferenceManager$OnPreferenceTreeClickListener");
            callVoidMethod(mPreferenceManager, "setOnPreferenceTreeClickListener", new Class[] { clazz }, new Object[] { null });
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onDestroyView() {
        mList = null;
        mHandler.removeCallbacks(mRequestFocus);
        mHandler.removeMessages(MSG_BIND_PREFERENCES);
        super.onDestroyView();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        // FIXME: mPreferenceManager.dispatchActivityDestroy();
        callVoidMethod(mPreferenceManager, "dispatchActivityDestroy", null, null);
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);

        final PreferenceScreen preferenceScreen = getPreferenceScreen();
        if (preferenceScreen != null) {
            Bundle container = new Bundle();
            preferenceScreen.saveHierarchyState(container);
            outState.putBundle(PREFERENCES_TAG, container);
        }
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // FIXME: mPreferenceManager.dispatchActivityResult(requestCode, resultCode, data);
        callVoidMethod(mPreferenceManager, "dispatchActivityResult",
            new Class[] { int.class, int.class, Intent.class },
            new Object[] { requestCode, resultCode, data });
    }

    /**
     * Returns the {@link PreferenceManager} used by this fragment.
     * @return The {@link PreferenceManager}.
     */
    public PreferenceManager getPreferenceManager() {
        return mPreferenceManager;
    }

    /**
     * Sets the root of the preference hierarchy that this fragment is showing.
     *
     * @param preferenceScreen The root {@link PreferenceScreen} of the preference hierarchy.
     */
    public void setPreferenceScreen(PreferenceScreen preferenceScreen) {
        // FIXME: if (mPreferenceManager.setPreferences(preferenceScreen) && preferenceScreen != null) {
        if (callReturnMethod(mPreferenceManager, "setPreferences", Boolean.class,
            new Class[] { PreferenceScreen.class }, new Object[] { preferenceScreen }) && preferenceScreen != null) {
            mHavePrefs = true;
            if (mInitDone) {
                postBindPreferences();
            }
        }
    }

    /**
     * Gets the root of the preference hierarchy that this fragment is showing.
     *
     * @return The {@link PreferenceScreen} that is the root of the preference
     *         hierarchy.
     */
    public PreferenceScreen getPreferenceScreen() {
        // FIXME: return mPreferenceManager.getPreferenceScreen();
        return callReturnMethod(mPreferenceManager, "getPreferenceScreen", PreferenceScreen.class, null, null);
    }

    /**
     * Adds preferences from activities that match the given {@link Intent}.
     *
     * @param intent The {@link Intent} to query activities.
     */
    public void addPreferencesFromIntent(Intent intent) {
        requirePreferenceManager();

        // FIXME: setPreferenceScreen(mPreferenceManager.inflateFromIntent(intent, getPreferenceScreen()));
        setPreferenceScreen(callReturnMethod(mPreferenceManager, "inflateFromIntent", PreferenceScreen.class,
            new Class[] { Intent.class, PreferenceScreen.class },
            new Object[] { intent, getPreferenceScreen() }));
    }

    /**
     * Inflates the given XML resource and adds the preference hierarchy to the current
     * preference hierarchy.
     *
     * @param preferencesResId The XML resource ID to inflate.
     */
    public void addPreferencesFromResource(int preferencesResId) {
        requirePreferenceManager();

        // FIXME: setPreferenceScreen(mPreferenceManager.inflateFromResource(getActivity(),
        //        preferencesResId, getPreferenceScreen()));
        setPreferenceScreen(callReturnMethod(mPreferenceManager, "inflateFromResource", PreferenceScreen.class,
            new Class[] { Context.class, int.class, PreferenceScreen.class },
            new Object[] { getActivity(), preferencesResId, getPreferenceScreen() }));
    }

    /**
     * {@inheritDoc}
     */
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen,
            Preference preference) {
        // FIXME: preference.getFragment()
        if (/*preference.getFragment() != null &&*/
                getActivity() instanceof OnPreferenceStartFragmentCallback) {
            return ((OnPreferenceStartFragmentCallback)getActivity()).onPreferenceStartFragment(
                    this, preference);
        }
        return false;
    }

    /**
     * Finds a {@link Preference} based on its key.
     *
     * @param key The key of the preference to retrieve.
     * @return The {@link Preference} with the key, or null.
     * @see PreferenceGroup#findPreference(CharSequence)
     */
    public Preference findPreference(CharSequence key) {
        if (mPreferenceManager == null) {
            return null;
        }
        return mPreferenceManager.findPreference(key);
    }

    private void requirePreferenceManager() {
        if (mPreferenceManager == null) {
            throw new RuntimeException("This should be called after super.onCreate.");
        }
    }

    private void postBindPreferences() {
        if (mHandler.hasMessages(MSG_BIND_PREFERENCES)) return;
        mHandler.obtainMessage(MSG_BIND_PREFERENCES).sendToTarget();
    }

    private void bindPreferences() {
        final PreferenceScreen preferenceScreen = getPreferenceScreen();
        if (preferenceScreen != null) {
            preferenceScreen.bind(getListView());
        }
    }

    /** @hide */
    public ListView getListView() {
        ensureList();
        return mList;
    }

    private void ensureList() {
        if (mList != null) {
            return;
        }
        View root = getView();
        if (root == null) {
            throw new IllegalStateException("Content view not yet created");
        }
        View rawListView = root.findViewById(android.R.id.list);
        if (!(rawListView instanceof ListView)) {
            throw new RuntimeException(
                    "Content has view with id attribute 'android.R.id.list' "
                    + "that is not a ListView class");
        }
        mList = (ListView)rawListView;
        if (mList == null) {
            throw new RuntimeException(
                    "Your content must have a ListView whose id attribute is " +
                    "'android.R.id.list'");
        }
        mList.setOnKeyListener(mListOnKeyListener);
        mHandler.post(mRequestFocus);
    }

    private OnKeyListener mListOnKeyListener = new OnKeyListener() {

        @Override
        public boolean onKey(View v, int keyCode, KeyEvent event) {
            Object selectedItem = mList.getSelectedItem();
            if (selectedItem instanceof Preference) {
                View selectedView = mList.getSelectedView();
                // FIXME : return ((Preference)selectedItem).onKey(
                //                selectedView, keyCode, event);
                return callReturnMethod(selectedItem, "onKey", Boolean.class,
                            new Class[] { View.class, int.class, KeyEvent.class },
                            new Object[] { selectedView, keyCode, event });
            }
            return false;
        }

    };

    public static void callVoidMethod(Object receiver, String methodName, Class<?>[] parameterTypes, Object[] args) {
        try {
            Method method = receiver.getClass().getDeclaredMethod(methodName, parameterTypes);
            method.setAccessible(true);
            method.invoke(receiver, args);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    public static <T> T callReturnMethod(Object receiver, String methodName, Class<T> returnType, Class<?>[] parameterTypes, Object[] args) {
        try {
            Method method = receiver.getClass().getDeclaredMethod(methodName, parameterTypes);
            method.setAccessible(true);
            return (T) method.invoke(receiver, args);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        if (Boolean.class.equals(returnType)) {
            return (T) Boolean.FALSE;
        }
        return null;
    }

    @SuppressWarnings("unchecked")
    public static <T> T callConstructor(Class<T> returnType, Class<?>[] parameterTypes, Object[] args) {
        try {
            Constructor<?> constructor = returnType.getDeclaredConstructor(parameterTypes);
            constructor.setAccessible(true);
            return (T) constructor.newInstance(args);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (java.lang.InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return null;
    }
}
```

2\. Kemudian membuat *fragment*nya. Saya beri nama *PaijoFragment.*

```
<pre class="brush:xml"><?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen 
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:key="myScreen" >
    <EditTextPreference
	   	    android:key="name"
	   	    android:title="Nama Minuman"
	   	    android:summary="Nama Minuman"
	   	    android:enabled="true"/>

    <PreferenceCategory
        android:key="group"
        android:title="Teh" >

        <EditTextPreference
            android:key="merk"
            android:title="Merek Teh"
            android:summary="Sari Harum"/>

        <EditTextPreference
            android:key="merk"
            android:title="Merek Teh"
            android:summary="Sosro"/>

    </PreferenceCategory>

    <PreferenceCategory
        android:key="group"
        android:title="Kopi" >

        <EditTextPreference
            android:key="merk"
            android:title="Merek Kopi"
            android:summary="Kapal Merah"/>

        <EditTextPreference
            android:key="merk"
            android:title="Merek Kopi"
            android:summary="Kopi Luwak"/>

        <EditTextPreference
            android:key="merk"
            android:title="Merek Kopi"
            android:summary="Torabika"/>

    </PreferenceCategory>

</PreferenceScreen>
```

```
package com.hangga.slidepreffdemo;

import android.os.Bundle;

public class PaijoFragment extends PreferenceFragment{

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.preff_kopi);
	}

}
```

3\. Kemudian *FragmentAdapter*nya.

```
package com.hangga.slidepreffdemo;

import android.support.v13.app.FragmentPagerAdapter; 

/*import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
*/
public class PaijoFragmentAdapter extends FragmentPagerAdapter{

	PaijoFragment paijoFragment;

	public PaijoFragmentAdapter(android.app.FragmentManager fm) {
		super(fm);
	}

	@Override
	public PreferenceFragment getItem(int arg0) {
		return new PaijoFragment();
	}

	@Override
	public int getCount() {
		return 5; // misal jumlah page nya 5
	}

}
```

4\. Tinggal pasang…

```
<pre class="brush:xml"><RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="0dp"
    >

    <com.viewpagerindicator.CirclePageIndicator
    	android:id="@+id/indicator"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:padding="5dp"
        android:layout_alignParentTop="true"
        android:background="@android:color/black" />

    <android.support.v4.view.ViewPager
    	android:id="@+id/pgMain"
    	android:layout_below="@+id/indicator"
        android:layout_width="fill_parent"
        android:layout_height="fill_parent"
        android:layout_marginTop="0dp"
        >
    </android.support.v4.view.ViewPager>
</RelativeLayout>
```

```
package com.hangga.slidepreffdemo;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.viewpagerindicator.CirclePageIndicator;

import android.os.Bundle;
import android.support.v4.view.ViewPager;

public class MainActivity extends SherlockFragmentActivity {

	android.app.FragmentManager fm = getFragmentManager();
	PaijoFragmentAdapter paijoFragmentAdapter;
	ViewPager pgMain;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		pgMain = (ViewPager) findViewById(R.id.pgMain);
		paijoFragmentAdapter = new PaijoFragmentAdapter(fm);
		pgMain.setAdapter(paijoFragmentAdapter);
		pgMain.setCurrentItem(0);

		CirclePageIndicator indicator = (CirclePageIndicator) findViewById(R.id.indicator);
		indicator.setViewPager(pgMain);
		indicator.setCurrentItem(0);
	}

}
```

\[dl url=”http://hangga.github.io/blog/wp-content/uploads/2014/03/SlidePreffDemo.7z” title=”Download Source Lengkap” desc=”Tolles Archiv”\]