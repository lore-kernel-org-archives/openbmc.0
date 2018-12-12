Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PXfmkU9m"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FFhk3r2zzDqTL
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 22:59:02 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id m19so14594269ioh.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 03:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIr772JfXgxIn6yPIzSEAzAy3qPWxs7XeG5MDZjNwQc=;
 b=PXfmkU9m0XHJCGg/ZabICHlMdYG6tTzNfOeXJpU9pTrEai2LJ9inXBJnGiCbSFtN7O
 DyOAsDNOheFgCTyAmln3JEU0/dtIoT8CwZrmn9QVy1VNeVWQhoP8ee70d062YxWF6RLW
 MP75qeXVrqjLv+Ag6OO1kT4hg+yV9ap9qi9ny9bAqL4wO784nRaA++52qN7HJ6/Ztf/2
 QO4zLmjP+m8c5eEM5nbeNZUn8b8HgD1hR2j2prZ8rDFa6Yzy9NA2O8GseawEBAOeUU6h
 GGZpmDp56cqnx9NnJPDA5+gk+Wva+tMFGoHAPL+G2ehR+wfrEV6edxoco7goOmJ3fzJm
 3pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIr772JfXgxIn6yPIzSEAzAy3qPWxs7XeG5MDZjNwQc=;
 b=FO4TR4QG+0c99AxX6/B7vmxB/DDp64fabhp4gZD+0M6cYkrT9y2P+tRS7biWxcxBOy
 tPc6z4MsGNo+QX5z8I0Rz4Z6/w30yAVys+TSp/URo8CLNzzTs9qLGY8rF8gYABCz7gUt
 7selx5FdA4yuNamJYqcbQKrdjp5/fojhYQgbwN7WcExFIxszXfPs2EuTNEnXgvZXjXR8
 91Pd6lOWst53R68dhs6j9n0JDLdizpmIWbdXr3+bRAwQJPFvNDFsP8tH2xl4hnqScTPO
 VOlhtHnH7I+QB5QrhK6qavByF4rO8V+KcqKyfmCwpVEA2xRd+ycpgxi6UGLkIgeh8P/g
 Jg2g==
X-Gm-Message-State: AA+aEWbEXeFAIOObSEk1auUCHg+UvlgVBvValY3B6Pb+PnZBN2BnyJpv
 jVPZlrEACjBPdoK67xysCyB39YcVAkfjOA1impo=
X-Google-Smtp-Source: AFSGD/XiLLFqvcUEQKKCtnF5lBI9/CFgZ21eMkJxgi5dL/45DnkE2S5g1u+ojeKLgKfTC+4rqrPCdOTG8W20LaL4l78=
X-Received: by 2002:a5e:850e:: with SMTP id i14mr694750ioj.90.1544615940009;
 Wed, 12 Dec 2018 03:59:00 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
 <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <CACPK8Xd2FDD=FX7SK5cxWrkgGT190rJAHOJefs4Gws6qzJkfYA@mail.gmail.com>
In-Reply-To: <CACPK8Xd2FDD=FX7SK5cxWrkgGT190rJAHOJefs4Gws6qzJkfYA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 12 Dec 2018 14:05:25 +0200
Message-ID: <CAP6Zq1je+PsriSUUL2JoNX-OQte85F=uQd7EG9np-D1fsxjcTg@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Joel Stanley <joel@jms.id.au>
Cc: dthompson@mellanox.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 amithash@fb.com, vijaykhemka@fb.com
Content-Type: multipart/mixed; boundary="0000000000006b5ef4057cd1ecbf"
X-Mailman-Approved-At: Thu, 13 Dec 2018 10:13:46 +1100
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
X-List-Received-Date: Wed, 12 Dec 2018 11:59:04 -0000

--0000000000006b5ef4057cd1ecbf
Content-Type: multipart/alternative; boundary="0000000000006b5ef0057cd1ecbd"

--0000000000006b5ef0057cd1ecbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,



First, I like to apologize that there is many patches of NPCM to add, so it
look quite messy...

After adding the below our customers could use (in most cases) OpenBMC
linux tree and not Nuvoton Linux tree.



We have the following patches to add:

=C2=B7         Patches already have accepted.

=C2=B7         Patches on upstream process.

=C2=B7         PCI Mailbox patches - The PCI mail box will not upstream, be=
cause
it not build with the mailbox driver interface,

but still OpenBMC have an application to use the miscellaneous mailbox but
still OpenBMC have an application

to use the miscellaneous mailbox.

=C2=B7         ETHERNET MAC CONTROLLER (EMC) patches =E2=80=93 the patches =
is on final
stage of upstream work, but it is very important to us that the patches wil=
l

add now because costumer requests that are using the OpenBMC linux.

=C2=B7         Device tree and defconfig patches =E2=80=93 in our github it=
 is a bunch
of patches, so I prefer to send you one patch to each topic.

I will start to send device tree update to Rob soon.



*Commit upstream to kernel 4.20*



*hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255  *

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Df21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258



*Commits will upstream to kernel 4.21*



*dt-binding: spi: add NPCM PSPI controller documentation  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D4ad26864df53b265976c4a3ae61b1e6cad92fe40



*spi: npcm: add NPCM PSPI controller driver  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D2a22f1b30cee8d1e104a6c5062a609bedbfd5c39



*spi: npcm: fix u32 csgpio being checked for less than zero  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D757ec116c9bce4278fa4423039736c832cc63b6f



*spi: npcm: fix platform_no_drv_owner.cocci warnings  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D7986e2273c1ed987ff34f1c318d5a2b18e8c0fee



*spi: npcm: Fix an error code in the probe function  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D428f977a6a6b43154928571b01fa8415c11a9244



*spi: npcm: Fix uninitialized variable warning  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D1d2319efb6a970d5f5740a60828244e6c309df2b



*spi: npcm: Modify pspi send function  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D1fa33be36cfc8908be951ed56113906f422add50



*spi: Update NPCM PSPI controller documentation  *

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D6ab4a3502923c20c5a6921868e787e5fd033409b



*pinctrl: nuvoton: modify NPCM7xx pin configuration function  *

https://git.linaro.org/people/linus.walleij/linux-pinctrl.git/commit/?h=3Df=
or-next&id=3D67b249aaa650a461c86484e6c365f33887f0968a



*watchdog: npcm: Modify npcm watchdog kconfig arch parameter  *

https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-stagi=
ng/+/4181f4a55838db15deaed315b11bfab395be0a17



*Commits on **upstream* *process*



*dt-binding: mtd: add NPCM FIU controller*

*https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb71223156=
d5c525c18dd74
<https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb71223156=
d5c525c18dd74>*



*mtd: spi-nor: add NPCM FIU controller driver*

https://github.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c5c=
5eaffa519561



*dt-bindings: i2c: npcm7xx: add binding for i2c controller*

https://github.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c03e=
3912387ff9a7



*i2c: npcm: driver for Poleg i2c controller*

https://github.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7d8=
3dafcc2dbc6c



*dt-binding: bmc: Add NPCM7xx LPC BPC documentation*

https://github.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790af=
65ac38b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c



*misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver*

https://github.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b63d=
5a244a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403



*misc: bpc: modify remove function in npcm7xx bpc driver*

https://github.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f847=
29beebb66a9c#diff-7081e24727d8058bcc6ebf20230f5403



*PCI mail box commits*



*dt-binding: bmc: add npcm7xx pci mailbox document*

https://github.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e057735=
45f181246496



*misc: mbox: add npcm7xx pci mailbox driver*

https://github.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf50a=
d8365f2301d1



*EMC net commits*



*net: npcm: add NPCM7xx Ethernet MAC controller*

https://github.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d347=
7a8e9f7d950b



*dt-binding: net: document NPCM7xx EMC DT bindings*

https://github.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce83=
3afa3957fb2d



Waiting to your approval, Thanks a lot.



cheers,



Tomer


On Tue, 4 Dec 2018 at 05:20, Joel Stanley <joel@jms.id.au> wrote:

> Hello Dave,
>
> On Tue, 4 Dec 2018 at 13:43, David Thompson <dthompson@mellanox.com>
> wrote:
> >
> > Since 4.19 kernel is deemed "longterm" with a projected EOL of Dec 2020=
,
> is the plan to keep OpenBMC on this kernel version for a while?
>
> I have no plans to stay on a given release once the next is out at
> this stage. My goal is to get all of the code upstream, so that I
> don't need to maintain any out of tree patches, and then system
> integrator can pick whichever kernel they want for their system.
>
> It would be straight forward to maintain a stable tree once the "dev"
> tree has moved on past 4.19. I have some ideas on how this could work
> if you are interested.
>
> > I've yet to upstream any of my changes, my bad, and as a
> > result I've gone through four kernel upgrades this year
> > {4.13, 4.17, 4.18, and now 4.19}.
>
> I encourage you to get your patches on the list! Do you have a run
> down of what you keep out of tree?
>
> Cheers,
>
> Joel
>
> > I'm curious about the OpenBMC kernel upgrade strategy,
> > esp. after 4.19.
> >
> > Regards,
> > - Dave
> >
> > -----Original Message-----
> > From: openbmc <openbmc-bounces+dthompson=3Dmellanox.com@lists.ozlabs.or=
g>
> On Behalf Of Joel Stanley
> > Sent: Monday, December 3, 2018 5:05 PM
> > To: Amithash Prasad <amithash@fb.com>
> > Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; vijaykhemka@fb.com
> > Subject: Re: Linux dev-4.19
> >
> > On Tue, 4 Dec 2018 at 07:25, Amithash Prasad <amithash@fb.com> wrote:
> > >
> > > >> I have couple of NCSI patch which were up streamed last week in
> linux-next kernel. Will those be part of this 4.19 kernel in openbmc or
> what is procedure to pull those patches in openbmc build. As these are
> required for Meta-facebook build with networking working.
> > > Joel,
> > >
> > > Thanks for cherry-picking a few of the NCSI changes into dev-4.19!
> Along with these, can we get a couple more cherry-picked into dev-4.19?
> > >
> > > One patch from linux-next:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
o
> > > mmit/net/ncsi?h=3Dnext-20181203&id=3D16e8c4ca21a238cdf0355475bf15bd72=
e92fe
> > > b8f
> > >
> > > One merged patch to bring in the Tiogapass device tree:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
i
> > > t/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e06e2a=
91a
> > > 65cff59e520acc51b9adf4900bf
> >
> > Nice work. This is a great way to request the patches get merged. I'm
> happy because they're already on their way upstream, and the URLs with SH=
As
> make it easy for me to cherry pick.
> >
> > Merged!
> >
> > Cheers,
> >
> > Joel
>

--0000000000006b5ef0057cd1ecbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"=
background-image:initial;background-position:initial;background-size:initia=
l;background-repeat:initial;background-origin:initial;background-clip:initi=
al;margin:0cm 0cm 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">H=
i
Joel,</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">First,
I like to apologize that there is many patches of NPCM to add, so it look q=
uite
messy...</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">After
adding the below our customers could use (in most cases) OpenBMC linux tree=
 and
not Nuvoton Linux tree. =C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">We have
the following patches to add:</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-family=
:Symbol">=C2=B7<span style=3D"font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:7pt;line-height:normal;font-fam=
ily:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><span dir=3D"LTR"></span>Patches
already have accepted.</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-family=
:Symbol">=C2=B7<span style=3D"font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:7pt;line-height:normal;font-fam=
ily:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><span dir=3D"LTR"></span>Patches
on upstream process.</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-family=
:Symbol">=C2=B7<span style=3D"font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:7pt;line-height:normal;font-fam=
ily:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><span dir=3D"LTR"></span>PCI
Mailbox patches - The PCI mail box will not upstream, because it not build =
with
the mailbox driver interface, </p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif">but
still OpenBMC have an application to use the=C2=A0miscellaneous=C2=A0mailbo=
x
but still OpenBMC have an application</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif">to
use the=C2=A0miscellaneous=C2=A0mailbox.</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-family=
:Symbol">=C2=B7<span style=3D"font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:7pt;line-height:normal;font-fam=
ily:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><span dir=3D"LTR"></span>ETHERNET
MAC CONTROLLER (EMC) patches =E2=80=93 the patches is on final stage of ups=
tream work,
but it is very important to us that the patches will</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif">add
now because costumer requests that are using the OpenBMC linux.</p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif"><span style=3D"font-family=
:Symbol">=C2=B7<span style=3D"font-variant-numeric:normal;font-variant-east=
-asian:normal;font-stretch:normal;font-size:7pt;line-height:normal;font-fam=
ily:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span></span><span dir=3D"LTR"></span>Device
tree and defconfig patches =E2=80=93 in our github it is a bunch of patches=
, so I
prefer to send you one patch to each topic. </p>

<p class=3D"gmail-MsoListParagraph" style=3D"background-image:initial;backg=
round-position:initial;background-size:initial;background-repeat:initial;ba=
ckground-origin:initial;background-clip:initial;margin:0cm 0cm 0.0001pt 36p=
t;font-size:11pt;font-family:Calibri,sans-serif">I
will start to send device tree update to Rob soon.</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><u><span style=3D"font-size:14pt">Commit =
upstream to kernel 4.20</span></u></b><span style=3D"font-size:14pt"></span=
></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">hwmon: (npcm-750-pwm-fan)
Change initial pwm target to 255=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://git.=
kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Df21c8e7=
53b1dcb8f9e5b096db1f7f4e6fdfa7258" style=3D"color:rgb(5,99,193)">https://gi=
t.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Df21c8=
e753b1dcb8f9e5b096db1f7f4e6fdfa7258</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><u><span style=3D"font-size:14pt">Commits
will upstream to kernel 4.21</span></u></b><span style=3D"font-size:14pt"><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-binding: spi: add NPCM
PSPI controller documentation=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D4ad26864df53b2=
65976c4a3ae61b1e6cad92fe40" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D4ad26864df53b265976c4a3ae61b1e6cad92fe40</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: add NPCM PSPI
controller driver=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D2a22f1b30cee8d=
1e104a6c5062a609bedbfd5c39" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D2a22f1b30cee8d1e104a6c5062a609bedbfd5c39</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: fix u32 csgpio
being checked for less than zero=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D757ec116c9bce4=
278fa4423039736c832cc63b6f" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D757ec116c9bce4278fa4423039736c832cc63b6f</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: fix
platform_no_drv_owner.cocci warnings=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D7986e2273c1ed9=
87ff34f1c318d5a2b18e8c0fee" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D7986e2273c1ed987ff34f1c318d5a2b18e8c0fee</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: Fix an error
code in the probe function=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D428f977a6a6b43=
154928571b01fa8415c11a9244" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D428f977a6a6b43154928571b01fa8415c11a9244</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: Fix
uninitialized variable warning=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D1d2319efb6a970=
d5f5740a60828244e6c309df2b" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D1d2319efb6a970d5f5740a60828244e6c309df2b</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: npcm: Modify pspi send
function=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D1fa33be36cfc89=
08be951ed56113906f422add50" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D1fa33be36cfc8908be951ed56113906f422add50</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">spi: Update NPCM PSPI
controller documentation=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.kernel.org/pub/scm/li=
nux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D6ab4a3502923c2=
0c5a6921868e787e5fd033409b" style=3D"color:rgb(5,99,193)">https://git.kerne=
l.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=
=3D6ab4a3502923c20c5a6921868e787e5fd033409b</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">pinctrl: nuvoton: modify
NPCM7xx pin configuration function=C2=A0=C2=A0</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://git.linaro.org/people/lin=
us.walleij/linux-pinctrl.git/commit/?h=3Dfor-next&amp;id=3D67b249aaa650a461=
c86484e6c365f33887f0968a" style=3D"color:rgb(5,99,193)">https://git.linaro.=
org/people/linus.walleij/linux-pinctrl.git/commit/?h=3Dfor-next&amp;id=3D67=
b249aaa650a461c86484e6c365f33887f0968a</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:Arial,sans-serif">watchdog: npcm: Modify npcm watchdog kconfig
arch parameter=C2=A0=C2=A0</span></b><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><a href=3D"https://kernel.googlesource.com/p=
ub/scm/linux/kernel/git/groeck/linux-staging/+/4181f4a55838db15deaed315b11b=
fab395be0a17" style=3D"color:rgb(5,99,193)">https://kernel.googlesource.com=
/pub/scm/linux/kernel/git/groeck/linux-staging/+/4181f4a55838db15deaed315b1=
1bfab395be0a17</a></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><u><span style=3D"font-size:14pt">Commits
on </span></u></b><b><u><span style=3D"font-size:14pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;background-image:initial;background-position:initial=
;background-size:initial;background-repeat:initial;background-origin:initia=
l;background-clip:initial">upstream</span></u></b><b><u><span style=3D"font=
-size:14pt"> </span></u></b><b><u><span style=3D"font-size:14pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">process</span></u></b><u><span style=
=3D"font-size:14pt"></span></u></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-binding: mtd: add NPCM
FIU controller</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><u><a href=3D"https://github.com/Nuvoton-Isr=
ael/linux/commit/f13c82dca3ca21175eb71223156d5c525c18dd74" style=3D"color:r=
gb(5,99,193)">https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21=
175eb71223156d5c525c18dd74</a></u></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">mtd: spi-nor: add NPCM FIU
controller driver</span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c5c5eaffa519561=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/747809a0082dbeaaa6b786842c5c5eaffa519561</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-bindings: i2c: npcm7xx:
add binding for i2c controller</span></b><b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif;background-image:initial;background-position:in=
itial;background-size:initial;background-repeat:initial;background-origin:i=
nitial;background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-=
size:12pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c03e3912387ff9a7=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/07be53b47443fcab645f0e67c03e3912387ff9a7</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">i2c: npcm: driver for Poleg
i2c controller</span></b><b><span style=3D"font-size:12pt;font-family:Arial=
,sans-serif;background-image:initial;background-position:initial;background=
-size:initial;background-repeat:initial;background-origin:initial;backgroun=
d-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-size:12pt;font-f=
amily:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7d83dafcc2dbc6c=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/3a7f3375024461d3db17a78cb7d83dafcc2dbc6c</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-binding: bmc: Add
NPCM7xx LPC BPC documentation</span></b><b><span style=3D"font-size:12pt;fo=
nt-family:Arial,sans-serif;background-image:initial;background-position:ini=
tial;background-size:initial;background-repeat:initial;background-origin:in=
itial;background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-s=
ize:12pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790af65ac38b2c24d=
#diff-e7386aa740d12baf8cdc2a0ab8e5347c" style=3D"color:rgb(5,99,193)">https=
://github.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790af65ac3=
8b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">misc: npcm7xx-lpc-bpc: add
NPCM7xx BIOS post code driver</span></b><b><span style=3D"font-size:12pt;fo=
nt-family:Arial,sans-serif;background-image:initial;background-position:ini=
tial;background-size:initial;background-repeat:initial;background-origin:in=
itial;background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-s=
ize:12pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b63d5a244a0bdd3b=
#diff-7081e24727d8058bcc6ebf20230f5403" style=3D"color:rgb(5,99,193)">https=
://github.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b63d5a244=
a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">misc: bpc: modify remove
function in npcm7xx bpc driver</span></b><b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif;background-image:initial;background-position:in=
itial;background-size:initial;background-repeat:initial;background-origin:i=
nitial;background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-=
size:12pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f84729beebb66a9c=
#diff-7081e24727d8058bcc6ebf20230f5403" style=3D"color:rgb(5,99,193)">https=
://github.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f84729bee=
bb66a9c#diff-7081e24727d8058bcc6ebf20230f5403</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><u><span style=3D"font-size:14pt">PCI
mail box commits</span></u></b><span style=3D"font-size:14pt"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-binding: bmc: add
npcm7xx pci mailbox document</span></b><b><span style=3D"font-size:12pt;fon=
t-family:Arial,sans-serif;background-image:initial;background-position:init=
ial;background-size:initial;background-repeat:initial;background-origin:ini=
tial;background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-si=
ze:12pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e05773545f181246496=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/7da4f41849aef11b1a9a6e05773545f181246496</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">misc: mbox: add npcm7xx pci
mailbox driver</span></b><b><span style=3D"font-size:12pt;font-family:Arial=
,sans-serif;background-image:initial;background-position:initial;background=
-size:initial;background-repeat:initial;background-origin:initial;backgroun=
d-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-size:12pt;font-f=
amily:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf50ad8365f2301d1=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/c3d5d2bab5ad216e6c0debabf50ad8365f2301d1</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><span style=3D"text-dec=
oration-line:none">=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><u><span style=3D"font-size:14pt">EMC
net commits</span></u></b><b><span style=3D"font-size:14pt"></span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:12pt;font-family:Ar=
ial,sans-serif">=C2=A0</span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">net: npcm: add NPCM7xx
Ethernet MAC controller</span></b><b><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif;background-image:initial;background-position:initial;b=
ackground-size:initial;background-repeat:initial;background-origin:initial;=
background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-size:12=
pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d3477a8e9f7d950b=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/6a9407ed142ff2c205d732d4d3477a8e9f7d950b</a></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><span style=3D"text-dec=
oration-line:none">=C2=A0</span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><b><span style=3D"font-size:12pt;font-family=
:&quot;Segoe UI&quot;,sans-serif;background-image:initial;background-positi=
on:initial;background-size:initial;background-repeat:initial;background-ori=
gin:initial;background-clip:initial">dt-binding: net: document
NPCM7xx EMC DT bindings</span></b><b><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif;background-image:initial;background-position:initial;b=
ackground-size:initial;background-repeat:initial;background-origin:initial;=
background-clip:initial">=C2=A0=C2=A0</span></b><span style=3D"font-size:12=
pt;font-family:Arial,sans-serif"></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span class=3D"gmail-MsoHyperlink" style=3D"=
color:rgb(5,99,193);text-decoration-line:underline"><a href=3D"https://gith=
ub.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce833afa3957fb2d=
" style=3D"color:rgb(5,99,193)">https://github.com/Nuvoton-Israel/linux/com=
mit/66478b88409dba415a7bb008ce833afa3957fb2d</a></span></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">Waiting
to your approval, Thanks a lot.</p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-size:initial;background-repeat:initial;background-orig=
in:initial;background-clip:initial;margin:0cm 0cm 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">cheers,</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">=C2=A0</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt;font-size:11pt;font=
-family:Calibri,sans-serif">Tomer</p></div><div dir=3D"ltr"><br></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div></div=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 4 Dec =
2018 at 05:20, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hello Dave,<br>
<br>
On Tue, 4 Dec 2018 at 13:43, David Thompson &lt;<a href=3D"mailto:dthompson=
@mellanox.com" target=3D"_blank">dthompson@mellanox.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Since 4.19 kernel is deemed &quot;longterm&quot; with a projected EOL =
of Dec 2020, is the plan to keep OpenBMC on this kernel version for a while=
?<br>
<br>
I have no plans to stay on a given release once the next is out at<br>
this stage. My goal is to get all of the code upstream, so that I<br>
don&#39;t need to maintain any out of tree patches, and then system<br>
integrator can pick whichever kernel they want for their system.<br>
<br>
It would be straight forward to maintain a stable tree once the &quot;dev&q=
uot;<br>
tree has moved on past 4.19. I have some ideas on how this could work<br>
if you are interested.<br>
<br>
&gt; I&#39;ve yet to upstream any of my changes, my bad, and as a<br>
&gt; result I&#39;ve gone through four kernel upgrades this year<br>
&gt; {4.13, 4.17, 4.18, and now 4.19}.<br>
<br>
I encourage you to get your patches on the list! Do you have a run<br>
down of what you keep out of tree?<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt; I&#39;m curious about the OpenBMC kernel upgrade strategy,<br>
&gt; esp. after 4.19.<br>
&gt;<br>
&gt; Regards,<br>
&gt; - Dave<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: openbmc &lt;openbmc-bounces+dthompson=3D<a href=3D"mailto:mellan=
ox.com@lists.ozlabs.org" target=3D"_blank">mellanox.com@lists.ozlabs.org</a=
>&gt; On Behalf Of Joel Stanley<br>
&gt; Sent: Monday, December 3, 2018 5:05 PM<br>
&gt; To: Amithash Prasad &lt;<a href=3D"mailto:amithash@fb.com" target=3D"_=
blank">amithash@fb.com</a>&gt;<br>
&gt; Cc: OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; <a href=3D"mailto:vijayk=
hemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a><br>
&gt; Subject: Re: Linux dev-4.19<br>
&gt;<br>
&gt; On Tue, 4 Dec 2018 at 07:25, Amithash Prasad &lt;<a href=3D"mailto:ami=
thash@fb.com" target=3D"_blank">amithash@fb.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt;&gt; I have couple of NCSI patch which were up streamed last =
week in linux-next kernel. Will those be part of this 4.19 kernel in openbm=
c or what is procedure to pull those patches in openbmc build. As these are=
 required for Meta-facebook build with networking working.<br>
