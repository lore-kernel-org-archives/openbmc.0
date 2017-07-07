Return-Path: <xow@google.com>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com
 [IPv6:2a00:1450:400c:c0c::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x48Wb5T87zDr93
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 08:32:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rqajzJg4"; 
 dkim-atps=neutral
Received: by mail-wr0-x233.google.com with SMTP id r103so65097168wrb.0
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=rQ1ZNKU8r2SaCdNIeZgn+LPjrk481eVOilITVA5Rk/w=;
 b=rqajzJg4aZUlIJwE7h3h4LGVewxR4EMkZXxM0F4CmAhp4wKT8UBOcA7sHQS1IwfPlZ
 eKiqwaOJRGqpVsWpZlEOPYo/yNeQoMWwEu/Nkp9CLmQkxxpMEZHaCFbIj9ENjYPc5CJB
 z7ew0B7IrHHbm5p2oeZzFdb389ze81J7GpmgLJ218ghA6sDXBPvJviD1favu9hufBqcm
 P8W02aFWs0xXlISIY4D9uxLgdX89wD6qp2Q15WTT1mthIzmNFyuebrEdeJDhTJXUoGFa
 xxeXS9BQCNWC1+xjaTnzMVLDt8jaY+FQWjoyL2z4t9vZhLyXfaig2q6uCoAX9H7hCV33
 LNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=rQ1ZNKU8r2SaCdNIeZgn+LPjrk481eVOilITVA5Rk/w=;
 b=cNu/sE34p9idVfiQ3vsR9OVGam5e9wCvj3TYMkm7bK34BuNf7BuiYq/VIEnlvTanwv
 S6svVJnDIm6cNkZtP3vaAIJIMNBxAPlzU2ijDSIjpVccjeIUgBxPvwHC+Th4fzuvTHhl
 +uXfh4docLdPPc/5ibgDLv8HFs+dYj/DCaXdjwKnRrhiOyu7YNnFeQ5ODWw7TBnG4Y84
 0Z+csJOpMSXO+lrJn35aFCB0FVMBUgu3zSAK8AfUKK/bfchI5pSZNzpL6H9day2HX/Rf
 hHN1TmPUD4YOBePH9cQz1vvrSgNbSQfLCz9hILixq9ibz8GRrMKmS2XPNoyD+dO7Pfo9
 CEtw==
X-Gm-Message-State: AIVw1102IiuWfwK8qMNDemBHTc6MGlGF0kBiZOATvwWvKrS9n+YoJ6+0
 BG0bHvzhFUiBiWuwsvnUpleZHOr5UywN
X-Received: by 10.223.176.119 with SMTP id g52mr1966995wra.26.1499466774765;
 Fri, 07 Jul 2017 15:32:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.64.131 with HTTP; Fri, 7 Jul 2017 15:32:54 -0700 (PDT)
In-Reply-To: <20170704011012.26158-1-joel@jms.id.au>
References: <20170704011012.26158-1-joel@jms.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 7 Jul 2017 15:32:54 -0700
Message-ID: <CAPH-5w4wjUQO80oNCpH1rrOdEMHNBG+x3OMRbhiUVa-BZmi20w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: Release UART1 from reset for
 all platforms
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 07 Jul 2017 22:33:00 -0000

On Mon, Jul 3, 2017 at 6:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> This workaround was in place for Zaius. Make it common to all
> platforms as the held-in-reset behaviour breaks the Linux tty layer
> where users expect the existence of a device to mean it is usable.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 420a8d0344da..d3eb9e7c2d8b 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -173,14 +173,6 @@ static void __init do_zaius_setup(void)
>         /* Set pin high */
>         reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
>         writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
> -
> -       /* Disable default behavior of UART1 being held in reset by LPCRST#.
> -        * By releasing UART1 from being controlled by LPC reset, it becomes
> -        * immediately available regardless of the host being up.
> -        */
> -       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> -       /* Clear "Enable UART1 reset source from LPC" */
> -       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
>  static void __init do_witherspoon_setup(void)
> @@ -254,6 +246,14 @@ static void __init aspeed_init_early(void)
>          */
>         writel(0x001fdff3, AST_IO(AST_BASE_SCU | 0x9c));
>
> +       /* Disable default behavior of UART1 being held in reset by LPCRST#.
> +        * By releasing UART1 from being controlled by LPC reset, it becomes
> +        * immediately available regardless of the host being up.
> +        */
> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +       /* Clear "Enable UART1 reset source from LPC" */
> +       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
> +
>         /*
>          * Temporary setup of AST registers until pinmux driver is complete
>          */
> --
> 2.13.2
>

Reviewed-by: Xo Wang <xow@google.com>
