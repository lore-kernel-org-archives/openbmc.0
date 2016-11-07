Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBxGh2ZYzzDvMv
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 13:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CoaNedbl"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e187so6852054itc.0
 for <openbmc@lists.ozlabs.org>; Sun, 06 Nov 2016 18:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Zs5jAduEo0pF6cHpwQwTil50e4G314Q2MVudvwZplD4=;
 b=CoaNedblBPodaYm9ebxf9kn30FG8mjh+lWQwtxMgSfqEy+KyQ7a/tPVLbBYlvklGvt
 Xp7Ea8WE1R2dPS4oZRZiw6V8GXL6qrVSyofqDFdL+P7jJbYd4pB1kDfg0ABksudQCheb
 z7OQNral4KvXluFjmfP0N4KaOecH2xfLtvujHtMNvEeOfODUQbI4XePj201vzdWnJUsJ
 VQU/O5wDa7+9yVWHC7rC50Opt7Onu2rsrBPF9EEheLAVWRIVq8m1r3p+OrFOZYN9PtvI
 LOvGcKaRR2Pw4nX+RwRx6ETFJmiXlefN4daDzTwQ5gVULx8BsvO+JOqhLI4xrhjfLJ7Z
 ZmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Zs5jAduEo0pF6cHpwQwTil50e4G314Q2MVudvwZplD4=;
 b=c6k5i4MPzNCyXCvsaiDA41ziTWzOOuaVL/dOwTpICN2sapc3KlSLK1lg7OQugp4D4M
 8cGx+ovNvuL6t347wC+Tty4/wo+bAQKVaMu1PXjBT+/oGxje7wDu6yOwnbY8Gh506aos
 SQiIJm2kQGRksHRusywW5rByfeb94RRigq99XhNWWsvZzkJ8WlUcwhJwwfSemxwdssaj
 uEJYzKldctZ1ceBdYVmcvtmsUhJAZINnLQiEs70hX9C4VDchd7GfA8x9giCBRzXhiiV4
 ++5s+FAQQ2ENDrxLyJTKIRh6AdM/IWc/uaPIEDwQLZ7AeF2nII1IQDBEEB0IEvBhVyHm
 xIFw==
X-Gm-Message-State: ABUngvdetscuzrnxfzf75uvS612JnfmKXVu/wez7aOjcLZOyE8PuEIcEKP4jvVpXbRxxNec3pMOhfrf2XKcQZQ==
X-Received: by 10.157.60.206 with SMTP id t14mr2206458otf.37.1478485770380;
 Sun, 06 Nov 2016 18:29:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 6 Nov 2016 18:29:09 -0800 (PST)
In-Reply-To: <1478278847-9164-7-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
 <1478278847-9164-7-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Nov 2016 12:59:09 +1030
X-Google-Sender-Auth: yQmOkZa3aAr3VGrng1xz5EK3xLc
Message-ID: <CACPK8Xcba+bD866RjZ_q81pdU=H8Wwp6Hk1jG+MjAY6Mtw9mFw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 6/8] mtd: spi-nor: aspeed: prepare for fast
 read
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
X-List-Received-Date: Mon, 07 Nov 2016 02:29:32 -0000

On Sat, Nov 5, 2016 at 3:30 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Include dummy cycle in the control register value which will be
> required for fast read.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 41 ++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspee=
d-smc.c
> index 73adf409ac34..444af3aff8b5 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c

> @@ -304,6 +304,10 @@ struct aspeed_smc_controller {
>                                        CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHI=
FT)
>  #define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI=
 | \
>                                           CONTROL_SPI_IO_DUMMY_CYCLES_LO)
> +#define CONTROL_SPI_IO_DUMMY_CYCLES_SET(dummy)                         \
> +       (((((dummy) >> 2) & 0x1) << CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT)=
 | \
> +       (((dummy) & 0x3) << CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT))
> +

This is a bit hairy.

Aside from that,

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
