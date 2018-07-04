Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LH2Oozk/"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L4nv2PgczF1QS
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 12:34:42 +1000 (AEST)
Received: by mail-it0-x22c.google.com with SMTP id u4-v6so5847318itg.0
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8SUzj/vCKz/PbLpBX7RY+8TfJBpMOetngva2CcRHds=;
 b=LH2Oozk/XgHwMzVHxQO7NcLU/tn6W8HcDa84ks4b7A4uSy3aVwxXTmX39Ll4plR2A+
 TtQOWQSgtXnkkb7WKh8G52CJjdMf0bIVo0ggVs5F3tHd0XGrJFvsp/A5Wc2iUWMYOkwg
 hpCpUHiKv3NaEFXER/CBBg1f8AkzWRzf190qVX9NRbK5y48pNGWOKJ61Ip6EFX/Scvn+
 lUM7NVjj7zG/0P3qZTzJpKv9fbQJARIo9SK4hFbC7xe+2Zjof3KWdYx9VNFQe/amSnm3
 C1KIlolFNiT/r3I6ib7l+3hkPbwlIHomDjKZNGsGusd6dSuNRuyEeX5BxPVGlWgOEAzt
 ME9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8SUzj/vCKz/PbLpBX7RY+8TfJBpMOetngva2CcRHds=;
 b=re5g+tlojSlBuQjubdGeSHoiIR+LCCtqqb/S3UXrtr/5a+T6tV06SF2+r6JWW5zWof
 893vBLmYkRDsgNNh8ELeyXc0VLYFFUdIPVybctKs5I2LfT2Nyl5y+gVAssolUqRQOaUE
 7FQZDaCqHcQTA51UzHgP6QKaeh2CqHXxInjQwSVIagcI2hOMpcBdjYfZ7zfvEYHWTorw
 4njFYJPsQuS+0InVMqt+aC913m1pDK8ntPTHXW428tJCGTumsmzoehaS+oeCCAmIa3M0
 SkEH1eDc7rPS8hy44DDSkk7gc90Q90iwx4oS6qKvm3hbrO+j+p5N/6omVb/MtBtj3kC+
 1hVw==
X-Gm-Message-State: APt69E1Hq2MNI0f1/YzN9qlZv/tBYZmTb1PWU24igktk8jAjR3NAtclh
 oaNn+JxHpZLMe12tRDOVD02s4wIDPMPUUEVhbcpWb8YU
X-Google-Smtp-Source: AAOMgpfIrx8K7zHDn7YXAytVwFuGxyx0oPW47F4ye3Y/VWB/IQvfd+1YufrfAEyx2K/B+eHE4ijVZDsQgpx09MxHcpY=
X-Received: by 2002:a24:f6c1:: with SMTP id
 u184-v6mr436893ith.14.1530671680524; 
 Tue, 03 Jul 2018 19:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
 <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
 <CAARXrtkRqe-CGfi1XZn1ueuA7npP0pC67-HfuvaGCiaxtU-Uvg@mail.gmail.com>
 <CAG9c7cBFcpDp+d-WiDqLsGjo8XEUa-ziGYYRU_=hOwAr6TbGKg@mail.gmail.com>
In-Reply-To: <CAG9c7cBFcpDp+d-WiDqLsGjo8XEUa-ziGYYRU_=hOwAr6TbGKg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 4 Jul 2018 10:34:24 +0800
Message-ID: <CAARXrtn0SM65b4m6Ln_+2Sh7iC9LNV+X6YjKY6v28UVdDAsg+A@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 02:34:44 -0000

> After following your instructions, the CONFIG_DEVMEM is still not set in the below '.config'
>
> workspace/sources/linux-aspeed/.config
>
> It did work if I directly modified meta-openbmc-bsp/meta-aspeed/recipes-kernel/linux/linux-aspeed/ast2500/defconfig

Then you need to make sure if your build config include the machine layer by
checking the build configuration.

E.g. below is meta-romulus' configuration, check if your meta-machine is
correctly included.

    Build Configuration:
    ...
    meta
    meta-poky
    meta-oe
    meta-networking
    meta-perl
    meta-python
    meta-webserver
    meta-virtualization
    meta-phosphor
    meta-aspeed
    meta-openpower
    meta-ibm
    meta-romulus   <== Your meta-machine should appear here.

Btw, what is your machine, is it in OpenBMC tree?
