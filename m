Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZLTXb3R/"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Hn310Lx7zDqXP
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 01:38:36 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id p7so462070iog.12
 for <openbmc@lists.ozlabs.org>; Sun, 16 Dec 2018 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CmAvvxDQ6FhKaQUABE67MdVaIVlpYqPWYy85ZzFcO2U=;
 b=ZLTXb3R/Q5Xf898c6R69ypz6UMQkcumf4Zi6oA6h0oT0pd9LDdnkt5DkoCKLiLV1hN
 L6vaNl097ztMGW73f488TK1dj2eCZof8YlGFtBWjKiK083UEM1cBCStxI7iyhgcya/aM
 /yOM1RxMvBcRaPIFNWtnU68dXvOH5siNjvxIpq0y7FYqfVcVgYIUDQzWz4p9xBhWaLwb
 cdcOCS60j8+e1/73V6xLYzm6b2o56qs0ORE7ChRcH32fIfNG3XE3OaIDtS5HJZ6NxAf+
 v0R8zmfg/ZKoi24bE3ZQT5aK+pnDPackO8bheyxckfiUm0ltSxhJAZlBZ+w4n/L1E3P6
 y/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CmAvvxDQ6FhKaQUABE67MdVaIVlpYqPWYy85ZzFcO2U=;
 b=L8RjLHw2kGwGXM3ya3Rv+eCtCW2sLTBc3ofeU8XthBQ5WqxJtUXHw8D1o/cImiwGE6
 iRoA+u9RX5YeEq/Ac5wHzcd0WQ8NrRqBkqSQfPBPXFG+OOeGjHGtLIoJTRu6LC9N1w+v
 n/ULUZmgl8xPMJttp4aTGLZUF6HHobcyEOSHmO4j83rJVRlmlpnDiVIpHE2DJIWuxDm6
 583APk5Kq47jGteXksxn90HiVZxsBYBvi2icgw0iUu+JjA3+pOwbOBKORf0oqTf7AqxN
 kKlxLoVsJhUMgcencrqtnOofKdnEDBw/IeyrvpLrBANISVMddNwTV+cxpAzZA8tmCfmq
 A+SA==
X-Gm-Message-State: AA+aEWagCgR5vwC0jh7rD+c1V04pD9wuALpFPwuK7sV7vRMp/3K96JKI
 QdaEXIpDcdmfSE6tmrQ7T22fdpGIuaSC9gwn7W1HqA==
X-Google-Smtp-Source: AFSGD/WqdGxI7zpaTPdaMjvhLPVjeq0Rq58FCT8G8GvaQYyBTy7YHVPejb16LakJ74fQWtXd4QzkAW8JSLHaHgTRTog=
X-Received: by 2002:a5d:814d:: with SMTP id f13mr9026551ioo.90.1544971114037; 
 Sun, 16 Dec 2018 06:38:34 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
 <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <CACPK8Xd2FDD=FX7SK5cxWrkgGT190rJAHOJefs4Gws6qzJkfYA@mail.gmail.com>
 <CAP6Zq1je+PsriSUUL2JoNX-OQte85F=uQd7EG9np-D1fsxjcTg@mail.gmail.com>
 <CACPK8XcGpd5Y3XTFB+VTFr+1S4hf4ytgMZV-VeDBrN8nyFPDHg@mail.gmail.com>
 <CACPK8XeKEsMCP6vOQo96Y7TaBO1PWiBb1yZkaQAeBg0RiUD=sA@mail.gmail.com>
In-Reply-To: <CACPK8XeKEsMCP6vOQo96Y7TaBO1PWiBb1yZkaQAeBg0RiUD=sA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 16 Dec 2018 16:44:58 +0200
Message-ID: <CAP6Zq1iNBy9KGS4uGstsEERXL4qio5N-ou30v7MpcNfQQGPYLw@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000070c6e7057d249ecd"
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
X-List-Received-Date: Sun, 16 Dec 2018 14:38:38 -0000

--00000000000070c6e7057d249ecd
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Dec 2018 at 02:56, Joel Stanley <joel@jms.id.au> wrote:

