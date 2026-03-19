Return-Path: <openbmc+bounces-1638-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27856108E1E6
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 10:57:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fc2hf5wjCz2ynh;
	Thu, 19 Mar 2026 21:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b12e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773917842;
	cv=pass; b=ATzeUOZBMia7uro5pacEdyx8LIrI90XYM3+pQq501FyShkK0dneu9GOyaIfWd097Xvobr7qZcd5xgTjVee1CHDMTchr05EhFzhOlWLL1nwe9QsPKPTZ7mhK+Sgsp/TU2hhoGKzoqd0rkWXFldWxnSXpeQOze6fnXUseifEESBQXJP9hqRPBvAHBeH2KczH/cmcoqf8P5nt0LTNpz46WD1vqkaVaNMYfTTxvZEVa8Zk78E0AyJwwIkty4mwAN3Xs6tWAFYBnYHLmSUJ2pyO49PKRS+WbX7ul1HknwjqpxmjeSBE9lI8VtVWopVvGBzPMhY4WoFR+sQ1+tSye+s+oYrw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773917842; c=relaxed/relaxed;
	bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iihSUvDd6CKBHVIxd2QehgNq7pHZBjl0vwj1iD2ZwaCER4pODGvNQmLiFxh57o++2KKdyu/A73JtwzaDT5AY/CacprSmlV0qiQfUBtLAi/cioat0pzinY/jfiYwpcEra38e33KJHMxGAr2JjlYFztURhiu51WBlNGk/i4eGPU1X7366PexI8UNZqCui31FX+nS7NiQc7C81G7hZD+AfxBhgLOVb3eIZvA09TJQ51p9h8ucSLl/ny0TL0qGdI8eINHphzLlpZ4WnMadbYcb0l7UbjRwIOeNpLKNwTtb+o7PESo+edEB6C85zzNmWH4VxrPDdb5LypVYei90Vh1/vpDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fX6Pz3oc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12e; helo=mail-yx1-xb12e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fX6Pz3oc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12e; helo=mail-yx1-xb12e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12e.google.com (mail-yx1-xb12e.google.com [IPv6:2607:f8b0:4864:20::b12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fc2hc58WJz2ySj
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 21:57:19 +1100 (AEDT)
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64e9f79cae8so425076d50.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 03:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773917837; cv=none;
        d=google.com; s=arc-20240605;
        b=NLPhbOLb8JymbK1bQM8Y1Dawk1o53qZn+e5o5znXIR6DaV6zvRAU9oK1oULCs+1iGl
         6ShIKh3RuutCwpwqXQevP8UoNkdoS9HZnQhmUnMj29D540F2pyhv79RHHioEKcJufdwM
         bn6zPpIFKUpIEtqXEVWGZWkyEI9k32KYq4v6yBYH+dR2t+eITD4Y7mJo5+zV79c645Tb
         4n9WjNAZUN+vlW8stkMu2Qxrr2m1ozaqSVj6DiBkyFghQBBIDuxLmj1V3POh9HP6TV5u
         ToHCa2LckEMIQplBq8QXmQl7GO6T3QecA6ChWLlh2g3G2nSvoaO/0Jij4b8txH9KFIvk
         2q5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        fh=q/zn9F2cDj+dFNJLOM92H+FkT5g09ksAHv9S5phHgpw=;
        b=WGHYsgraPkFWVhSSrD2nf2vq7DEQzNbrE8GIFh14rHAabKEZwfndMY4VlceUg1qqlx
         VG+6ng/MK+0OTpfR7XoHjOkJ8DlE2cgGwnGvxIPHugiN0I/yib+Vp+klDVL8aMVH/TXb
         0etEihO8mnjnQZq46Tme9KcnezcDJksSyV98VAhxRAcUiVdTUZVXhbbNTSDP76J8UTLv
         94276XsoOo+DZib2dg3xoNY/pVGxI7rzlx/SHQs8KpijQ2jEYvc7meEgOG2AgOqUHMyU
         Ded8UjFAkVFYWSTt4ZwMxiNXY6IiDwDYVWLtqR8A3Xt5m3tGUZvOPRQsNH4FpOVqtC2/
         BSOA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773917837; x=1774522637; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        b=fX6Pz3ocB0EIu1bOEIMre+ThcejUUj0f19ssoGQJ83nJoanHH6tl15K3umrZ2Iumcb
         XBboi8fJnQduFW5Bxx+nId+i++Lunso5x/Q0VnqJ/53GDJC3iIOQ9vFebdiz/cKXsJih
         2BdW9EeGTqkNJ9ZXGxcdf18KMnKFgmm+CVrjyhl1x3bHWmcSyJ4o9liwt5lgJSzwgvKR
         uMe4b8RZB78RWU6tbLPVgBuDd/RI5wtOORkU7Nc1XdEMHfuHu77NEQpN5ULs7eCAOIAI
         M4lwxKP0fD9LWG7zSoQ7p3824+MyFRi98dNQn3yn9B6Ji2Hh6I6jgt7o2vmhvh1jp7pz
         VzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917837; x=1774522637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Y2y/RwBdkzoJubItdybq6OxUp3cxRf7Wsr1KNbZFdw=;
        b=GBXBEOiPVIqTO89HQKhL97CNKpe4ObqSSUtxYIIcAXilO7+0v5UvVymDIXnVTTbbgB
         dA2IdjR9cwABKEdst/LDPJ7FfUyRcdSAvHtzUAbV27g24W1aYfuYN6AWwaRWQyqT4+kg
         TTk09xWYpC4LBa2aUuLaycZI7mSNTEnTCv+7P194ZOe78zhNxxvzl8gJGVcYcjyfRoVO
         kCGFKHoGhnAFWxXTnMRpwR9OtwWwR++4dw6sP3xoPcTVbGxby8jLO6rMSyNU7LdZmRko
         JtEKmpaVvm5u617LfrQI/z/tJkgOrKkUP3e1dE7ptF4T60sLzZMBj9lIdO64rbspCo8L
         SPMw==
X-Forwarded-Encrypted: i=1; AJvYcCXPTBcq69lDIUIXh4n6JU47aWzLwLU4eim22DGv2oHEsvrHnJUaYuNlrBROcaRFfeGSISVWV5lp@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxcydz7okzMeFMxaE4TUtg4kkyMvs/3zecDUH0j+U0VziAlaAIC
	rwVD0EykWYTbfi60+EogFtmUBmK1TU51IlY6gCT00N24S59vINuQDIjh9ICZQQJqcYEA9IJBsAU
	u11Oktr/hxCRCLjwGP2lUzUFKcEYajNw=
X-Gm-Gg: ATEYQzynqKBfRxr3wS5xqA7qrgHi9WNVU+SjK9cNSYwBPmImLLObMTSocIjYx/NOYzr
	Ood2LJcdGA+gW/N0KrUHoRez7NFsQj6Y8L7/aagZ+JS0KnJ54Qwo8yPpAE78G7MBzKC10WMILeL
	mQhCme9EqXtNeaLDfM9P+yBWyKseMppws+IWoES7umTagwhOdE747pxIFI9kPy4sJpPjOvrwfK5
	dEhy6c/HCFPj55Tvwk3RLZhX6qh+zBx0gvusxbqJGbARFQgXgq3nJomSsml3dYpQQg1aeJe1AWW
	FT/qT+zM
X-Received: by 2002:a53:acd3:0:10b0:64c:b7c9:dffd with SMTP id
 956f58d0204a3-64e915e8daamr5846442d50.58.1773917836798; Thu, 19 Mar 2026
 03:57:16 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260318193538.246853-1-visitorckw@gmail.com> <20260318193538.246853-3-visitorckw@gmail.com>
In-Reply-To: <20260318193538.246853-3-visitorckw@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 19 Mar 2026 12:57:04 +0200
X-Gm-Features: AaiRm53rvDmQUT5KJXSzT_dt1jC1YV7jFfq4QfNKoPbw45Vjy844uk6y9AHfZJg
Message-ID: <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com, tali.perry1@gmail.com, 
	srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuan-Wei,

Thanks for the upstream Nuvoton OTP driver.

On Wed, 18 Mar 2026 at 21:36, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
> NPCM SoCs.
>
> This OTP is read-only and manages two independent arrays: Key Storage
> and Fuse Array, which contain cryptographic keys, hardware strapping,
> and calibration data.
>
> Each array provides 1024 bytes of storage.
>
> It can be accessed by writing the target address and a read command
> to the control registers, and then polling a status register until
> the data is ready. Concurrent accesses are protected by a mutex.
>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  MAINTAINERS              |   7 +++
>  drivers/nvmem/Kconfig    |  10 +++
>  drivers/nvmem/Makefile   |   2 +
>  drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 148 insertions(+)
>  create mode 100644 drivers/nvmem/npcm-otp.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61bf550fd37c..e391e2bcb5f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18894,6 +18894,13 @@ F:     drivers/nubus/
>  F:     include/linux/nubus.h
>  F:     include/uapi/linux/nubus.h
>
> +NUVOTON NPCM OTP NVMEM DRIVER
> +M:     Kuan-Wei Chiu <visitorckw@gmail.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
> +F:     drivers/nvmem/npcm-otp.c
> +
>  NUVOTON NCT6694 MFD DRIVER
>  M:     Ming Yu <tmyu0@nuvoton.com>
>  S:     Supported
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 74ddbd0f79b0..5d065b7448ff 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
>           This driver can also be built as a module. If so, the module
>           will be called nvmem_qoriq_efuse.
>
> +config NVMEM_NPCM_OTP
> +       tristate "Nuvoton NPCM7xx OTP Controller"
> +       depends on ARCH_NPCM || COMPILE_TEST
> +       help
> +         This option enables support for the OTP (One-Time Programmable)
> +         controller found on Nuvoton NPCM7xx BMCs.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called npcm-otp.
> +
>  endif
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 7252b8ec88d4..63c23b304d64 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)            +=3D nvmem_zynqmp=
_nvmem.o
>  nvmem_zynqmp_nvmem-y                   :=3D zynqmp_nvmem.o
>  obj-$(CONFIG_NVMEM_QORIQ_EFUSE)                +=3D nvmem-qoriq-efuse.o
>  nvmem-qoriq-efuse-y                    :=3D qoriq-efuse.o
> +obj-$(CONFIG_NVMEM_NPCM_OTP)           +=3D nvmem-npcm-otp.o
> +nvmem-npcm-otp-y                       :=3D npcm-otp.o
> diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
> new file mode 100644
> index 000000000000..abe4bab66c06
> --- /dev/null
> +++ b/drivers/nvmem/npcm-otp.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
> + *
> + * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +/* Register offsets and bitmasks */
> +#define NPCM_OTP_FST           0x00
> +#define NPCM_OTP_FADDR         0x04
> +#define NPCM_OTP_FDATA         0x08
> +#define NPCM_OTP_FCTL          0x14
> +
> +#define FST_RDY                        BIT(0)
> +#define FST_RDST               BIT(1)
> +#define FCTL_READ_CMD          0x02
> +
> +/* OTP total capacity is 8192 bits (1024 Bytes) */
> +#define NPCM_OTP_SIZE          1024
> +
> +struct npcm_otp {
> +       void __iomem *base;
> +       struct mutex lock; /* protects concurrent OTP accesses */
> +};
> +
> +static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset,=
 u8 *val)
