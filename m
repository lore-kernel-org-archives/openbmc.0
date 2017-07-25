Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGkp8404hzDqsH
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 13:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fr6Kb6QO"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id s143so345703ywg.4
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 20:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=2iKUtTVDtRymBRxIzywFjucY8A8OCEyqyXXtvqyLXtM=;
 b=fr6Kb6QODRCdWAOtkf5zfPDhV1FdzQWByd1mX2OlqSK2am6npqc2jxOGyhArUL8GgB
 8SMpn+lE5qx1FObNdx7KsJX6pjmbA5UdQ3nXLuLRSrANwhtrrDsAdE2zjMQs73Wh22yv
 wJ9j+ku8PGJ+a9PKulB4doVr0q408WCwyvAylDSzjs1knYWaQh9FfuA/5Wd+fGfR0F19
 i+uKE0gZYNPJUWc2O6s92AdROsFddkk/5hhFfsTr+J89WYO1imP9Q4pLsUpgqTno8sss
 JJZt6Ee3saTHd6dhQe5Py1gRfL7oUAK+LFNSTY9bkso3jZnKuWxK7/VYHezCZqsgowoK
 QJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=2iKUtTVDtRymBRxIzywFjucY8A8OCEyqyXXtvqyLXtM=;
 b=L7vxso5IJWD60jKDT3C41i3rEzXBWY8FdOtTIlSMVcv/remk1eH2QQW0B3Kh1Os5F0
 9fCwqHn3MzQYGy8FZy8wXKPyI8BlQ5BQmOwTr8/mIymaLCljdn64Kc/SPtXDp/rLRecJ
 HF1+gm3RDpQsVKygYb4SiIT1oAfVpRZZYyuNLDhQ2kjhmSMjclulRUCHOBmMDn1TW/FI
 25By3EyNaPqBEyF6p9q/UHNAnhrmShK3z9049wlmj8YwDRVyzyIlS4GPMD65RLPDoOi7
 eY5s0GE1glAjPy7myZ4CYgYlh5JIOSB+FvdW6SuNne6Dae9ED/zX1TmmCt6mMv9FHjLK
 9aew==
X-Gm-Message-State: AIVw11339UCWOCW6dcPzTOnE67WZ0VGrvU9qX9DR36huLyayGCWFcuFg
 KL3vLHSMYJeTNJum7pUdnWQYugiW5i8CLbE=
X-Received: by 10.37.214.214 with SMTP id n205mr1327925ybg.233.1500954733280; 
 Mon, 24 Jul 2017 20:52:13 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Mon, 24 Jul 2017 20:51:52 -0700 (PDT)
In-Reply-To: <1500889206-25863-1-git-send-email-clg@kaod.org>
References: <1500889206-25863-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jul 2017 13:21:52 +0930
X-Google-Sender-Auth: BHERPJh_uEmpfB5s8wJv1MaWstU
Message-ID: <CACPK8XeO-MwMR4Yd6G-0MoJiW2AWZpM_EMDCmnPrQ89R2Ot8pg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] mtd: spi-nor: aspeed: set 4B setting for
 all chips
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 03:52:17 -0000

On Mon, Jul 24, 2017 at 7:10 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The driver made the wrong assumption that the 4B setting was
> autodetected for all chips of the AST2500 FMC flash controller. This
> is only the case for the CS0.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

I tested this on a witherspoon and it appeared to work. I have applied
it to dev-4.10. Thanks for hunting it down!

root@spoon1-bmc:~# time flashcp /tmp/flash-witherspoon /dev/mtd6
real 3m44.212s
user 0m0.750s
sys 3m42.620s

Cheers,

Joel


> ---
>
>  To be noted that the speed setting of CS1 is quite low because the
>  HCLK/16 divider is used. It can be improved.
>
>  drivers/mtd/spi-nor/aspeed-smc.c |   13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> Index: linux-openbmc-4.10.git/drivers/mtd/spi-nor/aspeed-smc.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-4.10.git.orig/drivers/mtd/spi-nor/aspeed-smc.c
> +++ linux-openbmc-4.10.git/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -794,19 +794,18 @@ static void aspeed_smc_chip_set_type(str
>  }
>
>  /*
> - * The AST2500 FMC flash controller should be strapped by hardware, or
> - * autodetected, but the AST2500 SPI flash needs to be set.
> + * The first chip of the AST2500 FMC flash controller is strapped by
> + * hardware, or autodetected, but other chips need to be set. Enforce
> + * the 4B setting for all chips.
>   */
>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
>  {
>         struct aspeed_smc_controller *controller =3D chip->controller;
>         u32 reg;
>
> -       if (chip->controller->info =3D=3D &spi_2500_info) {
> -               reg =3D readl(controller->regs + CE_CONTROL_REG);
> -               reg |=3D 1 << chip->cs;
> -               writel(reg, controller->regs + CE_CONTROL_REG);
> -       }
> +       reg =3D readl(controller->regs + CE_CONTROL_REG);
> +       reg |=3D 1 << chip->cs;
> +       writel(reg, controller->regs + CE_CONTROL_REG);
>  }
>
>  /*
