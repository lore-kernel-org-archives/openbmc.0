Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="egm8lGUx"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43FXsR5Hy9zDqVs
 for <openbmc@lists.ozlabs.org>; Thu, 13 Dec 2018 10:22:34 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id q1so68072qkf.13
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 15:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q8EI7maqtEE2sum/fhNr7AGkTfvH1Ai9ha5MswqFHE0=;
 b=egm8lGUxZVydhoo0ZcHSz9OJKRnQ3OR152iWqptsZC+bs/YJcjtVXiDpXDzHSb+E3b
 LudPfnYuCXEPbFFOJRH+iW+wHVrqY4h1lQYDdiahmuQZ0O7j6coMXK/hnKKmCOmw97cR
 vzvNYBLLRW2GL7RlJrKYysk4wYBn8yWjzN0co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q8EI7maqtEE2sum/fhNr7AGkTfvH1Ai9ha5MswqFHE0=;
 b=Idy2BHlpNuQfh28i+4EoStBg+7ih3xWWH+n0lhG2FW3HPV4KvuvMbH749MfZe321no
 4jF2PPwOJ19/fS4SFMq/ZSCcI/3JaBO39De+ikZ9vpy3adnTWsZs/puKVtmqRbKrDMhX
 fwAnXOGWVO5VYPrNq8s9CVv72ZGk6IM5rwWYlFvlP5a5xigP3sIFozTNtpUtc/03sS8a
 Jen22GxIoUg1CUFAixw0IV0eFshEiE3IxWDMKOUeQEHK4Qy5uvOaptVxxYCoUOmR6EWT
 8or2ez6BqlXEcdvZi/CXELMkiL6Ui16MuaKV9DR+xz2x/0h6tu7CC1v2ypaceF9q6bXl
 2GHQ==
X-Gm-Message-State: AA+aEWbHSHR+MjO0Mb0T48nV8iLg2a5GfsaqkXQLj0JXfFjltOQ3qBmU
 K0jLPM7BP7y8m32N9bGnHMT8TSN50MF0Px0ywpI=
X-Google-Smtp-Source: AFSGD/WjIzv6OfKKCCST5gHUcsdAmAGKQTEsUvv8PBIM3Og0GE37c9jf37FxTDo5Kj7PZSLZnPJWGQG2F080Y906yr0=
X-Received: by 2002:ae9:eb96:: with SMTP id
 b144mr19967353qkg.127.1544656951836; 
 Wed, 12 Dec 2018 15:22:31 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
 <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <CACPK8Xd2FDD=FX7SK5cxWrkgGT190rJAHOJefs4Gws6qzJkfYA@mail.gmail.com>
 <CAP6Zq1je+PsriSUUL2JoNX-OQte85F=uQd7EG9np-D1fsxjcTg@mail.gmail.com>
In-Reply-To: <CAP6Zq1je+PsriSUUL2JoNX-OQte85F=uQd7EG9np-D1fsxjcTg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Dec 2018 09:52:20 +1030
Message-ID: <CACPK8XcGpd5Y3XTFB+VTFr+1S4hf4ytgMZV-VeDBrN8nyFPDHg@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Tomer Maimon <tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 12 Dec 2018 23:22:37 -0000

Hi Tomer,

On Wed, 12 Dec 2018 at 22:29, Tomer Maimon <tmaimon77@gmail.com> wrote:
> First, I like to apologize that there is many patches of NPCM to add, so =
it look quite messy...

That's fine. The NPCM team has done a good job of incrementally
upstreaming their work, and I'm sure you will continue this progress
next year.

A note for next time: turn off the HTML email for the mailing list please.

> =C2=B7         PCI Mailbox patches - The PCI mail box will not upstream, =
because it not build with the mailbox driver interface,
> but still OpenBMC have an application to use the miscellaneous mailbox bu=
t still OpenBMC have an application
> to use the miscellaneous mailbox.

I think we had a similar issue when attempting to upstream the ASPEED
LPC mailbox driver. The kernel has a driver model called "mailbox",
and so the reviewers assumed the hardware should use that. However it
does not fit the hardware or use case at all. We should work out a
common solution here.

> =C2=B7         ETHERNET MAC CONTROLLER (EMC) patches =E2=80=93 the patche=
s is on final stage of upstream work, but it is very important to us that t=
he patches will
> add now because costumer requests that are using the OpenBMC linux.

Is this the driver that Ben offered to help rework? I strongly suggest
re-starting the conversation with him. He is very experienced with the
network stack, and will be able to help get the driver in shape for
upstream, and make it efficient.

I'll take a look at the patches below today.

Cheers,

Joel

