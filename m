Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="P1hu1loq"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44b5b226yGzDqHR
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 14:56:13 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id z76so3019888qkb.12
 for <openbmc@lists.ozlabs.org>; Thu, 04 Apr 2019 20:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQsXaHCaOa1D7BC8wN/L3VIv8AysZoTf6h9EozM8odQ=;
 b=P1hu1loq0XtxC6ae/aQxjzES5yRWywEdWSd/dKyYzzECYjJgYwgA1VhHb+tpNw5XuB
 2phuXsDOvkFczyPiTKp0cV0RgMCQkph9E+dw2REcYNAArOOjMuJqDh2gkblCjVfXrvKB
 w4YYUbRJZYvQF43whFr7ZVuLH8er+o4sN0w/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQsXaHCaOa1D7BC8wN/L3VIv8AysZoTf6h9EozM8odQ=;
 b=dntBnwo72B5Y+LX6DjZAWRBgcxYsq2aYF58VFcZ/5ZiZVmrDenmwHjg2/GngQYGavf
 Qu6xLRFmExIyRjBX6cynkKBAoKB9IXSBsNAQtaW3AiEituEJJaWnGBYWef/U1KzjLfW/
 lPKPQlF4KxDvSnTg0vAW1J4rp9TiitvCMDl1Z5+Txm4Nwhu2vhBiiFENF19r778nlbbG
 h8qcdQ3AZsrwQINDeCVkRF59ip5rSSNnXtuqxW3ouEr+hu9qT6955hpAk4TxYgX0tLLB
 R9eW9emRFKUNDD3SQ4sDf4uZ4x/erXm8GYchWMsougWBOE+eF/Ynfj7SKK66lWj1hiKn
 dm/A==
X-Gm-Message-State: APjAAAX4VBa3nKDp/wqn1hoxxsE9H6iYZd8/T/70Oei2KN3H67Bi6Y+F
 K+MTlgJN/ccKOBgPL1M8rNNEvyB4LHvK1Uy3mpE=
X-Google-Smtp-Source: APXvYqzOn2+MKRFWp4GbAn9Hw55jaCyujs3q3SQjG1pxZpCR4Q9WH55iBrXvL083douFzx/4KbeLwDF0Lh45f4WofbI=
X-Received: by 2002:ae9:e002:: with SMTP id m2mr8443319qkk.178.1554436570417; 
 Thu, 04 Apr 2019 20:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xcq7w=h3azUzaPK3F-JUm1oZUOyfnjQ98k2W6_HcKg3rQ@mail.gmail.com>
 <1554388197-10251-1-git-send-email-anoo@linux.ibm.com>
In-Reply-To: <1554388197-10251-1-git-send-email-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Apr 2019 03:55:58 +0000
Message-ID: <CACPK8XfC2fLM=DFLvstSXhFYG53zx+y75x0rx9xc=9df=qj4YQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed/flash: Add
 MT25QL01GB chip
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2019 03:56:14 -0000

On Thu, 4 Apr 2019 at 14:30, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> The MT25QL01GB is a 128MB NOR flash chip planned to be used on
> a Witherspoon system (AST2500).
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> Tested-by: Adriana Kobylak <anoo@us.ibm.com>

That looks better. I've applied this one.

Thanks,

Joel


> ---
>  arch/arm/mach-aspeed/flash.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
> index 907e785..54a6059 100644
> --- a/arch/arm/mach-aspeed/flash.c
> +++ b/arch/arm/mach-aspeed/flash.c
> @@ -83,6 +83,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];          /* FLASH chips info */
>  #define SST25VF040B            0x8d25bf
>  #define AT25DF161              0x02461F
>  #define AT25DF321              0x01471F
> +#define MT25QL01GB             0x21ba20
>
>  /* SPI Define */
>  #define CS0_CTRL                       0x10
> @@ -1141,6 +1142,19 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
>                         ReadClk  = 50;
>                         break;
>
> +               case MT25QL01GB:
> +                       info->sector_count = 2048;
> +                       info->size = 0x8000000;
> +                       erase_region_size  = 0x10000;
> +                       info->readcmd = 0x0b;
> +                       info->dualport = 0;
> +                       info->dummybyte = 1;
> +                       info->buffersize = 1;
> +                       WriteClk = 50;
> +                       EraseClk = 25;
> +                       ReadClk  = 50;
> +                       break;
> +
>                 default:        /* use JEDEC ID */
>                         printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
>                         erase_region_size  = 0x10000;
> --
> 1.8.3.1
>
