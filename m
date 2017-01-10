Return-Path: <roblip@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tynRC3jKHzDqJ5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 09:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lbaC3yIq"; 
 dkim-atps=neutral
Received: by mail-lf0-x242.google.com with SMTP id q89so9895277lfi.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 14:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/WsDD6nY8wGzwXq+tMzXrx0WvfbYSHutOo5DdQnssmY=;
 b=lbaC3yIqXiEcT4RT77NVbfT7ADPKU7XKecx/Kh+8hp0HD3+xuoZ3KXzmbChuoZLVy0
 XXJ52bXxH/1JIrn53NmfKuFoRj60N22sYw64VDvIAjtWs/OG0AaPhab9BPqqjV0dWRxo
 Xy9cuCdukC9sbjWx+WegkYELmpSb+dOLmR1tuwowN2xa3sBy+b153LhfCxPJz2nkLQLi
 S+o/yu3reg0Tysbuh9Ow2MjhkZ8u5IISkkp8iHyiITQ9eJ7lEITG4eZ4T/Y27qwM59xY
 NiCWNJGTML5Tlvls3GvoaI8i8XW42df00oFxXQ1YknNDVG52rENqp5JYweqeqhX93vMP
 5/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/WsDD6nY8wGzwXq+tMzXrx0WvfbYSHutOo5DdQnssmY=;
 b=EVuJMIpjWhUQZcuIZehNZ+WqAebqNWdk9yXlxWQAvmFztJ/ej3fWt0xLtkwMe/QwY6
 GuPcujswHpJmrF9LAP7aA30mF7FwxyGs6ihLt1HoIJKbHAWecue0V2dgpyvYczIhPB1j
 wzNAdXjrXXr/22SGFFSi/950ELD9m1hJXIaalmuMxSdpxFHZo6eqDDKpWaQ/M06tH7uR
 iDAzxQ5khfQzGEl1tAxx3IrMaK5wB7/SfPDRGLqzgUWY2E0tYyuKIlttEaAV6HafBzN1
 lduNk8NGW2wG02F25aZiPC8ohRWPiM+qlM7Al+YrS3ZCzZTaN6UV8pr8uGA9ai0uLHfI
 vbBA==
X-Gm-Message-State: AIkVDXKLvbxzI1mno3/J6rCfPSPlPkGEYeBOIl0zGGizvKUtZfywuSpv47JrF+i3bnB83nvM7XlL3UA7M4comg==
X-Received: by 10.46.71.132 with SMTP id u126mr2001667lja.43.1484088899994;
 Tue, 10 Jan 2017 14:54:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.177.141 with HTTP; Tue, 10 Jan 2017 14:54:59 -0800 (PST)
In-Reply-To: <fbab9bcc-1fa5-cc91-a5ff-d242d0465029@kaod.org>
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-3-rlippert@google.com>
 <fbab9bcc-1fa5-cc91-a5ff-d242d0465029@kaod.org>
From: Rob Lippert <roblip@gmail.com>
Date: Tue, 10 Jan 2017 14:54:59 -0800
Message-ID: <CAN+5HW0ibdtp4cLmE6DhpGcNao3+6AGPdJYfAtVoHYRx5NxmKw@mail.gmail.com>
Subject: Re: [PATCH linux 2/3] mtd: spi-nor: aspeed: add support for SPI dual
 IO read mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org, Robert Lippert <rlippert@google.com>
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
X-List-Received-Date: Tue, 10 Jan 2017 22:55:04 -0000