&gt; &gt; Joel,<br>
&gt; &gt;<br>
&gt; &gt; Thanks for cherry-picking a few of the NCSI changes into dev-4.19=
! Along with these, can we get a couple more cherry-picked into dev-4.19?<b=
r>
&gt; &gt;<br>
&gt; &gt; One patch from linux-next:<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/next/l=
inux-next.git/co" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.o=
rg/pub/scm/linux/kernel/git/next/linux-next.git/co</a><br>
&gt; &gt; mmit/net/ncsi?h=3Dnext-20181203&amp;id=3D16e8c4ca21a238cdf0355475=
bf15bd72e92fe<br>
&gt; &gt; b8f<br>
&gt; &gt;<br>
&gt; &gt; One merged patch to bring in the Tiogapass device tree:<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable=
/linux.git/commi" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.o=
rg/pub/scm/linux/kernel/git/stable/linux.git/commi</a><br>
&gt; &gt; t/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e0=
6e2a91a<br>
&gt; &gt; 65cff59e520acc51b9adf4900bf<br>
&gt;<br>
&gt; Nice work. This is a great way to request the patches get merged. I&#3=
9;m happy because they&#39;re already on their way upstream, and the URLs w=
ith SHAs make it easy for me to cherry pick.<br>
&gt;<br>
&gt; Merged!<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Joel<br>
</blockquote></div>

--0000000000006b5ef0057cd1ecbd--

--0000000000006b5ef4057cd1ecbf
Content-Type: application/octet-stream; 
	name="0002-arm-npcm-add-configuration-for-EVB-based-NPCM7xx-BMC.patch"
Content-Disposition: attachment; 
	filename="0002-arm-npcm-add-configuration-for-EVB-based-NPCM7xx-BMC.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jpl4o7971>
X-Attachment-Id: f_jpl4o7971

RnJvbSA1OGEwNzEzYmI3MDljYmFiZTliN2M1ZDA0ZTEzYmMwOTU3MjQ1OTU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+CkRh
dGU6IFN1biwgOSBEZWMgMjAxOCAxMDo0NjozNiArMDIwMApTdWJqZWN0OiBbUEFUQ0ggMi8yXSBh
cm06IG5wY206IGFkZCBjb25maWd1cmF0aW9uIGZvciBFVkIgYmFzZWQgTlBDTTd4eCBCTUMKCmFk
ZCBjb25maWd1cmF0aW9uIGRlZmluaXRpb24gZm9yIGV2YWx1YXRpb24gYm9hcmQgYmFzZWQKTlBD
TTd4eCAoUG9sZWcpIEJNQy4KClNpZ25lZC1vZmYtYnk6IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3
QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2FybS9jb25maWdzL1BvbGVnU1ZCX2RlZmNvbmZpZyB8IDEy
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2NvbmZpZ3MvUG9s
ZWdTVkJfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9Qb2xlZ1NWQl9k
ZWZjb25maWcgYi9hcmNoL2FybS9jb25maWdzL1BvbGVnU1ZCX2RlZmNvbmZpZwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjRjODY2NTgzYjM1OAotLS0gL2Rldi9udWxs
CisrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvUG9sZWdTVkJfZGVmY29uZmlnCkBAIC0wLDAgKzEsMTIx
IEBACitDT05GSUdfU1lTVklQQz15CitDT05GSUdfQlNEX1BST0NFU1NfQUNDVD15CitDT05GSUdf
TE9HX0JVRl9TSElGVD0yMQorQ09ORklHX0NHUk9VUFM9eQorQ09ORklHX1NZU0ZTX0RFUFJFQ0FU
RUQ9eQorQ09ORklHX1NZU0ZTX0RFUFJFQ0FURURfVjI9eQorQ09ORklHX0JMS19ERVZfSU5JVFJE
PXkKK0NPTkZJR19LRVJORUxfWFo9eQorQ09ORklHX1NZU0NUTF9TWVNDQUxMPXkKK0NPTkZJR19F
TUJFRERFRD15CitDT05GSUdfU0xBQj15CitDT05GSUdfTU9EVUxFUz15CitDT05GSUdfTU9EVUxF
X1VOTE9BRD15CitDT05GSUdfTU9EVkVSU0lPTlM9eQorQ09ORklHX1BBUlRJVElPTl9BRFZBTkNF
RD15CitDT05GSUdfREVGQVVMVF9ERUFETElORT15CitDT05GSUdfQVJDSF9OUENNPXkKK0NPTkZJ
R19BUkNIX05QQ003WFg9eQorQ09ORklHX1NNUD15CitDT05GSUdfVk1TUExJVF8zR19PUFQ9eQor
Q09ORklHX0FFQUJJPXkKK0NPTkZJR19aQk9PVF9ST01fQlNTPTB4MAorQ09ORklHX0JJTkZNVF9N
SVNDPXkKK0NPTkZJR19ORVQ9eQorQ09ORklHX1BBQ0tFVD15CitDT05GSUdfVU5JWD15CitDT05G
SUdfSU5FVD15CitDT05GSUdfSVBfUE5QPXkKK0NPTkZJR19JUF9QTlBfREhDUD15CitDT05GSUdf
SVBfUE5QX0JPT1RQPXkKK0NPTkZJR19VRVZFTlRfSEVMUEVSX1BBVEg9Ii9zYmluL2hvdHBsdWci
CitDT05GSUdfREVWVE1QRlM9eQorQ09ORklHX01URD15CitDT05GSUdfTVREX0JMT0NLPXkKK0NP
TkZJR19NVERfUkFNPXkKK0NPTkZJR19NVERfQ09NUExFWF9NQVBQSU5HUz15CitDT05GSUdfTVRE
X1NQSV9OT1I9eQorQ09ORklHX01URF9NMjVQODA9eQorQ09ORklHX1NQSV9OUENNX0ZJVT15CitD
T05GSUdfU1BJPXkKK0NPTkZJR19TUElfTlBDTV9QU1BJPXkKK0NPTkZJR19PRl9PVkVSTEFZPXkK
K0NPTkZJR19CTEtfREVWX0xPT1A9eQorQ09ORklHX0JMS19ERVZfTkJEPXkKK0NPTkZJR19CTEtf
REVWX1JBTT15CitDT05GSUdfQkxLX0RFVl9SQU1fQ09VTlQ9MQorQ09ORklHX0JMS19ERVZfUkFN
X1NJWkU9ODE5MgorQ09ORklHX1NDU0k9eQorQ09ORklHX0JMS19ERVZfU0Q9eQorQ09ORklHX05F
VERFVklDRVM9eQorQ09ORklHX05QQ003WFhfRU1DX0VUSD15CitDT05GSUdfU1RNTUFDX0VUSD15
CitDT05GSUdfQlJPQURDT01fUEhZPXkKK0NPTkZJR19TRVJJQUxfODI1MD15CitDT05GSUdfU0VS
SUFMXzgyNTBfQ09OU09MRT15CitDT05GSUdfU0VSSUFMX09GX1BMQVRGT1JNPXkKK0NPTkZJR19O
UENNNzUwX09UUD15CitDT05GSUdfTlBDTTc1MF9PVFBfV1JJVEVfRU5BQkxFPXkKK0NPTkZJR19O
UENNN1hYX0tDU19JUE1JX0JNQz15CitDT05GSUdfSFdfUkFORE9NPXkKK0NPTkZJR19JMkM9eQor
Q09ORklHX0kyQ19DSEFSREVWPXkKK0NPTkZJR19JMkNfTlBDTTdYWD15CitDT05GSUdfR1BJT19T
WVNGUz15CitDT05GSUdfR1BJT19HRU5FUklDX1BMQVRGT1JNPXkKK0NPTkZJR19TRU5TT1JTX0xN
NzU9eQorQ09ORklHX1NFTlNPUlNfVE1QMTAyPXkKK0NPTkZJR19TRU5TT1JTX05QQ003WFg9eQor
Q09ORklHX1RIRVJNQUw9eQorQ09ORklHX1dBVENIRE9HPXkKK0NPTkZJR19VU0JfSElEREVWPXkK
K0NPTkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVM9eQorQ09ORklHX1VTQl9TVE9SQUdFPXkK
K0NPTkZJR19VU0JfQ0hJUElERUE9eQorQ09ORklHX1VTQl9DSElQSURFQV9VREM9eQorQ09ORklH
X1VTQl9HQURHRVQ9eQorQ09ORklHX1VTQl9HQURHRVRfTlBDTVg1MF9VU0IyPXkKK0NPTkZJR19V
U0JfRUhDSV9ST09UX0hVQl9UVD15CitDT05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15CitDT05GSUdf
VVNCX0FSQ0hfSEFTX0VIQ0k9eQorQ09ORklHX1VTQl9FSENJX0hDRD15CitDT05GSUdfVVNCX0FS
Q0hfSEFTX09IQ0k9eQorQ09ORklHX1VTQl9PSENJX0hDRD15CitDT05GSUdfVVNCPXkKK0NPTkZJ
R19VU0JfTUFTU19TVE9SQUdFPW0KK0NPTkZJR19VU0JfRURNX0tCRF9NT1VTRT1tCitDT05GSUdf
TU1DPXkKK0NPTkZJR19NTUNfU0RIQ0k9eQorQ09ORklHX01NQ19TREhDSV9OUENNNzUwPXkKK0NP
TkZJR19JSU89eQorQ09ORklHX05QQ003WFhfQURDPXkKK0NPTkZJR19NU0RPU19GUz15CitDT05G
SUdfVkZBVF9GUz15CitDT05GSUdfVE1QRlM9eQorQ09ORklHX1JPTUZTX0ZTPXkKK0NPTkZJR19O
RlNfRlM9eQorQ09ORklHX1JPT1RfTkZTPXkKK0NPTkZJR19DSUZTPXkKK0NPTkZJR19DSUZTX1hB
VFRSPXkKK0NPTkZJR19OTFNfQ09ERVBBR0VfNDM3PXkKK0NPTkZJR19OTFNfQVNDSUk9eQorQ09O
RklHX05MU19JU084ODU5XzE9eQorQ09ORklHX0RZTkFNSUNfREVCVUc9eQorQ09ORklHX0RFQlVH
X0lORk89eQorQ09ORklHX0RFQlVHX0lORk9fUkVEVUNFRD15CitDT05GSUdfUkVBREFCTEVfQVNN
PXkKK0NPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKK0NPTkZJR19NQUdJQ19TWVNSUT15
CitDT05GSUdfRlVOQ1RJT05fVFJBQ0VSPXkKK0NPTkZJR19FQVJMWV9QUklOVEs9eQorQ09ORklH
X0NSWVBUT19DQkM9eQorQ09ORklHX0NSWVBUT19DVFI9eQorQ09ORklHX0NSWVBUT19DTUFDPXkK
K0NPTkZJR19DUllQVE9fQ1JDMzJDPXkKK0NPTkZJR19DUllQVE9fREVGTEFURT15CitDT05GSUdf
Q1JZUFRPX0xaTz15CitDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1NLQ0lQSEVSPXkKK0NPTkZJR19D
UllQVE9fREVWX05QQ01YNTA9eQorQ09ORklHX0FSTV9DUllQVE89eQorQ09ORklHX05QQ003WFhf
TFBDX0JQQz15CitDT05GSUdfTlBDTTdYWF9QQ0lfTUJPWD15Ci0tIAoyLjE0LjEKCg==
--0000000000006b5ef4057cd1ecbf
Content-Type: application/octet-stream; 
	name="0001-dts-npcm7xx-Modify-NPCM7xx-device-tree.patch"
Content-Disposition: attachment; 
	filename="0001-dts-npcm7xx-Modify-NPCM7xx-device-tree.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jpl4o78s0>
X-Attachment-Id: f_jpl4o78s0