> > > Commit upstream to kernel 4.20
> > > hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258
>
> Done.
>
> > > Commits will upstream to kernel 4.21
> > >
> > > dt-binding: spi: add NPCM PSPI controller documentation
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=4ad26864df53b265976c4a3ae61b1e6cad92fe40
> > >
> > > spi: npcm: add NPCM PSPI controller driver
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=2a22f1b30cee8d1e104a6c5062a609bedbfd5c39
> > >
> > > spi: npcm: fix u32 csgpio being checked for less than zero
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=757ec116c9bce4278fa4423039736c832cc63b6f
> > >
> > > spi: npcm: fix platform_no_drv_owner.cocci warnings
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=7986e2273c1ed987ff34f1c318d5a2b18e8c0fee
> > >
> > > spi: npcm: Fix an error code in the probe function
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=428f977a6a6b43154928571b01fa8415c11a9244
> > >
> > > spi: npcm: Fix uninitialized variable warning
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=1d2319efb6a970d5f5740a60828244e6c309df2b
> > >
> > > spi: npcm: Modify pspi send function
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=1fa33be36cfc8908be951ed56113906f422add50
> > >
> > > spi: Update NPCM PSPI controller documentation
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=6ab4a3502923c20c5a6921868e787e5fd033409b
> > >
> > > pinctrl: nuvoton: modify NPCM7xx pin configuration function
> > >
> https://git.linaro.org/people/linus.walleij/linux-pinctrl.git/commit/?h=for-next&id=67b249aaa650a461c86484e6c365f33887f0968a
> > >
> > > watchdog: npcm: Modify npcm watchdog kconfig arch parameter
> > >
> > >
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging/+/4181f4a55838db15deaed315b11bfab395be0a17
>
> All of the above are now done. I built your defconfig and net booted
> it on the poleg evb I have:
>
>  Booting Linux on physical CPU 0x0
>  Linux version 4.19.8-00077-gdfde697b6cae (joel@aurora) (gcc version
> 8.2.0 (Ubuntu 8.2.0-7ubuntu1)) #2 SMP Thu Dec 13 11:24:12 ACDT 2018
>  CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=18c5387d
>  CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>  OF: fdt: Machine model: Nuvoton npcm750 Development Board (Device Tree)
>
>
> > > Commits on upstream process
> > >
> > > dt-binding: mtd: add NPCM FIU controller
> > >
> https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb71223156d5c525c18dd74
> > >
> > > mtd: spi-nor: add NPCM FIU controller driver
> > >
> https://github.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c5c5eaffa519561
> > >
> > > dt-bindings: i2c: npcm7xx: add binding for i2c controller
> > >
> https://github.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c03e3912387ff9a7
> > >
> > > i2c: npcm: driver for Poleg i2c controller
> > >
> https://github.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7d83dafcc2dbc6c
> > >
> > > dt-binding: bmc: Add NPCM7xx LPC BPC documentation
> > >
> https://github.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790af65ac38b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c
> > >
> > > misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver
> > >
> https://github.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b63d5a244a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403
> > >
> > > misc: bpc: modify remove function in npcm7xx bpc driver
> > >
> https://github.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f84729beebb66a9c#diff-7081e24727d8058bcc6ebf20230f5403
> > >
> > > PCI mail box commits
> > >
> > > dt-binding: bmc: add npcm7xx pci mailbox document
> > >
> https://github.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e05773545f181246496
> > >
> > > misc: mbox: add npcm7xx pci mailbox driver
> > >
> https://github.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf50ad8365f2301d1
> > >
> > > EMC net commits
> > >
> > > net: npcm: add NPCM7xx Ethernet MAC controller
> > >
> https://github.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d3477a8e9f7d950b
> > >
> > > dt-binding: net: document NPCM7xx EMC DT bindings
> > >
> https://github.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce833afa3957fb2d
>
> Not all of the above commits do not have signed-off-bys. This is
> required for putting it in the kernel tree.
>
> Instead of cherry-picking these from your tree, I would prefer to see
> them posted to the mailing list where I can apply them. Can you please
> send them out using git send-email, and we can go from there?
>

Done.

I have applied the device tree patch you sent.
>
> Can you please re-send the defconfig using git-send-email and name it
> 'poleg_defconfig' or 'poleg_svb_defconfig' (what is SVB?) to match the
> defconfig naming convention. It should be generated against the
> dev-4.19 tree (make poleg_defconfig && make savedefconfig && cp
> defconfig arch/arm/config/poleg_defconfig).
>
>
Done, you can find the new defconfig in the mail I sent earlier,
BTW, I modify the name to npcm7xx_defconfig

Cheers,
>
> Joel
>

Thank a lot,

Tomer

