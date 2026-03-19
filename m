Return-Path: <openbmc+bounces-1642-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CC109192B
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:38:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLDm19J2z2yDk;
	Fri, 20 Mar 2026 09:37:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773937068;
	cv=none; b=gvljIyVJ19RKLtEYR0ZY/lq5Qt6UB8uoEVbI0ooY96oSErn5t0XaIx1/X38pDSEFDdIpucSarAZuB2b9vAu2QgdPBHC/Bg/pPQ0LPViwBVdHmaSU1xJuAtkSokwiNoBcp93F6rZIzJdWXLbN3/lD3SHvO0aa9SGLCLXaPVn4FhcwRwOdoqbyklsLaMNCs3XryDWbAwmqs10zcccBxRO5mvhUeuhNOui7iE6zQaPFXfzzzEiJydM0Ivu8+qkLI1wSOpj8Wq3W/NI3tgiozBcyAG0GuuW/AbonNTx5/gMa2yreMIX2KY7B0Ojme9amPoATlcLoVoncKbSuhVp5SeDRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773937068; c=relaxed/relaxed;
	bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0FcLtmHxuTjATHiNRtBLTvWjgSsFmLysudatIROabUhNALfuyLMFGwUkq4uWclkGz/2SlzalDD6KU+yfrJZIw0m++NiYxE+TDRbt7/vfdFP3mYzlv9IupzNZKEcy1r6XgNEWZCz4vMPeP07XxKEL1/eyLUhQgSBs+hDjQUtci7cSd61HHvxFSY0p9pbFI/A1Qy1bqDdJV5vqeYjfRX2HPRBZ9PiCP5BeBy1X2gEa0JR+n6VBx8aegSl9BDtgd4PCbKb5iouydBT9zzw3SwdoL5d5Kj5Zihuu46g8ONHnm1vW8283BwnXRF8OgNQG9ChJghlmgdE2Ufl/XVV1qPIRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S/MQLsJV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S/MQLsJV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fc9pM52Mdz2ynW
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 03:17:46 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aae146b604so5602245ad.3
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773937064; x=1774541864; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=;
        b=S/MQLsJV6iRK87kzO/SmLGNxbu03VpadY545q17ud1GcF32mKn1vEpg/HOOsu163Pa
         LyMyTEAWQgEyOBRj/GDJQ5iB52MkeUFKj1VYl4TAebic0dZqqj8EkMyC6y/NruBwA34e
         RMxIcMLa5eCJxfxPp6LMfmuhoj7xSPspGYF7y9Bcio4K+DT+nlnYYvHPjQrEQwLU12GO
         BkFH7lCLgL7wukwdgjxrxsRteFNkWJ/GnEleMdnr3cYV+XEtJNCNdPJ5j2wQKU5/Owmj
         d/ZJUQiLW+UEfEqQFwDR+V/+6qzTy5NpZK0ojdb1M6O7pPrRItmUsMsLodHXmNsPXmCg
         mlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937064; x=1774541864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOzJPTVd2K0ObveD8TmPHZd5icUhrVuBV8d7L+Wyo2o=;
        b=aAH49geTKI0YHYsxAYfte9HEsx4E+ma6v0zaGTkKchfG5Zt1RkXg4XCOJIZ1aKy2HD
         t0IJEc530XEjvoRTixE6T3BhllMFySkv2vkad/+27C0jaqi0RPqmG3CVWcr3Q0MDflTw
         iLKt+YhlQAbuqdvWENohGixOz4+HqdJr2VliSJfgxCZgEklv7AlcwNnmkmVVylld6TUd
         JKzT/ciTx0hpDnmDvOcqev8ZLH9rDBYDlyqylkZTIMnudMqdbjhzAUj4fRuu34svFO83
         sXvklj3gtuMo22iizG+gd+9w8bcFqkfnvuOY9gNHjMtalziDTXl6MKXOacaADiGh7W3L
         Dj5A==
X-Forwarded-Encrypted: i=1; AJvYcCXqO8cUyWJTnf/seDh9L2mlqGQndC/qZt46F6IzX00ooH64rGkJT496Cz4ofMGKtHTYfVryR3+7@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yws6U3lCYio1aD9sLmm+JOyaPmL6pGqQAp4M5zIm/5MQ9tFO4LK
	fFa4Gm9JblgmfGD3or4g1pgNDm1dSK5JGpLkU6d3du0T0WvJOQ+vuDK0
