Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBx5G1slWzDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:21:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZuOfY2vg"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id b123so1615681itb.2
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=p4aMYU7P3RwbCd6IqbG0CmMxwngKtLZVMtRo9Y14Tro=;
 b=ZuOfY2vgJNUod70a6X2aAk0YjxqM3B5qHzqkc1zB6WR2N2jUnAKiDfVminxWeViRbf
 Vet/J3r1vB8FNKuRZuocDE9j9yeKndkCMjETRccGIrHZpbsiOc4OwV8IPOvuczaKtMCS
 EZlMe29SSWvumgW06StwwclbbFGxmw2E67tZ/1tC0uXirvVxPRbPppd57/4kGM4knkbg
 IQloDYUpb1/gfMYFmaWsLAQXbzrXT1CxzN+IH5fG9zEOcK62olT4NZUvfaKB+VTxMtA4
 885mX+3Ytyatl9M4zw2UdAY1Sx6lewcehYH0HcEoKb66hsme7yvr9mzdCrUvkezIQK0j
 bp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=p4aMYU7P3RwbCd6IqbG0CmMxwngKtLZVMtRo9Y14Tro=;
 b=kQs2N/3/iNN78d2UuSN0ePOar16esxQiYb/QBjx9W6t2Dbzm51nBwsgRcs8q2bIfza
 3ftDw2XQUL7Cs/oe8JBsoX6IHhJW+MMBKM1gOJqTF2yCTyFl5tB+wZqlV6sHl0S//M8D
 Bth0WkcsYFr7i6b6SuA6MZ7tRtSbYqyJUYCdnENtv4nW3PpAaPAwApjempNQ6QQgDlIy
 +yYtmkWNIxT8/DwH87df+xBoQzAqwKlGT+X7CLns6xEAsDwbPNU/3O9ok44qXhrxukAu
 vuDeIF/5OTO0rVYJQsYoMgHIzvd7L5BEbuM0uRasz9X3jykIk1D+dcI+7j0cwK3G5f3X
 6W+A==
X-Gm-Message-State: ABUngvd2gldczEbQMQkgKVsTlIyK3ezVdnBnrfRURUXi2O72lhdKSkjbnpdWQmHebJAZ8jfrPDYnEuMUDcbmCA==
X-Received: by 10.202.77.140 with SMTP id a134mr2995434oib.137.1478485280183; 
 Sun, 06 Nov 2016 18:21:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:20:59 -0800 (PST)
In-Reply-To: <1478278847-9164-2-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:50:59 +1030
X-Google-Sender-Auth: sSdGs3BSq2_P6EOqA92gCiKv69A
Message-ID: <CACPK8XdrCx1r7OnMmAMBOELDwc3Afa7rzE6jsre+6ft7ae7YkQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/8] mtd: spi-nor: aspeed: fix setting of
 the register control value for writes
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 07 Nov 2016 02:21:22 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The setting of the register control value for writes depends on the
> base value which was defined only if the mask applied to it changed
> the register control value.
>
> Fix that.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index f65379bb2287..75ba73ef0660 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -756,7 +756,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_s=
mc_chip *chip,
>  {
>         struct aspeed_smc_controller *controller =3D chip->controller;
>         const struct aspeed_smc_info *info =3D controller->info;
> -       u32 reg;
> +       u32 reg, base_reg;
>
>         /*
>          * Always turn on the write enable bit to allow opcodes to be
> @@ -789,12 +789,13 @@ static int aspeed_smc_chip_setup_init(struct aspeed=
_smc_chip *chip,
>         reg =3D readl(chip->ctl);
>         dev_dbg(controller->dev, "control register: %08x\n", reg);
>
> -       if ((reg & CONTROL_SPI_KEEP_MASK) !=3D reg) {
> -               chip->ctl_val[smc_base] =3D reg & CONTROL_SPI_KEEP_MASK;
> +       base_reg =3D reg & CONTROL_SPI_KEEP_MASK;
> +       if (base_reg !=3D reg) {
>                 dev_info(controller->dev,
>                          "control register changed to: %08x\n",

Is this the kind of message we would see if someone else (the host, or
pflash) was changing the register while the kernel driver was loaded?

If so, we might want to make this a dev_warn or even a WARN in order
make it really clear that a bad thing has happened.

Cheers,

Joel

> -                        chip->ctl_val[smc_base]);
> +                        base_reg);
>         }
> +       chip->ctl_val[smc_base] =3D base_reg;
>
>         /*
>          * Retain the prior value of the control register as the
> --
> 2.7.4
>
