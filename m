Return-Path: <raltherr@google.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
 [209.85.214.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPQ2Z5m8zzDqmX
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 07:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=Kb9UilWA; 
 dkim-atps=neutral
Received: by mail-it0-f41.google.com with SMTP id z189so109254253itg.0
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2016 14:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=b+NOWy1PJm44xbJ4IG0R8jUdx3iqrM3fXRU/I5GopT0=;
 b=Kb9UilWAR8SaAxFcpcjHrxgItYbmO4o4L7Rkt9cOcw8PtH++8TY3k9yQ5DsoD86u0x
 vvOyMl5qNGkxum5EFzJ7v40vYhNdU6cp9+oIiRXQMt4dxcYWXA1GPDbTpmhLD01pYVuQ
 gk1OrL0i0IMJn6u+H4HnZO0l68V0B32XOYaQXIu3OxPlxrfidY9tLfwl7Ey3C+TPvruX
 sIPClBv8VOyBbsOJrIQ8usrWwL6wzQOEeGpAEzXg4oSWz2ner1uYKIU03MaT8kjjzZUm
 INQT8TwBNv8YHCpEYZyRo0ax2Cn4WtiPVY6VRypxT3pHPQfRgti1g/mJZgeRo8MLyrZK
 xI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=b+NOWy1PJm44xbJ4IG0R8jUdx3iqrM3fXRU/I5GopT0=;
 b=Vpiw9VcI0Z0MR9Y/3CtSYa3QMQEUoPNI0TDOBj+hWoCVnnQOSn3peAQ+L64BJFT6sX
 dQ5SzoLROcrnSZhYIRrBLf4sW/k7xPIAjaLnz1+dHdYHNwruoG6V+CXe623y5ujtB8bE
 PnJkOxrGKNf2y2X6rgcFqqZotV1pKSFtvQ5pvcy0OET+3rdVZBzskg17anzCwpOceXWR
 8vDesm8oV7VdPa9vPq9Ax4KlSFQPL08tC7ciP/s2fx76thnzBs+Ksj8lEQ98NDG1WlQG
 D0LSKWIrdcba+uEH5wW7N51typN1URFSTWdHxz8ZobmkFHoTL1InfGKbUV4y3Hc86pa7
 epUw==
X-Gm-Message-State: ALyK8tLx224nerRSrHmYQQlIA9hEMru8+gJf43ghbBolJjzq8DPLiq4yVzoY7anBbZoX9ADtEb8grWx1x8ZC5f+G
X-Received: by 10.107.26.85 with SMTP id a82mr3159982ioa.13.1465335528573;
 Tue, 07 Jun 2016 14:38:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.65.14.170 with HTTP; Tue, 7 Jun 2016 14:38:47 -0700 (PDT)
In-Reply-To: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 7 Jun 2016 14:38:47 -0700
Message-ID: <CAPLgG=kvUiHYaSB15c1E71NfSuxvjabWOLVMii4f=gNTmDUu0Q@mail.gmail.com>
Subject: Re: AST2500 support questions
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113fd586a8a7370534b70384
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 21:39:51 -0000

--001a113fd586a8a7370534b70384
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

openbmc/openbmc master only has AST2400 support.  All of the AST2500
support is in separate branches for now as it is incomplete and AST2400
support on those branches hasn't been tested yet.  If you want to build an
AST2500 image, you can use my kc8apf/openbmc ast2500 branch
<https://github.com/kc8apf/openbmc/tree/ast2500> which will build an image
for the EVB.  I know the resulting u-boot gets far enough to load a kernel
but I haven't tried booting the full image yet.  Xo Wang has been trying
that and I believe his recent kernel pull request
<https://github.com/openbmc/linux/pull/93> is needed for the root to
mount.  This is all a big work in progress.  I'm hoping to pull all the
changes from my ast2500 branch into openbmc/openbmc sometime this week.
Please feel free to mail out patches or share trees in the meantime.

On Tue, Jun 7, 2016 at 11:43 AM, Shay Slobodkin <shays@mellanox.com> wrote:

> Hi,
>
>
>
> Following the latest great news of adding support for AST2500 into main
> code, we boost up our work to align with yours.
>
> Several questions regarding our current status, appreciate the assistance
> hopefully it will be merged into openbmc code as well soon.
>
>
>
> 1. We were trying to fetch latest code from origin, hoping AST2500 will b=
e
> inside already.
>
> After fetch, we couldn=E2=80=99t find the new AST2500 addition under:
>
> meta-openbmc-bsp/meta-aspeed/ or meta-openbmc-machines/
>
> Is it held somewhere else, on a different git branch?
>
>
>
>
>
> 2. We have loaded ast2500-evb with aspped-ast2500-evb.dtb file on aspeed
> evb, but we faced some problems with DTB.
>
> We tried kernels 4.6 and 4.7 from:
>
> <https://github.com/shenki/linux/tree/dev-4.7>
>
> <https://github.com/openbmc/linux/tree/dev-4.6>
>
>
>
> We tried to boot it with uImage and separate DTB image using the command
> =E2=80=98bootm <KERNEL_ADDR> - <DTB_ADDR>=E2=80=99
>
> but the kernel seems to halt during boot, the only messages we got were:
>
>
>
> ## Booting kernel from Legacy Image at 83000000 ...
>
>    Image Name:   Linux-4.7.0-rc1-12701-gca25849-d
>
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>
>    Data Size:    2102392 Bytes =3D 2 MiB
>
>    Load Address: 80800000
>
>    Entry Point:  80800000
>
>    Verifying Checksum ... OK
>
> ## Flattened Device Tree blob at 82000000
>
>    Booting using the fdt blob at 0x82000000
>
>    Loading Kernel Image ... OK
>
> OK
>
>    Loading Device Tree to 9eb7b000, end 9eb7f971 ... OK
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
>
>
>
> We added CONFIG_OF_LIBFDT to ast-g5.h and it allow us to get to boot with
> a separate DTB file (aspeed-ast2500-evb.dtb) as seen above.
>
>
>
> We also tried to boot zImage, we failed with the following message (for
> that we added CONFIG_CMD_BOOTZ to u-boot config):
>
>
>
> ast# bootz 0x83000000
>
>
>
> Our initial try, we received this output:
>
>
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
>
> no ATAGS support: can't continue
>
>
>
> Then we added CONFFIG_ATAGS to kernel config and failed with the below:
>
>
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
>
> Error: unrecognized/unsupported machine ID (r1 =3D 0x000022b8).
>
> Available machine support:
>
> ID (hex)        NAME
>
> ffffffff        Generic DT based system
>
> ffffffff        ASpeed SoC
>
>
>
>
>
> Which u-boot command do you suggest for booting with DTB file?
>
> How did you guys managed to boot?
>
>
>
> 3. We saw in a latest updates that there is a new u-boot
> https://github.com/legoater/u-boot/tree/v2016.05-ast2500.
>
> Is it stable enough for using it?
>
>
>
> Thank you guys for the great support,
>
> Shay
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a113fd586a8a7370534b70384
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">openbmc/openbmc master only has AST2400 support.=C2=A0 All=
 of the AST2500 support is in separate branches for now as it is incomplete=
 and AST2400 support on those branches hasn&#39;t been tested yet.=C2=A0 If=
 you want to build an AST2500 image, you can use my <a href=3D"https://gith=
ub.com/kc8apf/openbmc/tree/ast2500">kc8apf/openbmc ast2500 branch</a>=C2=A0=
which will build an image for the EVB.=C2=A0 I know the resulting u-boot ge=
ts far enough to load a kernel but I haven&#39;t tried booting the full ima=
ge yet.=C2=A0 Xo Wang has been trying that and I believe his recent <a href=
=3D"https://github.com/openbmc/linux/pull/93">kernel pull request</a>=C2=A0=
is needed for the root to mount.=C2=A0 This is all a big work in progress.=
=C2=A0 I&#39;m hoping to pull all the changes from my ast2500 branch into o=
penbmc/openbmc sometime this week.=C2=A0 Please feel free to mail out patch=
es or share trees in the meantime.</div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Tue, Jun 7, 2016 at 11:43 AM, Shay Slobodkin <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:shays@mellanox.com" target=3D"_blank">s=
hays@mellanox.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div>
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Following the latest great news of adding support fo=
r AST2500 into main code, we boost up our work to align with yours.<u></u><=
u></u></p>
<p class=3D"MsoNormal">Several questions regarding our current status, appr=
eciate the assistance hopefully it will be merged into openbmc code as well=
 soon.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">1. We were trying to fetch latest code from origin, =
hoping AST2500 will be inside already.<u></u><u></u></p>
<p class=3D"MsoNormal">After fetch, we couldn=E2=80=99t find the new AST250=
0 addition under:<u></u><u></u></p>
<p class=3D"MsoNormal">meta-openbmc-bsp/meta-aspeed/ or meta-openbmc-machin=
es/<u></u><u></u></p>
<p class=3D"MsoNormal">Is it held somewhere else, on a different git branch=
?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">2. We have loaded ast2500-evb with aspped-ast2500-ev=
b.dtb file on aspeed evb, but we faced some problems with DTB.<u></u><u></u=
></p>
<p class=3D"MsoNormal">We tried kernels 4.6 and 4.7 from:<u></u><u></u></p>
<p class=3D"MsoNormal">&lt;<a href=3D"https://github.com/shenki/linux/tree/=
dev-4.7" target=3D"_blank">https://github.com/shenki/linux/tree/dev-4.7</a>=
&gt;<u></u><u></u></p>
<p class=3D"MsoNormal">&lt;<a href=3D"https://github.com/openbmc/linux/tree=
/dev-4.6" target=3D"_blank">https://github.com/openbmc/linux/tree/dev-4.6</=
a>&gt;<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We tried to boot it with uImage and separate DTB ima=
ge using the command =E2=80=98bootm &lt;KERNEL_ADDR&gt; - &lt;DTB_ADDR&gt;=
=E2=80=99<u></u><u></u></p>
<p class=3D"MsoNormal">but the kernel seems to halt during boot, the only m=
essages we got were:
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">## Booting kernel from Le=
gacy Image at 83000000 ...<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Image Name:=
=C2=A0=C2=A0 Linux-4.7.0-rc1-12701-gca25849-d<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Image Type:=
=C2=A0=C2=A0 ARM Linux Kernel Image (uncompressed)<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Data Size:=
=C2=A0=C2=A0=C2=A0 2102392 Bytes =3D 2 MiB<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Load Address=
: 80800000<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Entry Point:=
=C2=A0 80800000<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Verifying Ch=
ecksum ... OK<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">## Flattened Device Tree =
blob at 82000000<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Booting usin=
g the fdt blob at 0x82000000<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Loading Kern=
el Image ... OK<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">OK<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0=C2=A0 Loading Devi=
ce Tree to 9eb7b000, end 9eb7f971 ... OK<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<u></u=
><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We added CONFIG_OF_LIBFDT to ast-g5.h and it allow u=
s to get to boot with a separate DTB file (aspeed-ast2500-evb.dtb) as seen =
above.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">We also tried to boot zImage, we failed with the fol=
lowing message (for that we added CONFIG_CMD_BOOTZ to u-boot config):<u></u=
><u></u></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">ast# bootz 0x83000000<u><=
/u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Our initial try, we received this output:<u></u><u><=
/u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<u></u=
><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">no ATAGS support: can&#39=
;t continue<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Then we added CONFFIG_ATAGS to kernel config and fai=
led with the below:<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Starting kernel ...<u></u=
><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Uncompressing Linux... do=
ne, booting the kernel.<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Error: unrecognized/unsup=
ported machine ID (r1 =3D 0x000022b8).<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Available machine support=
:<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ID (hex)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 NAME<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ffffffff=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Generic DT based system<u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">ffffffff=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASpeed SoC<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Which u-boot command do you suggest for booting with=
 DTB file?<u></u><u></u></p>
<p class=3D"MsoNormal">How did you guys managed to boot? <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">3. We saw in a latest updates that there is a new u-=
boot <a href=3D"https://github.com/legoater/u-boot/tree/v2016.05-ast2500" t=
arget=3D"_blank">
https://github.com/legoater/u-boot/tree/v2016.05-ast2500</a>.<u></u><u></u>=
</p>
<p class=3D"MsoNormal">Is it stable enough for using it?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thank you guys for the great support,<u></u><u></u><=
/p>
<p class=3D"MsoNormal">Shay<u></u><u></u></p>
</div>
</div>

<br>_______________________________________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listinfo/openbmc</a><br>
<br></blockquote></div><br></div>

--001a113fd586a8a7370534b70384--
