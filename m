Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TpPhl/PA"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VbKX0CmDzDqCg
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jan 2019 15:58:39 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id k12so35768163qtf.7
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jan 2019 20:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YcwB/f8wZ50IZtvAmc/97uzOeJC/wDcDfqW5dGfGHmw=;
 b=TpPhl/PA1GZOIDpxjuhSroVMJcXucdzKxcz02oSTivRiGD/hkX3M0k+wdKvB/BQBDs
 1u5HVMz8dX3qsqt94v6zUgk+gJ1ebQyTCnTT4b13gDm7xBS7flNfh8wFjv9/7SGW5eBo
 cnITkKiwZunABVb+LZe3FP5KfjAmoe68sp3Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YcwB/f8wZ50IZtvAmc/97uzOeJC/wDcDfqW5dGfGHmw=;
 b=KuHws86962z9vSMGMjSszD5XLkw/Cq3cDnHygq6a7qOEbpu/vSAs2Caccv7Z8AMAIn
 0X6MWU8tU5olJgED0ZuIfc6pOz5b66UkwVGVH1RcJS29xzWgReRanQD17gfaNkg81jet
 LLPqwf3bGYWfdW98DlWOW6gCF7cFuDg3vHpgdDLE/vsblwwxqzXpmkczFIUJqYPcKKXX
 3fyPzH+irVPBbRAVADrCxjm2O7Afixd3NKriCDAfeNhhnSNReD813X9urrenQRYNaRUJ
 Hp3/QHaNGKQraXyW4gnmV+JWUPdlZ4N9HegfCY92D2DS5iryU0ivH/lZRQQk967H2Upz
 gCWA==
X-Gm-Message-State: AA+aEWacXjJ0wIZRYpxzr5b8ejtBs39RYrC+alUmci6sGY3QYYO0k9Ce
 tlhhprhuisC8kLwnswm54LemDA3dMWWJC9YTXoVNjdBJhT8=
X-Google-Smtp-Source: AFSGD/W3doN0icww3RHVOsAfvDldl99qQUgpojjGrBXeCiORuyU1uBeh7J5NyHsychJBW8EYhuwxNM+W3k9UTpv5D5E=
X-Received: by 2002:ac8:29b7:: with SMTP id 52mr44196934qts.266.1546491517309; 
 Wed, 02 Jan 2019 20:58:37 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0@DB7PR02MB4393.eurprd02.prod.outlook.com>
In-Reply-To: <DB7PR02MB4393FA60E9C00C75DF8FDE0592BF0@DB7PR02MB4393.eurprd02.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Jan 2019 15:28:26 +1030
Message-ID: <CACPK8XfSBpxs7eou_TiZNgAQKeWGi-aXSs735371Pd0tPJVuqA@mail.gmail.com>
Subject: Re: HELP:Kernel Panic after enabling IIO-HWMON driver in DTS
To: "A, Maheswari" <maheswari.a@atos.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2019 04:58:40 -0000

On Thu, 20 Dec 2018 at 16:14, A, Maheswari <maheswari.a@atos.net> wrote:
>
> Hi,
>
>
>
> I have already enabled IIO-HWMON and ASPEED_ADC drivers in linux configur=
ation file.
>
>
>
> Included  changes in my platform DTS file.

Which DTS file did you make these changes to? Can you please point me
to the rest of the file.

What is the git SHA of the kernel commit you based your work on?

>     iio-hwmon {
>
> +                compatible =3D "iio-hwmon";
>
> +                io-channels =3D <&adc 12>;
>
> +        };
>
> @@ -334,3 +339,8 @@
>
> +&adc
>
> +{
>
> +       status =3D "okay";
>
> +};
>
>
>
> We are getting the below Kernel panic after this IIO-HWMON driver changes=
 in DTS file.
>
>
>
> Other platform are using this iio-hwmon driver. Please let us know if any=
one faced this same issue.
>
>
>
>
>
> [    3.761575] =3D=3D=3D=3D 1. IIO_HWMON Probe =3D=3D=3D [    3.765477] U=
nable to handle kernel paging request at virtual address fffffdfb [    3.77=
2710] pgd =3D f5dd9e82 [    3.775426] [fffffdfb] *pgd=3D9effd861, *pte=3D00=
000000, *ppte=3D00000000 [    3.781715] Internal error: Oops: 37 [#1] ARM [=
    3.786073] Modules linked in:
>
> [    3.789148] CPU: 0 PID: 1 Comm: swapper Not tainted 4.18.8 #1 [    3.7=
94892] Hardware name: Generic DT based system [    3.799706] PC is at iio_h=
wmon_probe+0xb4/0x3e4 [    3.804235] LR is at   (null)