> +{
> +       u32 fst;
> +       int ret;
> +
> +       writel(offset, otp->base + NPCM_OTP_FADDR);
> +       writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
> +
> +       ret =3D readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
> +                                (fst & FST_RDY), 10, 10000);
> +       if (ret)
> +               return ret;
> +
> +       *val =3D (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
> +
> +       /* Clear the status bit to prepare for the next read */
> +       writel(FST_RDST, otp->base + NPCM_OTP_FST);
> +
> +       return 0;
> +}
> +
> +static int npcm_otp_read(void *context, unsigned int offset,
> +                        void *val, size_t bytes)
> +{
> +       struct npcm_otp *otp =3D context;
> +       u8 *buf =3D val;
> +       int ret =3D 0;
> +       size_t i;
> +
> +       mutex_lock(&otp->lock);
> +
> +       for (i =3D 0; i < bytes; i++) {
> +               ret =3D npcm_otp_read_byte(otp, offset + i, &buf[i]);
> +               if (ret)
> +                       break;
> +       }
> +
> +       mutex_unlock(&otp->lock);
> +
> +       return ret;
> +}
> +
> +static int npcm_otp_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct npcm_otp *otp;
> +       struct nvmem_config config =3D { 0 };
> +       struct nvmem_device *nvmem;
> +
> +       otp =3D devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
> +       if (!otp)
> +               return -ENOMEM;
> +
> +       otp->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(otp->base))
> +               return PTR_ERR(otp->base);
Since the driver already opens and manages the OTP registers, it
should also be responsible for handling the OTP index.
The NPCM AES driver can make use of keys stored in OTP.
We would be happy to help add support for OTP=E2=80=91stored keys to the
upstream driver.
If you=E2=80=99d like, we can set up a meeting to discuss how this can be i=
mplemented.
> +
> +       mutex_init(&otp->lock);
> +
> +       config.dev =3D dev;
> +       config.name =3D dev_name(dev);
> +       config.read_only =3D true;
> +       config.word_size =3D 1;
> +       config.stride =3D 1;
> +       config.reg_read =3D npcm_otp_read;
> +       config.priv =3D otp;
> +       config.size =3D NPCM_OTP_SIZE;
Suggest setting the size according to the BMC SoC,
The NPCM7xx has 2 8Kbyte OTP, and the NPCM8xx 64KB size.OPT
> +
> +       nvmem =3D devm_nvmem_register(dev, &config);
> +       if (IS_ERR(nvmem))
> +               return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to regi=
ster nvmem\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id npcm_otp_dt_ids[] =3D {
> +       { .compatible =3D "nuvoton,npcm750-key-storage" },
> +       { .compatible =3D "nuvoton,npcm750-fuse-array" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
> +
> +static struct platform_driver npcm_otp_driver =3D {
> +       .probe          =3D npcm_otp_probe,
> +       .driver         =3D {
> +               .name   =3D "npcm-otp",
> +               .of_match_table =3D npcm_otp_dt_ids,
> +       },
> +};
> +module_platform_driver(npcm_otp_driver);
> +
> +MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
> +MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
> +MODULE_LICENSE("GPL");
> --
> 2.53.0.851.ga537e3e6e9-goog
>

Thanks,

Tomer

