Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0GCY37V9zDqXb
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 19:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJDcY7VJ"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 96so3580515uaq.2
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7iUulZr/Fhosdxrt3lKXwUj25uDgOM0qXQrx/hgrTrY=;
 b=AJDcY7VJJ4d3Hcc962RkxU5tocIZk00GK1W/lwDIDJotYZLXeVXHQhScRfRnGL96Gu
 65u0BLRabU2yJ8fboqrVSUeomsK3PURfDnRyTOeTN8G6V1bvag4oPJscIbv2A9CB+8SA
 mlU00/xl30LyIulpRbNdiYdsTasq4NX02exSITbAlGAlrizRecX1Pn9Nhoif7ienc3AD
 SrhENcmoGdhrQ3OofPeOYYiiI4c631M+Yod6ZGYUYk7SFUi4yovtlzNuMmNM7o9FkSAb
 CaCeA0m76Q/1izEYeH4PnbVglOrf+I9TZhv8XNmZEv9F4zzd3bstMW3YGNWHovYa7mye
 vCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7iUulZr/Fhosdxrt3lKXwUj25uDgOM0qXQrx/hgrTrY=;
 b=LPUjYTzInlr12PzQ+ARoKjV0b5VAPqL+wVjsQXd9CoevDB6zSFy956WuY1u70s6RSm
 Vl/YxcKgsiS7dRD86p31MS2YAOdyVD1WmdSla5SnP1o0cTaNkzOBhUr4NfE3xlUUMlcD
 3I3Kk2LgiW6e/FYfJDzH/JCclctsB5gbh1d/iTqUwqNTWy3qSbrSxNPwPvT/WveLkHV2
 coF/G1EZ3dVHrpd7zcpGCRBW7ZMhourj9O/V6GLJohKFDBXadDksC7Go1Vc/TCHPotJQ
 Qw7Oldp6CPxHi9w3t+G8+Y/ImZTv0bediJb7U0k6kHKaYI3E9CnxRKuDKHosRFlrxuYC
 Cy4Q==
X-Gm-Message-State: AIkVDXK5k/dHbGt+OFSxpCUSzbTFK1rYxJZGKlPLrd1zkZTJz5m66Q5frqOeZ/6XOPtjXfhlMcDXzQVrtVrkcg==
X-Received: by 10.159.52.219 with SMTP id b27mr7269860uac.31.1484296503281;
 Fri, 13 Jan 2017 00:35:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.73 with HTTP; Fri, 13 Jan 2017 00:34:42 -0800 (PST)
In-Reply-To: <20170110225555.117814-4-rlippert@google.com>
References: <20170110225555.117814-1-rlippert@google.com>
 <20170110225555.117814-4-rlippert@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Jan 2017 19:34:42 +1100
X-Google-Sender-Auth: siQJf7INiIRp9k-xEdtJProlV6k
Message-ID: <CACPK8XfZUZb5zO1JhZnEPi-_c6rAD1E8BAxSm53WL=KV_wp5SA@mail.gmail.com>
Subject: Re: [PATCH linux v2 3/3] mtd: spi-nor: aspeed: fix DMA access on
 AST2500
To: Robert Lippert <roblip@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 13 Jan 2017 08:35:05 -0000

On Wed, Jan 11, 2017 at 9:55 AM, Robert Lippert <roblip@gmail.com> wrote:
> AST2500 has additional bits in the dma_addr field.  Its easier
> to just write the full address into the register as the hardware
> will handle the masking properly.
>
> Signed-off-by: Robert Lippert <rlippert@google.com>

Applied to dev-4.7 as db7536c39879.

Cheers,

> ---
>
> Changes in v2:
> - Cleanups suggested by Cedric.
>
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index 3c8e897048c6..cd8a43238660 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -349,7 +349,7 @@ static int aspeed_smc_dma_wait(struct aspeed_smc_chip *chip)
>  }
>
>  #define DMA_LENGTH(x) (((x) - 4) & ~0xFE000003)
> -#define DMA_ADDR(x) ((x) & ~0xE0000003)
> +#define DMA_ADDR(x) ((x) & ~0x00000003)
>
>  static inline void aspeed_smc_chip_configure(struct aspeed_smc_chip *chip,
>                                              u32 ctl)
> --
> 2.11.0.390.gc69c2f50cf-goog
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
