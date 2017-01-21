Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v5Cxj0wJ7zDqX2
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 21:10:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qczC9gjR"; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id x49so66650887qtc.2
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=p9iy4XYgq2DGNuwNXH3rd2HAXlFMrtRsVmC9au0L3Ek=;
 b=qczC9gjRuQ4/iBQrq+6g1gmw9sU6cXr/youUuuz8E6gYVmMnsxn3rw/R13waRvr1fK
 e+cRwAQVqqXmQe8SOvigUU9nZ3xmpKPzgzPQOXeeOAwHqVTGA0bM9NidbVRNFjkcaagE
 W+ji9UBpIAGlOO7C8CRCEexkO99P3JIdxNFhw97WrCA/eeNHp1EtfSnwDgaJlhJn/91A
 WURdcxdepRf9g36k7hSbDG6AicJDt2MH0K3ObFPfm7mrBtQ9mneK2hCJU3+18F2FhTEq
 JvUjY7IZzCA/oZI5YUQIlx27viAP2NRcCNcR5TTu+kchf0MTkBksGxwTTH+ibX3eiyLQ
 8iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=p9iy4XYgq2DGNuwNXH3rd2HAXlFMrtRsVmC9au0L3Ek=;
 b=gwm6d/CU1aZ0rWpKKFlgmh7w141CLSjLAF4+Mrpn3dd734V9dZE5pZ43CZiEY9izUd
 /JX7fxUg8p5RnkjK8JcZ6m4advbimTpe7qedfMjhQwYSU7yAIMoescKaDmbrhXeVna2h
 7YV9S9IzQTO6UQ5Zj1j68OMyezKktjGCifj4ITH8PfkMZYHwbM912hlVHMg19sW6asPk
 Mh8ncW+GUWNEX1OOAIChFaLDwCGw3AG3+NELHcFcU4dPxmUFRyGSJ7h3vySgUPKBjlXN
 HWikz0Y/sJtLwAW+Ee9OevxcDYr4nrHO6WYyognezKzNTqi16lbR/Czk9ztiMwFSQF4X
 guVA==
X-Gm-Message-State: AIkVDXJiF5xRCmFhyDVunseyWXTlFTiLlFTgJeRrZ+9Ys3hO51Q54iSBlEOAaNdo/bkYgVNrhnGOcyihrP24HA==
X-Received: by 10.237.47.33 with SMTP id l30mr16169382qtd.62.1484993414899;
 Sat, 21 Jan 2017 02:10:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Sat, 21 Jan 2017 02:10:14 -0800 (PST)
In-Reply-To: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
References: <CAPH-5w5h5B5PwPuYDcTyRC8Ea-y4ryxsQ8+q2JtJxc2Oi9+ZWg@mail.gmail.com>
From: Mine <mine260309@gmail.com>
Date: Sat, 21 Jan 2017 18:10:14 +0800
Message-ID: <CAARXrtmP1i4NZNO+jE5WmS7QRLd3d7E_yR8dDu8qrx82QnOX9Q@mail.gmail.com>
Subject: Re: Does anyone tftpboot the userspace image?
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 21 Jan 2017 10:10:18 -0000

Hi Xo,


On Sat, Jan 21, 2017 at 9:59 AM, Xo Wang <xow@google.com> wrote:
> Hi folks,
>
> I noticed from this discussion
> https://lists.ozlabs.org/pipermail/openbmc/2016-April/thread.html#2738
> that kernel developers were tftpbooting the userspace image from a
> obmc-phosphor-image-<machine>.cpio.lzma.u-boot file.
>
> 1. How does/did that work? I guess you needed a custom init in the
> initrd to load the u-boot container (?) instead of from mtd?

In uboot, we can use tftp to load the kernel and initrd to specific address,
and use `bootm` command to start the kernel.
E.g. for witherspoon:
tftp 0x80001000 kernel
tftp 0x81000000 initrd
bootm 0x80001000 0x81000000

>
> 2. Are you still using this? Building the extra .cpio.lzma.u-boot is
> kind of slow, with an extra ~45 seconds to do 'find | cpio | lzma;
> mkimage' every build, and it can't be parallelized.

I believe someone uses this, since it does not require to flash the image to
the NOR flash, and make it easier to test new build.

>
> I ask because I mailed a change to remove those image products from
> the build, then followed the 'blame' to this use case:
> https://gerrit.openbmc-project.xyz/#/c/1957/
>
> cheers
> xo
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