RnJvbSAxNDY1ODc5ZGY1MmM3NjFlMGQ3YTY0MWZlMjc1ZDY3ZWE2NGJjMmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+CkRh
dGU6IFN1biwgOSBEZWMgMjAxOCAxMDowOTo0MyArMDIwMApTdWJqZWN0OiBbUEFUQ0ggMS8yXSBk
dHM6IG5wY203eHg6IE1vZGlmeSBOUENNN3h4IGRldmljZSB0cmVlCgpNb2RpZnkgTlBDTTd4eCBk
ZXZpY2UgdHJlZSB0byBzdXBwb3J0IGFsbCBOUENNN3h4Cm1vZHVsZXMgZHJpdmVycy4KClNpZ25l
ZC1vZmYtYnk6IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3QGdtYWlsLmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9udXZvdG9uLWNvbW1vbi1ucGNtN3h4LmR0c2kgfCAxMDUxICsrKysrKysrKysr
Ky0KIGFyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRzICAgICB8ICA1MTIg
KysrKysrLQogYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWdwaW8uZHRzaSAgIHwg
MjAzMSArKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9udXZvdG9u
LW5wY203NTAuZHRzaSAgICAgICAgfCAgMTQwICstCiA0IGZpbGVzIGNoYW5nZWQsIDM3MDEgaW5z
ZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0v
Ym9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWdwaW8uZHRzaQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL251dm90b24tY29tbW9uLW5wY203eHguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L251dm90b24tY29tbW9uLW5wY203eHguZHRzaQppbmRleCBkMmQwNzYxMjk1YTQuLmFmZTBkM2Ni
NTE2ZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1jb21tb24tbnBjbTd4
eC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tY29tbW9uLW5wY203eHguZHRz
aQpAQCAtMiw3ICsyLDkgQEAKIC8vIENvcHlyaWdodCAoYykgMjAxOCBOdXZvdG9uIFRlY2hub2xv
Z3kgdG9tZXIubWFpbW9uQG51dm90b24uY29tCiAvLyBDb3B5cmlnaHQgMjAxOCBHb29nbGUsIElu
Yy4KIAorI2luY2x1ZGUgInNrZWxldG9uLmR0c2kiCiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50
ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L251dm90b24sbnBjbTd4eC1jbG9jay5oPgogCiAvIHsKIAkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
QEAgLTEwLDcgKzEyLDcgQEAKIAlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OwogCiAJLyogZXh0
ZXJuYWwgcmVmZXJlbmNlIGNsb2NrICovCi0JY2xrX3JlZmNsazogY2xrX3JlZmNsayB7CisJY2xr
X3JlZmNsazogY2xrLXJlZmNsayB7CiAJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwogCQkj
Y2xvY2stY2VsbHMgPSA8MD47CiAJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47CkBAIC0x
OCw3ICsyMCw3IEBACiAJfTsKIAogCS8qIGV4dGVybmFsIHJlZmVyZW5jZSBjbG9jayBmb3IgY3B1
LiBmbG9hdCBpbiBub3JtYWwgb3BlcmF0aW9uICovCi0JY2xrX3N5c2J5cGNrOiBjbGtfc3lzYnlw
Y2sgeworCWNsa19zeXNieXBjazogY2xrLXN5c2J5cGNrIHsKIAkJY29tcGF0aWJsZSA9ICJmaXhl
ZC1jbG9jayI7CiAJCSNjbG9jay1jZWxscyA9IDwwPjsKIAkJY2xvY2stZnJlcXVlbmN5ID0gPDgw
MDAwMDAwMD47CkBAIC0yNiw3ICsyOCw3IEBACiAJfTsKIAogCS8qIGV4dGVybmFsIHJlZmVyZW5j
ZSBjbG9jayBmb3IgTUMuIGZsb2F0IGluIG5vcm1hbCBvcGVyYXRpb24gKi8KLQljbGtfbWNieXBj
azogY2xrX21jYnlwY2sgeworCWNsa19tY2J5cGNrOiBjbGstbWNieXBjayB7CiAJCWNvbXBhdGli
bGUgPSAiZml4ZWQtY2xvY2siOwogCQkjY2xvY2stY2VsbHMgPSA8MD47CiAJCWNsb2NrLWZyZXF1
ZW5jeSA9IDw4MDAwMDAwMDA+OwpAQCAtMzQsNyArMzYsNyBAQAogCX07CiAKIAkgLyogZXh0ZXJu
YWwgY2xvY2sgc2lnbmFsIHJnMXJlZmNrLCBzdXBwbGllZCBieSB0aGUgcGh5ICovCi0JY2xrX3Jn
MXJlZmNrOiBjbGtfcmcxcmVmY2sgeworCWNsa19yZzFyZWZjazogY2xrLXJnMXJlZmNrIHsKIAkJ
Y29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7CiAJCSNjbG9jay1jZWxscyA9IDwwPjsKIAkJY2xv
Y2stZnJlcXVlbmN5ID0gPDEyNTAwMDAwMD47CkBAIC00MiwxNCArNDQsMTQgQEAKIAl9OwogCiAJ
IC8qIGV4dGVybmFsIGNsb2NrIHNpZ25hbCByZzJyZWZjaywgc3VwcGxpZWQgYnkgdGhlIHBoeSAq
LwotCWNsa19yZzJyZWZjazogY2xrX3JnMnJlZmNrIHsKKwljbGtfcmcycmVmY2s6IGNsay1yZzJy
ZWZjayB7CiAJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwogCQkjY2xvY2stY2VsbHMgPSA8
MD47CiAJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMjUwMDAwMDA+OwogCQljbG9jay1vdXRwdXQtbmFt
ZXMgPSAiY2xrX3JnMnJlZmNrIjsKIAl9OwogCi0JY2xrX3hpbjogY2xrX3hpbiB7CisJY2xrX3hp
bjogY2xrLXhpbiB7CiAJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwogCQkjY2xvY2stY2Vs
bHMgPSA8MD47CiAJCWNsb2NrLWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CkBAIC02OSw2ICs3MSwx
MiBAQAogCQkJcmVnID0gPDB4ODAwMDAwIDB4MTAwMD47CiAJCX07CiAKKwkJcnN0OiByc3RAZjA4
MDEwMDAgeworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtcnN0IiwgInN5c2NvbiIs
CisJCQkic2ltcGxlLW1mZCI7CisJCQlyZWcgPSA8MHg4MDEwMDAgMHgxMDAwPjsKKwkJfTsKKwog
CQlzY3U6IHNjdUAzZmUwMDAgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE5LXNjdSI7
CiAJCQlyZWcgPSA8MHgzZmUwMDAgMHgxMDAwPjsKQEAgLTgwLDcgKzg4LDcgQEAKIAkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAyMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJCWNhY2hlLXVuaWZp
ZWQ7CiAJCQljYWNoZS1sZXZlbCA9IDwyPjsKLQkJCWNsb2NrcyA9IDwmY2xrIDEwPjsKKwkJCWNs
b2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FYST47CiAJCQlhcm0sc2hhcmVkLW92ZXJyaWRlOwog
CQl9OwogCkBAIC0xMDksNiArMTE3LDE4MiBAQAogCQkJY2xvY2tzID0gPCZjbGtfcmVmY2xrPiwg
PCZjbGtfc3lzYnlwY2s+LCA8JmNsa19tY2J5cGNrPjsKIAkJfTsKIAorCQlnbWFjMDogZXRoQGYw
ODAyMDAwIHsKKwkJCWRldmljZV90eXBlID0gIm5ldHdvcmsiOworCQkJY29tcGF0aWJsZSA9ICJz
bnBzLGR3bWFjIjsKKwkJCXJlZyA9IDwweGYwODAyMDAwIDB4MjAwMD47CisJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlpbnRlcnJ1cHQtbmFtZXMg
PSAibWFjaXJxIjsKKwkJCWV0aGVybmV0ID0gPDA+OworCQkJY2xvY2tzCT0gPCZjbGtfcmcxcmVm
Y2s+LCA8JmNsayBOUENNN1hYX0NMS19BSEI+OworCQkJY2xvY2stbmFtZXMgPSAic3RtbWFjZXRo
IiwgImNsa19nbWFjIjsKKwkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQlwaW5jdHJs
LTAgPSA8JnJnMV9waW5zCisJCQkgICAgICAgICAgICAgJnJnMW1kaW9fcGlucz47CisJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOworCQl9OworCisJCWVtYzA6IGV0aEBmMDgyNTAwMCB7CisJCQlkZXZp
Y2VfdHlwZSA9ICJuZXR3b3JrIjsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLWVt
YyI7CisJCQlyZWcgPSA8MHhmMDgyNTAwMCAweDEwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCQk8R0lDX1NQSSAxNSBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FIQj47CisJCQljbG9j
ay1uYW1lcyA9ICJjbGtfZW1jIjsKKwkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQlw
aW5jdHJsLTAgPSA8JnIxX3BpbnMKKwkJCSAgICAgICAgICAgICAmcjFlcnJfcGlucworCQkJCSAg
ICAgJnIxbWRfcGlucz47CisJCX07CisKKwkJZWhjaTE6dXNiQGYwODA2MDAwIHsKKwkJCWNvbXBh
dGlibGUgPSAibnV2b3RvbixucGNtNzUwLWVoY2kiOworCQkJcmVnID0gPDB4ZjA4MDYwMDAgMHgx
MDAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2MSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKKwkJb2hjaTE6IG9oY2lAZjA4MDcwMDAg
eworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtb2hjaSI7CisJCQlyZWcgPSA8MHhm
MDgwNzAwMCAweDEwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDYyIElSUV9UWVBFX0xF
VkVMX0hJR0g+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlzZGhjaTA6IHNk
aGNpQGYwODQyMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXNkaGNpIjsK
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQlyZWcgPSA8MHhmMDg0MjAwMCAweDIwMD47CisJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjYgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQljbG9j
a3MgPSAgPCZjbGsgTlBDTTdYWF9DTEtfQUhCPjsgICAgICAvKiwgPCZjbGtfeGluPjsqLworCQkJ
Y2xvY2stbmFtZXMgPSAiY2xrX21tYyI7ICAgICAgICAgICAgICAgLyogLCJjbGtfeGluIjsgKi8K
KwkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQlwaW5jdHJsLTAgPSA8Jm1tYzhfcGlu
cworCQkJCSAgICAgJm1tY19waW5zPjsKKwkJfTsKKworCQlzZGhjaTE6IHNkaGNpQGYwODQwMDAw
IHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXNkaGNpIjsKKwkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CisJCQlyZWcgPSA8MHhmMDg0MDAwMCAweDIwMD47CisJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMjcgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQljbG9ja3MgPSAgPCZjbGsg
TlBDTTdYWF9DTEtfQUhCPjsgICAgICAvKiwgPCZjbGtfeGluPjsqLworCQkJY2xvY2stbmFtZXMg
PSAiY2xrX3NkaGMiOyAgICAgICAgICAgICAgLyogLCJjbGtfeGluIjsgKi8KKwkJCXBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCI7CisJCQlwaW5jdHJsLTAgPSA8JnNkMV9waW5zPjsKKwkJfTsKKwor
CQlhZXM6YWVzQGYwODU4MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLWFl
cyI7CisJCQlyZWcgPSA8MHhmMDg1ODAwMCAweDEwMDA+OworCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FIQj47CisJCQljbG9jay1uYW1lcyA9
ICJjbGtfYWhiIjsKKwkJfTsKKworCQlzaGE6c2hhQGYwODVhMDAwIHsKKwkJCWNvbXBhdGlibGUg
PSAibnV2b3RvbixucGNtNzUwLXNoYSI7CisJCQlyZWcgPSA8MHhmMDg1YTAwMCAweDEwMDA+Owor
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FI
Qj47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfYWhiIjsKKwkJfTsKKworCQljb3ByOiBjb3ByQDAg
eworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtY29wciI7CisJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5Q
Q003WFhfQ0xLX0FIQj47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfYWhiIjsKKwkJfTsKKworCQl2
ZG1hOiB2ZG1hQGUwODAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXZk
bSI7CisJCQlyZWcgPSA8MHhlMDgwMDAwMCAweDEwMDAKKwkJCQkgICAweGYwODIyMDAwIDB4MTAw
MD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjkgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJ
CX07CisKKwkJc3BpMDogc3BpQGZiMDAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3Rvbixu
cGNtNzUwLXNwaSI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0g
PDA+OworCQkJcmVnID0gPDB4ZmIwMDAwMDAgMHgxMDAwPiwgPDB4ODAwMDAwMDAgMHgxMDAwMDAw
MD47CisJCQlyZWctbmFtZXMgPSAiY29udHJvbCIsICJtZW1vcnkiOworCQkJY2hpcC1tYXgtYWRk
cmVzcy1tYXAgPSA8MHg4MDAwMDAwPjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FI
Qj47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfYWhiIjsKKwkJCXNwaS1ub3JAMCB7CisJCQkJCWNv
bXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7CisJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owor
CQkJCQkjc2l6ZS1jZWxscyA9IDwxPjsKKwkJCQkJcmVnID0gPDA+OworCQkJfTsKKwkJfTsKKwkJ
c3BpMzogc3BpQGMwMDAwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXNw
aSI7CisJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCQkJ
cmVnID0gPDB4YzAwMDAwMDAgMHgxMDAwPiwgPDB4QTAwMDAwMDAgMHgyMDAwMDAwMD47CisJCQly
ZWctbmFtZXMgPSAiY29udHJvbCIsICJtZW1vcnkiOworCQkJY2hpcC1tYXgtYWRkcmVzcy1tYXAg
PSA8MHg4MDAwMDAwPjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FIQj47CisJCQlj
bG9jay1uYW1lcyA9ICJjbGtfYWhiIjsKKwkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJ
CQlwaW5jdHJsLTAgPSA8JnNwaTNfcGlucyAmc3BpM3F1YWRfcGlucz47CisJCQlzcGktbm9yQDAg
eworCQkJCQljb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOworCQkJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MT47CisJCQkJCXJlZyA9IDwwPjsKKwkJCX07
CisJCX07CisKKwkJcGNpX3JjOiBheGktcGNpZUBlMTAwMDAwMCB7CisJCQkjYWRkcmVzcy1jZWxs
cyA9IDwzPjsKKwkJCSNzaXplLWNlbGxzID0gPDI+OworCQkJI2ludGVycnVwdC1jZWxscyA9IDwx
PjsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXBjaXJjIjsKKwkJCXJlZyA9IDww
eGUxMDAwMDAwIDB4MTAwMD47CisJCQlkZXZpY2VfdHlwZSA9ICJwY2kiOworCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDEyNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWJ1cy1yYW5nZSA9IDww
eDAwIDB4ZmY+OworCQkJcmFuZ2VzID0gPDB4MDIwMDAwMDAgMCAweGVhMDAwMDAwCisJCQkJMHhl
YTAwMDAwMCAwIDB4MDIwMDAwMDA+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKwor
CQlkdmM6IGR2Y0BmMDgwODAwMCB7CisJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1k
dmMiOworCQkJcmVnID0gPDB4ZjA4MDgwMDAgMHgxMDAwPjsKKwkJCWludGVycnVwdHMgPSA8MCAy
MyA0PjsKKwkJfTsKKworCQl2Y2Q6IHZjZEBmMDgxMDAwMCB7CisJCQljb21wYXRpYmxlID0gIm51
dm90b24sbnBjbTc1MC12Y2QiOworCQkJcmVnID0gPDB4ZjA4MTAwMDAgMHgxMDAwMD47CisJCQlw
aHktbWVtb3J5ID0gPDB4M2UyMDAwMDAgMHg2MDAwMDA+OworCQkJZGUtbW9kZSA9IC9iaXRzLyA4
IDwxPjsKKwkJCWludGVycnVwdHMgPSA8MCAyMiA0PjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CisJCX07CisKKwkJZWNlOiBlY2VAZjA4MjAwMDAgeworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9u
LG5wY203NTAtZWNlIjsKKwkJCXJlZyA9IDwweGYwODIwMDAwIDB4MjAwMD47CisJCQlwaHktbWVt
b3J5ID0gPDB4M2U4MDAwMDAgMHg2MDAwMDA+OworCQkJaW50ZXJydXB0cyA9IDwwIDI0IDQ+Owor
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKworCQlwY2ltYm94OiBwY2ltYm94QGYwODQ4
MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXBjaS1tYm94IiwKKwkJCQkJ
InNpbXBsZS1tZmQiLCAic3lzY29uIjsKKwkJCXJlZyA9IDwweGYwODRDMDAwIDB4OAorCQkJCTB4
ZjA4NDgwMDAgMHgzRjAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4IElSUV9UWVBFX0xF
VkVMX0hJR0g+OworCQl9OworCiAJCWFwYiB7CiAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJ
CSNzaXplLWNlbGxzID0gPDE+OwpAQCAtMTE2LDExICszMDAsNzIgQEAKIAkJCWludGVycnVwdC1w
YXJlbnQgPSA8JmdpYz47CiAJCQlyYW5nZXMgPSA8MHgwIDB4ZjAwMDAwMDAgMHgwMDMwMDAwMD47
CiAKKwkJCWxwY19rY3M6IGxwY19rY3NANzAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9u
LG5wY203NTAtbHBjLWtjcyIsCisJCQkJCQkic2ltcGxlLW1mZCIsICJzeXNjb24iOworCQkJCXJl
ZyA9IDwweDcwMDAgMHg0MD47CisJCQkJcmVnLWlvLXdpZHRoID0gPDE+OworCisJCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MT47CisJCQkJcmFuZ2VzID0gPDB4
MCAweDcwMDAgMHg0MD47CisKKwkJCQlrY3MxOiBrY3MxQDAgeworCQkJCQljb21wYXRpYmxlID0g
Im51dm90b24sbnBjbTc1MC1rY3MtYm1jIjsKKwkJCQkJcmVnID0gPDB4MCAweDQwPjsKKwkJCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDkgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJCWtjc19j
aGFuID0gPDE+OworCQkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJCX07CisKKwkJCQlrY3My
OiBrY3MyQDAgeworCQkJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1rY3MtYm1jIjsK
KwkJCQkJcmVnID0gPDB4MCAweDQwPjsKKwkJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkgSVJR
X1RZUEVfTEVWRUxfSElHSD47CisJCQkJCWtjc19jaGFuID0gPDI+OworCQkJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOworCQkJCX07CisKKwkJCQlrY3MzOiBrY3MzQDAgeworCQkJCQljb21wYXRpYmxl
ID0gIm51dm90b24sbnBjbTc1MC1rY3MtYm1jIjsKKwkJCQkJcmVnID0gPDB4MCAweDQwPjsKKwkJ
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJCWtj
c19jaGFuID0gPDM+OworCQkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJCX07CisJCQl9Owor
CisJCQlscGNfaG9zdDogbHBjX2hvc3RANzAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9u
LG5wY203NTAtbHBjLWhvc3QiLAorCQkJCQkJInNpbXBsZS1tZmQiLCAic3lzY29uIjsKKwkJCQly
ZWcgPSA8MHg3MDAwIDB4NjA+OworCisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJI3Np
emUtY2VsbHMgPSA8MT47CisJCQkJcmFuZ2VzID0gPDB4MCAweDcwMDAgMHg2MD47CisKKwkJCQls
cGNfYnBjOiBscGNfYnBjQDQwIHsKKwkJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAt
bHBjLWJwYyI7CisJCQkJCXJlZyA9IDwweDQwIDB4MjA+OworCQkJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJCQl9OworCQkJfTsKKworCQkJcHNwaTogcHNwaUAwIHsKKwkJCQljb21wYXRpYmxlID0gIm51
dm90b24sbnBjbTc1MC1wc3BpIjsKKwkJCQlyZWcgPSA8MHgyMDAwMDAgMHgyMDAwPjsKKwkJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMzEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJCQk8R0lD
X1NQSSAyOCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hY
X0NMS19BUEI1PjsKKwkJCQljbG9jay1uYW1lcyA9ICJjbGtfYXBiNSI7CisJCQl9OworCiAJCQl0
aW1lcjA6IHRpbWVyQDgwMDAgewogCQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXRp
bWVyIjsKIAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzIgSVJRX1RZUEVfTEVWRUxfSElHSD47
Ci0JCQkJcmVnID0gPDB4ODAwMCAweDUwPjsKLQkJCQljbG9ja3MgPSA8JmNsayA1PjsKKwkJCQly
ZWcgPSA8MHg4MDAwIDB4MUM+OworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX1RJTUVS
PjsKIAkJCX07CiAKIAkJCXdhdGNoZG9nMDogd2F0Y2hkb2dAODAxQyB7CkBAIC0xMjgsNyArMzcz
LDcgQEAKIAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDcgSVJRX1RZUEVfTEVWRUxfSElHSD47
CiAJCQkJcmVnID0gPDB4ODAxQyAweDQ+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Ci0JCQkJ
Y2xvY2tzID0gPCZjbGsgNT47CisJCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfVElNRVI+
OwogCQkJfTsKIAogCQkJd2F0Y2hkb2cxOiB3YXRjaGRvZ0A5MDFDIHsKQEAgLTEzNiw3ICszODEs
NyBAQAogCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
IAkJCQlyZWcgPSA8MHg5MDFDIDB4ND47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKLQkJCQlj
bG9ja3MgPSA8JmNsayA1PjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19USU1FUj47
CiAJCQl9OwogCiAJCQl3YXRjaGRvZzI6IHdhdGNoZG9nQGEwMUMgewpAQCAtMTQ0LDEzICszODks
MTMgQEAKIAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDkgSVJRX1RZUEVfTEVWRUxfSElHSD47
CiAJCQkJcmVnID0gPDB4YTAxQyAweDQ+OwogCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Ci0JCQkJ
Y2xvY2tzID0gPCZjbGsgNT47CisJCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfVElNRVI+
OwogCQkJfTsKIAogCQkJc2VyaWFsMDogc2VyaWFsQDEwMDAgewogCQkJCWNvbXBhdGlibGUgPSAi
bnV2b3RvbixucGNtNzUwLXVhcnQiOwogCQkJCXJlZyA9IDwweDEwMDAgMHgxMDAwPjsKLQkJCQlj
bG9ja3MgPSA8JmNsayA2PjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19VQVJUPjsK
IAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJCQly
ZWctc2hpZnQgPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKQEAgLTE1OSw3ICs0MDQs
NyBAQAogCQkJc2VyaWFsMTogc2VyaWFsQDIwMDAgewogCQkJCWNvbXBhdGlibGUgPSAibnV2b3Rv
bixucGNtNzUwLXVhcnQiOwogCQkJCXJlZyA9IDwweDIwMDAgMHgxMDAwPjsKLQkJCQljbG9ja3Mg
PSA8JmNsayA2PjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19VQVJUPjsKIAkJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJCQlyZWctc2hp
ZnQgPSA8Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKQEAgLTE2OCw3ICs0MTMsNyBAQAog
CQkJc2VyaWFsMjogc2VyaWFsQDMwMDAgewogCQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNt
NzUwLXVhcnQiOwogCQkJCXJlZyA9IDwweDMwMDAgMHgxMDAwPjsKLQkJCQljbG9ja3MgPSA8JmNs
ayA2PjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19VQVJUPjsKIAkJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJCQlyZWctc2hpZnQgPSA8
Mj47CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKQEAgLTE3NywxMSArNDIyLDc4NSBAQAogCQkJ
c2VyaWFsMzogc2VyaWFsQDQwMDAgewogCQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUw
LXVhcnQiOwogCQkJCXJlZyA9IDwweDQwMDAgMHgxMDAwPjsKLQkJCQljbG9ja3MgPSA8JmNsayA2
PjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19VQVJUPjsKIAkJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKIAkJCQlyZWctc2hpZnQgPSA8Mj47
CiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CisKKwkJCXJuZzogcm5nQGIwMDAgewor
CQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXJuZyI7CisJCQkJcmVnID0gPDB4YjAw
MCAweDEwMDA+OworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FQQjE+OworCQkJCWNs
b2NrLW5hbWVzID0gImNsa19hcGIxIjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsK
KworCQkJYWRjOiBhZGNAYzAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAt
YWRjIjsKKwkJCQlyZWcgPSA8MHhjMDAwIDB4MTAwMD47CisJCQkJY2xvY2tzID0gPCZjbGsgTlBD
TTdYWF9DTEtfQURDPjsKKwkJCQljbG9jay1uYW1lcyA9ICJjbGtfYWRjIjsKKwkJCQl2cmVmID0g
PDIwNDg+OworCQkJfTsKKworCQkJb3RwOm90cEAxODkwMDAgeworCQkJCWNvbXBhdGlibGUgPSAi
bnV2b3RvbixucGNtNzUwLW90cCI7CisJCQkJcmVnID0gPDB4MTg5MDAwIDB4MTAwMAorCQkJCQkg
ICAweDE4YTAwMCAweDEwMDA+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQkJY2xvY2tz
ID0gPCZjbGsgTlBDTTdYWF9DTEtfQVBCND47CisJCQkJY2xvY2stbmFtZXMgPSAiY2xrX2FwYjQi
OworCQkJfTsKKworCQkJcHdtX2Zhbjpwd20tZmFuLWNvbnRyb2xsZXJAMTAzMDAwIHsJCisJCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJY29tcGF0
aWJsZSA9ICJudXZvdG9uLG5wY203NTAtcHdtLWZhbiI7CisJCQkJcmVnID0gPDB4MTAzMDAwIDB4
MjAwMD4sCisJCQkJCTwweDE4MDAwMCAweDgwMDA+OworCQkJCXJlZy1uYW1lcyA9ICJwd20iLCAi
ZmFuIjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19BUEIzPiwKKwkJCQkJPCZjbGsg
TlBDTTdYWF9DTEtfQVBCND47CisJCQkJY2xvY2stbmFtZXMgPSAicHdtIiwiZmFuIjsKKwkJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgOTYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJCQk8R0lD
X1NQSSA5NyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKwkJCQkJCTxHSUNfU1BJIDk4IElSUV9UWVBF
X0xFVkVMX0hJR0g+LAorCQkJCQkJPEdJQ19TUEkgOTkgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJ
CQkJCQk8R0lDX1NQSSAxMDAgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJCQk8R0lDX1NQSSAx
MDEgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJCQk8R0lDX1NQSSAxMDIgSVJRX1RZUEVfTEVW
RUxfSElHSD4sCisJCQkJCQk8R0lDX1NQSSAxMDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJCQlwaW5jdHJsLTAgPSA8JnB3bTBfcGlucyAm
cHdtMV9waW5zCisJCQkJCQkmcHdtMl9waW5zICZwd20zX3BpbnMKKwkJCQkJCSZwd200X3BpbnMg
JnB3bTVfcGlucworCQkJCQkJJnB3bTZfcGlucyAmcHdtN19waW5zCisJCQkJCQkmZmFuaW4wX3Bp
bnMgJmZhbmluMV9waW5zCisJCQkJCQkmZmFuaW4yX3BpbnMgJmZhbmluM19waW5zCisJCQkJCQkm
ZmFuaW40X3BpbnMgJmZhbmluNV9waW5zCisJCQkJCQkmZmFuaW42X3BpbnMgJmZhbmluN19waW5z
CisJCQkJCQkmZmFuaW44X3BpbnMgJmZhbmluOV9waW5zCisJCQkJCQkmZmFuaW4xMF9waW5zICZm
YW5pbjExX3BpbnMKKwkJCQkJCSZmYW5pbjEyX3BpbnMgJmZhbmluMTNfcGlucworCQkJCQkJJmZh
bmluMTRfcGlucyAmZmFuaW4xNV9waW5zPjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJ
fTsKKworCQkJaTJjMDogaTJjLWJ1c0A4MDAwMCB7CisJCQkJcmVnID0gPDB4ODAwMDAgMHgxMDAw
PjsKKwkJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1pMmMtYnVzIjsKKwkJCQljbG9j
a3MgPSA8JmNsayBOUENNN1hYX0NMS19BUEIyPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAw
MD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owor
CQkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQkJcGluY3RybC0wID0gPCZzbWIwX3Bp
bnM+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlpMmMxOiBpMmMtYnVz
QDgxMDAwIHsKKwkJCQlyZWcgPSA8MHg4MTAwMCAweDEwMDA+OworCQkJCWNvbXBhdGlibGUgPSAi
bnV2b3RvbixucGNtNzUwLWkyYy1idXMiOworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xL
X0FQQjI+OworCQkJCWJ1cy1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgNjUgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKKwkJCQlwaW5jdHJsLTAgPSA8JnNtYjFfcGlucz47CisJCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzI6IGkyYy1idXNAODIwMDAgeworCQkJCXJlZyA9IDww
eDgyMDAwIDB4MTAwMD47CisJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtaTJjLWJ1
cyI7CisJCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfQVBCMj47CisJCQkJYnVzLWZyZXF1
ZW5jeSA9IDwxMDAwMDA+OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2NiBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKKwkJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJCXBpbmN0cmwt
MCA9IDwmc21iMl9waW5zPjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJ
aTJjMzogaTJjLWJ1c0A4MzAwMCB7CisJCQkJcmVnID0gPDB4ODMwMDAgMHgxMDAwPjsKKwkJCQlj
b21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1pMmMtYnVzIjsKKwkJCQljbG9ja3MgPSA8JmNs
ayBOUENNN1hYX0NMS19BUEIyPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDY3IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQkJcGluY3RybC0wID0gPCZzbWIzX3BpbnM+OworCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlpMmM0OiBpMmMtYnVzQDg0MDAwIHsK
KwkJCQlyZWcgPSA8MHg4NDAwMCAweDEwMDA+OworCQkJCWNvbXBhdGlibGUgPSAibnV2b3Rvbixu
cGNtNzUwLWkyYy1idXMiOworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FQQjI+Owor
CQkJCWJ1cy1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NjggSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
KwkJCQlwaW5jdHJsLTAgPSA8JnNtYjRfcGlucz47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
KwkJCX07CisKKwkJCWkyYzU6IGkyYy1idXNAODUwMDAgeworCQkJCXJlZyA9IDwweDg1MDAwIDB4
MTAwMD47CisJCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtaTJjLWJ1cyI7CisJCQkJ
Y2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfQVBCMj47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwx
MDAwMDA+OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2OSBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKKwkJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJCXBpbmN0cmwtMCA9IDwmc21i
NV9waW5zPjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJaTJjNjogaTJj
LWJ1c0A4NjAwMCB7CisJCQkJcmVnID0gPDB4ODYwMDAgMHgxMDAwPjsKKwkJCQljb21wYXRpYmxl
ID0gIm51dm90b24sbnBjbTc1MC1pMmMtYnVzIjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hY
X0NMS19BUEIyPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDcwIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CisJCQkJcGluY3RybC0wID0gPCZzbWI2X3BpbnM+OworCQkJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlpMmM3OiBpMmMtYnVzQDg3MDAwIHsKKwkJCQlyZWcg
PSA8MHg4NzAwMCAweDEwMDA+OworCQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLWky
Yy1idXMiOworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FQQjI+OworCQkJCWJ1cy1m
cmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzEgSVJRX1RZ
UEVfTEVWRUxfSElHSD47CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJCQlwaW5j
dHJsLTAgPSA8JnNtYjdfcGlucz47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisK
KwkJCWkyYzg6IGkyYy1idXNAODgwMDAgeworCQkJCXJlZyA9IDwweDg4MDAwIDB4MTAwMD47CisJ
CQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtaTJjLWJ1cyI7CisJCQkJY2xvY2tzID0g
PCZjbGsgTlBDTTdYWF9DTEtfQVBCMj47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+Owor
CQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3MiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJCXBpbmN0cmwtMCA9IDwmc21iOF9waW5zPjsK
KwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJaTJjOTogaTJjLWJ1c0A4OTAw
MCB7CisJCQkJcmVnID0gPDB4ODkwMDAgMHgxMDAwPjsKKwkJCQljb21wYXRpYmxlID0gIm51dm90
b24sbnBjbTc1MC1pMmMtYnVzIjsKKwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19BUEIy
PjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDczIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CisJCQkJcGluY3RybC0wID0gPCZzbWI5X3BpbnM+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CisJCQl9OworCisJCQlpMmMxMDogaTJjLWJ1c0A4YTAwMCB7CisJCQkJcmVnID0gPDB4OGEw
MDAgMHgxMDAwPjsKKwkJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1pMmMtYnVzIjsK
KwkJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19BUEIyPjsKKwkJCQlidXMtZnJlcXVlbmN5
ID0gPDEwMDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc0IElSUV9UWVBFX0xFVkVM
X0hJR0g+OworCQkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQkJcGluY3RybC0wID0g
PCZzbWIxMF9waW5zPjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJaTJj
MTE6IGkyYy1idXNAOGIwMDAgeworCQkJCXJlZyA9IDwweDhiMDAwIDB4MTAwMD47CisJCQkJY29t
cGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtaTJjLWJ1cyI7CisJCQkJY2xvY2tzID0gPCZjbGsg
TlBDTTdYWF9DTEtfQVBCMj47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OworCQkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSA3NSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOworCQkJCXBpbmN0cmwtMCA9IDwmc21iMTFfcGlucz47CisJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzEyOiBpMmMtYnVzQDhjMDAwIHsK
KwkJCQlyZWcgPSA8MHg4YzAwMCAweDEwMDA+OworCQkJCWNvbXBhdGlibGUgPSAibnV2b3Rvbixu
cGNtNzUwLWkyYy1idXMiOworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FQQjI+Owor
CQkJCWJ1cy1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NzYgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
KwkJCQlwaW5jdHJsLTAgPSA8JnNtYjEyX3BpbnM+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CisJCQl9OworCisJCQlpMmMxMzogaTJjLWJ1c0A4ZDAwMCB7CisJCQkJcmVnID0gPDB4OGQwMDAg
MHgxMDAwPjsKKwkJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC1pMmMtYnVzIjsKKwkJ
CQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19BUEIyPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0g
PDEwMDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc3IElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworCQkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCQkJcGluY3RybC0wID0gPCZz
bWIxM19waW5zPjsKKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJaTJjMTQ6
IGkyYy1idXNAOGUwMDAgeworCQkJCXJlZyA9IDwweDhlMDAwIDB4MTAwMD47CisJCQkJY29tcGF0
aWJsZSA9ICJudXZvdG9uLG5wY203NTAtaTJjLWJ1cyI7CisJCQkJY2xvY2tzID0gPCZjbGsgTlBD
TTdYWF9DTEtfQVBCMj47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OworCQkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSA3OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOworCQkJCXBpbmN0cmwtMCA9IDwmc21iMTRfcGlucz47CisJCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzE1OiBpMmMtYnVzQDhmMDAwIHsKKwkJ
CQlyZWcgPSA8MHg4ZjAwMCAweDEwMDA+OworCQkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNt
NzUwLWkyYy1idXMiOworCQkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FQQjI+OworCQkJ
CWJ1cy1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNzkg
SVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJ
CQlwaW5jdHJsLTAgPSA8JnNtYjE1X3BpbnM+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJ
CQl9OworCisJCQlnZnhpOiBnZnhpQGYwMDBlMDAwIHsKKwkJCQljb21wYXRpYmxlID0gIm51dm90
b24sbnBjbTc1MC1nZnhpIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsKKwkJCQlyZWcgPSA8MHhm
MDAwZTAwMCAweDEwMD47CisJCQl9OworCisJCX07CisJfTsKKworCXBpbmN0cmw6IHBpbmN0cmxA
ZjA4MDAwMDAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MT47
CisJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXBpbmN0cmwiLCAic3lzY29uIiwgInNp
bXBsZS1tZmQiOworCQlyYW5nZXMgPSA8MCAweGYwMDEwMDAwIDB4ODAwMD47CisJCXN0YXR1cyA9
ICJva2F5IjsKKwkJZ3BpbzA6IGdwaW9AZjAwMTAwMDAgeworCQkJZ3Bpby1jb250cm9sbGVyOwor
CQkJI2dwaW8tY2VsbHMgPSA8Mj47CisJCQlyZWcgPSA8MHgwIDB4ODA+OworCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDExNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWdwaW8tcmFuZ2VzID0g
PCZwaW5jdHJsIDAgMCAzMj47CisJCX07CisJCWdwaW8xOiBncGlvQGYwMDExMDAwIHsKKwkJCWdw
aW8tY29udHJvbGxlcjsKKwkJCSNncGlvLWNlbGxzID0gPDI+OworCQkJcmVnID0gPDB4MTAwMCAw
eDgwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTcgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisJCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDMyIDMyPjsKKwkJfTsKKwkJZ3BpbzI6IGdw
aW9AZjAwMTIwMDAgeworCQkJZ3Bpby1jb250cm9sbGVyOworCQkJI2dwaW8tY2VsbHMgPSA8Mj47
CisJCQlyZWcgPSA8MHgyMDAwIDB4ODA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExOCBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsIDAgNjQgMzI+
OworCQl9OworCQlncGlvMzogZ3Bpb0BmMDAxMzAwMCB7CisJCQlncGlvLWNvbnRyb2xsZXI7CisJ
CQkjZ3Bpby1jZWxscyA9IDwyPjsKKwkJCXJlZyA9IDwweDMwMDAgMHg4MD47CisJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTE5IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJZ3Bpby1yYW5nZXMg
PSA8JnBpbmN0cmwgMCA5NiAzMj47CisJCX07CisJCWdwaW80OiBncGlvQGYwMDE0MDAwIHsKKwkJ
CWdwaW8tY29udHJvbGxlcjsKKwkJCSNncGlvLWNlbGxzID0gPDI+OworCQkJcmVnID0gPDB4NDAw
MCAweDgwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMjAgSVJRX1RZUEVfTEVWRUxfSElH
SD47CisJCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDEyOCAzMj47CisJCX07CisJCWdwaW81
OiBncGlvQGYwMDE1MDAwIHsKKwkJCWdwaW8tY29udHJvbGxlcjsKKwkJCSNncGlvLWNlbGxzID0g
PDI+OworCQkJcmVnID0gPDB4NTAwMCAweDgwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAx
MjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDE2
MCAzMj47CisJCX07CisJCWdwaW82OiBncGlvQGYwMDE2MDAwIHsKKwkJCWdwaW8tY29udHJvbGxl
cjsKKwkJCSNncGlvLWNlbGxzID0gPDI+OworCQkJcmVnID0gPDB4NjAwMCAweDgwPjsKKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxMjIgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlncGlvLXJh
bmdlcyA9IDwmcGluY3RybCAwIDE5MiAzMj47CisJCX07CisJCWdwaW83OiBncGlvQGYwMDE3MDAw
IHsKKwkJCWdwaW8tY29udHJvbGxlcjsKKwkJCSNncGlvLWNlbGxzID0gPDI+OworCQkJcmVnID0g
PDB4NzAwMCAweDgwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMjMgSVJRX1RZUEVfTEVW
RUxfSElHSD47CisJCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDIyNCAzMj47CisJCX07CisK
KwkJaW94MV9waW5zOiBpb3gxLXBpbnMgeworCQkJZ3JvdXBzID0gImlveDEiOworCQkJZnVuY3Rp
b24gPSAiaW94MSI7CisJCX07CisJCWlveDJfcGluczogaW94Mi1waW5zIHsKKwkJCWdyb3VwcyA9
ICJpb3gyIjsKKwkJCWZ1bmN0aW9uID0gImlveDIiOworCQl9OworCQlzbWIxZF9waW5zOiBzbWIx
ZC1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIxZCI7CisJCQlmdW5jdGlvbiA9ICJzbWIxZCI7CisJ
CX07CisJCXNtYjJkX3BpbnM6IHNtYjJkLXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjJkIjsKKwkJ
CWZ1bmN0aW9uID0gInNtYjJkIjsKKwkJfTsKKwkJbGtncG8xX3BpbnM6IGxrZ3BvMS1waW5zIHsK
KwkJCWdyb3VwcyA9ICJsa2dwbzEiOworCQkJZnVuY3Rpb24gPSAibGtncG8xIjsKKwkJfTsKKwkJ
bGtncG8yX3BpbnM6IGxrZ3BvMi1waW5zIHsKKwkJCWdyb3VwcyA9ICJsa2dwbzIiOworCQkJZnVu
Y3Rpb24gPSAibGtncG8yIjsKKwkJfTsKKwkJaW94aF9waW5zOiBpb3hoLXBpbnMgeworCQkJZ3Jv
dXBzID0gImlveGgiOworCQkJZnVuY3Rpb24gPSAiaW94aCI7CisJCX07CisJCWdzcGlfcGluczog
Z3NwaS1waW5zIHsKKwkJCWdyb3VwcyA9ICJnc3BpIjsKKwkJCWZ1bmN0aW9uID0gImdzcGkiOwor
CQl9OworCQlzbWI1Yl9waW5zOiBzbWI1Yi1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWI1YiI7CisJ
CQlmdW5jdGlvbiA9ICJzbWI1YiI7CisJCX07CisJCXNtYjVjX3BpbnM6IHNtYjVjLXBpbnMgewor
CQkJZ3JvdXBzID0gInNtYjVjIjsKKwkJCWZ1bmN0aW9uID0gInNtYjVjIjsKKwkJfTsKKwkJbGtn
cG8wX3BpbnM6IGxrZ3BvMC1waW5zIHsKKwkJCWdyb3VwcyA9ICJsa2dwbzAiOworCQkJZnVuY3Rp
b24gPSAibGtncG8wIjsKKwkJfTsKKwkJcHNwaTJfcGluczogcHNwaTItcGlucyB7CisJCQlncm91
cHMgPSAicHNwaTIiOworCQkJZnVuY3Rpb24gPSAicHNwaTIiOworCQl9OworCQlzbWI0ZGVuX3Bp
bnM6IHNtYjRkZW4tcGlucyB7CisJCQlncm91cHMgPSAic21iNGRlbiI7CisJCQlmdW5jdGlvbiA9
ICJzbWI0ZGVuIjsKKwkJfTsKKwkJc21iNGJfcGluczogc21iNGItcGlucyB7CisJCQlncm91cHMg
PSAic21iNGIiOworCQkJZnVuY3Rpb24gPSAic21iNGIiOworCQl9OworCQlzbWI0Y19waW5zOiBz
bWI0Yy1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWI0YyI7CisJCQlmdW5jdGlvbiA9ICJzbWI0YyI7
CisJCX07CisJCXNtYjE1X3BpbnM6IHNtYjE1LXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjE1IjsK
KwkJCWZ1bmN0aW9uID0gInNtYjE1IjsKKwkJfTsKKwkJc21iNGRfcGluczogc21iNGQtcGlucyB7
CisJCQlncm91cHMgPSAic21iNGQiOworCQkJZnVuY3Rpb24gPSAic21iNGQiOworCQl9OworCQlz
bWIxNF9waW5zOiBzbWIxNC1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIxNCI7CisJCQlmdW5jdGlv
biA9ICJzbWIxNCI7CisJCX07CisJCXNtYjVfcGluczogc21iNS1waW5zIHsKKwkJCWdyb3VwcyA9
ICJzbWI1IjsKKwkJCWZ1bmN0aW9uID0gInNtYjUiOworCQl9OworCQlzbWI0X3BpbnM6IHNtYjQt
cGlucyB7CisJCQlncm91cHMgPSAic21iNCI7CisJCQlmdW5jdGlvbiA9ICJzbWI0IjsKKwkJfTsK
KwkJc21iM19waW5zOiBzbWIzLXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjMiOworCQkJZnVuY3Rp
b24gPSAic21iMyI7CisJCX07CisJCXNwaTBjczFfcGluczogc3BpMGNzMS1waW5zIHsKKwkJCWdy
b3VwcyA9ICJzcGkwY3MxIjsKKwkJCWZ1bmN0aW9uID0gInNwaTBjczEiOworCQl9OworCQlzcGkw
Y3MyX3BpbnM6IHNwaTBjczItcGlucyB7CisJCQlncm91cHMgPSAic3BpMGNzMiI7CisJCQlmdW5j
dGlvbiA9ICJzcGkwY3MyIjsKKwkJfTsKKwkJc3BpMGNzM19waW5zOiBzcGkwY3MzLXBpbnMgewor
CQkJZ3JvdXBzID0gInNwaTBjczMiOworCQkJZnVuY3Rpb24gPSAic3BpMGNzMyI7CisJCX07CisJ
CXNtYjNjX3BpbnM6IHNtYjNjLXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjNjIjsKKwkJCWZ1bmN0
aW9uID0gInNtYjNjIjsKKwkJfTsKKwkJc21iM2JfcGluczogc21iM2ItcGlucyB7CisJCQlncm91
cHMgPSAic21iM2IiOworCQkJZnVuY3Rpb24gPSAic21iM2IiOworCQl9OworCQlibWN1YXJ0MGFf
cGluczogYm1jdWFydDBhLXBpbnMgeworCQkJZ3JvdXBzID0gImJtY3VhcnQwYSI7CisJCQlmdW5j
dGlvbiA9ICJibWN1YXJ0MGEiOworCQl9OworCQl1YXJ0MV9waW5zOiB1YXJ0MS1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJ1YXJ0MSI7CisJCQlmdW5jdGlvbiA9ICJ1YXJ0MSI7CisJCX07CisJCWp0YWcy
X3BpbnM6IGp0YWcyLXBpbnMgeworCQkJZ3JvdXBzID0gImp0YWcyIjsKKwkJCWZ1bmN0aW9uID0g
Imp0YWcyIjsKKwkJfTsKKwkJYm1jdWFydDFfcGluczogYm1jdWFydDEtcGlucyB7CisJCQlncm91
cHMgPSAiYm1jdWFydDEiOworCQkJZnVuY3Rpb24gPSAiYm1jdWFydDEiOworCQl9OworCQl1YXJ0
Ml9waW5zOiB1YXJ0Mi1waW5zIHsKKwkJCWdyb3VwcyA9ICJ1YXJ0MiI7CisJCQlmdW5jdGlvbiA9
ICJ1YXJ0MiI7CisJCX07CisJCWJtY3VhcnQwYl9waW5zOiBibWN1YXJ0MGItcGlucyB7CisJCQln
cm91cHMgPSAiYm1jdWFydDBiIjsKKwkJCWZ1bmN0aW9uID0gImJtY3VhcnQwYiI7CisJCX07CisJ
CXIxZXJyX3BpbnM6IHIxZXJyLXBpbnMgeworCQkJZ3JvdXBzID0gInIxZXJyIjsKKwkJCWZ1bmN0
aW9uID0gInIxZXJyIjsKKwkJfTsKKwkJcjFtZF9waW5zOiByMW1kLXBpbnMgeworCQkJZ3JvdXBz
ID0gInIxbWQiOworCQkJZnVuY3Rpb24gPSAicjFtZCI7CisJCX07CisJCXNtYjNkX3BpbnM6IHNt
YjNkLXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjNkIjsKKwkJCWZ1bmN0aW9uID0gInNtYjNkIjsK
KwkJfTsKKwkJZmFuaW4wX3BpbnM6IGZhbmluMC1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjAi
OworCQkJZnVuY3Rpb24gPSAiZmFuaW4wIjsKKwkJfTsKKwkJZmFuaW4xX3BpbnM6IGZhbmluMS1w
aW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjEiOworCQkJZnVuY3Rpb24gPSAiZmFuaW4xIjsKKwkJ
fTsKKwkJZmFuaW4yX3BpbnM6IGZhbmluMi1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjIiOwor
CQkJZnVuY3Rpb24gPSAiZmFuaW4yIjsKKwkJfTsKKwkJZmFuaW4zX3BpbnM6IGZhbmluMy1waW5z
IHsKKwkJCWdyb3VwcyA9ICJmYW5pbjMiOworCQkJZnVuY3Rpb24gPSAiZmFuaW4zIjsKKwkJfTsK
KwkJZmFuaW40X3BpbnM6IGZhbmluNC1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjQiOworCQkJ
ZnVuY3Rpb24gPSAiZmFuaW40IjsKKwkJfTsKKwkJZmFuaW41X3BpbnM6IGZhbmluNS1waW5zIHsK
KwkJCWdyb3VwcyA9ICJmYW5pbjUiOworCQkJZnVuY3Rpb24gPSAiZmFuaW41IjsKKwkJfTsKKwkJ
ZmFuaW42X3BpbnM6IGZhbmluNi1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjYiOworCQkJZnVu
Y3Rpb24gPSAiZmFuaW42IjsKKwkJfTsKKwkJZmFuaW43X3BpbnM6IGZhbmluNy1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJmYW5pbjciOworCQkJZnVuY3Rpb24gPSAiZmFuaW43IjsKKwkJfTsKKwkJZmFu
aW44X3BpbnM6IGZhbmluOC1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjgiOworCQkJZnVuY3Rp
b24gPSAiZmFuaW44IjsKKwkJfTsKKwkJZmFuaW45X3BpbnM6IGZhbmluOS1waW5zIHsKKwkJCWdy
b3VwcyA9ICJmYW5pbjkiOworCQkJZnVuY3Rpb24gPSAiZmFuaW45IjsKKwkJfTsKKwkJZmFuaW4x
MF9waW5zOiBmYW5pbjEwLXBpbnMgeworCQkJZ3JvdXBzID0gImZhbmluMTAiOworCQkJZnVuY3Rp
b24gPSAiZmFuaW4xMCI7CisJCX07CisJCWZhbmluMTFfcGluczogZmFuaW4xMS1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJmYW5pbjExIjsKKwkJCWZ1bmN0aW9uID0gImZhbmluMTEiOworCQl9OworCQlm
YW5pbjEyX3BpbnM6IGZhbmluMTItcGlucyB7CisJCQlncm91cHMgPSAiZmFuaW4xMiI7CisJCQlm
dW5jdGlvbiA9ICJmYW5pbjEyIjsKKwkJfTsKKwkJZmFuaW4xM19waW5zOiBmYW5pbjEzLXBpbnMg
eworCQkJZ3JvdXBzID0gImZhbmluMTMiOworCQkJZnVuY3Rpb24gPSAiZmFuaW4xMyI7CisJCX07
CisJCWZhbmluMTRfcGluczogZmFuaW4xNC1waW5zIHsKKwkJCWdyb3VwcyA9ICJmYW5pbjE0IjsK
KwkJCWZ1bmN0aW9uID0gImZhbmluMTQiOworCQl9OworCQlmYW5pbjE1X3BpbnM6IGZhbmluMTUt
cGlucyB7CisJCQlncm91cHMgPSAiZmFuaW4xNSI7CisJCQlmdW5jdGlvbiA9ICJmYW5pbjE1IjsK
KwkJfTsKKwkJcHdtMF9waW5zOiBwd20wLXBpbnMgeworCQkJZ3JvdXBzID0gInB3bTAiOworCQkJ
ZnVuY3Rpb24gPSAicHdtMCI7CisJCX07CisJCXB3bTFfcGluczogcHdtMS1waW5zIHsKKwkJCWdy
b3VwcyA9ICJwd20xIjsKKwkJCWZ1bmN0aW9uID0gInB3bTEiOworCQl9OworCQlwd20yX3BpbnM6
IHB3bTItcGlucyB7CisJCQlncm91cHMgPSAicHdtMiI7CisJCQlmdW5jdGlvbiA9ICJwd20yIjsK
KwkJfTsKKwkJcHdtM19waW5zOiBwd20zLXBpbnMgeworCQkJZ3JvdXBzID0gInB3bTMiOworCQkJ
ZnVuY3Rpb24gPSAicHdtMyI7CisJCX07CisJCXIyX3BpbnM6IHIyLXBpbnMgeworCQkJZ3JvdXBz
ID0gInIyIjsKKwkJCWZ1bmN0aW9uID0gInIyIjsKKwkJfTsKKwkJcjJlcnJfcGluczogcjJlcnIt
cGlucyB7CisJCQlncm91cHMgPSAicjJlcnIiOworCQkJZnVuY3Rpb24gPSAicjJlcnIiOworCQl9
OworCQlyMm1kX3BpbnM6IHIybWQtcGlucyB7CisJCQlncm91cHMgPSAicjJtZCI7CisJCQlmdW5j
dGlvbiA9ICJyMm1kIjsKKwkJfTsKKwkJZ2EyMGtiY19waW5zOiBnYTIwa2JjLXBpbnMgeworCQkJ
Z3JvdXBzID0gImdhMjBrYmMiOworCQkJZnVuY3Rpb24gPSAiZ2EyMGtiYyI7CisJCX07CisJCXNt
YjVkX3BpbnM6IHNtYjVkLXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjVkIjsKKwkJCWZ1bmN0aW9u
ID0gInNtYjVkIjsKKwkJfTsKKwkJbHBjX3BpbnM6IGxwYy1waW5zIHsKKwkJCWdyb3VwcyA9ICJs
cGMiOworCQkJZnVuY3Rpb24gPSAibHBjIjsKKwkJfTsKKwkJZXNwaV9waW5zOiBlc3BpLXBpbnMg
eworCQkJZ3JvdXBzID0gImVzcGkiOworCQkJZnVuY3Rpb24gPSAiZXNwaSI7CisJCX07CisJCXJn
MV9waW5zOiByZzEtcGlucyB7CisJCQlncm91cHMgPSAicmcxIjsKKwkJCWZ1bmN0aW9uID0gInJn
MSI7CisJCX07CisJCXJnMW1kaW9fcGluczogcmcxbWRpby1waW5zIHsKKwkJCWdyb3VwcyA9ICJy
ZzFtZGlvIjsKKwkJCWZ1bmN0aW9uID0gInJnMW1kaW8iOworCQl9OworCQlyZzJfcGluczogcmcy
LXBpbnMgeworCQkJZ3JvdXBzID0gInJnMiI7CisJCQlmdW5jdGlvbiA9ICJyZzIiOworCQl9Owor
CQlkZHJfcGluczogZGRyLXBpbnMgeworCQkJZ3JvdXBzID0gImRkciI7CisJCQlmdW5jdGlvbiA9
ICJkZHIiOworCQl9OworCQlzbWIwX3BpbnM6IHNtYjAtcGlucyB7CisJCQlncm91cHMgPSAic21i
MCI7CisJCQlmdW5jdGlvbiA9ICJzbWIwIjsKKwkJfTsKKwkJc21iMV9waW5zOiBzbWIxLXBpbnMg
eworCQkJZ3JvdXBzID0gInNtYjEiOworCQkJZnVuY3Rpb24gPSAic21iMSI7CisJCX07CisJCXNt
YjJfcGluczogc21iMi1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIyIjsKKwkJCWZ1bmN0aW9uID0g
InNtYjIiOworCQl9OworCQlzbWIyY19waW5zOiBzbWIyYy1waW5zIHsKKwkJCWdyb3VwcyA9ICJz
bWIyYyI7CisJCQlmdW5jdGlvbiA9ICJzbWIyYyI7CisJCX07CisJCXNtYjJiX3BpbnM6IHNtYjJi
LXBpbnMgeworCQkJZ3JvdXBzID0gInNtYjJiIjsKKwkJCWZ1bmN0aW9uID0gInNtYjJiIjsKKwkJ
fTsKKwkJc21iMWNfcGluczogc21iMWMtcGlucyB7CisJCQlncm91cHMgPSAic21iMWMiOworCQkJ
ZnVuY3Rpb24gPSAic21iMWMiOworCQl9OworCQlzbWIxYl9waW5zOiBzbWIxYi1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJzbWIxYiI7CisJCQlmdW5jdGlvbiA9ICJzbWIxYiI7CisJCX07CisJCXNtYjhf
cGluczogc21iOC1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWI4IjsKKwkJCWZ1bmN0aW9uID0gInNt
YjgiOworCQl9OworCQlzbWI5X3BpbnM6IHNtYjktcGlucyB7CisJCQlncm91cHMgPSAic21iOSI7
CisJCQlmdW5jdGlvbiA9ICJzbWI5IjsKKwkJfTsKKwkJc21iMTBfcGluczogc21iMTAtcGlucyB7
CisJCQlncm91cHMgPSAic21iMTAiOworCQkJZnVuY3Rpb24gPSAic21iMTAiOworCQl9OworCQlz
bWIxMV9waW5zOiBzbWIxMS1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIxMSI7CisJCQlmdW5jdGlv
biA9ICJzbWIxMSI7CisJCX07CisJCXNkMV9waW5zOiBzZDEtcGlucyB7CisJCQlncm91cHMgPSAi
c2QxIjsKKwkJCWZ1bmN0aW9uID0gInNkMSI7CisJCX07CisJCXNkMXB3cl9waW5zOiBzZDFwd3It
cGlucyB7CisJCQlncm91cHMgPSAic2QxcHdyIjsKKwkJCWZ1bmN0aW9uID0gInNkMXB3ciI7CisJ
CX07CisJCXB3bTRfcGluczogcHdtNC1waW5zIHsKKwkJCWdyb3VwcyA9ICJwd200IjsKKwkJCWZ1
bmN0aW9uID0gInB3bTQiOworCQl9OworCQlwd201X3BpbnM6IHB3bTUtcGlucyB7CisJCQlncm91
cHMgPSAicHdtNSI7CisJCQlmdW5jdGlvbiA9ICJwd201IjsKKwkJfTsKKwkJcHdtNl9waW5zOiBw
d202LXBpbnMgeworCQkJZ3JvdXBzID0gInB3bTYiOworCQkJZnVuY3Rpb24gPSAicHdtNiI7CisJ
CX07CisJCXB3bTdfcGluczogcHdtNy1waW5zIHsKKwkJCWdyb3VwcyA9ICJwd203IjsKKwkJCWZ1
bmN0aW9uID0gInB3bTciOworCQl9OworCQltbWM4X3BpbnM6IG1tYzgtcGlucyB7CisJCQlncm91
cHMgPSAibW1jOCI7CisJCQlmdW5jdGlvbiA9ICJtbWM4IjsKKwkJfTsKKwkJbW1jX3BpbnM6IG1t
Yy1waW5zIHsKKwkJCWdyb3VwcyA9ICJtbWMiOworCQkJZnVuY3Rpb24gPSAibW1jIjsKKwkJfTsK
KwkJbW1jd3BfcGluczogbW1jd3AtcGlucyB7CisJCQlncm91cHMgPSAibW1jd3AiOworCQkJZnVu
Y3Rpb24gPSAibW1jd3AiOworCQl9OworCQltbWNjZF9waW5zOiBtbWNjZC1waW5zIHsKKwkJCWdy
b3VwcyA9ICJtbWNjZCI7CisJCQlmdW5jdGlvbiA9ICJtbWNjZCI7CisJCX07CisJCW1tY3JzdF9w
aW5zOiBtbWNyc3QtcGlucyB7CisJCQlncm91cHMgPSAibW1jcnN0IjsKKwkJCWZ1bmN0aW9uID0g
Im1tY3JzdCI7CisJCX07CisJCWNsa291dF9waW5zOiBjbGtvdXQtcGlucyB7CisJCQlncm91cHMg
PSAiY2xrb3V0IjsKKwkJCWZ1bmN0aW9uID0gImNsa291dCI7CisJCX07CisJCXNlcmlycV9waW5z
OiBzZXJpcnEtcGlucyB7CisJCQlncm91cHMgPSAic2VyaXJxIjsKKwkJCWZ1bmN0aW9uID0gInNl
cmlycSI7CisJCX07CisJCWxwY2Nsa19waW5zOiBscGNjbGstcGlucyB7CisJCQlncm91cHMgPSAi
bHBjY2xrIjsKKwkJCWZ1bmN0aW9uID0gImxwY2NsayI7CisJCX07CisJCXNjaXBtZV9waW5zOiBz
Y2lwbWUtcGlucyB7CisJCQlncm91cHMgPSAic2NpcG1lIjsKKwkJCWZ1bmN0aW9uID0gInNjaXBt
ZSI7CisJCX07CisJCXNjaV9waW5zOiBzY2ktcGlucyB7CisJCQlncm91cHMgPSAic2NpIjsKKwkJ
CWZ1bmN0aW9uID0gInNjaSI7CisJCX07CisJCXNtYjZfcGluczogc21iNi1waW5zIHsKKwkJCWdy
b3VwcyA9ICJzbWI2IjsKKwkJCWZ1bmN0aW9uID0gInNtYjYiOworCQl9OworCQlzbWI3X3BpbnM6
IHNtYjctcGlucyB7CisJCQlncm91cHMgPSAic21iNyI7CisJCQlmdW5jdGlvbiA9ICJzbWI3IjsK
KwkJfTsKKwkJcHNwaTFfcGluczogcHNwaTEtcGlucyB7CisJCQlncm91cHMgPSAicHNwaTEiOwor
CQkJZnVuY3Rpb24gPSAicHNwaTEiOworCQl9OworCQlmYW5pbnhfcGluczogZmFuaW54LXBpbnMg
eworCQkJZ3JvdXBzID0gImZhbmlueCI7CisJCQlmdW5jdGlvbiA9ICJmYW5pbngiOworCQl9Owor
CQlyMV9waW5zOiByMS1waW5zIHsKKwkJCWdyb3VwcyA9ICJyMSI7CisJCQlmdW5jdGlvbiA9ICJy
MSI7CisJCX07CisJCXNwaTNfcGluczogc3BpMy1waW5zIHsKKwkJCWdyb3VwcyA9ICJzcGkzIjsK
KwkJCWZ1bmN0aW9uID0gInNwaTMiOworCQl9OworCQlzcGkzY3MxX3BpbnM6IHNwaTNjczEtcGlu
cyB7CisJCQlncm91cHMgPSAic3BpM2NzMSI7CisJCQlmdW5jdGlvbiA9ICJzcGkzY3MxIjsKKwkJ
fTsKKwkJc3BpM3F1YWRfcGluczogc3BpM3F1YWQtcGlucyB7CisJCQlncm91cHMgPSAic3BpM3F1
YWQiOworCQkJZnVuY3Rpb24gPSAic3BpM3F1YWQiOworCQl9OworCQlzcGkzY3MyX3BpbnM6IHNw
aTNjczItcGlucyB7CisJCQlncm91cHMgPSAic3BpM2NzMiI7CisJCQlmdW5jdGlvbiA9ICJzcGkz
Y3MyIjsKKwkJfTsKKwkJc3BpM2NzM19waW5zOiBzcGkzY3MzLXBpbnMgeworCQkJZ3JvdXBzID0g
InNwaTNjczMiOworCQkJZnVuY3Rpb24gPSAic3BpM2NzMyI7CisJCX07CisJCW5wcmRfc21pX3Bp
bnM6IG5wcmQtc21pLXBpbnMgeworCQkJZ3JvdXBzID0gIm5wcmRfc21pIjsKKwkJCWZ1bmN0aW9u
ID0gIm5wcmRfc21pIjsKKwkJfTsKKwkJc21iMGJfcGluczogc21iMGItcGlucyB7CisJCQlncm91
cHMgPSAic21iMGIiOworCQkJZnVuY3Rpb24gPSAic21iMGIiOworCQl9OworCQlzbWIwY19waW5z
OiBzbWIwYy1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIwYyI7CisJCQlmdW5jdGlvbiA9ICJzbWIw
YyI7CisJCX07CisJCXNtYjBkZW5fcGluczogc21iMGRlbi1waW5zIHsKKwkJCWdyb3VwcyA9ICJz
bWIwZGVuIjsKKwkJCWZ1bmN0aW9uID0gInNtYjBkZW4iOworCQl9OworCQlzbWIwZF9waW5zOiBz
bWIwZC1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIwZCI7CisJCQlmdW5jdGlvbiA9ICJzbWIwZCI7
CisJCX07CisJCWRkY19waW5zOiBkZGMtcGlucyB7CisJCQlncm91cHMgPSAiZGRjIjsKKwkJCWZ1
bmN0aW9uID0gImRkYyI7CisJCX07CisJCXJnMm1kaW9fcGluczogcmcybWRpby1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJyZzJtZGlvIjsKKwkJCWZ1bmN0aW9uID0gInJnMm1kaW8iOworCQl9OworCQl3
ZG9nMV9waW5zOiB3ZG9nMS1waW5zIHsKKwkJCWdyb3VwcyA9ICJ3ZG9nMSI7CisJCQlmdW5jdGlv
biA9ICJ3ZG9nMSI7CisJCX07CisJCXdkb2cyX3BpbnM6IHdkb2cyLXBpbnMgeworCQkJZ3JvdXBz
ID0gIndkb2cyIjsKKwkJCWZ1bmN0aW9uID0gIndkb2cyIjsKKwkJfTsKKwkJc21iMTJfcGluczog
c21iMTItcGlucyB7CisJCQlncm91cHMgPSAic21iMTIiOworCQkJZnVuY3Rpb24gPSAic21iMTIi
OworCQl9OworCQlzbWIxM19waW5zOiBzbWIxMy1waW5zIHsKKwkJCWdyb3VwcyA9ICJzbWIxMyI7
CisJCQlmdW5jdGlvbiA9ICJzbWIxMyI7CisJCX07CisJCXNwaXhfcGluczogc3BpeC1waW5zIHsK
KwkJCWdyb3VwcyA9ICJzcGl4IjsKKwkJCWZ1bmN0aW9uID0gInNwaXgiOworCQl9OworCQlzcGl4
Y3MxX3BpbnM6IHNwaXhjczEtcGlucyB7CisJCQlncm91cHMgPSAic3BpeGNzMSI7CisJCQlmdW5j
dGlvbiA9ICJzcGl4Y3MxIjsKKwkJfTsKKwkJY2xrcmVxX3BpbnM6IGNsa3JlcS1waW5zIHsKKwkJ
CWdyb3VwcyA9ICJjbGtyZXEiOworCQkJZnVuY3Rpb24gPSAiY2xrcmVxIjsKIAkJfTsKIAl9Owog
fTsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ldmIuZHRz
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWV2Yi5kdHMKaW5kZXggMTVmNzQ0
ZjFiZWVhLi44YzU2OGIzODA3MDYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90
b24tbnBjbTc1MC1ldmIuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1
MC1ldmIuZHRzCkBAIC05LDYgKzksNDUgQEAKIAltb2RlbCA9ICJOdXZvdG9uIG5wY203NTAgRGV2
ZWxvcG1lbnQgQm9hcmQgKERldmljZSBUcmVlKSI7CiAJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5w
Y203NTAiOwogCisJYWxpYXNlcyB7CisJCWV0aGVybmV0MCA9ICZlbWMwOworCQlldGhlcm5ldDEg
PSAmZW1jMTsKKwkJZXRoZXJuZXQyID0gJmdtYWMwOworCQlldGhlcm5ldDMgPSAmZ21hYzE7CisJ
CXNlcmlhbDAgPSAmc2VyaWFsMDsKKwkJc2VyaWFsMSA9ICZzZXJpYWwxOworCQlzZXJpYWwyID0g
JnNlcmlhbDI7CisJCXNlcmlhbDMgPSAmc2VyaWFsMzsKKwkJdWRjMCA9ICZ1ZGMwOworCQl1ZGMx
ID0gJnVkYzE7CisJCXVkYzIgPSAmdWRjMjsKKwkJdWRjMyA9ICZ1ZGMzOworCQl1ZGM0ID0gJnVk
YzQ7CisJCXVkYzUgPSAmdWRjNTsKKwkJdWRjNiA9ICZ1ZGM2OworCQl1ZGM3ID0gJnVkYzc7CisJ
CXVkYzggPSAmdWRjODsKKwkJdWRjOSA9ICZ1ZGM5OworCQllbW1jMCA9ICZzZGhjaTA7CisJCWVt
bWMxID0gJnNkaGNpMTsKKwkJaTJjMCA9ICZpMmMwOworCQlpMmMxID0gJmkyYzE7CisJCWkyYzIg
PSAmaTJjMjsKKwkJaTJjMyA9ICZpMmMzOworCQlpMmM0ID0gJmkyYzQ7CisJCWkyYzUgPSAmaTJj
NTsKKwkJaTJjNiA9ICZpMmM2OworCQlpMmM3ID0gJmkyYzc7CisJCWkyYzggPSAmaTJjODsKKwkJ
aTJjOSA9ICZpMmM5OworCQlpMmMxMCA9ICZpMmMxMDsKKwkJaTJjMTEgPSAmaTJjMTE7CisJCWky
YzEyID0gJmkyYzEyOworCQlpMmMxMyA9ICZpMmMxMzsKKwkJaTJjMTQgPSAmaTJjMTQ7CisJCWky
YzE1ID0gJmkyYzE1OworCX07CisKIAljaG9zZW4gewogCQlzdGRvdXQtcGF0aCA9ICZzZXJpYWwz
OwogCX07CkBAIC0xNiwyNCArNTUsNDY5IEBACiAJbWVtb3J5IHsKIAkJcmVnID0gPDAgMHg0MDAw
MDAwMD47CiAJfTsKLX07CiAKLSZ3YXRjaGRvZzEgewotCXN0YXR1cyA9ICJva2F5IjsKLX07CisJ
YWhiIHsKKwkgICAgICAgIGdtYWMwOiBldGhAZjA4MDIwMDAgeworCQkJcGh5LW1vZGUgPSAicmdt
aWktaWQiOworCQkJc3RhdHVzID0gIm9rYXkiOworCQl9OwogCi0mc2VyaWFsMCB7Ci0Jc3RhdHVz
ID0gIm9rYXkiOwotfTsKKwkJZ21hYzE6IGV0aEBmMDgwNDAwMCB7CisJCQlwaHktbW9kZSA9ICJy
Z21paS1pZCI7CisJCQlzdGF0dXMgPSAib2theSI7CisJCX07CiAKLSZzZXJpYWwxIHsKLQlzdGF0
dXMgPSAib2theSI7Ci19OworCQllbWMwOiBldGhAZjA4MjUwMDAgeworCQkJcGh5LW1vZGUgPSAi
cm1paSI7CisJCQkjdXNlLW5jc2k7IC8qIGFkZCB0aGlzIHRvIHN1cHBvcnQgbmNzaSAqLworCQkJ
c3RhdHVzID0gIm9rYXkiOworCQl9OworCisJCWVtYzE6IGV0aEBmMDgyNjAwMCB7CisJCQlwaHkt
bW9kZSA9ICJybWlpIjsKKwkJCSN1c2UtbmNzaTsgLyogYWRkIHRoaXMgdG8gc3VwcG9ydCBuY3Np
ICovCisJCQlzdGF0dXMgPSAib2theSI7CisJCX07CisKKwkJZWhjaTE6IHVzYkBmMDgwNjAwMCB7
CisJCQlzdGF0dXMgPSAib2theSI7CisJCX07CisKKwkJb2hjaTE6IG9oY2lAZjA4MDcwMDAgewor
CQkJc3RhdHVzID0gIm9rYXkiOworCQl9OworCisJCXVkYzA6dWRjQGYwODMwMDAwIHsKKwkJCXN0
YXR1cyA9ICJva2F5IjsKKwkJfTsKKworCQl1ZGMxOnVkY0BmMDgzMTAwMCB7CisJCQlzdGF0dXMg
PSAib2theSI7CisJCX07CisKKwkJdWRjMjp1ZGNAZjA4MzIwMDAgeworCQkJc3RhdHVzID0gIm9r
YXkiOworCQl9OworCisJCXVkYzM6dWRjQGYwODMzMDAwIHsKKwkJCXN0YXR1cyA9ICJva2F5IjsK
KwkJfTsKKworCQl1ZGM0OnVkY0BmMDgzNDAwMCB7CisJCQlzdGF0dXMgPSAib2theSI7CisJCX07
CisKKwkJdWRjNTp1ZGNAZjA4MzUwMDAgeworCQkJc3RhdHVzID0gIm9rYXkiOworCQl9OworCisJ
CXVkYzY6dWRjQGYwODM2MDAwIHsKKwkJCXN0YXR1cyA9ICJva2F5IjsKKwkJfTsKKworCQl1ZGM3
OnVkY0BmMDgzNzAwMCB7CisJCQlzdGF0dXMgPSAib2theSI7CisJCX07CisKKwkJdWRjODp1ZGNA
ZjA4MzgwMDAgeworCQkJc3RhdHVzID0gIm9rYXkiOworCQl9OworCisJCXVkYzk6dWRjQGYwODM5
MDAwIHsKKwkJCXN0YXR1cyA9ICJva2F5IjsKKwkJfTsKKworCQlhZXM6YWVzQGYwODU4MDAwIHsK
KwkJCXN0YXR1cyA9ICJva2F5IjsKKwkJfTsKKworCQlzaGE6c2hhQGYwODVhMDAwIHsKKwkJCXN0
YXR1cyA9ICJva2F5IjsKKwkJfTsKKworCQlzcGkwOiBzcGlAZmIwMDAwMDAgeworCQkJc3BpLW5v
ckAwIHsKKwkJCQlwYXJ0aXRpb25zQDgwMDAwMDAwIHsKKwkJCQkJY29tcGF0aWJsZSA9ICJmaXhl
ZC1wYXJ0aXRpb25zIjsKKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJCSNzaXplLWNl
bGxzID0gPDE+OworCQkJCQliYnVib290MUAwIHsKKwkJCQkJCWxhYmVsID0gImJiLXVib290LTEi
OworCQkJCQkJcmVnID0gPDB4MDAwMDAwMCAweDgwMDAwPjsKKwkJCQkJCXJlYWQtb25seTsKKwkJ
CQkJCX07CisJCQkJCWJidWJvb3QyQDgwMDAwIHsKKwkJCQkJCWxhYmVsID0gImJiLXVib290LTIi
OworCQkJCQkJcmVnID0gPDB4MDA4MDAwMCAweDgwMDAwPjsKKwkJCQkJCXJlYWQtb25seTsKKwkJ
CQkJCX07CisJCQkJCWVudnBhcmFtQDEwMDAwMCB7CisJCQkJCQlsYWJlbCA9ICJlbnYtcGFyYW0i
OworCQkJCQkJcmVnID0gPDB4MDEwMDAwMCAweDQwMDAwPjsKKwkJCQkJCXJlYWQtb25seTsKKwkJ
CQkJCX07CisJCQkJCXNwYXJlQDE0MDAwMCB7CisJCQkJCQlsYWJlbCA9ICJzcGFyZSI7CisJCQkJ
CQlyZWcgPSA8MHgwMTQwMDAwIDB4QzAwMDA+OworCQkJCQkJfTsKKwkJCQkJa2VybmVsQDIwMDAw
MCB7CisJCQkJCQlsYWJlbCA9ICJrZXJuZWwiOworCQkJCQkJcmVnID0gPDB4MDIwMDAwMCAweDQw
MDAwMD47CisJCQkJCQl9OworCQkJCQlyb290ZnNANjAwMDAwIHsKKwkJCQkJCWxhYmVsID0gInJv
b3RmcyI7CisJCQkJCQlyZWcgPSA8MHgwNjAwMDAwIDB4NzAwMDAwPjsKKwkJCQkJCX07CisJCQkJ
CXNwYXJlMUBEMDAwMDAgeworCQkJCQkJbGFiZWwgPSAic3BhcmUxIjsKKwkJCQkJCXJlZyA9IDww
eDBEMDAwMDAgMHgyMDAwMDA+OworCQkJCQkJfTsKKwkJCQkJc3BhcmUyQDBGMDAwMDAgeworCQkJ
CQkJbGFiZWwgPSAic3BhcmUyIjsKKwkJCQkJCXJlZyA9IDwweDBGMDAwMDAgMHgyMDAwMDA+Owor
CQkJCQkJfTsKKwkJCQkJc3BhcmUzQDExMDAwMDAgeworCQkJCQkJbGFiZWwgPSAic3BhcmUzIjsK
KwkJCQkJCXJlZyA9IDwweDExMDAwMDAgMHgyMDAwMDA+OworCQkJCQkJfTsKKwkJCQkJc3BhcmU0
QDEzMDAwMDAgeworCQkJCQkJbGFiZWwgPSAic3BhcmU0IjsKKwkJCQkJCXJlZyA9IDwweDEzMDAw
MDAgMHgwPjsKKwkJCQkJfTsKKwkJCQl9OworCQkJfTsKKwkJfTsKKworCQlzcGkzOiBzcGlAYzAw
MDAwMDAgeworCQkJCXNwaS1ub3JAMCB7CisJCQkJcGFydGl0aW9uc0BBMDAwMDAwMCB7CisJCQkJ
CWNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CisJCQkJCSNhZGRyZXNzLWNlbGxzID0g
PDE+OworCQkJCQkjc2l6ZS1jZWxscyA9IDwxPjsKKwkJCQkJc3lzdGVtMUAwIHsKKwkJCQkJCWxh
YmVsID0gInNwaTMtc3lzdGVtMSI7CisJCQkJCQlyZWcgPSA8MHgwIDB4ODAwMDAwPjsKKwkJCQkJ
fTsKKwkJCQkJc3lzdGVtMkA4MDAwMDAgeworCQkJCQkJbGFiZWwgPSAic3BpMy1zeXN0ZW0yIjsK
KwkJCQkJCXJlZyA9IDwweDgwMDAwMCAweDA+OworCQkJCQl9OworCQkJCX07CisJCQl9OworCQl9
OworCisJCXNkaGNpMDogc2RoY2lAZjA4NDIwMDAgeworCQkJc3RhdHVzID0gIm9rYXkiOworCQl9
OworCisJCXNkaGNpMTogc2RoY2lAZjA4NDAwMDAgeworCQkJc3RhdHVzID0gIm9rYXkiOworCQl9
OworCisJCXBjaW1ib3g6IHBjaW1ib3hAZjA4NDgwMDAgeworCQkJc3RhdHVzID0gIm9rYXkiOwor
CQl9OworCisJCXZjZDogdmNkQGYwODEwMDAwIHsKKwkJCXN0YXR1cyA9ICJva2F5IjsKKwkJfTsK
KworCQllY2U6IGVjZUBmMDgyMDAwMCB7CisJCQlzdGF0dXMgPSAib2theSI7CisJCX07CisKKwkJ
YXBiIHsKKworCQkJd2F0Y2hkb2cxOiB3YXRjaGRvZ0A5MDFDIHsKKwkJCQlzdGF0dXMgPSAib2th
eSI7CisJCQl9OworCisJCQlybmc6IHJuZ0BiMDAwIHsKKwkJCQlzdGF0dXMgPSAib2theSI7CisJ
CQl9OworCisJCQlzZXJpYWwwOiBzZXJpYWxAMTAwMCB7CisJCQkJc3RhdHVzID0gIm9rYXkiOwor
CQkJfTsKIAotJnNlcmlhbDIgewotCXN0YXR1cyA9ICJva2F5IjsKKwkJCXNlcmlhbDE6IHNlcmlh
bEAyMDAwIHsKKwkJCQlzdGF0dXMgPSAib2theSI7CisJCQl9OworCisJCQlzZXJpYWwyOiBzZXJp
YWxAMzAwMCB7CisJCQkJc3RhdHVzID0gIm9rYXkiOworCQkJfTsKKworCQkJc2VyaWFsMzogc2Vy
aWFsQDQwMDAgeworCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJCX07CisKKwkJCW90cDpvdHBAMTg5
MDAwIHsKKwkJCQlzdGF0dXMgPSAib2theSI7CisJCQl9OworCisJCQlscGNfa2NzOiBscGNfa2Nz
QDcwMDAgeworCQkJCWtjczE6IGtjczFAMCB7CisJCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJCQl9
OworCisJCQkJa2NzMjoga2NzMkAwIHsKKwkJCQkJc3RhdHVzID0gIm9rYXkiOworCQkJCX07CisK
KwkJCQlrY3MzOiBrY3MzQDAgeworCQkJCQlzdGF0dXMgPSAib2theSI7CisJCQkJfTsKKwkJCX07
CisKKwkJCWxwY19ob3N0OiBscGNfaG9zdEA3MDAwIHsKKwkJCQlscGNfYnBjOiBscGNfYnBjQDQw
IHsKKwkJCQkJbW9uaXRvci1wb3J0cyA9IDwweDgwPjsKKwkJCQkJc3RhdHVzID0gIm9rYXkiOwor
CQkJCX07CisJCQl9OworCisJCQkvKiBsbTc1IG9uIFNWQiAqLworCQkJaTJjMDogaTJjLWJ1c0A4
MDAwMCB7CisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47
CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OworCQkJCXN0YXR1cyA9ICJva2F5IjsKKwor
CQkJCWxtNzVANDggeworCQkJCQljb21wYXRpYmxlID0gImxtNzUiOworCQkJCQlyZWcgPSA8MHg0
OD47CisJCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJCQl9OworCQkJfTsKKworCQkJLyogbG03NSBv
biBFQiAqLworCQkJaTJjMTogaTJjLWJ1c0A4MTAwMCB7CisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+
OworCQkJCXN0YXR1cyA9ICJva2F5IjsKKworCQkJCWxtNzVANDggeworCQkJCQljb21wYXRpYmxl
ID0gImxtNzUiOworCQkJCQlyZWcgPSA8MHg0OD47CisJCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJ
CQl9OworCQkJfTsKKworCQkJLyogdG1wMTAwIG9uIEVCICovCisJCQlpMmMyOiBpMmMtYnVzQDgy
MDAwIHsKKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0gIm9rYXkiOworCisJ
CQkJdG1wMTAwQDQ4IHsKKwkJCQkJY29tcGF0aWJsZSA9ICJ0bXAxMDAiOworCQkJCQlyZWcgPSA8
MHg0OD47CisJCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJCQl9OworCQkJfTsKKworCQkJLyogdG1w
MTAwIG9uIFNWQiAqLworCQkJaTJjNjogaTJjLWJ1c0A4NjAwMCB7CisJCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwx
MDAwMDA+OworCQkJCXN0YXR1cyA9ICJva2F5IjsKKworCQkJCXRtcDEwMEA0OCB7CisJCQkJCWNv
bXBhdGlibGUgPSAidG1wMTAwIjsKKwkJCQkJcmVnID0gPDB4NDg+OworCQkJCQlzdGF0dXMgPSAi
b2theSI7CisJCQkJfTsKKwkJCX07CisJCQlpMmMzOiBpMmMtYnVzQDgzMDAwIHsKKwkJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVl
bmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0gIm9rYXkiOworCQkJfTsKKworCQkJaTJjNDog
aTJjLWJ1c0A4NDAwMCB7CisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUtY2Vs
bHMgPSA8MD47CisJCQkJYnVzLWZyZXF1ZW5jeSA9IDwxMDAwMDA+OworCQkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CisJCQl9OworCisJCQlpMmM1OiBpMmMtYnVzQDg1MDAwIHsKKwkJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVlbmN5
ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzc6
IGkyYy1idXNAODcwMDAgeworCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCSNzaXplLWNl
bGxzID0gPDA+OworCQkJCWJ1cy1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKKwkJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOworCQkJfTsKKworCQkJaTJjODogaTJjLWJ1c0A4ODAwMCB7CisJCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJYnVzLWZyZXF1ZW5j
eSA9IDwxMDAwMDA+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlpMmM5
OiBpMmMtYnVzQDg5MDAwIHsKKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1j
ZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzEwOiBpMmMtYnVzQDhhMDAwIHsKKwkJCQkjYWRk
cmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVl
bmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWky
YzExOiBpMmMtYnVzQDhiMDAwIHsKKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6
ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJCWkyYzE0OiBpMmMtYnVzQDhlMDAwIHsKKwkJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJl
cXVlbmN5ID0gPDEwMDAwMD47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCX07CisKKwkJ
CWkyYzE1OiBpMmMtYnVzQDhmMDAwIHsKKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkj
c2l6ZS1jZWxscyA9IDwwPjsKKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEwMDAwMD47CisJCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsgICAgICAgICAgICAgICAvKiBTVkIgY29uZmxpY3Qgd2l0aCBwc3Bp
MiBjcyBncGlvMjBvX3BpbnMgKi8KKwkJCX07CisKKwkJCXB3bV9mYW46cHdtLWZhbi1jb250cm9s
bGVyQDEwMzAwMCB7CisJCQkJc3RhdHVzID0gIm9rYXkiOworCQkJCWZhbkAwIHsKKwkJCQkJcmVn
ID0gPDB4MDA+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDAwIDB4MDE+OworCQkJ
CQljb29saW5nLWxldmVscyA9IDwxMjcgMjU1PjsKKwkJCQl9OworCQkJCWZhbkAxIHsKKwkJCQkJ
cmVnID0gPDB4MDE+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDAyIDB4MDM+Owor
CQkJCQljb29saW5nLWxldmVscyA9IC9iaXRzLyA4IDwxMjcgMjU1PjsKKwkJCQl9OworCQkJCWZh
bkAyIHsKKwkJCQkJcmVnID0gPDB4MDI+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDww
eDA0IDB4MDU+OworCQkJCQljb29saW5nLWxldmVscyA9IC9iaXRzLyA4IDwxMjcgMjU1PjsKKwkJ
CQl9OworCQkJCWZhbkAzIHsKKwkJCQkJcmVnID0gPDB4MDM+OworCQkJCQlmYW4tdGFjaC1jaCA9
IC9iaXRzLyA4IDwweDA2IDB4MDc+OworCQkJCQljb29saW5nLWxldmVscyA9IC9iaXRzLyA4IDwx
MjcgMjU1PjsKKwkJCQl9OworCQkJCWZhbkA0IHsKKwkJCQkJcmVnID0gPDB4MDQ+OworCQkJCQlm
YW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDA4IDB4MDk+OworCQkJCQljb29saW5nLWxldmVscyA9
IC9iaXRzLyA4IDwxMjcgMjU1PjsKKwkJCQl9OworCQkJCWZhbkA1IHsKKwkJCQkJcmVnID0gPDB4
MDU+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDBBIDB4MEI+OworCQkJCQljb29s
aW5nLWxldmVscyA9IC9iaXRzLyA4IDwxMjcgMjU1PjsKKwkJCQl9OworCQkJCWZhbkA2IHsKKwkJ
CQkJcmVnID0gPDB4MDY+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4IDwweDBDIDB4MEQ+
OworCQkJCQljb29saW5nLWxldmVscyA9IC9iaXRzLyA4IDwxMjcgMjU1PjsKKwkJCQl9OworCQkJ
CWZhbkA3IHsKKwkJCQkJcmVnID0gPDB4MDc+OworCQkJCQlmYW4tdGFjaC1jaCA9IC9iaXRzLyA4
IDwweDBFIDB4MEY+OworCQkJCQljb29saW5nLWxldmVscyA9IC9iaXRzLyA4IDwxMjcgMjU1PjsK
KwkJCQl9OworCQkJfTsKKworCQkJLyogZXhhbXBsZSBmb3IgZnV0dXJlIHBzcGkgYmluZGluZyAq
LworCQkJLyoKKwkJCXBzcGk6IHBzcGlAMCB7CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKKwkJCQlwaW5jdHJsLTAgPSA8JnBzcGkxX3BpbnMgJnBzcGkyX3BpbnMgCisJCQkJCSZncGlv
MjBvX3BpbnMgJmdwaW8yMDNvX3BpbnM+OworCQkJCWNzLWdwaW9zID0gPCZncGlvIDIwIDE+LCA8
JmdwaW8gMjAzIDE+OworCQkJCXN0YXR1cyA9ICJva2F5IjsKKwkJCX07CisJCQkqLworCQl9Owor
CX07CisKKwlwaW5jdHJsOiBwaW5jdHJsQGYwODAwMDAwIHsKKwkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKKwkJcGluY3RybC0wID0gPAkmaW94MV9waW5zCisJCQkJJmdwaW84X3BpbnMKKwkJ
CQkmZ3BpbzlvX3BpbnMKKwkJCQkmZ3BpbzEwX3BpbnMKKwkJCQkmZ3BpbzExb19waW5zCisJCQkJ
JmdwaW8xNl9waW5zCisJCQkJJmdwaW8yNG9fcGlucworCQkJCSZncGlvMjVvbF9waW5zCisJCQkJ
JmdwaW8zMm9fcGlucworCQkJCSZqdGFnMl9waW5zCisJCQkJJmdwaW82MW9fcGlucworCQkJCSZn
cGlvNjJvX3BpbnMKKwkJCQkmZ3BpbzYzb19waW5zCisJCQkJJmdwaW82NG9fcGlucyAgICAgIC8q
IFNWQiBwc3BpMSBlbmFibGUgKi8KKwkJCQkmZ3BpbzgwX3BpbnMKKwkJCQkmZ3BpbzgxX3BpbnMK
KwkJCQkmZ3BpbzgyX3BpbnMKKwkJCQkmZ3BpbzgzX3BpbnMKKwkJCQkmbHBjX3BpbnMKKwkJCQkm
Z3BpbzEzMm9fcGlucworCQkJCSZncGlvMTMzX3BpbnMKKwkJCQkmZ3BpbzEzNF9waW5zCisJCQkJ
JmdwaW8xMzVfcGlucworCQkJCSZncGlvMTQ0X3BpbnMKKwkJCQkmZ3BpbzE0NV9waW5zCisJCQkJ
JmdwaW8xNDZfcGlucworCQkJCSZncGlvMTQ3X3BpbnMKKwkJCQkmZ3BpbzE2MF9waW5zCisJCQkJ
JmdwaW8xNjJfcGlucworCQkJCSZncGlvMTY4X3BpbnMKKwkJCQkmZ3BpbzE2OV9waW5zCisJCQkJ
JmdwaW8xNzBfcGlucworCQkJCSZncGlvMTg3b19waW5zCisJCQkJJmdwaW8xOTBfcGlucworCQkJ
CSZncGlvMTkxb19waW5zCisJCQkJJmdwaW8xOTJvX3BpbnMKKwkJCQkmZ3BpbzE5N29sX3BpbnMK
KwkJCQkmZGRjX3BpbnMKKwkJCQkmZ3BpbzIxOF9waW5zCisJCQkJJmdwaW8yMTlvbF9waW5zCisJ
CQkJJmdwaW8yMjBvbF9waW5zCisJCQkJJmdwaW8yMjFvX3BpbnMKKwkJCQkmZ3BpbzIyMl9waW5z
CisJCQkJJmdwaW8yMjNvbF9waW5zCisJCQkJJnNwaXhfcGlucworCQkJCSZncGlvMjI4b2xfcGlu
cworCQkJCSZncGlvMjMxb19waW5zCisJCQkJJmdwaW8yNTVfcGlucz47CisJfTsKIH07CiAKLSZz
ZXJpYWwzIHsKLQlzdGF0dXMgPSAib2theSI7CismZ2NyIHsKKwlzZXJpYWxfcG9ydF9tdXg6IG11
eC1jb250cm9sbGVyIHsKKwljb21wYXRpYmxlID0gIm1taW8tbXV4IjsKKwkjbXV4LWNvbnRyb2wt
Y2VsbHMgPSA8MT47CisKKwltdXgtcmVnLW1hc2tzID0gPDB4MzggMHgwNz47CisJaWRsZS1zdGF0
ZXMgPSA8Mj47IC8qIFNlcmlhbCBwb3J0IG1vZGUgMyAodGFrZW92ZXIpICovCisJfTsKIH07CmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAtZ3Bpby5kdHNpIGIv
YXJjaC9hcm0vYm9vdC9kdHMvbnV2b3Rvbi1ucGNtNzUwLWdwaW8uZHRzaQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmI5Njc1ZmJjZTRlNgotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC1ncGlvLmR0c2kKQEAgLTAsMCAr
MSwyMDMxIEBACisvKgorICogRFRTaSBmaWxlIGZvciB0aGUgTlBDTTc1MCBwaW4gY29udHJvbGxl
cgorICoKKyAqIENvcHlyaWdodCAoYykgMjAxNC0yMDE3IE51dm90b24gVGVjaG5vbG9neSBjb3Jw
b3JhdGlvbi4KKyAqCisgKiBSZWxlYXNlZCB1bmRlciB0aGUgR1BMdjIgb25seS4KKyAqIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisgKgorICogaHR0cDovL3d3dy5vcGVuc291cmNl
Lm9yZy9saWNlbnNlcy9ncGwtbGljZW5zZS5odG1sCisgKiBodHRwOi8vd3d3LmdudS5vcmcvY29w
eWxlZnQvZ3BsLmh0bWwKKyAqLworCisKKy8geworCXBpbmN0cmw6IHBpbmN0cmxAZjA4MDAwMDAg
eworCQlncGlvMG9fcGluczogZ3BpbzBvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMC9JT1gxREki
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8xX3BpbnM6
IGdwaW8xLXBpbnMgeworCQkJcGlucyA9ICJHUElPMS9JT1gxTEQiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMl9waW5zOiBncGlvMi1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzIvSU9YMUNLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJs
ZTsKKwkJfTsKKwkJZ3BpbzJvX3BpbnM6IGdwaW8yby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIv
SU9YMUNLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dF9oaWdoOworCQl9OworCQlncGlv
M19waW5zOiBncGlvMy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzMvSU9YMUQwIjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzNvX3BpbnM6IGdwaW8zby1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzMvSU9YMUQwIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1oaWdoOworCQl9OworCQlncGlvNF9waW5zOiBncGlvNC1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzQvSU9YMkRJL1NNQjFEU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJs
ZTsKKwkJfTsKKwkJZ3BpbzVfcGluczogZ3BpbzUtcGlucyB7CisJCQlwaW5zID0gIkdQSU81L0lP
WDJMRC9TTUIxRFNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW82X3BpbnM6IGdwaW82LXBpbnMgeworCQkJcGlucyA9ICJHUElPNi9JT1gyQ0svU01C
MkRTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlv
Nm9fcGluczogZ3BpbzZvLXBpbnMgeworCQkJcGlucyA9ICJHUElPNi9JT1gyQ0svU01CMkRTREEi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW82b2xfcGlu
czogZ3BpbzZvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzYvSU9YMkNLL1NNQjJEU0RBIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW83X3BpbnM6IGdwaW83
LXBpbnMgeworCQkJcGlucyA9ICJHUElPNy9JT1gyRDAvU01CMkRTQ0wiOworCQkJYmlhcy1kaXNh
YmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvN29fcGluczogZ3BpbzdvLXBpbnMg
eworCQkJcGlucyA9ICJHUElPNy9JT1gyRDAvU01CMkRTQ0wiOworCQkJYmlhcy1kaXNhYmxlOwor
CQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW83b2xfcGluczogZ3BpbzdvbC1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzcvSU9YMkQwL1NNQjJEU0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1sb3c7CisJCX07CisJCWdwaW84X3BpbnM6IGdwaW84LXBpbnMgeworCQkJcGlucyA9ICJH
UElPOC9MS0dQTzEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9Owor
CQlncGlvOG9sX3BpbnM6IGdwaW84b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU84L0xLR1BPMSI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvOV9waW5zOiBn
cGlvOS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzkvTEtHUE8yIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzlvX3BpbnM6IGdwaW85by1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzkvTEtHUE8yIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdo
OworCQl9OworCQlncGlvOW9sX3BpbnM6IGdwaW85b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU85
L0xLR1BPMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlv
MTBfcGluczogZ3BpbzEwLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTAvSU9YSExEIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEwb2xfcGluczogZ3Bp
bzEwb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMC9JT1hITEQiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzExX3BpbnM6IGdwaW8xMS1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzExL0lPWEhDSyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW8xMW9fcGluczogZ3BpbzExby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJ
TzExL0lPWEhDSyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJ
Z3BpbzExb2xfcGluczogZ3BpbzExb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMS9JT1hIQ0si
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzEyX3BpbnM6
IGdwaW8xMi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyL0dTUElDSy9TTUI1QlNDTCI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMm9fcGluczogZ3Bp
bzEyby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyL0dTUElDSy9TTUI1QlNDTCI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzEyb2xfcGluczogZ3BpbzEy
b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMi9HU1BJQ0svU01CNUJTQ0wiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzEzX3BpbnM6IGdwaW8xMy1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzEzL0dTUElETy9TTUI1QlNEQSI7CisJCQliaWFzLWRpc2FibGU7
CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xM29sX3BpbnM6IGdwaW8xM29sLXBpbnMg
eworCQkJcGlucyA9ICJHUElPMTMvR1NQSURPL1NNQjVCU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8xNF9waW5zOiBncGlvMTQtcGlucyB7CisJCQlw
aW5zID0gIkdQSU8xNC9HU1BJREkvU01CNUNTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5w
dXQtZW5hYmxlOworCQl9OworCQlncGlvMTRvbF9waW5zOiBncGlvMTRvbC1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzE0L0dTUElESS9TTUI1Q1NDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRw
dXQtbG93OworCQl9OworCQlncGlvMTVfcGluczogZ3BpbzE1LXBpbnMgeworCQkJcGlucyA9ICJH
UElPMTUvR1NQSUNTL1NNQjVDU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJs
ZTsKKwkJfTsKKwkJZ3BpbzE1b19waW5zOiBncGlvMTVvLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTUvR1NQSUNTL1NNQjVDU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOwor
CQl9OworCQlncGlvMTZfcGluczogZ3BpbzE2LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTYvTEtH
UE8wIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE2
b19waW5zOiBncGlvMTZvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTYvTEtHUE8wIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMTZvbF9waW5zOiBncGlv
MTZvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE2L0xLR1BPMCI7CisJCQliaWFzLWRpc2FibGU7
CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTdfcGluczogZ3BpbzE3LXBpbnMgeworCQkJ
cGlucyA9ICJHUElPMTcvUFNQSTJESS9TTUI0REVOIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlu
cHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE3b19waW5zOiBncGlvMTdvLXBpbnMgeworCQkJcGlu
cyA9ICJHUElPMTcvUFNQSTJESS9TTUI0REVOIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1
dC1oaWdoOworCQl9OworCQlncGlvMTdvbF9waW5zOiBncGlvMTdvbC1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzE3L1BTUEkyREkvU01CNERFTiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQt
bG93OworCQl9OworCQlncGlvMThfcGluczogZ3BpbzE4LXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTgvUFNQSTJEMC9TTUI0QlNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7
CisJCX07CisJCWdwaW8xOG9sX3BpbnM6IGdwaW8xOG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTgvUFNQSTJEMC9TTUI0QlNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93Owor
CQl9OworCQlncGlvMTlfcGluczogZ3BpbzE5LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTkvUFNQ
STJDSy9TTUI0QlNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW8xOW9sX3BpbnM6IGdwaW8xOW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTkvUFNQ
STJDSy9TTUI0QlNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9Owor
CQlncGlvMjBfcGluczogZ3BpbzIwLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjAvU01CNENTREEv
U01CMTVTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvMjBvX3BpbnM6IGdwaW8yMG8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMC9TTUI0Q1NEQS9T
TUIxNVNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3Bp
bzIwb2xfcGluczogZ3BpbzIwb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMC9TTUI0Q1NEQS9T
TUIxNVNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlv
MjFfcGluczogZ3BpbzIxLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjEvU01CNENTQ0wvU01CMTVT
Q0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjFv
bF9waW5zOiBncGlvMjFvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIxL1NNQjRDU0NML1NNQjE1
U0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMl9w
aW5zOiBncGlvMjItcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMi9TTUI0RFNEQS9TTUIxNFNEQSI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8yMm9sX3Bp
bnM6IGdwaW8yMm9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjIvU01CNERTREEvU01CMTRTREEi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzIzX3BpbnM6
IGdwaW8yMy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIzL1NNQjREU0NML1NNQjE0U0NMIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIzb2xfcGluczog
Z3BpbzIzb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMy9TTUI0RFNDTC9TTUIxNFNDTCI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMjRfcGluczogZ3Bp
bzI0LXBpbnMgeworCQkJcGlucyA9ICJHUElPMjQvSU9YSERPIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzI0b19waW5zOiBncGlvMjRvLXBpbnMgewor
CQkJcGlucyA9ICJHUElPMjQvSU9YSERPIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1o
aWdoOworCQl9OworCQlncGlvMjRvbF9waW5zOiBncGlvMjRvbC1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzI0L0lPWEhETyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9Owor
CQlncGlvMjVfcGluczogZ3BpbzI1LXBpbnMgeworCQkJcGlucyA9ICJHUElPMjUvSU9YSERJIjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzI1b19waW5z
OiBncGlvMjVvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjUvSU9YSERJIjsKKwkJCWJpYXMtZGlz
YWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjVvbF9waW5zOiBncGlvMjVvbC1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzI1L0lPWEhESSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlv
dXRwdXQtbG93OworCQl9OworCQlncGlvMjZfcGluczogZ3BpbzI2LXBpbnMgeworCQkJcGlucyA9
ICJHUElPMjYvU01CNVNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW8yN19waW5zOiBncGlvMjctcGlucyB7CisJCQlwaW5zID0gIkdQSU8yNy9TTUI1
U0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzMy
X3BpbnM6IGdwaW8zMi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzMyL25TUEkwQ1MxIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzMyb19waW5zOiBncGlv
MzJvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMzIvblNQSTBDUzEiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8zMm9sX3BpbnM6IGdwaW8zMm9sLXBpbnMg
eworCQkJcGlucyA9ICJHUElPMzIvblNQSTBDUzEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0
cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzM3X3BpbnM6IGdwaW8zNy1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzM3L1NNQjNDU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3BpbzM3b19waW5zOiBncGlvMzdvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMzcvU01C
M0NTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8z
N29sX3BpbnM6IGdwaW8zN29sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMzcvU01CM0NTREEiOwor
CQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzM4X3BpbnM6IGdw
aW8zOC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzM4L1NNQjNDU0NMIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzM4b19waW5zOiBncGlvMzhvLXBpbnMg
eworCQkJcGlucyA9ICJHUElPMzgvU01CM0NTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0
cHV0LWhpZ2g7CisJCX07CisJCWdwaW8zOG9sX3BpbnM6IGdwaW8zOG9sLXBpbnMgeworCQkJcGlu
cyA9ICJHUElPMzgvU01CM0NTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsK
KwkJfTsKKwkJZ3BpbzM5X3BpbnM6IGdwaW8zOS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzM5L1NN
QjNCU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bp
bzM5b19waW5zOiBncGlvMzlvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMzkvU01CM0JTREEiOwor
CQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8zOW9sX3BpbnM6
IGdwaW8zOW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMzkvU01CM0JTREEiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzQwX3BpbnM6IGdwaW80MC1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzQwL1NNQjNCU0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlu
cHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzQwb19waW5zOiBncGlvNDBvLXBpbnMgeworCQkJcGlu
cyA9ICJHUElPNDAvU01CM0JTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7
CisJCX07CisJCWdwaW80MG9sX3BpbnM6IGdwaW80MG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElP
NDAvU01CM0JTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJ
Z3BpbzQxX3BpbnM6IGdwaW80MS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzQxL0JTUFJYRCI7CisJ
CQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW80Ml9waW5zOiBncGlvNDItcGlucyB7CisJCQlw
aW5zID0gIkdQTzQyL0JTUFRYRC9TVFJBUDExIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0
LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzQzX3BpbnM6IGdwaW80My1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzQzL1JYRDEvSlRNUzIvQlUxUlhEIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVu
YWJsZTsKKwkJfTsKKwkJZ3BpbzQ0X3BpbnM6IGdwaW80NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJ
TzQ0L25DVFMxL0pUREkyL0JVMUNUUyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW80NV9waW5zOiBncGlvNDUtcGlucyB7CisJCQlwaW5zID0gIkdQSU80
NS9uRENEMS9KVERPMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW80Nl9waW5zOiBncGlvNDYtcGlucyB7CisJCQlwaW5zID0gIkdQSU80Ni9uRFNSMS9K
VENLMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW80
N19waW5zOiBncGlvNDctcGlucyB7CisJCQlwaW5zID0gIkdQSU80Ny9uUkkxL0pDUF9SRFkyIjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzQ4X3BpbnM6
IGdwaW80OC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzQ4L1RYRDIvQlNQVFhEIjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzQ5X3BpbnM6IGdwaW80OS1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzQ5L1JYRDIvQlNQUlhEIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzUwX3BpbnM6IGdwaW81MC1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzUwL25DVFMyIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJs
ZTsKKwkJfTsKKwkJZ3BpbzUwb2xfcGluczogZ3BpbzUwb2wtcGlucyB7CisJCQlwaW5zID0gIkdQ
SU81MC9uQ1RTMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQln
cGlvNTFfcGluczogZ3BpbzUxLXBpbnMgeworCQkJcGlucyA9ICJHUE81MS9uUlRTMi9TVFJBUDIi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvNTFvX3Bp
bnM6IGdwaW81MW8tcGlucyB7CisJCQlwaW5zID0gIkdQTzUxL25SVFMyL1NUUkFQMiI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzUyX3BpbnM6IGdwaW81
Mi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzUyL25EQ0QyIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzUyb2xfcGluczogZ3BpbzUyb2wtcGlucyB7CisJ
CQlwaW5zID0gIkdQSU81Mi9uRENEMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93
OworCQl9OworCQlncGlvNTNfcGluczogZ3BpbzUzLXBpbnMgeworCQkJcGlucyA9ICJHUE81My9u
RFRSMl9CT1VUMi9TVFJBUDEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOwor
CQl9OworCQlncGlvNTNvX3BpbnM6IGdwaW81M28tcGlucyB7CisJCQlwaW5zID0gIkdQTzUzL25E
VFIyX0JPVVQyL1NUUkFQMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJ
fTsKKwkJZ3BpbzU0X3BpbnM6IGdwaW81NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzU0L25EU1Iy
IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzU0b2xf
cGluczogZ3BpbzU0b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU81NC9uRFNSMiI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvNTVfcGluczogZ3BpbzU1LXBp
bnMgeworCQkJcGlucyA9ICJHUElPNTUvblJJMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1
dC1lbmFibGU7CisJCX07CisJCWdwaW81NW9sX3BpbnM6IGdwaW81NW9sLXBpbnMgeworCQkJcGlu
cyA9ICJHUElPNTUvblJJMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9
OworCQlncGlvNTZfcGluczogZ3BpbzU2LXBpbnMgeworCQkJcGlucyA9ICJHUElPNTYvUjFSWEVS
UiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW81N19w
aW5zOiBncGlvNTctcGlucyB7CisJCQlwaW5zID0gIkdQSU81Ny9SMU1EQyI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW81N29sX3BpbnM6IGdwaW81N29s
LXBpbnMgeworCQkJcGlucyA9ICJHUElPNTcvUjFNREMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJ
b3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzU4X3BpbnM6IGdwaW81OC1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzU4L1IxTURJTyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW81OG9sX3BpbnM6IGdwaW81OG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPNTgv
UjFNRElPIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW81
OV9waW5zOiBncGlvNTktcGlucyB7CisJCQlwaW5zID0gIkdQSU81OS9TTUIzRFNEQSI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW81OW9fcGluczogZ3Bp
bzU5by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzU5L1NNQjNEU0RBIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvNTlvbF9waW5zOiBncGlvNTlvbC1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzU5L1NNQjNEU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1sb3c7CisJCX07CisJCWdwaW82MF9waW5zOiBncGlvNjAtcGlucyB7CisJCQlwaW5zID0g
IkdQSU82MC9TTUIzRFNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW82MG9fcGluczogZ3BpbzYwby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzYwL1NN
QjNEU0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlv
NjBvbF9waW5zOiBncGlvNjBvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzYwL1NNQjNEU0NMIjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW82MV9waW5zOiBn
cGlvNjEtcGlucyB7CisJCQlwaW5zID0gIkdQTzYxL25EVFIxX0JPVVQxL1NUUkFQNiI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW82MW9fcGluczogZ3Bp
bzYxby1waW5zIHsKKwkJCXBpbnMgPSAiR1BPNjEvbkRUUjFfQk9VVDEvU1RSQVA2IjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvNjJfcGluczogZ3BpbzYy
LXBpbnMgeworCQkJcGlucyA9ICJHUE82Mi9uUlRTVDEvU1RSQVA1IjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzYyb19waW5zOiBncGlvNjJvLXBpbnMg
eworCQkJcGlucyA9ICJHUE82Mi9uUlRTVDEvU1RSQVA1IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CW91dHB1dC1oaWdoOworCQl9OworCQlncGlvNjNfcGluczogZ3BpbzYzLXBpbnMgeworCQkJcGlu
cyA9ICJHUE82My9UWEQxL1NUUkFQNCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW82M29fcGluczogZ3BpbzYzby1waW5zIHsKKwkJCXBpbnMgPSAiR1BP
NjMvVFhEMS9TVFJBUDQiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07
CisJCWdwaW82NF9waW5zOiBncGlvNjQtcGlucyB7CisJCQlwaW5zID0gIkdQSU82NC9GQU5JTjAi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvNjRvX3Bp
bnM6IGdwaW82NG8tcGlucyB7CisJCQlwaW5zID0gIkdQSU82NC9GQU5JTjAiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW82NV9waW5zOiBncGlvNjUtcGlu
cyB7CisJCQlwaW5zID0gIkdQSU82NS9GQU5JTjEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5w
dXQtZW5hYmxlOworCQl9OworCQlncGlvNjZfcGluczogZ3BpbzY2LXBpbnMgeworCQkJcGlucyA9
ICJHUElPNjYvRkFOSU4yIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3BpbzY3X3BpbnM6IGdwaW82Ny1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzY3L0ZBTklO
MyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW82OF9w
aW5zOiBncGlvNjgtcGlucyB7CisJCQlwaW5zID0gIkdQSU82OC9GQU5JTjQiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvNjlfcGluczogZ3BpbzY5LXBp
bnMgeworCQkJcGlucyA9ICJHUElPNjkvRkFOSU41IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlu
cHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzY5b2xfcGluczogZ3BpbzY5b2wtcGlucyB7CisJCQlw
aW5zID0gIkdQSU82OS9GQU5JTjUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsK
KwkJfTsKKwkJZ3BpbzcwX3BpbnM6IGdwaW83MC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzcwL0ZB
TklONiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW83
MV9waW5zOiBncGlvNzEtcGlucyB7CisJCQlwaW5zID0gIkdQSU83MS9GQU5JTjciOworCQkJYmlh
cy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvNzJfcGluczogZ3Bpbzcy
LXBpbnMgeworCQkJcGlucyA9ICJHUElPNzIvRkFOSU44IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzcyb2xfcGluczogZ3Bpbzcyb2wtcGlucyB7CisJ
CQlwaW5zID0gIkdQSU83Mi9GQU5JTjgiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxv
dzsKKwkJfTsKKwkJZ3BpbzczX3BpbnM6IGdwaW83My1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzcz
L0ZBTklOOSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdw
aW83M29sX3BpbnM6IGdwaW83M29sLXBpbnMgeworCQkJcGlucyA9ICJHUElPNzMvRkFOSU45IjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW83NF9waW5zOiBn
cGlvNzQtcGlucyB7CisJCQlwaW5zID0gIkdQSU83NC9GQU5JTjEwIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzc0b2xfcGluczogZ3Bpbzc0b2wtcGlu
cyB7CisJCQlwaW5zID0gIkdQSU83NC9GQU5JTjEwIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1sb3c7CisJCX07CisJCWdwaW83NV9waW5zOiBncGlvNzUtcGlucyB7CisJCQlwaW5zID0g
IkdQSU83NS9GQU5JTjExIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3Bpbzc1b2xfcGluczogZ3Bpbzc1b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU83NS9G
QU5JTjExIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW83
Nl9waW5zOiBncGlvNzYtcGlucyB7CisJCQlwaW5zID0gIkdQSU83Ni9GQU5JTjEyIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzc2b2xfcGluczogZ3Bp
bzc2b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU83Ni9GQU5JTjEyIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW83N19waW5zOiBncGlvNzctcGlucyB7CisJ
CQlwaW5zID0gIkdQSU83Ny9GQU5JTjEzIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVu
YWJsZTsKKwkJfTsKKwkJZ3Bpbzc3b2xfcGluczogZ3Bpbzc3b2wtcGlucyB7CisJCQlwaW5zID0g
IkdQSU83Ny9GQU5JTjEzIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07
CisJCWdwaW83OF9waW5zOiBncGlvNzgtcGlucyB7CisJCQlwaW5zID0gIkdQSU83OC9GQU5JTjE0
IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzc4b2xf
cGluczogZ3Bpbzc4b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU83OC9GQU5JTjE0IjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW83OV9waW5zOiBncGlvNzkt
cGlucyB7CisJCQlwaW5zID0gIkdQSU83OS9GQU5JTjE1IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzc5b2xfcGluczogZ3Bpbzc5b2wtcGlucyB7CisJ
CQlwaW5zID0gIkdQSU83OS9GQU5JTjE1IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1s
b3c7CisJCX07CisJCWdwaW84MF9waW5zOiBncGlvODAtcGlucyB7CisJCQlwaW5zID0gIkdQSU84
MC9QV00wIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bp
bzgxX3BpbnM6IGdwaW84MS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzgxL1BXTTEiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvODJfcGluczogZ3Bpbzgy
LXBpbnMgeworCQkJcGlucyA9ICJHUElPODIvUFdNMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlp
bnB1dC1lbmFibGU7CisJCX07CisJCWdwaW84M19waW5zOiBncGlvODMtcGlucyB7CisJCQlwaW5z
ID0gIkdQSU84My9QV00zIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3Bpbzg0X3BpbnM6IGdwaW84NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzg0L1IyVFhE
MCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW84NG9f
cGluczogZ3Bpbzg0b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU84NC9SMlRYRDAiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW84NV9waW5zOiBncGlvODUt
cGlucyB7CisJCQlwaW5zID0gIkdQSU84NS9SMlRYRDEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJ
aW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvODVvX3BpbnM6IGdwaW84NW8tcGlucyB7CisJCQlw
aW5zID0gIkdQSU84NS9SMlRYRDEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7
CisJCX07CisJCWdwaW84Nl9waW5zOiBncGlvODYtcGlucyB7CisJCQlwaW5zID0gIkdQSU84Ni9S
MlRYRU4iOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlv
ODZvX3BpbnM6IGdwaW84Nm8tcGlucyB7CisJCQlwaW5zID0gIkdQSU84Ni9SMlRYRU4iOworCQkJ
Ymlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW84N19waW5zOiBncGlv
ODctcGlucyB7CisJCQlwaW5zID0gIkdQSU84Ny9SMlJYRDAiOworCQkJYmlhcy1kaXNhYmxlOwor
CQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvODdvX3BpbnM6IGdwaW84N28tcGlucyB7CisJ
CQlwaW5zID0gIkdQSU84Ny9SMlJYRDAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhp
Z2g7CisJCX07CisJCWdwaW84OF9waW5zOiBncGlvODgtcGlucyB7CisJCQlwaW5zID0gIkdQSU84
OC9SMlJYRDEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvODhvbF9waW5zOiBncGlvODhvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzg4L1IyUlhEMSI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvODlfcGluczog
Z3Bpbzg5LXBpbnMgeworCQkJcGlucyA9ICJHUElPODkvUjJDUlNEViI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW84OW9sX3BpbnM6IGdwaW84OW9sLXBp
bnMgeworCQkJcGlucyA9ICJHUElPODkvUjJDUlNEViI7CisJCQliaWFzLWRpc2FibGU7CisJCQlv
dXRwdXQtbG93OworCQl9OworCQlncGlvOTBfcGluczogZ3BpbzkwLXBpbnMgeworCQkJcGlucyA9
ICJHUElPOTAvUjJSWEVSUiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW85MG9fcGluczogZ3BpbzkwbzAtcGlucyB7CisJCQlwaW5zID0gIkdQSU85MC9S
MlJYRVJSIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlv
OTBvbF9waW5zOiBncGlvOTBvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzkwL1IyUlhFUlIiOwor
CQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzkxX3BpbnM6IGdw
aW85MS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzkxL1IyTURDIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bpbzkxb19waW5zOiBncGlvOTFvLXBpbnMgewor
CQkJcGlucyA9ICJHUElPOTEvUjJNREMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhp
Z2g7CisJCX07CisJCWdwaW85MW9sX3BpbnM6IGdwaW85MW9sLXBpbnMgeworCQkJcGlucyA9ICJH
UElPOTEvUjJNREMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJ
Z3BpbzkyX3BpbnM6IGdwaW85Mi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzkyL1IyTURJTyI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW85Mm9fcGluczog
Z3Bpbzkyby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzkyL1IyTURJTyI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3Bpbzkyb2xfcGluczogZ3Bpbzkyb2wtcGlu
cyB7CisJCQlwaW5zID0gIkdQSU85Mi9SMk1ESU8iOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0
cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzkzX3BpbnM6IGdwaW85My1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzkzL0dBMjAvU01CNURTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxl
OworCQl9OworCQlncGlvOTNvbF9waW5zOiBncGlvOTNvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJ
TzkzL0dBMjAvU01CNURTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJ
fTsKKwkJZ3Bpbzk0X3BpbnM6IGdwaW85NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzk0L25LQlJT
VC9TTUI1RFNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJ
CWdwaW85NG9fcGluczogZ3Bpbzk0by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzk0L25LQlJTVC9T
TUI1RFNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3Bp
bzk1X3BpbnM6IGdwaW85NS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzk1L25MUkVTRVQvbkVTUElS
U1QiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvOTZf
cGluczogZ3Bpbzk2LXBpbnMgeworCQkJcGlucyA9ICJHUElPOTYvUkcxVFhEMCI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW85Nm9sX3BpbnM6IGdwaW85
Nm9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPOTYvUkcxVFhEMCI7CisJCQliaWFzLWRpc2FibGU7
CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvOTdfcGluczogZ3Bpbzk3LXBpbnMgeworCQkJ
cGlucyA9ICJHUElPOTcvUkcxVFhEMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW85N29sX3BpbnM6IGdwaW85N29sLXBpbnMgeworCQkJcGlucyA9ICJH
UElPOTcvUkcxVFhEMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9Owor
CQlncGlvOThfcGluczogZ3Bpbzk4LXBpbnMgeworCQkJcGlucyA9ICJHUElPOTgvUkcxVFhEMiI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW85OG9sX3Bp
bnM6IGdwaW85OG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPOTgvUkcxVFhEMiI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvOTlfcGluczogZ3Bpbzk5LXBp
bnMgeworCQkJcGlucyA9ICJHUElPOTkvUkcxVFhEMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlp
bnB1dC1lbmFibGU7CisJCX07CisJCWdwaW85OW9sX3BpbnM6IGdwaW85OW9sLXBpbnMgeworCQkJ
cGlucyA9ICJHUElPOTkvUkcxVFhEMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93
OworCQl9OworCQlncGlvMTAwX3BpbnM6IGdwaW8xMDAtcGlucyB7CisJCQlwaW5zID0gIkdQSU8x
MDAvUkcxVFhDIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJ
Z3BpbzEwMG9sX3BpbnM6IGdwaW8xMDBvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEwMC9SRzFU
WEMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzEwMV9w
aW5zOiBncGlvMTAxLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTAxL1JHMVRYQ1RMIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEwMW9sX3BpbnM6IGdw
aW8xMDFvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEwMS9SRzFUWENUTCI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTAyX3BpbnM6IGdwaW8xMDItcGlu
cyB7CisJCQlwaW5zID0gIkdQSU8xMDIvUkcxUlhEMCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlp
bnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMDJvbF9waW5zOiBncGlvMTAyb2wtcGlucyB7CisJ
CQlwaW5zID0gIkdQSU8xMDIvUkcxUlhEMCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQt
bG93OworCQl9OworCQlncGlvMTAzX3BpbnM6IGdwaW8xMDMtcGlucyB7CisJCQlwaW5zID0gIkdQ
SU8xMDMvUkcxUlhEMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW8xMDNvbF9waW5zOiBncGlvMTAzb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMDMv
UkcxUlhEMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlv
MTA0X3BpbnM6IGdwaW8xMDQtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMDQvUkcxUlhEMiI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMDRvbF9waW5z
OiBncGlvMTA0b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMDQvUkcxUlhEMiI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTA1X3BpbnM6IGdwaW8xMDUt
cGlucyB7CisJCQlwaW5zID0gIkdQSU8xMDUvUkcxUlhEMyI7CisJCQliaWFzLWRpc2FibGU7CisJ
CQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMDVvbF9waW5zOiBncGlvMTA1b2wtcGlucyB7
CisJCQlwaW5zID0gIkdQSU8xMDUvUkcxUlhEMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRw
dXQtbG93OworCQl9OworCQlncGlvMTA2X3BpbnM6IGdwaW8xMDYtcGlucyB7CisJCQlwaW5zID0g
IkdQSU8xMDYvUkcxUlhDIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3BpbzEwNm9sX3BpbnM6IGdwaW8xMDZvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEw
Ni9SRzFSWEMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3Bp
bzEwN19waW5zOiBncGlvMTA3LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTA3L1JHMVJYQ1RMIjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEwN29sX3Bp
bnM6IGdwaW8xMDdvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEwNy9SRzFSWENUTCI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTA4X3BpbnM6IGdwaW8x
MDgtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xMDgvUkcxTURDIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEwOG9sX3BpbnM6IGdwaW8xMDhvbC1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzEwOC9SRzFNREMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0
cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzEwOV9waW5zOiBncGlvMTA5LXBpbnMgeworCQkJcGlucyA9
ICJHUElPMTA5L1JHMU1ESU8iOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOwor
CQl9OworCQlncGlvMTA5b2xfcGluczogZ3BpbzEwOW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTA5L1JHMU1ESU8iOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJ
Z3BpbzExMF9waW5zOiBncGlvMTEwLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEwL1JHMlRYRDAv
RERSVjAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlv
MTEwb2xfcGluczogZ3BpbzExMG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEwL1JHMlRYRDAv
RERSVjAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzEx
MV9waW5zOiBncGlvMTExLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTExL1JHMlRYRDEvRERSVjEi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTExb2xf
cGluczogZ3BpbzExMW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTExL1JHMlRYRDEvRERSVjEi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzExMl9waW5z
OiBncGlvMTEyLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEyL1JHMlRYRDIvRERSVjIiOworCQkJ
Ymlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTEyb2xfcGluczog
Z3BpbzExMm9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEyL1JHMlRYRDIvRERSVjIiOworCQkJ
Ymlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzExM19waW5zOiBncGlv
MTEzLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEzL1JHMlRYRDMvRERSVjMiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTEzb2xfcGluczogZ3BpbzEx
M29sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTEzL1JHMlRYRDMvRERSVjMiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzExOF9waW5zOiBncGlvMTE4LXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTE4L1NNQjJTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJ
aW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTE5X3BpbnM6IGdwaW8xMTktcGlucyB7CisJCQlw
aW5zID0gIkdQSU8xMTkvU01CMlNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW8xMjBfcGluczogZ3BpbzEyMC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJ
TzEyMC9TTUIyQ1NEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW8xMjFfcGluczogZ3BpbzEyMS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyMS9TTUIy
Q1NDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8x
MjJfcGluczogZ3BpbzEyMi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyMi9TTUIyQlNEQSI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMjNfcGluczog
Z3BpbzEyMy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyMy9TTUIyQlNDTCI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMjNfcGluczogZ3BpbzEyMy1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyMy9TTUIyQlNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJ
CQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMjRfcGluczogZ3BpbzEyNC1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzEyNC9TTUIxQ1NEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1l
bmFibGU7CisJCX07CisJCWdwaW8xMjVfcGluczogZ3BpbzEyNS1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzEyNS9TTUIxQ1NDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW8xMjZfcGluczogZ3BpbzEyNi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyNi9T
TUIxQlNEQSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdw
aW8xMjdfcGluczogZ3BpbzEyNy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEyNy9TTUIxQlNDTCI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMjhvX3Bp
bnM6IGdwaW8xMjhvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTI4L1NNQjhTQ0wiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8xMzBfcGluczogZ3BpbzEz
MC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzEzMC9TTUI5U0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEzMV9waW5zOiBncGlvMTMxLXBpbnMgewor
CQkJcGlucyA9ICJHUElPMTMxL1NNQjlTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQt
ZW5hYmxlOworCQl9OworCQlncGlvMTMyb19waW5zOiBncGlvMTMyby1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzEzMi9TTUIxMFNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsK
KwkJfTsKKwkJZ3BpbzEzM19waW5zOiBncGlvMTMzLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTMz
L1NNQjEwU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJ
Z3BpbzEzNF9waW5zOiBncGlvMTM0LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM0L1NNQjExU0NM
IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEzNV9w
aW5zOiBncGlvMTM1LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM1L1NNQjExU0RBIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzEzNl9waW5zOiBncGlv
MTM2LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM2L1NEMURUMCI7CisJCQliaWFzLWRpc2FibGU7
CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMzZvX3BpbnM6IGdwaW8xMzZvLXBpbnMg
eworCQkJcGlucyA9ICJHUElPMTM2L1NEMURUMCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRw
dXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzEzN19waW5zOiBncGlvMTM3LXBpbnMgeworCQkJcGlucyA9
ICJHUElPMTM3L1NEMURUMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW8xMzdvX3BpbnM6IGdwaW8xMzdvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM3
L1NEMURUMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3Bp
bzEzOF9waW5zOiBncGlvMTM4LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM4L1NEMURUMiI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMzhvX3BpbnM6
IGdwaW8xMzhvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTM4L1NEMURUMiI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzEzOV9waW5zOiBncGlvMTM5LXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTM5L1NEMURUMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlp
bnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xMzlvX3BpbnM6IGdwaW8xMzlvLXBpbnMgeworCQkJ
cGlucyA9ICJHUElPMTM5L1NEMURUMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGln
aDsKKwkJfTsKKwkJZ3BpbzE0MF9waW5zOiBncGlvMTQwLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTQwL1NEMUNMSyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJ
CWdwaW8xNDBvX3BpbnM6IGdwaW8xNDBvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTQwL1NEMUNM
SyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE0MV9w
aW5zOiBncGlvMTQxLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTQxL1NEMVdQIjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE0MW9fcGluczogZ3BpbzE0
MW8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8xNDEvU0QxV1AiOworCQkJYmlhcy1kaXNhYmxlOwor
CQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8xNDJfcGluczogZ3BpbzE0Mi1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzE0Mi9TRDFDTUQiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5h
YmxlOworCQl9OworCQlncGlvMTQyb19waW5zOiBncGlvMTQyby1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzE0Mi9TRDFDTUQiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07
CisJCWdwaW8xNDNfcGluczogZ3BpbzE0My1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0My9TRDFD
RC9TRDFQV1IiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvMTQzb19waW5zOiBncGlvMTQzby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0My9TRDFDRC9T
RDFQV1IiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8x
NDNvbF9waW5zOiBncGlvMTQzb2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xNDMvU0QxQ0QvU0Qx
UFdSIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8xNDRf
cGluczogZ3BpbzE0NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0NC9QV000IjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE0NV9waW5zOiBncGlvMTQ1
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTQ1L1BXTTUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJ
aW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTQ2X3BpbnM6IGdwaW8xNDYtcGlucyB7CisJCQlw
aW5zID0gIkdQSU8xNDYvUFdNNiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7
CisJCX07CisJCWdwaW8xNDdfcGluczogZ3BpbzE0Ny1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0
Ny9QV003IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3Bp
bzE0OF9waW5zOiBncGlvMTQ4LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTQ4L01NQ0RUNCI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNDhvX3BpbnM6
IGdwaW8xNDhvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTQ4L01NQ0RUNCI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE0OG9sX3BpbnM6IGdwaW8xNDhv
bF9waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0OC9NTUNEVDQiOworCQkJYmlhcy1kaXNhYmxlOwor
CQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE0OV9waW5zOiBncGlvMTQ5LXBpbnMgeworCQkJ
cGlucyA9ICJHUElPMTQ5L01NQ0RUNSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFi
bGU7CisJCX07CisJCWdwaW8xNDlvX3BpbnM6IGdwaW8xNDlvLXBpbnMgeworCQkJcGlucyA9ICJH
UElPMTQ5L01NQ0RUNSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsK
KwkJZ3BpbzE0OW9sX3BpbnM6IGdwaW8xNDlvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE0OS9N
TUNEVDUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1
MF9waW5zOiBncGlvMTUwLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTUwL01NQ0RUNiI7CisJCQli
aWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNTBvX3BpbnM6IGdw
aW8xNTBvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTUwL01NQ0RUNiI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE1MG9sX3BpbnM6IGdwaW8xNTBvbC1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1MC9NTUNEVDYiOworCQkJYmlhcy1kaXNhYmxlOworCQkJ
b3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1MV9waW5zOiBncGlvMTUxLXBpbnMgeworCQkJcGlu
cyA9ICJHUElPMTUxL01NQ0RUNyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7
CisJCX07CisJCWdwaW8xNTFvX3BpbnM6IGdwaW8xNTFvLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MTUxL01NQ0RUNyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJ
Z3BpbzE1MW9sX3BpbnM6IGdwaW8xNTFvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1MS9NTUNE
VDciOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1Ml9w
aW5zOiBncGlvMTUyLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTUyL01NQ0NMSyI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNTJvX3BpbnM6IGdwaW8x
NTJvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTUyL01NQ0NMSyI7CisJCQliaWFzLWRpc2FibGU7
CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE1Mm9sX3BpbnM6IGdwaW8xNTJvbC1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzE1Mi9NTUNDTEsiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0
cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1M19waW5zOiBncGlvMTUzLXBpbnMgeworCQkJcGlucyA9
ICJHUElPMTUzL01NQ1dQIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3BpbzE1M29sX3BpbnM6IGdwaW8xNTNvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1
My9NTUNXUCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlv
MTU0X3BpbnM6IGdwaW8xNTQtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xNTQvTU1DQ01EIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE1NG9sX3BpbnM6
IGdwaW8xNTRvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1NC9NTUNDTUQiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1NV9waW5zOiBncGlvMTU1LXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTU1L25NTUNDRC9uTU1DUlNUIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE1NW9sX3BpbnM6IGdwaW8xNTVvbC1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1NS9uTU1DQ0Qvbk1NQ1JTVCI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTU2X3BpbnM6IGdwaW8xNTYtcGlucyB7
CisJCQlwaW5zID0gIkdQSU8xNTYvTU1DRFQwIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0
LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE1Nm9sX3BpbnM6IGdwaW8xNTZvbC1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzE1Ni9NTUNEVDAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsK
KwkJfTsKKwkJZ3BpbzE1N19waW5zOiBncGlvMTU3LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTU3
L01NQ0RUMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdw
aW8xNTdvX3BpbnM6IGdwaW8xNTdvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTU3L01NQ0RUMSI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE1N29sX3Bp
bnM6IGdwaW8xNTdvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1Ny9NTUNEVDEiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE1OF9waW5zOiBncGlvMTU4
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTU4L01NQ0RUMiI7CisJCQliaWFzLWRpc2FibGU7CisJ
CQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNThvX3BpbnM6IGdwaW8xNThvLXBpbnMgewor
CQkJcGlucyA9ICJHUElPMTU4L01NQ0RUMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQt
aGlnaDsKKwkJfTsKKwkJZ3BpbzE1OG9sX3BpbnM6IGdwaW8xNThvbC1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzE1OC9NTUNEVDIiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJ
fTsKKwkJZ3BpbzE1OV9waW5zOiBncGlvMTU5LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTU5L01N
Q0RUMyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8x
NTlvX3BpbnM6IGdwaW8xNTlvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTU5L01NQ0RUMyI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE1OW9sX3BpbnM6
IGdwaW8xNTlvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE1OS9NTUNEVDMiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE2MF9waW5zOiBncGlvMTYwLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTYwL0NMS09VVC9STkdPU0NPVVQiOworCQkJYmlhcy1kaXNh
YmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTYwb19waW5zOiBncGlvMTYwby1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE2MC9DTEtPVVQvUk5HT1NDT1VUIjsKKwkJCWJpYXMtZGlz
YWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMTYwb2xfcGluczogZ3BpbzE2MG9s
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTYwL0NMS09VVC9STkdPU0NPVVQiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE2MV9waW5zOiBncGlvMTYxLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTYxL25MRlJBTUUvbkVTUElDUyI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNjJfcGluczogZ3BpbzE2Mi1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzE2Mi9TRVJJUlEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5w
dXQtZW5hYmxlOworCQl9OworCQlncGlvMTYzX3BpbnM6IGdwaW8xNjMtcGlucyB7CisJCQlwaW5z
ID0gIkdQSU8xNjMvTENMSy9FU1BJQ0xLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVu
YWJsZTsKKwkJfTsKKwkJZ3BpbzE2NF9waW5zOiBncGlvMTY0LXBpbnMgeworCQkJcGlucyA9ICJH
UElPMTY0L0xBRDAvRVNQSV9JTzAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxl
OworCQl9OworCQlncGlvMTY1X3BpbnM6IGdwaW8xNjUtcGlucyB7CisJCQlwaW5zID0gIkdQSU8x
NjUvTEFEMS9FU1BJX0lPMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJ
CX07CisJCWdwaW8xNjZfcGluczogZ3BpbzE2Ni1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE2Ni9M
QUQyL0VTUElfSU8yIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsK
KwkJZ3BpbzE2N19waW5zOiBncGlvMTY3LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTY3L0xBRDMv
RVNQSV9JTzMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvMTY4X3BpbnM6IGdwaW8xNjgtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xNjgvbkNMS1JVTi9u
RVNQSUFMRVJUIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJ
Z3BpbzE2OG9sX3BpbnM6IGdwaW8xNjhvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE2OC9uQ0xL
UlVOL25FU1BJQUxFUlQiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsK
KwkJZ3BpbzE2OV9waW5zOiBncGlvMTY5LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTY5L25TQ0lQ
TUUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTY5
b19waW5zOiBncGlvMTY5by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE2OS9uU0NJUE1FIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMTY5b2xfcGluczog
Z3BpbzE2OW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTY5L25TQ0lQTUUiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE3MF9waW5zOiBncGlvMTcwLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTcwL25TTUkiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5w
dXQtZW5hYmxlOworCQl9OworCQlncGlvMTcwb2xfcGluczogZ3BpbzE3MG9sLXBpbnMgeworCQkJ
cGlucyA9ICJHUElPMTcwL25TTUkiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsK
KwkJfTsKKwkJZ3BpbzE3M29fcGluczogZ3BpbzE3M28tcGlucyB7CisJCQlwaW5zID0gIkdQSU8x
NzMvU01CN1NDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJ
Z3BpbzE3M29sX3BpbnM6IGdwaW8xNzNvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE3My9TTUI3
U0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8xNzRf
cGluczogZ3BpbzE3NC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE3NC9TTUI3U0RBIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE3NV9waW5zOiBncGlv
MTc1LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTc1L1BTUEkxQ0svRkFOSU4xOSI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNzVvX3BpbnM6IGdwaW8x
NzVvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTc1L1BTUEkxQ0svRkFOSU4xOSI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE3NW9sX3BpbnM6IGdwaW8x
NzVvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE3NS9QU1BJMUNLL0ZBTklOMTkiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE3Nl9waW5zOiBncGlvMTc2
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTc2L1BTUEkxRE8vRkFOSU4xOCI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNzZvX3BpbnM6IGdwaW8xNzZv
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTc2L1BTUEkxRE8vRkFOSU4xOCI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE3Nm9sX3BpbnM6IGdwaW8xNzZv
bC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE3Ni9QU1BJMURPL0ZBTklOMTgiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE3N19waW5zOiBncGlvMTc3LXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTc3L1BTUEkxREkvRkFOSU4xNyI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8xNzdvX3BpbnM6IGdwaW8xNzdvLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMTc3L1BTUEkxREkvRkFOSU4xNyI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE3N29sX3BpbnM6IGdwaW8xNzdvbC1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE3Ny9QU1BJMURJL0ZBTklOMTciOworCQkJYmlhcy1kaXNh
YmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE4N19waW5zOiBncGlvMTg3LXBpbnMg
eworCQkJcGlucyA9ICJHUElPMTg3L25TUEkzQ1MxIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlu
cHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE4N29fcGluczogZ3BpbzE4N28tcGlucyB7CisJCQlw
aW5zID0gIkdQSU8xODcvblNQSTNDUzEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhp
Z2g7CisJCX07CisJCWdwaW8xODdvbF9waW5zOiBncGlvMTg3b2wtcGlucyB7CisJCQlwaW5zID0g
IkdQSU8xODcvblNQSTNDUzEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJ
fTsKKwkJZ3BpbzE4OF9waW5zOiBncGlvMTg4LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTg4L1NQ
STNEMi9uU1BJM0NTMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW8xODhvX3BpbnM6IGdwaW8xODhvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMTg4L1NQ
STNEMi9uU1BJM0NTMiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsK
KwkJZ3BpbzE4OW9fcGluczogZ3BpbzE4OW8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8xODkvU1BJ
M0QzL25TUEkzQ1MzIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9Owor
CQlncGlvMTkwX3BpbnM6IGdwaW8xOTAtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xOTAvblBSRF9T
TUkiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTkw
b19waW5zOiBncGlvMTkwby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE5MC9uUFJEX1NNSSI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE5MG9sX3BpbnM6
IGdwaW8xOTBvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE5MC9uUFJEX1NNSSI7CisJCQliaWFz
LWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMTkxb19waW5zOiBncGlvMTkx
by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE5MSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRw
dXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE5MW9sX3BpbnM6IGdwaW8xOTFvbC1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzE5MSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9Owor
CQlncGlvMTkyX3BpbnM6IGdwaW8xOTItcGlucyB7CisJCQlwaW5zID0gIkdQSU8xOTIiOworCQkJ
Ymlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMTkyb19waW5zOiBn
cGlvMTkyby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE5MiI7CisJCQliaWFzLWRpc2FibGU7CisJ
CQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE5Mm9sX3BpbnM6IGdwaW8xOTJvbC1waW5zIHsK
KwkJCXBpbnMgPSAiR1BJTzE5MiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93Owor
CQl9OworCQlncGlvMTk0X3BpbnM6IGdwaW8xOTQtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xOTQv
U01CMEJTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvMTk0b19waW5zOiBncGlvMTk0by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzE5NC9TTUIwQlND
TCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzE5NV9w
aW5zOiBncGlvMTk1LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTk1L1NNQjBCU0RBIjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE5Nl9waW5zOiBncGlv
MTk2LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTk2L1NNQjBDU0NMIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzE5N19waW5zOiBncGlvMTk3LXBpbnMg
eworCQkJcGlucyA9ICJHUElPMTk3L1NNQjBERU4iOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5w
dXQtZW5hYmxlOworCQl9OworCQlncGlvMTk3b19waW5zOiBncGlvMTk3by1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzE5Ny9TTUIwREVOIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdo
OworCQl9OworCQlncGlvMTk3b2xfcGluczogZ3BpbzE5N29sLXBpbnMgeworCQkJcGlucyA9ICJH
UElPMTk3L1NNQjBERU4iOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsK
KwkJZ3BpbzE5OG9fcGluczogZ3BpbzE5OG8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8xOTgvU01C
MERTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8x
OThvbF9waW5zOiBncGlvMTk4b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8xOTgvU01CMERTREEi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzE5OV9waW5z
OiBncGlvMTk5LXBpbnMgeworCQkJcGlucyA9ICJHUElPMTk5L1NNQjBEU0NMIjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIwMF9waW5zOiBncGlvMjAw
LXBpbnMgeworCQkJcGlucyA9ICJHUElPMjAwL1IyQ0siOworCQkJaW5wdXQtZW5hYmxlOworCQkJ
Ymlhcy1kaXNhYmxlOworCQl9OworCQlncGlvMjAwb2xfcGluczogZ3BpbzIwMG9sLXBpbnMgewor
CQkJcGlucyA9ICJHUElPMjAwL1IyQ0siOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxv
dzsKKwkJfTsKKwkJZ3BpbzIwMW9sX3BpbnM6IGdwaW8yMDFvbC1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzIwMC9SMkNLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJ
CWdwaW8yMDJfcGluczogZ3BpbzIwMi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwMi9TTUIwQ1NE
QSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8yMDNf
cGluczogZ3BpbzIwMy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwMy9GQU5JTjE2IjsKKwkJCWJp
YXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIwM29fcGluczogZ3Bp
bzIwM28tcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMDMvRkFOSU4xNiI7CisJCQliaWFzLWRpc2Fi
bGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzIwM29sX3BpbnM6IGdwaW8yMDNvbC1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwMy9GQU5JTjE2IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMDRfcGluczogZ3BpbzIwNC1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzIwNC9EREMyU0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJs
ZTsKKwkJfTsKKwkJZ3BpbzIwNG9fcGluczogZ3BpbzIwNG8tcGlucyB7CisJCQlwaW5zID0gIkdQ
SU8yMDQvRERDMlNDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsK
KwkJZ3BpbzIwNG9sX3BpbnM6IGdwaW8yMDRvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwNC9E
REMyU0NMIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8y
MDVfcGluczogZ3BpbzIwNS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwNS9EREMyU0RBIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIwNW9fcGluczog
Z3BpbzIwNW8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMDUvRERDMlNEQSI7CisJCQliaWFzLWRp
c2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzIwNW9sX3BpbnM6IGdwaW8yMDVv
bC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwNS9EREMyU0RBIjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMDZfcGluczogZ3BpbzIwNi1waW5zIHsKKwkJ
CXBpbnMgPSAiR1BJTzIwNi9IU1lOQzIiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5h
YmxlOworCQl9OworCQlncGlvMjA2b19waW5zOiBncGlvMjA2by1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzIwNi9IU1lOQzIiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07
CisJCWdwaW8yMDZvbF9waW5zOiBncGlvMjA2b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMDYv
SFNZTkMyIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8y
MDdfcGluczogZ3BpbzIwNy1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwNy9WU1lOQzIiOworCQkJ
Ymlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjA3b19waW5zOiBn
cGlvMjA3by1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwNy9WU1lOQzIiOworCQkJYmlhcy1kaXNh
YmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8yMDdvbF9waW5zOiBncGlvMjA3b2wt
cGlucyB7CisJCQlwaW5zID0gIkdQSU8yMDcvVlNZTkMyIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJ
CW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMDhfcGluczogZ3BpbzIwOC1waW5zIHsKKwkJCXBp
bnMgPSAiR1BJTzIwOC9SRzJUWEMvRFZDSyI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1l
bmFibGU7CisJCX07CisJCWdwaW8yMDhvX3BpbnM6IGdwaW8yMDhvLXBpbnMgeworCQkJcGlucyA9
ICJHUElPMjA4L1JHMlRYQy9EVkNLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdo
OworCQl9OworCQlncGlvMjA4b2xfcGluczogZ3BpbzIwOG9sLXBpbnMgeworCQkJcGlucyA9ICJH
UElPMjA4L1JHMlRYQy9EVkNLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJ
CX07CisJCWdwaW8yMDlfcGluczogZ3BpbzIwOS1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIwOS9S
RzJUWENUTC9ERFJWNCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07
CisJCWdwaW8yMDlvbF9waW5zOiBncGlvMjA5b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMDkv
UkcyVFhDVEwvRERSVjQiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsK
KwkJZ3BpbzIxMF9waW5zOiBncGlvMjEwLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjEwL1JHMlJY
RDAvRERSVjUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQln
cGlvMjEwb19waW5zOiBncGlvMjEwby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIxMC9SRzJSWEQw
L0REUlY1IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlv
MjEwb2xfcGluczogZ3BpbzIxMG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjEwL1JHMlJYRDAv
RERSVjUiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzIx
MV9waW5zOiBncGlvMjExLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjExL1JHMlJYRDEvRERSVjYi
OworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjExb19w
aW5zOiBncGlvMjExby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIxMS9SRzJSWEQxL0REUlY2IjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjExb2xfcGlu
czogZ3BpbzIxMW9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjExL1JHMlJYRDEvRERSVjYiOwor
CQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzIxMl9waW5zOiBn
cGlvMjEyLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjEyL1JHMlJYRDIvRERSVjciOworCQkJYmlh
cy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjEyb19waW5zOiBncGlv
MjEyby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIxMi9SRzJSWEQyL0REUlY3IjsKKwkJCWJpYXMt
ZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjEyb2xfcGluczogZ3BpbzIx
Mm9sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjEyL1JHMlJYRDIvRERSVjciOworCQkJYmlhcy1k
aXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzIxM19waW5zOiBncGlvMjEzLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMjEzL1JHMlJYRDMvRERSVjgiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjEzb19waW5zOiBncGlvMjEzby1waW5z
IHsKKwkJCXBpbnMgPSAiR1BJTzIxMy9SRzJSWEQzL0REUlY4IjsKKwkJCWJpYXMtZGlzYWJsZTsK
KwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjEzb2xfcGluczogZ3BpbzIxM29sLXBpbnMg
eworCQkJcGlucyA9ICJHUElPMjEzL1JHMlJYRDMvRERSVjgiOworCQkJYmlhcy1kaXNhYmxlOwor
CQkJb3V0cHV0LWxvdzsKKwkJfTsKKwkJZ3BpbzIxNF9waW5zOiBncGlvMjE0LXBpbnMgeworCQkJ
cGlucyA9ICJHUElPMjE0L1JHMlJYQy9ERFJWOSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1
dC1lbmFibGU7CisJCX07CisJCWdwaW8yMTRvbF9waW5zOiBncGlvMjE0b2wtcGlucyB7CisJCQlw
aW5zID0gIkdQSU8yMTQvUkcyUlhDL0REUlY5IjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1
dC1sb3c7CisJCX07CisJCWdwaW8yMTVfcGluczogZ3BpbzIxNS1waW5zIHsKKwkJCXBpbnMgPSAi
R1BJTzIxNS9SRzJSWENUTC9ERFJWMTAiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5h
YmxlOworCQl9OworCQlncGlvMjE1b2xfcGluczogZ3BpbzIxNW9sLXBpbnMgeworCQkJcGlucyA9
ICJHUElPMjE1L1JHMlJYQ1RML0REUlYxMCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQt
bG93OworCQl9OworCQlncGlvMjE2X3BpbnM6IGdwaW8yMTYtcGlucyB7CisJCQlwaW5zID0gIkdQ
SU8yMTYvUkcyTURDL0REUlYxMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7
CisJCX07CisJCWdwaW8yMTZvbF9waW5zOiBncGlvMjE2b2wtcGlucyB7CisJCQlwaW5zID0gIkdQ
SU8yMTYvUkcyTURDL0REUlYxMSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93Owor
CQl9OworCQlncGlvMjE3X3BpbnM6IGdwaW8yMTctcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMTcv
UkcyTURJTy9EVkhTWU5DIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJ
fTsKKwkJZ3BpbzIxN29sX3BpbnM6IGdwaW8yMTdvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIx
Ny9SRzJNRElPL0RWSFNZTkMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxvdzsKKwkJ
fTsKKwkJZ3BpbzIxOF9waW5zOiBncGlvMjE4LXBpbnMgeworCQkJcGlucyA9ICJHUElPMjE4L25X
RE8xIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIx
OG9sX3BpbnM6IGdwaW8yMThvbC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIxOC9uV0RPMSI7CisJ
CQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtbG93OworCQl9OworCQlncGlvMjE5X3BpbnM6IGdw
aW8yMTktcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMTkvbldETzIiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjE5b2xfcGluczogZ3BpbzIxOW9sLXBp
bnMgeworCQkJcGlucyA9ICJHUElPMjE5L25XRE8yIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMjBvbF9waW5zOiBncGlvMjIwb2wtcGlucyB7CisJCQlw
aW5zID0gIkdQSU8yMjAvU01CMTJTQ0wiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWxv
dzsKKwkJfTsKKwkJZ3BpbzIyMW9fcGluczogZ3BpbzIyMW8tcGlucyB7CisJCQlwaW5zID0gIkdQ
SU8yMjEvU01CMTJTREEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07
CisJCWdwaW8yMjJfcGluczogZ3BpbzIyMi1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIyMi9TTUIx
M1NDTCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJCWdwaW8y
MjJvX3BpbnM6IGdwaW8yMjJvLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjIyL1NNQjEzU0NMIjsK
KwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjIzX3BpbnM6
IGdwaW8yMjMtcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMjMvU01CMTNTREEiOworCQkJYmlhcy1k
aXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjIzb2xfcGluczogZ3BpbzIy
M29sLXBpbnMgeworCQkJcGlucyA9ICJHUElPMjIzL1NNQjEzU0RBIjsKKwkJCWJpYXMtZGlzYWJs
ZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMjRfcGluczogZ3BpbzIyNC1waW5zIHsK
KwkJCXBpbnMgPSAiR1BJTzIyNC9TUElYQ0siOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQt
ZW5hYmxlOworCQl9OworCQlncGlvMjI0b19waW5zOiBncGlvMjI0by1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzIyNC9TUElYQ0siOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJ
CX07CisJCWdwaW8yMjRvbF9waW5zOiBncGlvMjI0b2wtcGlucyB7CisJCQlwaW5zID0gIkdQSU8y
MjQvU1BJWENLIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJCWdw
aW8yMjVfcGluczogZ3BpbzIyNS1waW5zIHsKKwkJCXBpbnMgPSAiR1BPMjI1L1NQSVhEMC9TVFJB
UDEyIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsKKwkJfTsKKwkJZ3BpbzIy
NW9fcGluczogZ3BpbzIyNW8tcGlucyB7CisJCQlwaW5zID0gIkdQTzIyNS9TUElYRDAvU1RSQVAx
MiI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzIyNl9w
aW5zOiBncGlvMjI2LXBpbnMgeworCQkJcGlucyA9ICJHUE8yMjYvU1BJWEQxL1NUUkFQMTMiOwor
CQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjI2b19waW5z
OiBncGlvMjI2by1waW5zIHsKKwkJCXBpbnMgPSAiR1BPMjI2L1NQSVhEMS9TVFJBUDEzIjsKKwkJ
CWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1oaWdoOworCQl9OworCQlncGlvMjI3X3BpbnM6IGdw
aW8yMjctcGlucyB7CisJCQlwaW5zID0gIkdQSU8yMjcvblNQSVhDUzAiOworCQkJYmlhcy1kaXNh
YmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjI3b19waW5zOiBncGlvMjI3by1w
aW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIyNy9uU1BJWENTMCI7CisJCQliaWFzLWRpc2FibGU7CisJ
CQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJZ3BpbzIyN29sX3BpbnM6IGdwaW8yMjdvbC1waW5zIHsK
KwkJCXBpbnMgPSAiR1BJTzIyNy9uU1BJWENTMCI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRw
dXQtbG93OworCQl9OworCQlncGlvMjI4X3BpbnM6IGdwaW8yMjgtcGlucyB7CisJCQlwaW5zID0g
IkdQSU8yMjgvblNQSVhDUzEiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOwor
CQl9OworCQlncGlvMjI4b2xfcGluczogZ3BpbzIyOG9sLXBpbnMgeworCQkJcGlucyA9ICJHUElP
MjI4L25TUElYQ1MxIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91dHB1dC1sb3c7CisJCX07CisJ
CWdwaW8yMjlfcGluczogZ3BpbzIyOS1waW5zIHsKKwkJCXBpbnMgPSAiR1BPMjI5L1NQSVhEMi9T
VFJBUDMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlv
MjI5b19waW5zOiBncGlvMjI5by1waW5zIHsKKwkJCXBpbnMgPSAiR1BPMjI5L1NQSVhEMi9TVFJB
UDMiOworCQkJYmlhcy1kaXNhYmxlOworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8yMzBf
cGluczogZ3BpbzIzMC1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIzMC9TUElYRDMiOworCQkJYmlh
cy1kaXNhYmxlOworCQkJaW5wdXQtZW5hYmxlOworCQl9OworCQlncGlvMjMwb19waW5zOiBncGlv
MjMwby1waW5zIHsKKwkJCXBpbnMgPSAiR1BJTzIzMC9TUElYRDMiOworCQkJYmlhcy1kaXNhYmxl
OworCQkJb3V0cHV0LWhpZ2g7CisJCX07CisJCWdwaW8yMzBvbF9waW5zOiBncGlvMjMwb2wtcGlu
cyB7CisJCQlwaW5zID0gIkdQSU8yMzAvU1BJWEQzIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCW91
dHB1dC1sb3c7CisJCX07CisJCWdwaW8yMzFfcGluczogZ3BpbzIzMS1waW5zIHsKKwkJCXBpbnMg
PSAiR1BJTzIzMS9uQ0xLUkVRIjsKKwkJCWJpYXMtZGlzYWJsZTsKKwkJCWlucHV0LWVuYWJsZTsK
KwkJfTsKKwkJZ3BpbzIzMW9fcGluczogZ3BpbzIzMW8tcGlucyB7CisJCQlwaW5zID0gIkdQSU8y
MzEvbkNMS1JFUSI7CisJCQliaWFzLWRpc2FibGU7CisJCQlvdXRwdXQtaGlnaDsKKwkJfTsKKwkJ
Z3BpbzI1NV9waW5zOiBncGlvMjU1LXBpbnMgeworCQkJcGlucyA9ICJHUEkyNTUvREFDT1NFTCI7
CisJCQliaWFzLWRpc2FibGU7CisJCQlpbnB1dC1lbmFibGU7CisJCX07CisJfTsKK307CmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL251dm90b24tbnBjbTc1MC5kdHNpCmluZGV4IDZhYzM0MDUzMzU4Ny4uNDIxYTRl
ZDU0YmFkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAuZHRz
aQorKysgYi9hcmNoL2FybS9ib290L2R0cy9udXZvdG9uLW5wY203NTAuZHRzaQpAQCAtMyw2ICsz
LDcgQEAKIC8vIENvcHlyaWdodCAyMDE4IEdvb2dsZSwgSW5jLgogCiAjaW5jbHVkZSAibnV2b3Rv
bi1jb21tb24tbnBjbTd4eC5kdHNpIgorI2luY2x1ZGUgIm51dm90b24tbnBjbTc1MC1ncGlvLmR0
c2kiCiAKIC8gewogCSNhZGRyZXNzLWNlbGxzID0gPDE+OwpAQCAtMTcsNyArMTgsNyBAQAogCQlj
cHVAMCB7CiAJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29y
dGV4LWE5IjsKLQkJCWNsb2NrcyA9IDwmY2xrIDA+OworCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdY
WF9DTEtfQ1BVPjsKIAkJCWNsb2NrLW5hbWVzID0gImNsa19jcHUiOwogCQkJcmVnID0gPDA+Owog
CQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+OwpAQCAtMjYsMTkgKzI3LDE1MiBAQAogCQljcHVA
MSB7CiAJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4
LWE5IjsKLQkJCWNsb2NrcyA9IDwmY2xrIDA+OworCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9D
TEtfQ1BVPjsKIAkJCWNsb2NrLW5hbWVzID0gImNsa19jcHUiOwogCQkJcmVnID0gPDE+OwogCQkJ
bmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+OwogCQl9OwogCX07CisKIAlzb2MgewogCQl0aW1lckAz
ZmU2MDAgewogCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWE5LXR3ZC10aW1lciI7CiAJCQly
ZWcgPSA8MHgzZmU2MDAgMHgyMD47CiAJCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgKEdJQ19D
UFVfTUFTS19TSU1QTEUoMikgfAogCQkJCQkJICBJUlFfVFlQRV9MRVZFTF9ISUdIKT47Ci0JCQlj
bG9ja3MgPSA8JmNsayA1PjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX0FIQj47CisJ
CX07CisJfTsKKworCisJYWhiIHsKKwkJZ21hYzE6IGV0aEBmMDgwNDAwMCB7CisJCQlkZXZpY2Vf
dHlwZSA9ICJuZXR3b3JrIjsKKwkJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYyI7CisJCQlyZWcg
PSA8MHhmMDgwNDAwMCAweDIwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3IElSUV9U
WVBFX0xFVkVMX0hJR0g+OworCQkJaW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSI7CisJCQlldGhl
cm5ldCA9IDwxPjsKKwkJCWNsb2Nrcwk9IDwmY2xrX3JnMnJlZmNrPiwgPCZjbGsgTlBDTTdYWF9D
TEtfQUhCPjsKKwkJCWNsb2NrLW5hbWVzID0gInN0bW1hY2V0aCIsICJjbGtfZ21hYyI7CisJCQlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJLypwaW5jdHJsLTAgPSA8JnJnMl9waW5zCisJ
CQkgICAgICAgICAgICAgJnJnMm1kaW9fcGlucz47Ki8KKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7
CisJCX07CisKKwkJZW1jMTogZXRoQGYwODI2MDAwIHsKKwkJCWRldmljZV90eXBlID0gIm5ldHdv
cmsiOworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtZW1jIjsKKwkJCXJlZyA9IDww
eGYwODI2MDAwIDB4MTAwMD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE1IElSUV9UWVBF
X0xFVkVMX0hJR0g+LAorCQkJCQk8R0lDX1NQSSAxMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJ
CQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19BSEI+OworCQkJY2xvY2stbmFtZXMgPSAiY2xr
X2VtYyI7CisJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJcGluY3RybC0wID0gPCZy
Ml9waW5zCisJCQkgICAgICAgICAgICAgJnIyZXJyX3BpbnMKKwkJCQkgICAgICZyMm1kX3BpbnM+
OworCQl9OworCisJCXVkYzA6dWRjQGYwODMwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3Rv
bixucGNtNzUwLXVkYyI7CisJCQlyZWcgPSA8MHhmMDgzMDAwMCAweDEwMDAKKwkJCSAgICAgICAw
eGZmZmQwMDAwIDB4ODAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA1MSBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQljbG9ja3MgPSA8JmNsayBO
UENNN1hYX0NMS19TVT47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfdXNiX2JyaWRnZSI7CisJCX07
CisKKwkJdWRjMTp1ZGNAZjA4MzEwMDAgeworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203
NTAtdWRjIjsKKwkJCXJlZyA9IDwweGYwODMxMDAwIDB4MTAwMAorCQkJICAgICAgIDB4ZmZmZDA4
MDAgMHg4MDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDUyIElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhf
Q0xLX1NVPjsKKwkJCWNsb2NrLW5hbWVzID0gImNsa191c2JfYnJpZGdlIjsKKwkJfTsKKworCQl1
ZGMyOnVkY0BmMDgzMjAwMCB7CisJCQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC11ZGMi
OworCQkJcmVnID0gPDB4ZjA4MzIwMDAgMHgxMDAwCisJCQkgICAgICAgMHhmZmZkMTAwMCAweDgw
MD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfU1U+
OworCQkJY2xvY2stbmFtZXMgPSAiY2xrX3VzYl9icmlkZ2UiOworCQl9OworCisJCXVkYzM6dWRj
QGYwODMzMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXVkYyI7CisJCQly
ZWcgPSA8MHhmMDgzMzAwMCAweDEwMDAKKwkJCSAgICAgICAweGZmZmQxODAwIDB4ODAwPjsKKwkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSA1NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCXN0YXR1
cyA9ICJkaXNhYmxlZCI7CisJCQljbG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19TVT47CisJCQlj
bG9jay1uYW1lcyA9ICJjbGtfdXNiX2JyaWRnZSI7CisJCX07CisKKwkJdWRjNDp1ZGNAZjA4MzQw
MDAgeworCQkJY29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203NTAtdWRjIjsKKwkJCXJlZyA9IDww
eGYwODM0MDAwIDB4MTAwMAorCQkJICAgICAgIDB4ZmZmZDIwMDAgMHg4MDA+OworCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDU1IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJc3RhdHVzID0gImRp
c2FibGVkIjsKKwkJCWNsb2NrcyA9IDwmY2xrIE5QQ003WFhfQ0xLX1NVPjsKKwkJCWNsb2NrLW5h
bWVzID0gImNsa191c2JfYnJpZGdlIjsKKwkJfTsKKworCQl1ZGM1OnVkY0BmMDgzNTAwMCB7CisJ
CQljb21wYXRpYmxlID0gIm51dm90b24sbnBjbTc1MC11ZGMiOworCQkJcmVnID0gPDB4ZjA4MzUw
MDAgMHgxMDAwCisJCQkgICAgICAgMHhmZmZkMjgwMCAweDgwMD47CisJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgNTYgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
OworCQkJY2xvY2tzID0gPCZjbGsgTlBDTTdYWF9DTEtfU1U+OworCQkJY2xvY2stbmFtZXMgPSAi
Y2xrX3VzYl9icmlkZ2UiOworCQl9OworCisJCXVkYzY6dWRjQGYwODM2MDAwIHsKKwkJCWNvbXBh
dGlibGUgPSAibnV2b3RvbixucGNtNzUwLXVkYyI7CisJCQlyZWcgPSA8MHhmMDgzNjAwMCAweDEw
MDAKKwkJCSAgICAgICAweGZmZmQzMDAwIDB4ODAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSA1NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQlj
bG9ja3MgPSA8JmNsayBOUENNN1hYX0NMS19TVT47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfdXNi
X2JyaWRnZSI7CisJCX07CisKKwkJdWRjNzp1ZGNAZjA4MzcwMDAgeworCQkJY29tcGF0aWJsZSA9
ICJudXZvdG9uLG5wY203NTAtdWRjIjsKKwkJCXJlZyA9IDwweGYwODM3MDAwIDB4MTAwMAorCQkJ
ICAgICAgIDB4ZmZmZDM4MDAgMHg4MDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDU4IElS
UV9UWVBFX0xFVkVMX0hJR0g+OworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCWNsb2NrcyA9
IDwmY2xrIE5QQ003WFhfQ0xLX1NVPjsKKwkJCWNsb2NrLW5hbWVzID0gImNsa191c2JfYnJpZGdl
IjsKKwkJfTsKKworCQl1ZGM4OnVkY0BmMDgzODAwMCB7CisJCQljb21wYXRpYmxlID0gIm51dm90
b24sbnBjbTc1MC11ZGMiOworCQkJcmVnID0gPDB4ZjA4MzgwMDAgMHgxMDAwCisJCQkgICAgICAg
MHhmZmZkNDAwMCAweDgwMD47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNTkgSVJRX1RZUEVf
TEVWRUxfSElHSD47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJY2xvY2tzID0gPCZjbGsg
TlBDTTdYWF9DTEtfU1U+OworCQkJY2xvY2stbmFtZXMgPSAiY2xrX3VzYl9icmlkZ2UiOworCQl9
OworCisJCXVkYzk6dWRjQGYwODM5MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibnV2b3RvbixucGNt
NzUwLXVkYyI7CisJCQlyZWcgPSA8MHhmMDgzOTAwMCAweDEwMDAKKwkJCSAgICAgICAweGZmZmQ0
ODAwIDB4ODAwPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA2MCBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQljbG9ja3MgPSA8JmNsayBOUENNN1hY
X0NMS19TVT47CisJCQljbG9jay1uYW1lcyA9ICJjbGtfdXNiX2JyaWRnZSI7CiAJCX07CiAJfTsK
IH07Ci0tIAoyLjE0LjEKCg==
--0000000000006b5ef4057cd1ecbf--
