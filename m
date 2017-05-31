Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9wP0xGrzDq5W
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hB6f5ZXX"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id 130so460658ybl.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=j8Ga01LLSv7VM35aHfLNJ2mlo3PB00Hv7tUFvaL/ojw=;
 b=hB6f5ZXXciKwSg2iJkuuJ6N2TLCsuBCwQiytUZRg4nspTnfR2uMd8RHfbqWl4+3Lvh
 4zNzuv4oANEzlxa++Cxqm9n5S59Ywfc4Lz22WXpVzHnxp9LEGZ0S/agRrth+LdcYzUza
 lAiuAJKZcC9rV6do7ylxV1fMuqxpkhKEBfYcANtVCHiiPEiZ55UV+XK7wLYPBnOcxvmI
 eo/yoP0056zUy8TDhRr/Jbo6hBB/03fLD7AFBRk1VoCix/bqULY0wtVW77nf4A8H+8WV
 94rkivOCjhMg6M8t4V/jrS2DR333Bf5vKOIBaD/YM/J6ipUKblZZ5YL3a498jGeFW1XG
 rPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=j8Ga01LLSv7VM35aHfLNJ2mlo3PB00Hv7tUFvaL/ojw=;
 b=rL4mtFt58u8fuLCodtVI/Blo3pygAE8IBd7rxsH2tKg/ZC1VovtbMs3WXVQm/b5D8L
 06/8i+KpSQYIezBfv7DB1FM8JrDEn84pKA/+T5pie7D8nGfg7efW6TixmvPBU7qJ+oU2
 WsumZq8mdz4f1WLilhR6grxHLuqBjrZh5F/XLj2yJf3waEF+uFuXZxCAvc7ofZofrVF6
 UO+2DZI7h3qKUFgMeGOWFnpSUZSCh1W1rGyQ6RdGx6M++haX4E55V+6jJ9y+3KqFdFpL
 i8sO9O0G7UuxKNcbA1Tf3IY0fzV4ndNCvuHxdIIWY17hMUsIQl1KWQYJEZApfOqOMKTF
 dk3Q==
X-Gm-Message-State: AODbwcCk3puCFXde/URyTRuDodu5KbxC+1Zr8RHKIV/kL4Q9GPZ3WF6Z
 s9XBsg1cjPHN4b2RpaaPJfjnFX4DAg==
X-Received: by 10.37.59.210 with SMTP id i201mr227575yba.25.1496236579000;
 Wed, 31 May 2017 06:16:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 06:15:58 -0700 (PDT)
In-Reply-To: <20170530123810.102882-1-c_mykolak@mellanox.com>
References: <20170530123810.102882-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:45:58 +0930
X-Google-Sender-Auth: YEpwuU1wBqfdyf1zM4UFtcoyrx0
Message-ID: <CACPK8XdAuwTbdkYdGAJQJHbckYAT5wBDUF+Xxcp1nfYY3gLjwA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v4] ARM: aspeed: Add Mellanox MSN machine
 (aspeed arch)
To: Mykola Kostenok <c_mykolak@mellanox.com>
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
X-List-Received-Date: Wed, 31 May 2017 13:16:21 -0000

On Tue, May 30, 2017 at 10:08 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Initial introduction of Mellanox switches of MSNXXXX family equipped
> with Aspeed 2520 BMC SoC. This adds the platform early initialization.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Thanks, applied to dev-4.10.

Please follow up with the RMII clock and MAC strapping issues - these
should be fixed by correcting the hardware strapping. We would prefer
not to have a workaround in the kernel tree.

Cheers,

Joel

> ---
> v1->v2
> Fixed issues pointed out by Joel:
> - Make commit title shorter.
> - Replace flash layout from separate dtsi to dts.
> - Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
> - Remove no-hw-checksum from dts.
> - Add comments.
> - Remove WD2 disable from aspeed.c
> - Add wdt2 to dts.
>
> v2->v3
> - Split v2 patch into three separate.
>
> v3->v4
> Fixed issues pointed by Andrew:
> - Fix comment.
> - Fix UART1 reset disable sequence(read/modify/write).
> ---
>  arch/arm/mach-aspeed/aspeed.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 0f1a536ba1b2..5c88286c96fd 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -188,6 +188,31 @@ static void __init do_lanyang_setup(void)
>         writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>  }
>
> +static void __init do_mellanox_setup(void)
> +{
> +       unsigned long reg;
> +
> +       do_common_setup();
> +
> +       /* Set strapping for MAC1 to RMII/NCSI and MAC2 to RGMII. */
> +       reg = readl(AST_IO(AST_BASE_SCU | 0x70));
> +       reg |= BIT(7);
> +       reg &= ~BIT(6);
> +       writel(reg, AST_IO(AST_BASE_SCU | 0x70));
> +
> +       /* Disable default behavior of UART1 being held in reset by LPCRST#.
> +        * By releasing UART1 from being controlled by LPC reset, it becomes
> +        * immediately available regardless of the host being up. */
> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
> +       /* Clear "Enable UART1 reset source from LPC" */
> +       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
> +
> +       /* Enable RMII1 50MHz RCLK output. */
> +       reg = readl(AST_IO(AST_BASE_SCU | 0x48));
> +       reg |= BIT(29);
> +       writel(reg, AST_IO(AST_BASE_SCU | 0x48));
> +}
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -227,6 +252,8 @@ static void __init aspeed_init_early(void)
>                 do_romulus_setup();
>         if (of_machine_is_compatible("inventec,lanyang-bmc"))
>                 do_lanyang_setup();
> +       if (of_machine_is_compatible("mellanox,msn-bmc"))
> +               do_mellanox_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 2.11.0
>