--00000000000070c6e7057d249ecd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, 13 Dec 2018 at 02:56, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">=
joel@jms.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">&gt; &gt; Commit upstream to kernel 4.20<br>
&gt; &gt; hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git/commit/?id=3Df21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258" rel=3D"=
noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3Df21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258=
</a><br>
<br>
Done.<br>
<br>
&gt; &gt; Commits will upstream to kernel 4.21<br>
&gt; &gt;<br>
&gt; &gt; dt-binding: spi: add NPCM PSPI controller documentation<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D4ad26864df53b265976c4a3ae61b1e6cad9=
2fe40" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D4ad26864df53=
b265976c4a3ae61b1e6cad92fe40</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: add NPCM PSPI controller driver<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D2a22f1b30cee8d1e104a6c5062a609bedbf=
d5c39" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D2a22f1b30cee=
8d1e104a6c5062a609bedbfd5c39</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: fix u32 csgpio being checked for less than zero<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D757ec116c9bce4278fa4423039736c832cc=
63b6f" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D757ec116c9bc=
e4278fa4423039736c832cc63b6f</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: fix platform_no_drv_owner.cocci warnings<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D7986e2273c1ed987ff34f1c318d5a2b18e8=
c0fee" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D7986e2273c1e=
d987ff34f1c318d5a2b18e8c0fee</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: Fix an error code in the probe function<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D428f977a6a6b43154928571b01fa8415c11=
a9244" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D428f977a6a6b=
43154928571b01fa8415c11a9244</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: Fix uninitialized variable warning<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D1d2319efb6a970d5f5740a60828244e6c30=
9df2b" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D1d2319efb6a9=
70d5f5740a60828244e6c309df2b</a><br>
&gt; &gt;<br>
&gt; &gt; spi: npcm: Modify pspi send function<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D1fa33be36cfc8908be951ed56113906f422=
add50" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D1fa33be36cfc=
8908be951ed56113906f422add50</a><br>
&gt; &gt;<br>
&gt; &gt; spi: Update NPCM PSPI controller documentation<br>
&gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/brooni=
e/spi.git/commit/?h=3Dfor-next&amp;id=3D6ab4a3502923c20c5a6921868e787e5fd03=
3409b" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/=
linux/kernel/git/broonie/spi.git/commit/?h=3Dfor-next&amp;id=3D6ab4a3502923=
c20c5a6921868e787e5fd033409b</a><br>
&gt; &gt;<br>
&gt; &gt; pinctrl: nuvoton: modify NPCM7xx pin configuration function<br>
&gt; &gt; <a href=3D"https://git.linaro.org/people/linus.walleij/linux-pinc=
trl.git/commit/?h=3Dfor-next&amp;id=3D67b249aaa650a461c86484e6c365f33887f09=
68a" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.org/people/lin=
us.walleij/linux-pinctrl.git/commit/?h=3Dfor-next&amp;id=3D67b249aaa650a461=
c86484e6c365f33887f0968a</a><br>
&gt; &gt;<br>
&gt; &gt; watchdog: npcm: Modify npcm watchdog kconfig arch parameter<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://kernel.googlesource.com/pub/scm/linux/kernel/g=
it/groeck/linux-staging/+/4181f4a55838db15deaed315b11bfab395be0a17" rel=3D"=
noreferrer" target=3D"_blank">https://kernel.googlesource.com/pub/scm/linux=
/kernel/git/groeck/linux-staging/+/4181f4a55838db15deaed315b11bfab395be0a17=
</a><br>
<br>
All of the above are now done. I built your defconfig and net booted<br>
it on the poleg evb I have:<br>
<br>
=C2=A0Booting Linux on physical CPU 0x0<br>
=C2=A0Linux version 4.19.8-00077-gdfde697b6cae (joel@aurora) (gcc version<b=
r>
8.2.0 (Ubuntu 8.2.0-7ubuntu1)) #2 SMP Thu Dec 13 11:24:12 ACDT 2018<br>
=C2=A0CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=3D18c5387d<br>
=C2=A0CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction ca=
che<br>
=C2=A0OF: fdt: Machine model: Nuvoton npcm750 Development Board (Device Tre=
e)<br>
<br>
<br>
&gt; &gt; Commits on upstream process<br>
&gt; &gt;<br>
&gt; &gt; dt-binding: mtd: add NPCM FIU controller<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/f13c82d=
ca3ca21175eb71223156d5c525c18dd74" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb71223156d5c5=
25c18dd74</a><br>
&gt; &gt;<br>
&gt; &gt; mtd: spi-nor: add NPCM FIU controller driver<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/747809a=
0082dbeaaa6b786842c5c5eaffa519561" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c5c5ea=
ffa519561</a><br>
&gt; &gt;<br>
&gt; &gt; dt-bindings: i2c: npcm7xx: add binding for i2c controller<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/07be53b=
47443fcab645f0e67c03e3912387ff9a7" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c03e391=
2387ff9a7</a><br>
&gt; &gt;<br>
&gt; &gt; i2c: npcm: driver for Poleg i2c controller<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/3a7f337=
5024461d3db17a78cb7d83dafcc2dbc6c" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7d83da=
fcc2dbc6c</a><br>
&gt; &gt;<br>
&gt; &gt; dt-binding: bmc: Add NPCM7xx LPC BPC documentation<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/e8b6cc1=
c31e744b3fd5630d790af65ac38b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Nuvoton-Israel/linux/=
commit/e8b6cc1c31e744b3fd5630d790af65ac38b2c24d#diff-e7386aa740d12baf8cdc2a=
0ab8e5347c</a><br>
&gt; &gt;<br>
&gt; &gt; misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/adee227=
ac24431cd033f1c44b63d5a244a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Nuvoton-Israel/linux/=
commit/adee227ac24431cd033f1c44b63d5a244a0bdd3b#diff-7081e24727d8058bcc6ebf=
20230f5403</a><br>
&gt; &gt;<br>
&gt; &gt; misc: bpc: modify remove function in npcm7xx bpc driver<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/1c5268f=
9b17f9333ee2fb245f84729beebb66a9c#diff-7081e24727d8058bcc6ebf20230f5403" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Nuvoton-Israel/linux/=
commit/1c5268f9b17f9333ee2fb245f84729beebb66a9c#diff-7081e24727d8058bcc6ebf=
20230f5403</a><br>
&gt; &gt;<br>
&gt; &gt; PCI mail box commits<br>
&gt; &gt;<br>
&gt; &gt; dt-binding: bmc: add npcm7xx pci mailbox document<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/7da4f41=
849aef11b1a9a6e05773545f181246496" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e05773545f=
181246496</a><br>
&gt; &gt;<br>
&gt; &gt; misc: mbox: add npcm7xx pci mailbox driver<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/c3d5d2b=
ab5ad216e6c0debabf50ad8365f2301d1" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf50ad83=
65f2301d1</a><br>
&gt; &gt;<br>
&gt; &gt; EMC net commits<br>
&gt; &gt;<br>
&gt; &gt; net: npcm: add NPCM7xx Ethernet MAC controller<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/6a9407e=
d142ff2c205d732d4d3477a8e9f7d950b" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d3477a8=
e9f7d950b</a><br>
&gt; &gt;<br>
&gt; &gt; dt-binding: net: document NPCM7xx EMC DT bindings<br>
&gt; &gt; <a href=3D"https://github.com/Nuvoton-Israel/linux/commit/66478b8=
8409dba415a7bb008ce833afa3957fb2d" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce833af=
a3957fb2d</a><br>
<br>
Not all of the above commits do not have signed-off-bys. This is<br>
required for putting it in the kernel tree.<br>
<br>
Instead of cherry-picking these from your tree, I would prefer to see<br>
them posted to the mailing list where I can apply them. Can you please<br>
send them out using git send-email, and we can go from there?<br></blockquo=
te><div>=C2=A0</div><div>Done.=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
I have applied the device tree patch you sent.<br>
<br>
Can you please re-send the defconfig using git-send-email and name it<br>
&#39;poleg_defconfig&#39; or &#39;poleg_svb_defconfig&#39; (what is SVB?) t=
o match the<br>
defconfig naming convention. It should be generated against the<br>
dev-4.19 tree (make poleg_defconfig &amp;&amp; make savedefconfig &amp;&amp=
; cp<br>
defconfig arch/arm/config/poleg_defconfig).<br>
<br></blockquote><div>=C2=A0</div><div>Done, you can find the new defconfig=
 in the mail I sent earlier,</div><div>BTW, I modify the name to npcm7xx_de=
fconfig<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Cheers,<br>
<br>
Joel<br></blockquote><div><br></div><div>Thank a lot,</div><div><br></div><=
div>Tomer=C2=A0</div></div></div>

--00000000000070c6e7057d249ecd--
