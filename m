Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBL2ngjzDvjm
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jyBQzyPz"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id m75so2038293oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=KrXQoT9L8FpaB5HxWuoiO78bjANKrAhUekhm3mwJTq8=;
 b=jyBQzyPzVwBTxQXl6DgSFDUNM4aujCkUnQmZFHPn9K770L9dtABPnMhCflCDLcD0Am
 CPckFwPu6M8yFSMDpuxF7VPTRExoHhL4Rmk0z6lN4An8cZFpegdHRHifu76RVBFCup4b
 5qLNC0+TsjNcCVXgdGNnakJcK/8D/h+01M1Tc+ueRaDkHg9h0g8PXxfr1pC9wNzLnfnh
 ht2vXqb05oV1oBHE+cPGSqCfvRvxSSvaFmJa0Qao3NuLFDs5K2GoLYlStGtJ3VL1dVkl
 e/Kn7AYO79PWBNTNV27gJ/zov+loGxih3ZGluwQb9FOPhpaCzz4M7Crw30oSaYKNSfX8
 00vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=KrXQoT9L8FpaB5HxWuoiO78bjANKrAhUekhm3mwJTq8=;
 b=H772lbWLHSYGS8RXcRZnvAMKkHZqAXUEt2+as8K2e/x+IPtjFEG07win+jgnYogkqf
 pyiChiu/iC4OKXW44XS0Gq0MaZM+qHToSesSx+CPP4+AV24zPKGWjl66X/L0Nwh1/m1T
 RWtZz/zMO9Pdq9v1zG7Ry4+WJncUpPXB7Gnkjf2+4BLoLErufMMrKwpiC1CQzvSuzY7A
 hMupbo6tTphP8/C0PT2hBH+FFz+l77QQVKe2oPgQRTnYNiK+z1FO9ejngRhvdhqkVzjG
 BXaE7BaCgMlbKTChG/onQxFYWDXqMDrrscBDgLQkzALXJ9V6TaLe8ULtvY2l9zHFeY+G
 oAxw==
X-Gm-Message-State: AKaTC02+jS5O110C22uDSPnvxCa5GbWBjf8lweUH6vWpuu2nH5Qc/uUm8L8S2LTuPPBQuxCn4tPU5DDkyDTjVg==
X-Received: by 10.202.253.208 with SMTP id b199mr4468009oii.142.1479713160632; 
 Sun, 20 Nov 2016 23:26:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:40 -0800 (PST)
In-Reply-To: <1479478938-13267-20-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-20-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:40 +1030
X-Google-Sender-Auth: MJQIDyzf2tM5xtwqBScIFCvTuFU
Message-ID: <CACPK8XcN4uJ59hNj8ULJ-O9B-jk+W2xLBW5z2J6zFVmCcsuAAQ@mail.gmail.com>
Subject: Re: [PATCH qemu 19/38] aspeed/smc: add support for DMAs
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:02 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Some of SMC controllers on the Aspeed SoCs support DMA to access the
> flash modules. It can operate in a normal mode, to copy to or from the
> flash module mapping window, or in a checksum calculation mode, to
> evaluate the best clock settings for reads.
>
> When DMA is enabled, a DMA request is built and passed on to a bottom
> half to handle the memory transaction. The CPU is notified of the
> completion with an IRQ if it was enabled.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 234 ++++++++++++++++++++++++++++++++++++++++++++++=
++++--
>  1 file changed, 227 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 24c78aa57537..9596ea94a3bc 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c

> @@ -685,6 +697,202 @@ static uint64_t aspeed_smc_read(void *opaque, hwadd=
r addr, unsigned int size)
>      }
>  }
>
> +typedef struct AspeedDmaCo {
> +    AspeedSMCState *s;
> +    int len;
> +    uint32_t flash_addr;
> +    uint32_t dram_addr;
> +    uint32_t checksum;
> +    bool direction;
> +} AspeedDmaCo;

What does the "Co" part mean?

> +
> +static void coroutine_fn aspeed_smc_dma_done(AspeedDmaCo *dmaco)
> +{
> +    AspeedSMCState *s =3D dmaco->s;
> +
> +    s->regs[R_INTR_CTRL] |=3D INTR_CTRL_DMA_STATUS;
> +    if (s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_EN) {
> +        qemu_irq_raise(s->irq);
> +    }
> +}
