Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22c.google.com (mail-oi0-x22c.google.com
 [IPv6:2607:f8b0:4003:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6347C1A0609
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 11:59:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YyTLKx3b; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=lFUBxYQk; 
 dkim-atps=neutral
Received: by mail-oi0-x22c.google.com with SMTP id j125so46084946oih.0
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2016 16:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=vjqgDzaqLCDvTv3JR9YuRnn8gtdeY8eplrOJONUBn6U=;
 b=YyTLKx3bxNflnoxITss1S8qyy8Blh24gI+T/FG28VWba5vRuR1L7Y/b4+jWx2iABap
 3eUmRIOh1hGLoav8yE7CIytH57YtEwqU662itMcTK7JQoWNJJqYI+g2saplDqG7/PgmE
 CqYZJIQqDY3zhxNN3UNPkqVMJO7i7ST+MLlLb6vvBmtnhCu1BV6B+RGWj/VhJJ/bX00F
 OIAldqaa4t2CDOaocc1T2ezC6ybaLh4w0Dhlv8Bozp7sUJ8fLKTixMfoZt8zcrUPAK0H
 562RYu1CKQdqB+wS6lAiYCJ7I2eNgFy+OOIjcRGXsOuhB/cCVf8UE0hWj5dHKkPDu4r0
 I8bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=vjqgDzaqLCDvTv3JR9YuRnn8gtdeY8eplrOJONUBn6U=;
 b=lFUBxYQkVw3q7Ho6FpuEE9q72s19XJ4rtnh0vJCSUq5lRswP2CP5F9t8/RCWUF+2WE
 Yf7N3jdblUbKaxEf3KAYuOaUB6vd18FmQDMvdq8OakFFeYy77QOAEkus59QLGLoWnbau
 J8hgekjxM50bRcViia0+/8uH4wjb5l7RrUlro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=vjqgDzaqLCDvTv3JR9YuRnn8gtdeY8eplrOJONUBn6U=;
 b=N6pYaP4pUPIuL8guntU1dy9KRZI12oD42I0NOu767uPaGxkCRSXTLMUKrT1Eq6pCb/
 XoxEgqmpUTCjMEFIj4SuaZoepYBZ5nfki8wuKJJ3l2F41814CoDxJ7z2NUtBaa65ijmX
 l4nsZlCHeZXvKNlrWwLCmXQymYjl0odIHQfRy2Q81JyG24Ook/iciOZ0YOtLiHl19bcM
 gbviDkMLqOBJAj1L8hIuONoivL1uR5ERAjzfc9O4J8OCyHZnQvCvgmBCzDLWRC2uqPSJ
 X5rKyfkflPb+fujU6tJQ547sL2vZIGw9DdK4e0+9rBkB847rZ3GSe4Xk79nTMHQYpOzk
 eCfA==
X-Gm-Message-State: AG10YOQ+PcT8Q0Pjs8e4EbZG358+oT4mR4l4tLnyMFAnr1dVyr3C1GNKESYiSaIqBMdZrGbe1X13Tmfnuj8P3A==
X-Received: by 10.202.196.208 with SMTP id u199mr19638378oif.71.1456102744540; 
 Sun, 21 Feb 2016 16:59:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 21 Feb 2016 16:58:45 -0800 (PST)
In-Reply-To: <1455909023-21506-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455909023-21506-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909023-21506-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Feb 2016 11:28:45 +1030
X-Google-Sender-Auth: XCBUIwNjsREOozHNB0rkGgn2rxQ
Message-ID: <CACPK8Xfguq9sVJKgx_WV-gXPevG3L=7g+OrooD+doihOvFhbAg@mail.gmail.com>
Subject: Re: [PATCH linux] Remove GPIO and LPC from WDT reset list
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Norman James <nkskjames@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Feb 2016 00:59:06 -0000

On Sat, Feb 20, 2016 at 5:40 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Norman James <njames@us.ibm.com>
>
> WDT reset mode must also be set to SOC mode

Can you elaborate? What does this fix?

>
> Signed-off-by: Norman James <nkskjames@gmail.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 5 +++--
>  drivers/watchdog/aspeed_wdt.c | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 2feb161..6ebd6c0 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -191,9 +191,10 @@ static void __init aspeed_init_early(void)
>         writel(0, AST_IO(AST_BASE_WDT | 0x2c));
>
>         /*
> -        * ensure all IPs are reset on watchdog expiry
> +        * ensure all IPs except GPIO and LPC are reset on watchdog expiry
>          */
> -       writel(0x003ffff3, AST_IO(AST_BASE_SCU | 0x9C));
> +       writel(0x001fdff3, AST_IO(AST_BASE_SCU | 0x9C));
> +       //writel(0x003ffff3, AST_IO(AST_BASE_SCU | 0x9C));

Lets not leave commented out code in the tree.

>
>         /*
>          * Temporary setup of AST registers until pinmux driver is complete
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 07ae815..a1ea4c2 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -37,6 +37,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define WDT_RELOAD_VALUE       0x04
>  #define WDT_RESTART            0x08
>  #define WDT_CTRL               0x0C
> +#define   WDT_CTRL_RESET_MODE_SOC      (0x00 << 5)
>  #define   WDT_CTRL_RESET_MODE_FULL_CHIP        (0x01 << 5)
>  #define   WDT_CTRL_RESET_SYSTEM                (0x1  << 1)
>  #define   WDT_CTRL_ENABLE              (0x1  << 0)
> @@ -45,7 +46,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>
>  static void aspeed_wdt_enable(struct aspeed_wdt *wdt, int count)
>  {
> -       u32 ctrl = WDT_CTRL_RESET_MODE_FULL_CHIP | WDT_CTRL_RESET_SYSTEM |
> +       u32 ctrl = WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM |
>                 WDT_CTRL_ENABLE;
>
>         writel(0, wdt->base + WDT_CTRL);
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