On Tue, Jan 10, 2017 at 12:10 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>
> Hello Robert,
>
> On 01/10/2017 02:05 AM, Robert Lippert wrote:
> > Implements support for the dual IO read mode on aspeed SMC/FMC
> > controllers which uses both MISO and MOSI lines for data during a read
> > to double the read bandwidth.
> >
> > Signed-off-by: Robert Lippert <rlippert@google.com>
> > ---
> >
> >  drivers/mtd/spi-nor/aspeed-smc.c | 28 ++++++++++++++++++++++------
> >  1 file changed, 22 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/asp=
eed-smc.c
> > index d3bed34f5aa0..a8ca2ab308d7 100644
> > --- a/drivers/mtd/spi-nor/aspeed-smc.c
> > +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> > @@ -540,6 +540,9 @@ static int aspeed_smc_read_user(struct spi_nor *nor=
, loff_t from, size_t len,
> >  {
> >       struct aspeed_smc_chip *chip =3D nor->priv;
> >       int ret;
> > +     u32 ctl;
> > +     int i;
> > +     u8 dummy =3D 0;
>
> OxFF would be a better value.

OK.

>
> >       mutex_lock(&chip->controller->mutex);
> >
> > @@ -557,6 +560,18 @@ static int aspeed_smc_read_user(struct spi_nor *no=
r, loff_t from, size_t len,
> >
> >       aspeed_smc_start_user(nor);
> >       aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> > +
> > +     /* Send dummy bytes */
> > +     for (i =3D 0; i < (chip->nor.read_dummy / 8); ++i)
>
> the parentheses are not needed I think.

Yes not needed, removed.

>
> > +             aspeed_smc_write_to_ahb(chip->base, &dummy, 1);
> > +
> > +     if (chip->nor.flash_read =3D=3D SPI_NOR_DUAL) {
> > +             /* Switch to dual I/O mode for data cycle */
> > +             ctl =3D readl(chip->ctl) & ~CONTROL_SPI_IO_MODE_MASK;
> > +             ctl |=3D CONTROL_SPI_IO_DUAL_DATA;
> > +             writel(ctl, chip->ctl);
> > +     }
>
> So why can not we set the controller in aspeed_smc_chip_setup_finish()
> once and for all ?

It needs to make sure to only effect the data part of the operation
(the command+addr writes to the device should not be dual-IO mode),
and also needs to not interfere with the aspeed_smc_read_reg read
calls in which the data phase cannot be dual IO mode.

>
> > +
> >       aspeed_smc_read_from_ahb(read_buf, chip->base, len);
> >       aspeed_smc_stop_user(nor);
> >
> > @@ -868,6 +883,7 @@ static int aspeed_smc_chip_setup_finish(struct aspe=
ed_smc_chip *chip)
> >               cmd =3D CONTROL_SPI_COMMAND_MODE_NORMAL;
> >               break;
> >       case SPI_NOR_FAST:
> > +     case SPI_NOR_DUAL:
> >               cmd =3D CONTROL_SPI_COMMAND_MODE_FREAD;
> >               break;
> >       default:
> > @@ -876,9 +892,13 @@ static int aspeed_smc_chip_setup_finish(struct asp=
eed_smc_chip *chip)
> >       }
> >
> >       chip->ctl_val[smc_read] |=3D cmd |
> > +             spi_control_fill_opcode(chip->nor.read_opcode) |
> >               CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8)=
;
> >
> > -     dev_dbg(controller->dev, "base control register: %08x\n",
> > +     if (chip->nor.flash_read =3D=3D SPI_NOR_DUAL)
> > +             chip->ctl_val[smc_read] |=3D CONTROL_SPI_IO_DUAL_DATA;
>
> may be we can move that part in the switch setting above  ?

Done.

>
> > +     dev_info(controller->dev, "read control register: %08x\n",
> >                chip->ctl_val[smc_read]);
>
> may be keep dev_dbg, but the change of 'base' by 'read' is ok.

OK.

>
> Thanks,
>
> C.
>
> >       return 0;
> >  }
> > @@ -980,11 +1000,7 @@ static int aspeed_smc_probe(struct platform_devic=
e *pdev)
> >               if (err)
> >                       continue;
> >
> > -             /*
> > -              * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL atta=
ch
> > -              * when board support is present as determined by of prop=
erty.
> > -              */
> > -             err =3D spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
> > +             err =3D spi_nor_scan(&chip->nor, NULL, SPI_NOR_DUAL);
> >               if (err)
> >                       continue;
> >
> >
>
