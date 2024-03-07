---
id: 5161
title: 'Kotlin Coroutine : Beberapa Cara Implementasi Scheduler/Timer'
date: '2021-02-13T15:08:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'https://hangga.github.io/blog/?p=5161'
permalink: /2021/02/13/kotlin-coroutine-beberapa-cara-implementasi-scheduler-timer/
image: /wp-content/uploads/2021/02/pxfuel-1.jpg
categories:
    - Coding
    - Kotlin
tags:
    - Coroutine
    - kotlin
    - 'Kotlin Coroutine'
---

Scheduler atau timer dengan Kotlin `Coroutine` dapat membantu dalam mengelola tugas-tugas yang dijadwalkan secara periodik atau setelah jangka waktu tertentu. Kotlin `Coroutine` menyediakan kemampuan untuk membuat penjadwalan yang efisien dan mudah dibaca. Berikut adalah penjelasan komprehensif bersama dengan contohnya:

### 1. Setup

Pastikan untuk mengimpor library yang diperlukan. Dalam konteks ini, kita akan menggunakan `kotlinx.coroutines` dan `kotlinx.coroutines.delay`.

```
import kotlinx.coroutines.*
```

### 2. Membuat Scheduler

#### 2.1. Menggunakan delay()

Gunakan fungsi `launch` untuk menjalankan blok kode secara asinkron dan `delay` untuk memberikan jeda.

```
fun scheduleTimer(delayMillis: Long, action: () -> Unit): Job {
    return GlobalScope.launch {
        delay(delayMillis)
        action.invoke()
    }
}
```

Misalkan kita ingin menjalankan tugas setiap 1 detik, berikut adalah contoh penggunaan dengan mencetak pesan setiap detik.

```
fun main() {
    val timerJob = scheduleTimer(1000) {
        println("Tugas dijalankan setiap detik.")
    }

    // Menunggu beberapa detik sebelum menutup aplikasi (hanya untuk memberikan contoh).
    runBlocking {
        delay(5000)
        timerJob.cancel() // Mematikan timer setelah 5 detik.
    }
}
```

#### 2.2. Menggunakan Timer dan TimerTask

Kita juga dapat menggunakan kelas `Timer` dan `TimerTask` dari pustaka Java untuk melakukan penjadwalan. Contohnya:

```
import java.util.*

fun scheduleWithTimerTask(delayMillis: Long, periodMillis: Long, action: () -> Unit): TimerTask {
    val timerTask = object : TimerTask() {
        override fun run() {
            action.invoke()
        }
    }

    Timer().schedule(timerTask, delayMillis, periodMillis)

    return timerTask
}
```

#### 2.3. Menggunakan CoroutineScope dengan launch dan repeat

Selain itu kita juga dapat menggunakan fungsi `launch` bersama dengan fungsi ekstensi repeat untuk membuat penjadwalan yang mirip dengan `delay`.  
Contohnya:

```
fun scheduleWithRepeat(scope: CoroutineScope, periodMillis: Long, action: () -> Unit): Job {
    return scope.launch {
        repeat(Int.MAX_VALUE) {
            action.invoke()
            delay(periodMillis)
        }
    }
}
```

#### 2.4. Menggunakan Flow dengan onEach dan collect

Teknik yang terakhir, kita dapat menggunakan `Flow` untuk membuat aliran data yang menghasilkan nilai secara berulang dengan interval waktu tertentu. Contohnya:

```
import kotlinx.coroutines.flow.*

fun scheduleWithFlow(periodMillis: Long, action: () -> Unit): Job {
    return flow {
        while (true) {
            emit(Unit)
            delay(periodMillis)
        }
    }.onEach {
        action.invoke()
    }.launchIn(GlobalScope)
}
```

### 3. Catatan Penting:

- Pilih teknik yang sesuai dengan kebutuhan dan kompleksitas aplikasi kita.
- Pastikan untuk menangani kesalahan dan membatalkan pekerjaan sesuai kebutuhan.
- Hindari penggunaan `GlobalScope` di dalam produksi, lebih baik menggunakan `CoroutineScope` yang terkait dengan lingkup aplikasi.
- Sesuaikan interval waktu, penanganan kesalahan, dan kebutuhan spesifik aplikasi kita.

Sekian, terimakasih