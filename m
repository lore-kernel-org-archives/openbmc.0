Return-Path: <roblip@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzHcF388RzDqHm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 05:34:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CNWKiAo8"; 
 dkim-atps=neutral
Received: by mail-lf0-x243.google.com with SMTP id q89so12220786lfi.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 10:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ecGGAMw+YhyMhHc97T9HJE+ydrHP0J4eOcE3tF4K1hI=;
 b=CNWKiAo8asDBfqW09hBE5K+kxe5J8ROcAza45s2sBGmFCRbyKfbSJggeoaB3mnzbuB
 kUgWt8jRgihk/+Bky77xXYC8p1GyBAYvqcrQo8yZdKhwatDNXvLIXWn0NVnNyEZWl3Bc
 qQy7Qy9TX/Z9trvF0T9MjRooAnbZQX/Iik9QB+yGYd9VywvFhdP+Z8IAziek9YILq7q8
 h8/+IJjd4HdPgREZUI3Tfg1VPur0H9ETHpoZ4Rk9amX3+YMCC0xItTp3NTZ8kcixn0iG
 BqnSn2ncdsGvaD17sBB4gWKwWYzW+iDypuneo207oF0cABOK/otAY6z7xP4Ap+W01Lta
 +6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ecGGAMw+YhyMhHc97T9HJE+ydrHP0J4eOcE3tF4K1hI=;
 b=pIUnzKLxa+UNCOco34YJ2kCAT7DwZ08dZaXoyRoCJf12ZVvXTmiA0VF0GJZBGrjMqy
 GC562Arpt4Hc3pLJhr7tVisr6K/igzaYeIKOYOdR7/Q9ACgCJDKNhKgvpaMg45sAHnmr
 oapA/uWKS9dGSu/F6TA9LSH964FtOlNUOrtmLzYmSq6uAYArcvRxnE4uhnX03CEAz6HN
 kY0vOLTs3JpAuCoNtGcrXiyp8wqM4+zII/uUAreVxCAwDaY6B5pvKB9q2Zjq7CjKWP2L
 ohGuuQzm7F+NgivbpRKrG1wJt4ByDFzLEuZ6V/OlVJ8f/pbWW9gyPcNlohYNRFdkuoNs
 xKKw==
X-Gm-Message-State: AIkVDXIV0ROoex724XeC/co5Yqp2kCrPNJDqA5AwA4v6B1zLeQJCFGZstBH+X5A06uBW37QlhAyLxPHCuwN/uA==
X-Received: by 10.46.77.197 with SMTP id c66mr4105899ljd.25.1484159674018;
 Wed, 11 Jan 2017 10:34:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.177.141 with HTTP; Wed, 11 Jan 2017 10:34:33 -0800 (PST)
In-Reply-To: <4ff48c6c-d65a-4b41-50e6-24bcbb1bdf72@kaod.org>
References: <20170110010524.116687-1-rlippert@google.com>
 <20170110010524.116687-3-rlippert@google.com>
 <fbab9bcc-1fa5-cc91-a5ff-d242d0465029@kaod.org>
 <CAN+5HW0ibdtp4cLmE6DhpGcNao3+6AGPdJYfAtVoHYRx5NxmKw@mail.gmail.com>
 <4ff48c6c-d65a-4b41-50e6-24bcbb1bdf72@kaod.org>
From: Rob Lippert <roblip@gmail.com>
Date: Wed, 11 Jan 2017 10:34:33 -0800
Message-ID: <CAN+5HW0-kZigB+WxYdGdUmgXxk7_mWFC_d-0Jcz-mYuPy8LRVQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 18:34:38 -0000

