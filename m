Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5rd1ft7zDvHV
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:10:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cBypLSiJ; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id b186so7326558vkb.3
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=wdx2UkHxa1rCETQr50O9rfHF7C7b4yaGfVIODPdoYtw=;
 b=cBypLSiJaylIFeEeFXLpfdQ09U+fGxodxozSmNlB0MyN+y5cnsDH1qlmawU1Lql6+u
 pecsMVGLuXGupoX2JOOsHRx8H2E2VVeFIkx6tkyvV5/eDnsHv2aS8oJuwbtAhiAn9tUm
 Ovq55eGfjNwa0OvfSVWeGBNYOYcNntbTunkyEourenveMeasoVI9AX/pWdWF3HfqlSmT
 KuZOaaja3GBjiQqM5/WSJzczQjCeJ4TZAzfq17U5vFF2YdLJjnGIOXuILjIDIQlBahcz
 khML/JU4SZ/zWDyQrd4tJ0IRg2+a/zc1+aYF/BUYh17wnl2GCCxyohjobwaxNXUmMikd
 7nAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=wdx2UkHxa1rCETQr50O9rfHF7C7b4yaGfVIODPdoYtw=;
 b=WXSycaYVxeq2uG3TGMpqZ/+DUVyLZwaAZ9SJuOjMbpOzpThvQthWe6o6ZPl+4aM/ve
 I5TTaliZjY79AKnqDJ9M5QT+62aeuYlnxaLqdZojwN+0GFn5oAopGmc4KzqC0Q/0Lyhv
 qOl7vVWEopfBtehgSsUv/wLMxg+CJ3r/kQclhXLsk1yPLdBVIBs0UaPifGAvvIk59HWO
 SaFUteJhOu5NKTb3TnA5vUgT+brrYOkxR5hfkyqjWlpPsFVAw+nYDi3q5t01RZ0A4CFx
 8TuFV8+3Ux/vdm6hXHwjbVXDNtz+RG00nBfYrRZ4bvNHlzHRJf0j19FLNjY+psoADCPX
 +8UA==
X-Gm-Message-State: AA6/9RmP1+hTULG334fbfdj/EIzI3aQ0KWXzfr9TC5HpZqH5mto1tgch8sotxFg56X9saoa2rIWxQ1M1uiMe5w==
X-Received: by 10.31.138.143 with SMTP id m137mr2112869vkd.148.1476681055317; 
 Sun, 16 Oct 2016 22:10:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:10:34 -0700 (PDT)
In-Reply-To: <1476448684-6149-8-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-8-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:40:34 +1030
X-Google-Sender-Auth: IuBVCFWbE-pTsglEytB-5MG4Hns
Message-ID: <CACPK8Xe-hSZu0b9AVhDYRAGAZXn=pnrp7qmP26dEMH3ZCtD1iw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 07/12] mtd: spi-nor: aspeed: make locking
 more explicit
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 05:10:57 -0000

On Fri, Oct 14, 2016 at 11:07 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The routine aspeed_smc_stop_user() and aspeed_smc_start_user() hide
> the fact that they lock an unlock the controller. Change that to make
> it obvious in the code.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index a47eecfdfda2..b22e07d3ef32 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -276,8 +276,6 @@ static void aspeed_smc_start_user(struct spi_nor *nor=
)
>         struct aspeed_smc_per_chip *chip =3D nor->priv;
>         u32 ctl =3D chip->ctl_val[smc_base];
>
> -       mutex_lock(&chip->controller->mutex);
> -

This removes all locking from start_user and stop_user. There are some
accesses and register writes in both of these functions, is that okay?

What is the lock (supposed to be) protecting?

(I note that you effectively add it back in patch 9 where you
introduce DMA, by putting locks in aspeed_smc_read_user and write_user
that then calls start_user.)


>         ctl |=3D CONTROL_SPI_COMMAND_MODE_USER |
>                 CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
>         writel(ctl, chip->ctl);
> @@ -296,19 +294,21 @@ static void aspeed_smc_stop_user(struct spi_nor *no=
r)
>
>         writel(ctl2, chip->ctl);        /* stop user CE control */
>         writel(ctl, chip->ctl);         /* default to fread or read */
> -
> -       mutex_unlock(&chip->controller->mutex);
>  }
>
>  static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, =
int len)
>  {
>         struct aspeed_smc_per_chip *chip =3D nor->priv;
>
> +       mutex_lock(&chip->controller->mutex);
> +
>         aspeed_smc_start_user(nor);
>         aspeed_smc_to_fifo(chip->base, &opcode, 1);
>         aspeed_smc_from_fifo(buf, chip->base, len);
>         aspeed_smc_stop_user(nor);
>
> +       mutex_unlock(&chip->controller->mutex);
> +
>         return 0;
>  }
>
> @@ -317,11 +317,15 @@ static int aspeed_smc_write_reg(struct spi_nor *nor=
, u8 opcode, u8 *buf,
>  {
>         struct aspeed_smc_per_chip *chip =3D nor->priv;
>
> +       mutex_lock(&chip->controller->mutex);
> +
>         aspeed_smc_start_user(nor);
>         aspeed_smc_to_fifo(chip->base, &opcode, 1);
>         aspeed_smc_to_fifo(chip->base, buf, len);
>         aspeed_smc_stop_user(nor);
>
> +       mutex_unlock(&chip->controller->mutex);
> +
>         return 0;
>  }
>
> --
> 2.7.4
>
