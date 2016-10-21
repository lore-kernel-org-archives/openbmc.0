Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0YMG39NHzDsxX
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 15:57:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SLdFjZTV; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 139so9432280itm.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 21:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=SLDv46yolibR8OaitM/hs1EXWLnB7/9C6Fginqv3cR8=;
 b=SLdFjZTVmnqFG/SbaT3fUvpNpCWbcxTFY5tuxGfFhwO47vCdjyu9O3yVJ66mpjXQ7K
 bqLlNr6ukyWQ/be1Hy+jnIBYpAekBQMAcydTuA6JGzycXvITO4FpVVi155juyXX8W7o0
 n4Wrg8bIQGuLR95dA+76kOHi4s0idii3JtsyuuV4bpmI7ifdoZuQpmXL2+ek0M9D/3Wr
 CM+uQ2R0gNZGsgQH7FHtpMF287FDSwU6PilG9wDsrIRntgVpnj9tDahKt8l+7PtEsgIF
 tlSiWsWTUH+dexhr+FXeITPusJQFfcLEBuFEnpnVDnrPmHe5/KVE9DAHGEHM0tP4a4aP
 G+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=SLDv46yolibR8OaitM/hs1EXWLnB7/9C6Fginqv3cR8=;
 b=EVvGNHazFiJxk1vUYqv4Bn9dkB8Ommv5K0LKoob1SPRmJkP+d0OXYTyyfU/iPs4cOn
 u3LTtcY+XZXrOwDu4wJirAePTn2aJ9CFC17pRrmGCxJHipe+q1rBqOXO75gBw+Sp9Q9s
 KoXAe3H3CGUGe+zVruOXN34f24amRg5S/BQ5+HrBL6DHsqFqFSjkurByV4kRvmTPNErG
 59Mwo6+3ytURI9b7x4VVc4VuHzNdc9fAN0+AQkY9PJo4SMm+zgEQFogI9I8PeCVZqb+f
 yj9FYQ41BxfayFuhXy865fXxVnx6L6Pu/3q+bjEex0NE2ueNYjZXnCXzJJXeKufkZYMi
 EgEw==
X-Gm-Message-State: AA6/9RnJgJHVwi7XW0nf7oJs7mhkJ+1/UUGIuJhhLjhcaCHhOv81+ZK//LqasMjYNLKQP1WiYPTti7sXYqpznw==
X-Received: by 10.202.92.198 with SMTP id q189mr9579452oib.6.1477025848708;
 Thu, 20 Oct 2016 21:57:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 21:57:08 -0700 (PDT)
In-Reply-To: <1477004194-107484-1-git-send-email-xow@google.com>
References: <1477004194-107484-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 15:27:08 +1030
X-Google-Sender-Auth: mnyrlWBl-WgrsLWeT1tYX60GFgo
Message-ID: <CACPK8Xc+_m07jKCm-2tEGetpe7DuM03OrqOVp7wBH=4XgxrzrA@mail.gmail.com>
Subject: Re: [PATCH linux] mach-aspeed: Add Zaius BMC PHY reset
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Oct 2016 04:57:31 -0000

On Fri, Oct 21, 2016 at 9:26 AM, Xo Wang <xow@google.com> wrote:
> The Broadcom PHY for the Zaius BMC requires a hard reset after RGMII
> clocks are enabled. This asserts the reset in case it wasn't performed
> in U-Boot.

Applied to dev-4.7 as b1842ce03a37af80f638c2f7c679704b5bb5bd56.

I'm not sure how we would handle this properly if we were to submit it
upstream. We can carry it for now though.

Cheers,

Joel

>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 0a1700e..ebb2224 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/io.h>
> +#include <linux/delay.h>
>  #include <asm/mach-types.h>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> @@ -186,6 +187,9 @@ static void __init do_zaius_setup(void)
>
>         /* EVT1 hacks */
>         if (board_rev == 0) {
> +               /* D3 in GPIOA/B/C/D direction and data registers */
> +               unsigned long phy_reset_mask = BIT(27);
> +
>                 /* Set strap[13:12] to 01, Enable SPI master */
>                 /* Set bits in writes to SCU7C are cleared from SCU70 */
>                 writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
> @@ -195,6 +199,18 @@ static void __init do_zaius_setup(void)
>                 /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
>                 reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
>                 writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
> +
> +               /* Assert MAC2 PHY hardware reset */
> +               /* Set pin low */
> +               reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
> +               writel(reg & ~phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
> +               /* Enable pin for output */
> +               reg = readl(AST_IO(AST_BASE_GPIO | 0x04));
> +               writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x04));
> +               udelay(3);
> +               /* Set pin high */
> +               reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
> +               writel(reg | phy_reset_mask, AST_IO(AST_BASE_GPIO | 0x00));
>         }
>  }
>
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
