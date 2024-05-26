---
id: 3144
title: '[Git] fatal: The remote end hung up unexpectedly'
date: '2016-12-23T09:53:20+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=3144'
permalink: /2016/12/23/git-fatal-the-remote-end-hung-up-unexpectedly/
post_views_count:
    - '72'
image: /wp-content/uploads/2016/12/git-1010x476.jpeg
categories:
    - Linux
tags:
    - git
    - 'git error'
    - gitlab
    - 'The remote end hung up unexpectedly'
---

Beberapa waktu lalu pernah mengalami hal ini, yaitu ketika membuat *project* baru kemudian *push request*.

```
error: RPC failed; result=55, HTTP code = 200
fatal: The remote end hung up unexpectedly
Writing objects: 100% (54/54), 13.45 MiB | 35.00 KiB/s, done.
Total 54 (delta 2), reused 0 (delta 0)
fatal: The remote end hung up unexpectedly
```

Rupanya penyebabnya adalah berikut ini

*The “Smart HTTP” protocol in Git uses “Transfer-Encoding: chunked” in POST requests when it contains packed objects greater than 1MB in size.*  
 *Some proxy servers, like Nginx, do not support this transfer encoding by default, and the requests will be rejected before they get to Stash. Because of this, the Stash logs will not show any extra information.*

Sehingga kita harus mengubah ukuran *http.postBuffer*-nya

```
git config --global http.postBuffer 157286400
```

Sumber : <https://confluence.atlassian.com/stashkb/git-push-fails-fatal-the-remote-end-hung-up-unexpectedly-282988530.html>