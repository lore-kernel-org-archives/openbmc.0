Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBP2mdQzDvPc
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="khWiJdOX"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id f201so17131997oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=DHpK2+HWvJKVMcRSaEj3OcqXe6YAtUeRuVIvtUaf+Cg=;
 b=khWiJdOXOK8WA4NviBm5i62Ch/lFe+V3Nh7tPjxV8hn0AXr1uTUu3kg7fUt5AQA8Hw
 6NMvSSD6dYouLhFtrQC2srPzO5ninIrKjLZN4kFZ+XxNmO/xpRsOBGtvItB7JydVbljd
 O304Xf/8A0TkvKhIO9ExtrZf4vqrUQS87JTxENzfnGjIXAC3K5v/FN6ohnBK+Fw/JRU/
 xZACQwLrzSw1go0z3Qm62kr1epiE2ZjkwhecvpjWt7rXXuhFpQlrzQEkwIGVQa4AXpt7
 WN7dVOMjSDaTcl5paokbRdoLVJrqGOYoURiA56sH8WwfGDKIO6im786ELJir94TcVLqM
 tfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=DHpK2+HWvJKVMcRSaEj3OcqXe6YAtUeRuVIvtUaf+Cg=;
 b=S84HA/Pqad1U4kfXgmoEeAqHDvtj+A+/0dAE9IWUjcW9qg7dA3wWFhrZkt/4qVVpfk
 gzkRQJJ9k9VQ5f3LjTw3xs3rPfk10+WfS1YO9JV1XODSTcXxtMZqX70jzy8BvOENsR8Z
 u/UYO6BS8qfkxhEnYvaVBXj6p9cB2dX9U8w4A+cRUlcvvBiwetOxbVYntBMy9lcA6/4M
 X+tDUNf+9UklT9+a49Pxh6WI7Aw8dP5a68dyagE6oV4NDW5I4nEZ+BgQOjulxcoSYOPy
 Y4SFDV8/tAKhlaDU3MvwhjzDzylGsky131CwcTxMmG0rTLNtdaYoCWfhrhQEu/Ce4M7K
 CxHQ==
X-Gm-Message-State: AKaTC00hUa7I2B68VSC9RC14waJaJqzHbTP3x1tGXKfL/ptV37JeJywUsXK4glJMjGPGTLjx2SokXpSE6YhGxw==
X-Received: by 10.157.45.166 with SMTP id g35mr7575014otb.223.1479713163656;
 Sun, 20 Nov 2016 23:26:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:43 -0800 (PST)
In-Reply-To: <1479478938-13267-21-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-21-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:43 +1030
X-Google-Sender-Auth: Y9h18ztyBVMH_Fvl9mfTxOCOtI4
Message-ID: <CACPK8XdekrniuFNtNB3PU7H4STOPMPy-u86VAaQ8cPB7D4OPcw@mail.gmail.com>
Subject: Re: [PATCH qemu 20/38] aspeed/smc: handle dummy bytes when doing fast
 reads
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:05 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 9596ea94a3bc..c0ae07ef8c96 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c

> @@ -525,27 +534,49 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFl=
ash *fl, uint32_t addr)
>      ssi_transfer(s->spi, (addr & 0xff));
>  }
>
> +static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
> +{
> +    AspeedSMCState *s =3D fl->controller;
> +    uint32_t r_ctrl0 =3D s->regs[s->r_ctrl0 + fl->id];
> +
> +    return ((((r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1) << 2) |
> +            ((r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3)) * 8;

This is crazy :)

It might be easier to read if we had a few local variables. Might not
though, so it's up to you.

> +}
> +
> +static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned si=
ze)
> +{
> +    AspeedSMCState *s =3D fl->controller;
> +    uint64_t ret =3D 0;
> +    int i;
> +
> +    if (fl->cmd =3D=3D SPI_OP_READ_FAST) {
> +        for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
> +            ssi_transfer(s->spi, 0x0);

Do you need to check the return value here as well, like you do below?

> +        }
> +    }
> +    fl->cmd =3D 0;
> +
> +    for (i =3D 0; i < size; i++) {
> +        ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
> +    }
> +    return ret;
> +}