On Wed, Jan 11, 2017 at 3:43 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 01/10/2017 11:54 PM, Rob Lippert wrote:
>> On Tue, Jan 10, 2017 at 12:10 AM, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>>
>>> Hello Robert,
>>>
>>> On 01/10/2017 02:05 AM, Robert Lippert wrote:
>>>> Implements support for the dual IO read mode on aspeed SMC/FMC
>>>> controllers which uses both MISO and MOSI lines for data during a read
>>>> to double the read bandwidth.
>>>>
>>>> Signed-off-by: Robert Lippert <rlippert@google.com>
>>>> ---
>>>>
>>>>  drivers/mtd/spi-nor/aspeed-smc.c | 28 ++++++++++++++++++++++------
>>>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/as=
peed-smc.c
>>>> index d3bed34f5aa0..a8ca2ab308d7 100644
>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>> @@ -540,6 +540,9 @@ static int aspeed_smc_read_user(struct spi_nor *no=
r, loff_t from, size_t len,
>>>>  {
>>>>       struct aspeed_smc_chip *chip =3D nor->priv;
>>>>       int ret;
>>>> +     u32 ctl;
>>>> +     int i;
>>>> +     u8 dummy =3D 0;
>>>
>>> OxFF would be a better value.
>>
>> OK.
>>
>>>
>>>>       mutex_lock(&chip->controller->mutex);
>>>>
>>>> @@ -557,6 +560,18 @@ static int aspeed_smc_read_user(struct spi_nor *n=
or, loff_t from, size_t len,
>>>>
>>>>       aspeed_smc_start_user(nor);
>>>>       aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>>>> +
>>>> +     /* Send dummy bytes */
>>>> +     for (i =3D 0; i < (chip->nor.read_dummy / 8); ++i)
>>>
>>> the parentheses are not needed I think.
>>
>> Yes not needed, removed.
>>
>>>
>>>> +             aspeed_smc_write_to_ahb(chip->base, &dummy, 1);
>>>> +
>>>> +     if (chip->nor.flash_read =3D=3D SPI_NOR_DUAL) {
>>>> +             /* Switch to dual I/O mode for data cycle */
>>>> +             ctl =3D readl(chip->ctl) & ~CONTROL_SPI_IO_MODE_MASK;
>>>> +             ctl |=3D CONTROL_SPI_IO_DUAL_DATA;
>>>> +             writel(ctl, chip->ctl);
>>>> +     }
>>>
>>> So why can not we set the controller in aspeed_smc_chip_setup_finish()
>>> once and for all ?
>>
>> It needs to make sure to only effect the data part of the operation
>> (the command+addr writes to the device should not be dual-IO mode),
>> and also needs to not interfere with the aspeed_smc_read_reg read
>> calls in which the data phase cannot be dual IO mode.
>
> ok. it makes sense. Is it much faster ?

Yea it is about twice as much bandwidth, as I mentioned in the cover
letter it drops the time to dump an entire 64MB flash from 12s to 7s.

With a companion change to u-boot to double the SPI frequency to
104Mhz that time drops to 3s and speeds up the entire bmc boot process
(including uboot) by about 15s.

Thanks,
-Rob

>
> Thanks,
>
> C.
>
>>>
>>>> +
>>>>       aspeed_smc_read_from_ahb(read_buf, chip->base, len);
>>>>       aspeed_smc_stop_user(nor);
>>>>
>>>> @@ -868,6 +883,7 @@ static int aspeed_smc_chip_setup_finish(struct asp=
eed_smc_chip *chip)
>>>>               cmd =3D CONTROL_SPI_COMMAND_MODE_NORMAL;
>>>>               break;
>>>>       case SPI_NOR_FAST:
>>>> +     case SPI_NOR_DUAL:
>>>>               cmd =3D CONTROL_SPI_COMMAND_MODE_FREAD;
>>>>               break;
>>>>       default:
>>>> @@ -876,9 +892,13 @@ static int aspeed_smc_chip_setup_finish(struct as=
peed_smc_chip *chip)
>>>>       }
>>>>
>>>>       chip->ctl_val[smc_read] |=3D cmd |
>>>> +             spi_control_fill_opcode(chip->nor.read_opcode) |
>>>>               CONTROL_SPI_IO_DUMMY_CYCLES_SET(chip->nor.read_dummy / 8=
);
>>>>
>>>> -     dev_dbg(controller->dev, "base control register: %08x\n",
>>>> +     if (chip->nor.flash_read =3D=3D SPI_NOR_DUAL)
>>>> +             chip->ctl_val[smc_read] |=3D CONTROL_SPI_IO_DUAL_DATA;
>>>
>>> may be we can move that part in the switch setting above  ?
>>
>> Done.
>>
>>>
>>>> +     dev_info(controller->dev, "read control register: %08x\n",
>>>>                chip->ctl_val[smc_read]);
>>>
>>> may be keep dev_dbg, but the change of 'base' by 'read' is ok.
>>
>> OK.
>>
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>>>       return 0;
>>>>  }
>>>> @@ -980,11 +1000,7 @@ static int aspeed_smc_probe(struct platform_devi=
ce *pdev)
>>>>               if (err)
>>>>                       continue;
>>>>
>>>> -             /*
>>>> -              * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL att=
ach
>>>> -              * when board support is present as determined by of pro=
perty.
>>>> -              */
>>>> -             err =3D spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
>>>> +             err =3D spi_nor_scan(&chip->nor, NULL, SPI_NOR_DUAL);
>>>>               if (err)
>>>>                       continue;
>>>>
>>>>
>>>
>
