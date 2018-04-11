Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l8jLHrNb"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KpA9oAec"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40LWJw3YCvzDrqP
 for <openbmc@lists.ozlabs.org>; Wed, 11 Apr 2018 14:29:20 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id d50so564177qtc.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Apr 2018 21:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=OFx2pPpiWJxzTg9DyARYDVS0BNVnx5LgsW05Ifi1pOc=;
 b=l8jLHrNbrQcRfEoLxyUUc7u3Ul4vnIubQgLl6Duy+kMV7m+QI7Yjf01KTIslyTgKEn
 6IXTuKfMaC49EbBkUSMq6/Sxvl6VWDIIe4CaRHzNg5CAKJfcXmE0DGb/+1T2JBzFsEUd
 ipLMdLi/iKc6dah5U+v9a+paVa2GoeEeMCOfP6rZEXjs04MUlxdFMI7loj82qRk2/AeP
 0xd+bxSkDZS+Cx8RhZ8VHG6P7j+O+W35kLTBYUdCvXL/rCBaaJFfLCJOYmn5En2tOkVS
 Ehc/fls7fpBr2pb7acSajwvhTS05clItcwVDqUF0wFBe3esa+kI/9x952xf51tz/x/b8
 q4nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=OFx2pPpiWJxzTg9DyARYDVS0BNVnx5LgsW05Ifi1pOc=;
 b=KpA9oAecqjdSSo+X/h2++YwF+dQRVABB7yqQpWZS6c+d58Mxv/+zZx0rJwneZsVSuj
 feJblgSdpUFA+rV7TvQrqYzI3Cv91lD2608TKctcFNPtiLrlupFzWoIToAsRlEHJIiFR
 izg6PmV+B3L6AR7RhgJXzncsh+od33fzAYEV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=OFx2pPpiWJxzTg9DyARYDVS0BNVnx5LgsW05Ifi1pOc=;
 b=N7iNBKnsf567xYbfq/e1XiB1Cx5ukPqtYhAGw7nUkRIn3JDto7G+7N9WGMawTvSAAQ
 aLK8w35wmUDCbXPbsBN2Q3QOIdVAZB+xOpkcMzk1l7Xjodny9hb8DywvvLI8ir05wiXg
 Da0TalR8nC4XMCSdRJMCSs1eGVfzHi3dGWm4v6VOjtksgjG6hlwv49zEWPf1DYtmRhWe
 rKbe0bTxSVR5gyZqnnqhg0N46xkOmR8GuzeEf2kSDfzDXDGZ5zRUxBGVmXU5Y36YeVcQ
 rq9uzM7FQovHpqqjA5vGlwnMv7oyzZabCEw1WvG14nkrB4PWnSbtGEcE0KhI2DaiIrEw
 dDLg==
X-Gm-Message-State: ALQs6tC8dqqCmpTd3Y22fSUBa6Z1xWH/NVE4HKKQ0wWPZLStl1BpJ1oZ
 y8x+FNOOhw+hGTSF49803vxPmVCUzW+t/oqj3EewR7I9
X-Google-Smtp-Source: AIpwx48dNkpTcB7HzlP8oHBtwOZLN9iiPJW3hnJOiRqffQo9JobmAsoSiAmeLea16aGYWuV+UsaN0u5F836Lan9pTIk=
X-Received: by 10.237.40.2 with SMTP id r2mr5179849qtd.330.1523420957565; Tue,
 10 Apr 2018 21:29:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Tue, 10 Apr 2018 21:28:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Apr 2018 13:58:57 +0930
X-Google-Sender-Auth: snAXdvfnKMj3O6IebJ8yQgAwFag
Message-ID: <CACPK8Xe3hpnwzM1mAoYPA4xTdeSi8-bCqyuPH-RJsWP_3wic5w@mail.gmail.com>
Subject: Re: Upstream NPCM7xx to OpenBMC repository
To: Tomer Maimon <tomer.maimon@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2018 04:29:21 -0000

Hi Tomer,

On 9 April 2018 at 19:29,  <tomer.maimon@nuvoton.com> wrote:
> Hi Joel,
>
> Commits at Linus tree:
>
> MAINTAINERS: Add entry for the Nuvoton NPCM architecture - 6a498e06ba22872d3a27cc0dae77b9314b1de48b
> arm: npcm: add basic support for Nuvoton BMCs - 7bffa14c9aed5f788d3126271f0fd8758fbd129e
> arm: dts: add Nuvoton NPCM750 device tree - d6bdd009c21db3f677dd1d1bbb8c20bc819074bc
> serial: 8250: Add Nuvoton NPCM UART - f597fbce38d230af95384f4a04e0a13a1d0ad45d
> arm: dts: add watchdog device to NPCM750 device tree - 1c4937eec91426014247b9ae8cb3f04935cd4865
> arm: dts: modify UART compatible name in NPCM750 device tree - 33a5365900e9cf914cd1d2bdde1457b79b3e9ed9
> arm: dts: modify timer register size in NPCM750 device tree - 4828b20a0b89efba524eb34b3234d98683dbe108
> arm: dts: modify clock binding in NPCM750 device tree - 016c366f505f96dce2a4d0e1e9075fe6e0dfad3e
> arm: dts: modify Makefile NPCM750 configuration name - 82e9f1d1f87d23ae943f8508a720f482bc2de256
> arm: dts: modify Nuvoton NPCM7xx device tree structure - 518d2f43c358da2072948f64df99b1bd417288dc
> arm: npcm: modify configuration for the NPCM7xx BMC - cd903711fd9dce808b5cc07e509135886d962b0c
>
> clocksource commits:
>
> clocksource/drivers/npcm: Add NPCM7xx timer driver - 1c00289ecd12471ba9733e61aaf1d39883a77b16
> https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=clockevents/next&id=1c00289ecd12471ba9733e61aaf1d39883a77b16
> dt-binding: timer: document NPCM7xx timer DT bindings - ff2969c479d97c6221a9835ee0ab4c44513badc6
> https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=clockevents/next&id=ff2969c479d97c6221a9835ee0ab4c44513badc6
>
> WD driver commit:
>
> dt-bindings: watchdog: Add Nuvoton NPCM description - cacad4d735c5c2e73a3948b76eb5faa61fbe60cd
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging/+/cacad4d735c5c2e73a3948b76eb5faa61fbe60cd
> watchdog: Add Nuvoton NPCM watchdog driver - 71e57e2a025766412a9f3c645d0642c69d7d8c50
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging/+/71e57e2a025766412a9f3c645d0642c69d7d8c50
>
> clock driver patch:
>
> dt-binding: clk: npcm750: add binding
> https://patchwork.kernel.org/patch/10307601/
> clk: npcm7xx: add clock controller
> https://patchwork.kernel.org/patch/10307605/
>
> Enable L2 cache patch:
>
> arm: npcm: enable L2 cache in NPCM7xx architecture
> https://patchwork.kernel.org/patch/10328339/

Thanks. I've merged this list of patches to dev-4.13.

I did a build and booted it on my poleg eval board using a FIT image
and a small initrd:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] random: get_random_bytes called from
start_kernel+0x3c/0x3e4 with crng_init=0
[    0.000000] Linux version 4.13.16-00270-g8529863ca964 (joel@aurora)
(gcc version 7.3.0 (Ubuntu/Linaro 7.3.0-15ubuntu2)) #5 Wed Apr 11
13:40:26 8
[    0.000000] CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=18c53c7d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Nuvoton npcm750 Development
Board (Device Tree)

Congratulations on the hard work you and the team have done this past year.

Cheers,

Joel
