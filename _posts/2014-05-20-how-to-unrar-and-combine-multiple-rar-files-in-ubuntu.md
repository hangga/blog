---
id: 1878
title: 'How to unrar and combine multiple RAR files in Ubuntu'
date: '2014-05-20T06:59:53+00:00'
author: 'Hangga Aji Sayekti'
layout: post
guid: 'http://hangga.github.io/blog/?p=1878'
permalink: /2014/05/20/how-to-unrar-and-combine-multiple-rar-files-in-ubuntu/
post_views_count:
    - '142'
categories:
    - 'Dunia IT'
    - 'Komputer Info'
---

Rar used to be a favorite compression format when the compressed files were to be split into multiple pieces to fit into legacy external storage devices like Floppy, Zip disk, CD etc. WinRAR is a popular GUI application that can rar and unrar files in the rar format. If however you come across rar files that are split into multiple parts then you can extract and combine them as follows

unrar x -e file.part1.rar

The other parts have to be in the same folder. The unrar utility will find these other parts and then use them to extract the original file from the split archive.

If the rar and unrar utilities are not present in your system you can install them by running

sudo apt-get install rar unrar

Happy Unraring 🙂

Source : http://www.zyxware.com/articles/636/how-to-unrar-and-combine-multiple-rar-files-in-ubuntu