The return address is null. This looks like some memory corruption.
Does this kernel boot with the iiomon driver disabled?

Cheers,

Joel

> [    3.807207] pc : [<804eb7a0>]    lr : [<00000000>] psr: a0000013 [    =
3.813465] sp : 9e477d70  ip : 9e5b4550  fp : 9e477dbc [    3.818681] r10: 0=
0000000  r9 : 00000000  r8 : 80b51d1c [    3.823900] r7 : 9e5b4410  r6 : 9e=
6f2290  r5 : 00000000  r4 : 9e5b4400 [    3.830418] r3 : 00000000  r2 : fff=
ffdfb  r1 : 00000000  r0 : fffffdfb [    3.836936] Flags: NzCv  IRQs on  FI=
Qs on  Mode SVC_32  ISA ARM Segment none [    3.844068] Control: 00c5387d  =
Table: 9e764008  DAC: 00000051 [    3.849811] Process swapper (pid: 1, stac=
k limit =3D 0x2b33fe0f) [    3.855639] Stack: (0x9e477d70 to 0x9e478000) [ =
   3.860004] 7d60:                                     9e5b4400
>
> 9ec1af90 fffffdfb 9e477d88
>
> [    3.868179] 7d80: 8029ea9c 8029ae0c 9e5b4410 7e82968c 9e5b4418
>
> 9e5b4410 00000000 80b51d1c
>
> [    3.876361] 7da0: 00000000 80b51d1c 00000000 00000000 9e477ddc
>
> 9e477dc0 804488f0 804eb6f8
>
> [    3.884541] [=E2=80=A6=E2=80=A6.]
>
> 00000000 00000000 00000000
>
> [    4.023518] 7fe0: 00000000 00000000 00000000 00000000 00000013
>
> 00000000 00000000 00000000
>
> [    4.031740] [<804eb7a0>] (iio_hwmon_probe) from [<804488f0>]
>
> (platform_drv_probe+0x58/0xa8)
>
> [    4.040118] [<804488f0>] (platform_drv_probe) from [<80446790>]
>
> (driver_probe_device+0x2f8/0x474)
>
> [    4.048999] [<80446790>] (driver_probe_device) from [<80446a0c>]
>
> (__driver_attach+0x100/0x12c)
>
> [    4.057620] [<80446a0c>] (__driver_attach) from [<804443a4>]
>
> (bus_for_each_dev+0x80/0xc4)
>
> [    4.065802] [<804443a4>] (bus_for_each_dev) from [<80445f14>]
>
> (driver_attach+0x28/0x30)
>
> [    4.073811] [<80445f14>] (driver_attach) from [<8044582c>]
>
> (bus_add_driver+0x154/0x268)
>
> [    4.081832] [<8044582c>] (bus_add_driver) from [<804475f8>]
>
> (driver_register+0x84/0x118)
>
> [    4.089933] [<804475f8>] (driver_register) from [<80448834>]
>
> (__platform_driver_register+0x3c/0x50)
>
> [    4.099003] [<80448834>] (__platform_driver_register) from [<80a26f24>=
] (iio_hwmon_driver_init+0x20/0x28) [    4.108593] [<80a26f24>] (iio_hwmon_=
driver_init) from [<80102e20>]
>
> (do_one_initcall+0x4c/0x18c)
>
> [    4.117323] [<80102e20>] (do_one_initcall) from [<80a0116c>]
>
> (kernel_init_freeable+0x1a0/0x270)
>
> [    4.126038] [<80a0116c>] (kernel_init_freeable) from [<806a7e6c>]
>
> (kernel_init+0x18/0x128)
>
> [    4.134315] [<806a7e6c>] (kernel_init) from [<801010e8>]
>
> (ret_from_fork+0x14/0x2c)
>
> [    4.141882] Exception stack(0x9e477fb0 to 0x9e477ff8) [    4.146937] 7=
fa0:                                     00000000
>
> 00000000 00000000 00000000
>
> [    4.155112] 7fc0: 00000000 00000000 00000000 00000000 00000000
>
> 00000000 00000000 00000000
>
> [    4.163282] 7fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0 [    4.169903] Code: e0831083 e5860000 e1a01101 e0802001 (e7901001) [    =
4.176192] ---[ end trace 95853ce787f427d0 ]--- [    4.180830] Kernel panic =
- not syncing: Fatal exception
>
>
>
> Thanks
>
> Maheswari A