X-Gm-Gg: ATEYQzyOWCDs/ZrPDyrij05rOilbaOMF6QjIglqcTPqSyAyIagZG1XRNhIVlk7sLHFI
	0CLzPaqYvqdShgUigIfIBmI2v64tJVgSaseIbN98bCBD5fFHcMJ4k62WQYL2JjyyeGAKuyLjdMN
	3h5F4zIPo8ZU5D4Nv9WlFO+r+xqxR2+JIbdGsByh0niL/+3er8CqciBbrCbwcxtpjaD0mXLEGrv
	72sJq0XilgXMCVqiH7dJTxypzSyPT9BOq5D4PfBIyEgrIzVhZKnl7CDX48YVGIVdp6pQR+skK6U
	foyBcBf9shJxgIM6aO9bUdDfiMpAH2vPcexNNIOVDrvJqx8yXkR9xtXaDLNI4EfeX7DE19NlJHa
	6tuQ1INdsL/mldiZw3cdTRaSUozJyS7qrSs0JkObSczFx93VAOE7Sr/wFf0ms/3HOdWz/zvN+Qk
	U/6GL4tGQQtP3IOYTa0brBjNzG27JHa88yPA==
X-Received: by 2002:a17:902:e752:b0:2b0:686a:d470 with SMTP id d9443c01a7336-2b06e3941f5mr79049735ad.23.1773937063958;
        Thu, 19 Mar 2026 09:17:43 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:69b:67cd:27b7:b4b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e41990dsm86350305ad.3.2026.03.19.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:17:43 -0700 (PDT)
Date: Fri, 20 Mar 2026 00:17:37 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, srini@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
Message-ID: <abwhoY0vlmgQ0J1P@google.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
 <20260318193538.246853-3-visitorckw@gmail.com>
 <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP6Zq1gJOrEii97X2XjXexZeEQ5SN4F-wW334BN7SOrGbiVQxg@mail.gmail.com>

Hi Tomer,