> Commit upstream to kernel 4.20
>
>
>
> hwmon: (npcm-750-pwm-fan) Change initial pwm target to 255
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df21c8e753b1dcb8f9e5b096db1f7f4e6fdfa7258
>
>
>
> Commits will upstream to kernel 4.21
>
>
>
> dt-binding: spi: add NPCM PSPI controller documentation
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D4ad26864df53b265976c4a3ae61b1e6cad92fe40
>
>
>
> spi: npcm: add NPCM PSPI controller driver
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D2a22f1b30cee8d1e104a6c5062a609bedbfd5c39
>
>
>
> spi: npcm: fix u32 csgpio being checked for less than zero
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D757ec116c9bce4278fa4423039736c832cc63b6f
>
>
>
> spi: npcm: fix platform_no_drv_owner.cocci warnings
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D7986e2273c1ed987ff34f1c318d5a2b18e8c0fee
>
>
>
> spi: npcm: Fix an error code in the probe function
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D428f977a6a6b43154928571b01fa8415c11a9244
>
>
>
> spi: npcm: Fix uninitialized variable warning
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D1d2319efb6a970d5f5740a60828244e6c309df2b
>
>
>
> spi: npcm: Modify pspi send function
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D1fa33be36cfc8908be951ed56113906f422add50
>
>
>
> spi: Update NPCM PSPI controller documentation
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?h=
=3Dfor-next&id=3D6ab4a3502923c20c5a6921868e787e5fd033409b
>
>
>
> pinctrl: nuvoton: modify NPCM7xx pin configuration function
>
> https://git.linaro.org/people/linus.walleij/linux-pinctrl.git/commit/?h=
=3Dfor-next&id=3D67b249aaa650a461c86484e6c365f33887f0968a
>
>
>
> watchdog: npcm: Modify npcm watchdog kconfig arch parameter
>
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/groeck/linux-sta=
ging/+/4181f4a55838db15deaed315b11bfab395be0a17
>
>
>
> Commits on upstream process
>
>
>
> dt-binding: mtd: add NPCM FIU controller
>
> https://github.com/Nuvoton-Israel/linux/commit/f13c82dca3ca21175eb7122315=
6d5c525c18dd74
>
>
>
> mtd: spi-nor: add NPCM FIU controller driver
>
> https://github.com/Nuvoton-Israel/linux/commit/747809a0082dbeaaa6b786842c=
5c5eaffa519561
>
>
>
> dt-bindings: i2c: npcm7xx: add binding for i2c controller
>
> https://github.com/Nuvoton-Israel/linux/commit/07be53b47443fcab645f0e67c0=
3e3912387ff9a7
>
>
>
> i2c: npcm: driver for Poleg i2c controller
>
> https://github.com/Nuvoton-Israel/linux/commit/3a7f3375024461d3db17a78cb7=
d83dafcc2dbc6c
>
>
>
> dt-binding: bmc: Add NPCM7xx LPC BPC documentation
>
> https://github.com/Nuvoton-Israel/linux/commit/e8b6cc1c31e744b3fd5630d790=
af65ac38b2c24d#diff-e7386aa740d12baf8cdc2a0ab8e5347c
>
>
>
> misc: npcm7xx-lpc-bpc: add NPCM7xx BIOS post code driver
>
> https://github.com/Nuvoton-Israel/linux/commit/adee227ac24431cd033f1c44b6=
3d5a244a0bdd3b#diff-7081e24727d8058bcc6ebf20230f5403
>
>
>
> misc: bpc: modify remove function in npcm7xx bpc driver
>
> https://github.com/Nuvoton-Israel/linux/commit/1c5268f9b17f9333ee2fb245f8=
4729beebb66a9c#diff-7081e24727d8058bcc6ebf20230f5403
>
>
>
> PCI mail box commits
>
>
>
> dt-binding: bmc: add npcm7xx pci mailbox document
>
> https://github.com/Nuvoton-Israel/linux/commit/7da4f41849aef11b1a9a6e0577=
3545f181246496
>
>
>
> misc: mbox: add npcm7xx pci mailbox driver
>
> https://github.com/Nuvoton-Israel/linux/commit/c3d5d2bab5ad216e6c0debabf5=
0ad8365f2301d1
>
>
>
> EMC net commits
>
>
>
> net: npcm: add NPCM7xx Ethernet MAC controller
>
> https://github.com/Nuvoton-Israel/linux/commit/6a9407ed142ff2c205d732d4d3=
477a8e9f7d950b
>
>
>
> dt-binding: net: document NPCM7xx EMC DT bindings
>
> https://github.com/Nuvoton-Israel/linux/commit/66478b88409dba415a7bb008ce=
833afa3957fb2d
