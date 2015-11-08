---
layout: post
title:  "Cara install nodejs menggunakan nvm"
date:   2015-11-07 22:43:00 +0700
excerpt_separator: <!--more-->
author: Andri Kurnia
---

Saya akan menjelaskan bagaimana cara meng-install nodejs dengan nvm (node version manager).

Apakah kalian tau apa itu nodejs ?

    Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine.

<!--more-->

Kenapa saya meng-install nodejs menggunakan nvm tidak langsung men-download dari website nodejs ?

    Node.js mempunyai banyak versi, dengan nvm kita dapat mengganti versi node.js sesuai dengan project yang sedang dikerjakan.


## Install nvm

[nvm github repository](https://github.com/creationix/nvm)

Untuk meng-install nvm kita dapat menggunakan `curl` atau `wget`

Curl:

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

Wget:

    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash


## Install Node

[node.js github repository](https://github.com/nodejs/node)

Setelah anda meng-install `nvm` anda dapat menggunakan `nvm` pada terminal.

Menampilkan versi nodejs

    nvm ls-remote

Install versi stable nodejs

    nvm install stable


Selamat! Node.js telah terinstall pada komputer anda!

Thanks,
Andri Kurnia
