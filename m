Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x233.google.com (mail-yw0-x233.google.com
 [IPv6:2607:f8b0:4002:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMnPF6bt2zDq8M
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 14:06:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TiGCL8tj"; 
 dkim-atps=neutral
Received: by mail-yw0-x233.google.com with SMTP id u68so59962688ywg.0
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 19:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=o7JHVKXCoitka1VsZRgHXMd0OFQRITnjIa1KSCBbfig=;
 b=TiGCL8tjLRAnvIijob4vsuPrB/jtUjgEg9mA1Ym4dkevrAJQ3QXbmgT7XTPHnF28Lq
 clfdBhkPGVjzhUTu71qLhUhG6Tc0duZOCc9rID0VxO4ADtvowMmReBZsN5UNWRfJhGzw
 O44c4mkaqSp98UBMDkW4amPuIqESFgYmH8PTaY9cYL4shlZ5qLw4eMRP1dtsBqh43nCx
 B+pIAAI1zPUpjnQmFOlZuJdcXU2SLwdMHYGnFpOQBWMGZ19OVidUrO27UNVusxwsFQ0r
 tuCpCObtJHz6QJvZ+FRP9i3yjdlH+/PuB69vZLHBw1YcMTzNC+1mEMGbYlfnD1NVu5Fs
 7OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=o7JHVKXCoitka1VsZRgHXMd0OFQRITnjIa1KSCBbfig=;
 b=j9qb4R7iZ7gaDTGlnF+XYHewSWcMGPrvoqKAvcYn/9TxS65wNJZ+CDHgpHGiw4WRnX
 l7AAqWqKvaknbcsaKBTi/oBrG8eKJ6rOUisyN+jjidnviJ5GyP2FNM9SEPU2/HD6saac
 RDAMzpb3ts+UXue4bUZbyMdGkxoKgv8INPqbbkXKMA/ZMEE3cDRlQgsKxPOEhwTGRRx6
 EDwMJX2OsPHRPt2CD0WZjHerzTMZZ+xLdCHgriZLfcfmCGy/eFsT2b3HhUAA3ikhMBW3
 ryfgbpSPxEnZi2a91v3O5f3vGoJa83fndchPRhvFowpkZAKXyUz0fIBSYMvgXH0+rAO0
 lv5g==
X-Gm-Message-State: AMke39nsEtL5LS87SsZ0SS7GcDeYjxwYtdPKmeIV5HxPxSiHIjdW5Sr1DsU92sf4eGQNYbaBHguES+6O4DMu6A==
X-Received: by 10.129.118.82 with SMTP id j18mr19450431ywk.10.1487041567024;
 Mon, 13 Feb 2017 19:06:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Mon, 13 Feb 2017 19:05:46 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Feb 2017 13:35:46 +1030
X-Google-Sender-Auth: ya03LqgEmLnODpxXl7HBV8lnN4E
Message-ID: <CACPK8XcTyap7kRPzd5MUYsbzFsrD7i97XDk4NBeM0pwfr6uE4g@mail.gmail.com>
Subject: Booting FIT kernels
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2017 03:06:10 -0000

Hello,

I've switched my kernel development workflow to use a FIT image
containing the machine's dtb, initramfs and kenrel. By copying this
over with tftp and booting it, I can test my changes with a real
openbmc rootfs, but the changes go away once someone else reboots.

This example uses witherspoon. Put the files in the root of your
kernel object tree.

1. Download obmc-phosphor-initramfs-witherspoon.cpio.lzma[1]
2. Download http://ozlabs.org/~joel/openbmc.its
3. Build your kernel with `make`
4. Build your fit with `mkimgage -f openbmc.its myimage`

You now have a FIT image called myimage. Copy it across to your tftp
server and on a u-boot prompt as follows:

ast > setenv serverip <tftp server>
ast > tftp 0x83000000 myimage
ast > bootm 0x83000000

And off it goes! The magic was mostly working out where to find the
.its file. In the future we could include this in the kernel tree and
have a makefile rule that does the FIT-ing for us.

Cheers,

Joel

[1] https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=witherspoon/lastSuccessfulBuild/artifact/images/witherspoon/
