Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbW9M6PZ5zDrLH
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 21:07:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JJrSqnnU"; 
 dkim-atps=neutral
Received: by mail-lf0-x244.google.com with SMTP id y15so10088599lfd.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=s9sKfksSh5F6p98/YQd2TmXHOZCHsL+iDcgobnjXxVE=;
 b=JJrSqnnU9mq5ITVbN1O4M/HzXY9WVc/y3tj0RN+LFILOqpqonKZ9ED4la8Qh+4eTeo
 A4FsnAvYxJV65feolwI23AJ56utGwjp0FvYv2lbmUQPhvmxVpDWr9j9/BI9tBM9hejlV
 yQ/BkhMxw/LaS+UTWovaiQTCc/AQhnt4Tc7N4U4FcQSduD8aZTdEd9+rRcvSguIedlur
 D6YYHll9NoEP/E5quGtWyQEjGzG2OJ1ohmsauLaQGG0RUruWUWMaksEyzw7eE4VxQp7n
 1t//bsLRvJFbnVGJwQSfsSTkd7soBL58Ni/x9tkKsw/z6b7gTP812DjoxpbFncLVUa5R
 bBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=s9sKfksSh5F6p98/YQd2TmXHOZCHsL+iDcgobnjXxVE=;
 b=JzAE8vVPCd7mwZcOTzalRiN9UZbZ5T/PF2DX2J6uUtSa6suZT6iOCLsBGrP2R/knnX
 LkKOsOdinVV5ua2QHI7XBwVqhFN/v+w2fxoIFFwfkpu/I6vSG+Qyp09Auk7cuA9lAfjp
 /O/94WRJMNFFxS0pNIYZOMbOX6beC0TsrweTsZCwUbjJQBZC0nCec0vvEoUs/65peM4T
 xyZX5tgAnevCImr7BTGgBSZQQB3aSxIWcWHpCaSnhjLUVNXBWm/4SirU8Qteqe3eAlJP
 cU9iL2r31IZgKGSiUIxMmxnJk4dTm30sax1qQBVVrjRCf6vdeiMWDNxrv4d9+fnLjjWe
 HHTw==
X-Gm-Message-State: AHYfb5jYT8lBMP1MU6T0YaSef30d8ThnyjdzAc5T6n/HySnq7jALVu78
 A+fgwdvqrOnFhx9Cc6JZhG6CwjZYWw==
X-Received: by 10.46.87.25 with SMTP id l25mr5203976ljb.138.1503313620625;
 Mon, 21 Aug 2017 04:07:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Mon, 21 Aug 2017 04:06:40 -0700 (PDT)
In-Reply-To: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1502140837-48939-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Aug 2017 20:36:40 +0930
X-Google-Sender-Auth: yACVL3-ydGdp2DRPVGmuIrmMtbM
Message-ID: <CACPK8XcR3ZX6X_DZTttvHj5t=Cvnz3eS7uVPc3g_3afSkTULhw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD support to Aspeed
 Flash driver
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>, 
 Milton Miller II <miltonm@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 21 Aug 2017 11:07:04 -0000

On Tue, Aug 8, 2017 at 6:50 AM, Adriana Kobylak <anoo@linux.vnet.ibm.com> wrote:
> Add support to the aspeed flash driver to enable the common mtd layer
> through CONFIG_FLASH_CFI_MTD.
>
> This enables the flash to be used by u-boot mtd drivers including
> the mtdparts and ubi commands.
>
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> Acked-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  arch/arm/mach-aspeed/flash.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index 9c5ead6..e1e3cf8 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -124,6 +124,22 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];               /* FLASH chips info */
>  /* specificspi */
>  #define SpecificSPI_N25Q512    0x00000001
>
> +#ifdef CONFIG_FLASH_CFI_MTD
> +static uint flash_verbose=1;
> +void flash_set_verbose(uint v)
> +{
> +       flash_verbose = v;
> +}
> +
> +unsigned long flash_sector_size(flash_info_t *info, flash_sect_t sect)
> +{
> +       if (sect != (info->sector_count - 1))
> +               return info->start[sect + 1] - info->start[sect];
> +       else
> +               return info->start[0] + info->size - info->start[sect];
> +}

This function looks like it's copied from cfi_flash.c (line 197).

Can you explain why we're duplicating it here?

> +#endif
> +
>  /*-----------------------------------------------------------------------*/
>  static u32 ast_spi_calculate_divisor(u32 max_speed_hz)
>  {
> @@ -1372,6 +1388,10 @@ unsigned long flash_init (void)
>                        flash_get_info(CONFIG_ENV_ADDR_REDUND));
>  #endif
>
> +#ifdef CONFIG_FLASH_CFI_MTD
> +       cfi_mtd_init();
> +#endif
> +
>         return (size);
>  }
>
> --
> 1.8.2.2
>
