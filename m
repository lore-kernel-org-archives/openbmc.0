Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxLT6L7CzDvbx
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="njDwBxB6"; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id m138so6875549itm.3
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=4fpoRWmpDMce5s8MCYPzhDgi9e/pVhP73KIX27R6J/o=;
 b=njDwBxB6MzZwu0AMM/nxlgZMNevgm+9SBot+RVOQyaqsX74YW8nFWQ2LJ5hOPxvRPH
 eyqkqNd/2pn+RqrHok1kRkXoV+hVbuRGEbZn7dBy11nq64/PwBTC18h4gRpLPcPEmCB7
 +H+G3Nx7gkhmIH/bxQimeH/W9iJU9Fei5ZQvzWvl1kmQC9FuYVJspc4ZbXeadaLui4OY
 RzwZe5Gv05UWED/aKIHEX5pGKDQ3s/CR+r9VCm1RN2F/w/uMGNiN35243xiWG1qf77W8
 LpmgfuEjoAU+cJYQZz54/yNWQPPYyxjHHKfnv8BwY0QJxwSHHMCunjCVlpluFR6upWPj
 6vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=4fpoRWmpDMce5s8MCYPzhDgi9e/pVhP73KIX27R6J/o=;
 b=dHlMe+ms1XNAeVkYXfWZNn5qygfvu3IGUxBNp1sPv8WS/d7ChTM/sAm4qKtmgJdZYX
 lZnnBXL+HIopo6FUQ2GteRKR9VIPXs5pYcIINAYsI4jGgAtzmWpvh5c5TwQCrhvEmDOb
 rj1uSLUaMNsH5s5t2s1adu5W35LkpwfE8TLILS5bI5Y+SLkjtDyxu1slmumgolIbaviC
 CaflmL7IhNrdKruwC8C59Dy8LfH6A7IX5sh6c1uCbZViKc9JFiKLtnWxmwYt4y0B9H51
 Wk+2FbN0uBgPykLmLyq9wWW1VwPg4WkYjvicp2qcm2lssbTOstNsmQmPCDiuqP4wk71k
 KOdA==
X-Gm-Message-State: ABUngvd117Rq7gMUXDR7iBJrxYtwhimpSIfc3CD/bVvih01hq+cQJeuCPd246OMf2GFQnMt9/QrHPGw8tG7skw==
X-Received: by 10.202.114.129 with SMTP id p123mr3126671oic.132.1478485968138; 
 Sun, 06 Nov 2016 18:32:48 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:32:27 -0800 (PST)
In-Reply-To: <1478278847-9164-9-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-9-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 13:02:27 +1030
X-Google-Sender-Auth: Je-tTazwHo-L7GLLPkhfTEBB-uw
Message-ID: <CACPK8Xd=NBoaXpUxxv5ym-sTOW4W1KHmQX46LE6RpPOyTdWNPA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 8/8] mtd: spi-nor: aspeed: use command mode
 for reads
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
X-List-Received-Date: Mon, 07 Nov 2016 02:32:50 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> When accessing flash contents, let use the "command mode" for read.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 88cbfe7c4340..89085d84b4b5 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -522,8 +522,8 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *=
nor, u8 cmd, u32 addr)
>         }
>  }
>
> -static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t=
 len,
> -                               size_t *retlen, u_char *read_buf)
> +static int aspeed_smc_read(struct spi_nor *nor, loff_t from, size_t len,
> +                          size_t *retlen, u_char *read_buf)
>  {
>         struct aspeed_smc_chip *chip =3D nor->priv;
>         int ret;
> @@ -542,10 +542,10 @@ static int aspeed_smc_read_user(struct spi_nor *nor=
, loff_t from, size_t len,
>                 dev_err(chip->nor.dev, "DMA read failed: %d", ret);
>         }
>
> -       aspeed_smc_start_user(nor);
> -       aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> -       aspeed_smc_from_ahb(read_buf, chip->base, len);
> -       aspeed_smc_stop_user(nor);
> +       /*
> +        * we are in read or fread mode by default
> +        */
> +       aspeed_smc_from_ahb(read_buf, chip->base + from, len);

Even though I just acked the previous patch, when reading this it's
not clear that we're doing a read. Perhaps
smc_{read_from,write_to}_ahb?

Cheers,

Joel

>
>  out:
>         mutex_unlock(&chip->controller->mutex);
> @@ -861,6 +861,7 @@ static int aspeed_smc_chip_setup_finish(struct aspeed=
_smc_chip *chip)
>         }
>
>         chip->ctl_val[smc_read] |=3D cmd |
> +               spi_control_fill_opcode(chip->nor.read_opcode) |
>                 CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8)=
;
>
>         dev_dbg(controller->dev, "base control register: %08x\n",
> @@ -956,7 +957,7 @@ static int aspeed_smc_probe(struct platform_device *p=
dev)
>                 chip->nor.priv =3D chip;
>                 spi_nor_set_flash_node(&chip->nor, child);
>                 chip->nor.mtd.name =3D of_get_property(child, "label", NU=
LL);
> -               chip->nor.read =3D aspeed_smc_read_user;
> +               chip->nor.read =3D aspeed_smc_read;
>                 chip->nor.write =3D aspeed_smc_write_user;
>                 chip->nor.read_reg =3D aspeed_smc_read_reg;
>                 chip->nor.write_reg =3D aspeed_smc_write_reg;
> --
> 2.7.4
>
