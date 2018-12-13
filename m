Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="XzKWTiqc"; 
 dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FZxg5kJ9zDqVT
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 11:56:23 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id z16so382953qtq.4
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 16:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x//LuTyohjcONJ2YiSeLx4uAze/LEqMyP/+PrLmGfAI=;
 b=XzKWTiqcCFgv/de2d1HnuvnV01fVfnia6Zf8X9hS2bn4rBaC8wmd1eHOhgl7qWIkGb
 8MzY24+ijaa9Zq8aTT5KzKf8RPyXe+UFa9QTJbDPEERshX3xeg6i5daApm9zHsjppA88
 TprE4Oj90E8D9vEdEYtUse5zwzSHMqmK8ZEBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x//LuTyohjcONJ2YiSeLx4uAze/LEqMyP/+PrLmGfAI=;
 b=QOFTr7odcMxTibsJ8910DMEUr064WauDpxvrKbN5EeXnNlcpM40x2M8uVT2Ve1Ixrl
 g9rJ+i5T7D0rQq3BbOwi4Qi3CFrXADVwdUGs4m3GEJhacgf3KTPWhZvfl/YqW9z9FJL4
 ZUgaIktF7vbM3To7X73NE5bmHbvG+KdyQYl5FT34ho/XHRKFNy0pGD/Ymchp+xYG+ygX
 kICfl+3JBEiR9Xn9rjTe+VZhoKjK25ELF5GA3V4hfXMyJXowWbWl4T9eV29nP/8ek1AH
 IZl2XyidxQRGsBD4dn5htofRDW6ROrDxkJ/LCb59SXrDvnbhzPClN4eqVcX/eR1uFl6j
 oxdQ==
X-Gm-Message-State: AA+aEWa7VYKGCI4qSc1Hixl6pWgE7VIVU/FBT60hfDsD3TScbFzegUxp
 QEsxzG9R132A9/gp3lDZ4S7/J9X8RAXRfftcenc=
X-Google-Smtp-Source: AFSGD/VYs+Ovj8Mq38CRTvdnlsqYLZDLh0KnUFZKL5kqw6tSOz23E3KmLGHQe2eGQVKcELkxFPuFuUW0fHAVfAFnrs0=
X-Received: by 2002:ac8:748:: with SMTP id k8mr21996221qth.235.1544662580120; 
 Wed, 12 Dec 2018 16:56:20 -0800 (PST)
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
In-Reply-To: <CACPK8XcGpd5Y3XTFB+VTFr+1S4hf4ytgMZV-VeDBrN8nyFPDHg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Dec 2018 11:26:09 +1030
Message-ID: <CACPK8XeKEsMCP6vOQo96Y7TaBO1PWiBb1yZkaQAeBg0RiUD=sA@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 13 Dec 2018 00:56:25 -0000

> > Commit upstream to kernel 4.20
> > hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258

Done.

> > Commits will upstream to kernel 4.21
> >
> > dt-binding: spi: add NPCM PSPI controller documentation
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=4ad26864df53b265976c4a3ae61b1e6cad92fe40
> >
> > spi: npcm: add NPCM PSPI controller driver
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=2a22f1b30cee8d1e104a6c5062a609bedbfd5c39
> >
> > spi: npcm: fix u32 csgpio being checked for less than zero
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=757ec116c9bce4278fa4423039736c832cc63b6f
> >
> > spi: npcm: fix platform_no_drv_owner.cocci warnings
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=7986e2273c1ed987ff34f1c318d5a2b18e8c0fee
> >
> > spi: npcm: Fix an error code in the probe function
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=428f977a6a6b43154928571b01fa8415c11a9244
> >
> > spi: npcm: Fix uninitialized variable warning
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=1d2319efb6a970d5f5740a60828244e6c309df2b
> >
> > spi: npcm: Modify pspi send function
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=1fa33be36cfc8908be951ed56113906f422add50
> >
> > spi: Update NPCM PSPI controller documentation
> > https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=for-next&id=6ab4a3502923c20c5a6921868e787e5fd033409b
> >
> > pinctrl: nuvoton: modify NPCM7xx pin configuration function
> > https://git.linaro.org/people/linus.walleij/linux-pinctrl.git/commit/?h=for-next&id=67b249aaa650a461c86484e6c365f33887f0968a
> >
> > watchdog: npcm: Modify npcm watchdog kconfig arch parameter
> >
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-staging/+/4181f4a55838db15deaed315b11bfab395be0a17

All of the above are now done. I built your defconfig and net booted
it on the poleg evb I have:

 Booting Linux on physical CPU 0x0
 Linux version 4.19.8-00077-gdfde697b6cae (joel@aurora) (gcc version
8.2.0 (Ubuntu 8.2.0-7ubuntu1)) #2 SMP Thu Dec 13 11:24:12 ACDT 2018
 CPU: ARMv7 Processor [414fc091] revision 1 (ARMv7), cr=18c5387d
 CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
 OF: fdt: Machine model: Nuvoton npcm750 Development Board (Device Tree)


> > Commits on upstream process
> >
> > dt-binding: mtd: add NPCM FIU controller
> > https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb71223156d5c525c18dd74
> >
> > mtd: spi-nor: add NPCM FIU controller driver
> > https://github.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c5c5eaffa519561
> >
> > dt-bindings: i2c: npcm7xx: add binding for i2c controller
> > https://github.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c03e3912387ff9a7
> >
> > i2c: npcm: driver for Poleg i2c controller
> > https://github.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7d83dafcc2dbc6c
> >
> > dt-binding: bmc: Add NPCM7xx LPC BPC documentation
> > https://github.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790af65ac38b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c
> >
> > misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver
> > https://github.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b63d5a244a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403
> >
> > misc: bpc: modify remove function in npcm7xx bpc driver
> > https://github.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f84729beebb66a9c#diff-7081e24727d8058bcc6ebf20230f5403
> >
> > PCI mail box commits
> >
> > dt-binding: bmc: add npcm7xx pci mailbox document
> > https://github.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e05773545f181246496
> >
> > misc: mbox: add npcm7xx pci mailbox driver
> > https://github.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf50ad8365f2301d1
> >
> > EMC net commits
> >
> > net: npcm: add NPCM7xx Ethernet MAC controller
> > https://github.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d3477a8e9f7d950b
> >
> > dt-binding: net: document NPCM7xx EMC DT bindings
> > https://github.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce833afa3957fb2d

Not all of the above commits do not have signed-off-bys. This is
required for putting it in the kernel tree.

Instead of cherry-picking these from your tree, I would prefer to see
them posted to the mailing list where I can apply them. Can you please
send them out using git send-email, and we can go from there?

I have applied the device tree patch you sent.

Can you please re-send the defconfig using git-send-email and name it
'poleg_defconfig' or 'poleg_svb_defconfig' (what is SVB?) to match the
defconfig naming convention. It should be generated against the
dev-4.19 tree (make poleg_defconfig && make savedefconfig && cp
defconfig arch/arm/config/poleg_defconfig).

Cheers,

Joel
