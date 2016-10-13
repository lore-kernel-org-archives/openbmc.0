Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svb2v1CRVzDsxn
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 13:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WVDWYvNJ; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 2so2917848vkb.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=LNz998qr8ctlOcUNZb5jkaWKd8XCQd8TS0QwDDnjeiw=;
 b=WVDWYvNJjMj0NLXwyNd2MsPzl32qRxPX+V8r6MYN3LUwL6sN+Cao3RPHyxKVq1L9TO
 mhtY7YVt6+rgKhEBehuKhhNVQI7d2bf/8FzlFXkfKeu43PXg4wQTJfFfK/RLACgFjRWN
 ajGmd915tUaizjUzMRnt/iuTor6QY1C6iBeoisEz00MFLKVZIID54Dw4LTNy5P40vXLQ
 RO0cgctBju2uqKJiYbXa2dXz6OQVctC55bYMRq5FCMzY+amruRPX9cWAgXi0qmV9Ih/8
 KMFHUeAZ2LK+MD/ByuQi80WafF8kHVr/et3r+mYoLWQDBWxecMCuRWiMFLlnHZRI6+/t
 ptQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=LNz998qr8ctlOcUNZb5jkaWKd8XCQd8TS0QwDDnjeiw=;
 b=Y21bpTH6/8OniSsMDS9lqq8q2dSR7UFhcpep0vYZmCasMcZrNxhJ8E1PGqLp23WdfH
 SFjoHbKLyd8Zn4/ESPfZNzwB9zycDvfR95d0j1b+qh4Iz8q+TVQ/1FZd7ebb024cKJsi
 IE/nbSdqGkx0lHfokUuMKqJNUZ7+VYhyXG6u7bGkBtn2JWyukSPFfytU5O+yjtiITFen
 azC9GmfCbwrbxVRx21t0c4og02fo6hU/h8n0PQBvdZCFAR6RqkVrrM+8cQ4vObw2JCB1
 7YjCjF+SfyX0wavH3avuIySccpwdXNHjQYqk7RrN3xvpUX9PcG6H8/1eRAt4GSqVL18z
 D9KQ==
X-Gm-Message-State: AA6/9RlZwl+RrI4s+Ah7N/PAJlxRB9QcJMBwMD/XPtldVgZIMVCQsKIapyMonJssR3bBgqLztuJFbRcck6Mk/g==
X-Received: by 10.31.233.6 with SMTP id g6mr2860157vkh.148.1476327364024; Wed,
 12 Oct 2016 19:56:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 12 Oct 2016 19:55:43 -0700 (PDT)
In-Reply-To: <1476312288-100725-1-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Oct 2016 13:55:43 +1100
X-Google-Sender-Auth: bMZqucAHW6FBqeLtPxj-L0uCDTI
Message-ID: <CACPK8XdRCjtnaEYjh0-8HHEx_zADO+KB_RtrPdnONx4ySu3Rqw@mail.gmail.com>
Subject: Re: [PATCH 1/5] mach-aspeed: Add Zaius BMC-specific early setup
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
X-List-Received-Date: Thu, 13 Oct 2016 02:56:07 -0000

On Thu, Oct 13, 2016 at 9:44 AM, Xo Wang <xow@google.com> wrote:
> Add initialization for "ingrasys,zaius-bmc" machines to deal with
> hardware issues on EVT1 boards. This overrides incorrect straps that
> enabled the SPI slave and disables pull down resistors that prevented
> buttons inputs from being driven high.
>
> This code reads board revision fuse bits directly from GPIO registers
> because GPIO drivers are not available yet.

That's unfortunate, but I can't think of another way to make it work.

> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/mach-aspeed/aspeed.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 12a63db..9bf159c 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -170,6 +170,31 @@ static void __init do_witherspoon_setup(void)
>         do_ast2500_common_setup();
>  }
>
> +static void __init do_zaius_setup(void)
> +{
> +       unsigned long reg;
> +       unsigned long board_rev;
> +
> +       do_ast2500_common_setup();
> +
> +       /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
> +       reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
> +       board_rev = (reg >> 3) & 0x1F;
> +
> +       /* EVT1 hacks */
> +       if (board_rev == 0) {
> +               /* Set strap[13:12] to 01, Enable SPI master */
> +               /* Set bits in writes to SCU7C are cleared from SCU70 */
> +               writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
> +               /* SCU70 is set-only, so no read-modify-write needed */
> +               writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
> +
> +               /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
> +               reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
> +               writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
> +       }
> +}
> +
>
>  #define SCU_PASSWORD   0x1688A8A8
>
> @@ -216,6 +241,8 @@ static void __init aspeed_init_early(void)
>                 do_ast2500evb_setup();
>         if (of_machine_is_compatible("ibm,witherspoon-bmc"))
>                 do_witherspoon_setup();
> +       if (of_machine_is_compatible("ingrasys,zaius-bmc"))
> +               do_zaius_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