On Thu, Mar 19, 2026 at 12:57:04PM +0200, Tomer Maimon wrote:
> Hi Kuan-Wei,
> 
> Thanks for the upstream Nuvoton OTP driver.
> 
> On Wed, 18 Mar 2026 at 21:36, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >
> > Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
> > NPCM SoCs.
> >
> > This OTP is read-only and manages two independent arrays: Key Storage
> > and Fuse Array, which contain cryptographic keys, hardware strapping,
> > and calibration data.
> >
> > Each array provides 1024 bytes of storage.
> >
> > It can be accessed by writing the target address and a read command
> > to the control registers, and then polling a status register until
> > the data is ready. Concurrent accesses are protected by a mutex.
> >
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  MAINTAINERS              |   7 +++
> >  drivers/nvmem/Kconfig    |  10 +++
> >  drivers/nvmem/Makefile   |   2 +
> >  drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 148 insertions(+)
> >  create mode 100644 drivers/nvmem/npcm-otp.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 61bf550fd37c..e391e2bcb5f6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18894,6 +18894,13 @@ F:     drivers/nubus/
> >  F:     include/linux/nubus.h
> >  F:     include/uapi/linux/nubus.h
> >
> > +NUVOTON NPCM OTP NVMEM DRIVER
> > +M:     Kuan-Wei Chiu <visitorckw@gmail.com>
> > +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:     Maintained
> > +F:     Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
> > +F:     drivers/nvmem/npcm-otp.c
> > +
> >  NUVOTON NCT6694 MFD DRIVER
> >  M:     Ming Yu <tmyu0@nuvoton.com>
> >  S:     Supported
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index 74ddbd0f79b0..5d065b7448ff 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
> >           This driver can also be built as a module. If so, the module
> >           will be called nvmem_qoriq_efuse.
> >
> > +config NVMEM_NPCM_OTP
> > +       tristate "Nuvoton NPCM7xx OTP Controller"
> > +       depends on ARCH_NPCM || COMPILE_TEST
> > +       help
> > +         This option enables support for the OTP (One-Time Programmable)
> > +         controller found on Nuvoton NPCM7xx BMCs.
> > +
> > +         This driver can also be built as a module. If so, the module
> > +         will be called npcm-otp.
> > +
> >  endif
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 7252b8ec88d4..63c23b304d64 100644
> > --- a/drivers/nvmem/Makefile
> > +++ b/drivers/nvmem/Makefile
> > @@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)            += nvmem_zynqmp_nvmem.o
> >  nvmem_zynqmp_nvmem-y                   := zynqmp_nvmem.o
> >  obj-$(CONFIG_NVMEM_QORIQ_EFUSE)                += nvmem-qoriq-efuse.o
> >  nvmem-qoriq-efuse-y                    := qoriq-efuse.o
> > +obj-$(CONFIG_NVMEM_NPCM_OTP)           += nvmem-npcm-otp.o
> > +nvmem-npcm-otp-y                       := npcm-otp.o
> > diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
> > new file mode 100644
> > index 000000000000..abe4bab66c06
> > --- /dev/null
> > +++ b/drivers/nvmem/npcm-otp.c
> > @@ -0,0 +1,129 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
> > + *
> > + * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +/* Register offsets and bitmasks */
> > +#define NPCM_OTP_FST           0x00
> > +#define NPCM_OTP_FADDR         0x04
> > +#define NPCM_OTP_FDATA         0x08
> > +#define NPCM_OTP_FCTL          0x14
> > +
> > +#define FST_RDY                        BIT(0)
> > +#define FST_RDST               BIT(1)
> > +#define FCTL_READ_CMD          0x02
> > +
> > +/* OTP total capacity is 8192 bits (1024 Bytes) */
> > +#define NPCM_OTP_SIZE          1024
> > +
> > +struct npcm_otp {
> > +       void __iomem *base;
> > +       struct mutex lock; /* protects concurrent OTP accesses */
> > +};
> > +
> > +static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset, u8 *val)
> > +{
> > +       u32 fst;
> > +       int ret;
> > +
> > +       writel(offset, otp->base + NPCM_OTP_FADDR);
> > +       writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
> > +
> > +       ret = readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
> > +                                (fst & FST_RDY), 10, 10000);
> > +       if (ret)
> > +               return ret;
> > +
> > +       *val = (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
> > +
> > +       /* Clear the status bit to prepare for the next read */
> > +       writel(FST_RDST, otp->base + NPCM_OTP_FST);
> > +
> > +       return 0;
> > +}
> > +
> > +static int npcm_otp_read(void *context, unsigned int offset,
> > +                        void *val, size_t bytes)
> > +{
> > +       struct npcm_otp *otp = context;
> > +       u8 *buf = val;
> > +       int ret = 0;
> > +       size_t i;
> > +
> > +       mutex_lock(&otp->lock);
> > +
> > +       for (i = 0; i < bytes; i++) {
> > +               ret = npcm_otp_read_byte(otp, offset + i, &buf[i]);
> > +               if (ret)
> > +                       break;
> > +       }
> > +
> > +       mutex_unlock(&otp->lock);
> > +
> > +       return ret;
> > +}
> > +
> > +static int npcm_otp_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct npcm_otp *otp;
> > +       struct nvmem_config config = { 0 };
> > +       struct nvmem_device *nvmem;
> > +
> > +       otp = devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
> > +       if (!otp)
> > +               return -ENOMEM;
> > +
> > +       otp->base = devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(otp->base))
> > +               return PTR_ERR(otp->base);
> Since the driver already opens and manages the OTP registers, it
> should also be responsible for handling the OTP index.
> The NPCM AES driver can make use of keys stored in OTP.
> We would be happy to help add support for OTP‑stored keys to the
> upstream driver.
> If you’d like, we can set up a meeting to discuss how this can be implemented.

I would be very happy to collaborate. :)

Regarding scheduling a meeting, I will be traveling abroad from 03/22
to 04/01 with very limited and unstable network access, so I would
prefer to avoid that window. We can coordinate the exact date and time
off-list.

Regards,
Kuan-Wei

> > +
> > +       mutex_init(&otp->lock);
> > +
> > +       config.dev = dev;
> > +       config.name = dev_name(dev);
> > +       config.read_only = true;
> > +       config.word_size = 1;
> > +       config.stride = 1;
> > +       config.reg_read = npcm_otp_read;
> > +       config.priv = otp;
> > +       config.size = NPCM_OTP_SIZE;
> Suggest setting the size according to the BMC SoC,
> The NPCM7xx has 2 8Kbyte OTP, and the NPCM8xx 64KB size.OPT
> > +
> > +       nvmem = devm_nvmem_register(dev, &config);
> > +       if (IS_ERR(nvmem))
> > +               return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register nvmem\n");
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id npcm_otp_dt_ids[] = {
> > +       { .compatible = "nuvoton,npcm750-key-storage" },
> > +       { .compatible = "nuvoton,npcm750-fuse-array" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
> > +
> > +static struct platform_driver npcm_otp_driver = {
> > +       .probe          = npcm_otp_probe,
> > +       .driver         = {
> > +               .name   = "npcm-otp",
> > +               .of_match_table = npcm_otp_dt_ids,
> > +       },
> > +};
> > +module_platform_driver(npcm_otp_driver);
> > +
> > +MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
> > +MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0.851.ga537e3e6e9-goog
> >
> 
> Thanks,
> 
> Tomer

