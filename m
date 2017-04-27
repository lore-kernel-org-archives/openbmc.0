Return-Path: <xow@google.com>
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDNtj4kMyzDq72
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 03:17:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Pw2lMbce"; 
 dkim-atps=neutral
Received: by mail-qt0-x232.google.com with SMTP id g60so31619162qtd.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xv7yXNkslBvr78HJqb7tSEaHfVW7AztXdagZpUrH9Vc=;
 b=Pw2lMbcemzbZoxqmQj/JLM8EQcoyAfR0RoN0aV5ffI9WafyZO0Zc74kpMo6Ry+3QEM
 4ciN4hFSEqiecSljgpc9NUYllnEDooc9j0G52nCfcA8XFk48z3ZEb0tCgbdL5Yj/Z9x2
 JAOyJmjgAxT+XcRPvRp0tkJABd+noVq94eJL0HugsAYndMgEThCItGC6ZUCZi/E14Wd2
 4DDFiLYXJ/3Mzj6AIfZBaxQfv7eNagDsf2e1P966Vx35VFjLd4vEzyFUxvL6LYcUjD4x
 inTHFCfKRl8kNMRiB8i4fLUK0/z2djXgBUsZl1ZG9LYoEksO1eSc68v+bG0W1hbvUVYq
 DksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xv7yXNkslBvr78HJqb7tSEaHfVW7AztXdagZpUrH9Vc=;
 b=N5fUF4qQYSth0spbiXYKR78lTIeZX7+yfYUp0WTuhInOx1r5/1Trz88xMvhGGFcq3S
 8FTE5MBlH9t4drxIQstDE9VjJXx2fjnCZndwO24ia37P08x/5NM7ebx0oLJxwi5/eu++
 /fxozMGtCIu2tGgWL/FWDHfJNZLrMEszT9WR5Od0LsRv4R/tU2qtVNnz0Xxiq7TOz+Kg
 Ae4Xa7nX5Rj1b8N+t2XailQyFDaXTXodoakQs8fi6kRV6DJQQDNrqLub2FrYV8GDTMN4
 diALaBPHaQ8jGfmFk8siCAZj0O9IrtcNqvkfQCPi/AZxgUOa2I+ksbhCIWre+Lxfobfg
 KC9Q==
X-Gm-Message-State: AN3rC/6yF/adUCtjKGqrUCu5etISFFsrCltfUOwW6Flgp3ur9YIzundt
 53Jryvw8LbO3CWDAacTsm5KKpC2FgAZB
X-Received: by 10.200.55.151 with SMTP id d23mr6762717qtc.140.1493313467242;
 Thu, 27 Apr 2017 10:17:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Thu, 27 Apr 2017 10:17:46 -0700 (PDT)
In-Reply-To: <20170427060823.32226-7-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-7-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Thu, 27 Apr 2017 10:17:46 -0700
Message-ID: <CAPH-5w5MgSJdycVn=zQJZzy75Z_E3DA7BemcN8j4KjSomSy=kw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 06/10] aspeed: zaius: Remove LPC-to-AHB
 bridge configuration
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 27 Apr 2017 17:17:50 -0000

On Wed, Apr 26, 2017 at 11:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is handled by the mbox daemon via the lpc-ctrl driver.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index f73a72676437..e879e9e1aa42 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -136,18 +136,6 @@ static void __init do_zaius_setup(void)
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
>         writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
>
> -       /* Setup PNOR address mapping for 64M flash
> -        *
> -        *   ADRBASE: 0x3000 (0x30000000)
> -        *   HWMBASE: 0x0C00 (0x0C000000)
> -        *  ADDRMASK: 0xFC00 (0xFC000000)
> -        *   HWNCARE: 0x03FF (0x03FF0000)
> -        *
> -        * Mapping appears at 0x60300fc000000 on the host
> -        */
> -       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
> -       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> -
>         /* Set SPI1 CE1 decoding window to 0x34000000 */
>         writel(0x70680000, AST_IO(AST_BASE_SPI | 0x34));
>
> --
> 2.9.3
>

Reviewed-by: Xo Wang <xow@google.com>
