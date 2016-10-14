Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw7G729lvzDt1l
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 11:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xeYKIKtv; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id b186so4322197vkb.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 17:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oKNlyCPsrYqtDcdkDmExaZW9HMhPQq08FVwUYd1rLjI=;
 b=xeYKIKtvSXgibzQ1L1o0cv/kcXdIFFqAJM6uAbrJdhXSarZwIOIV1HQMySAfVJ1iR9
 J2NCHs4xKy4/dFr3dlPuQQsFN3SzvszeoCSPDbrEmcycqcGiKcJDjC8CjHyZYt3fqkM8
 dGHyWWvjN5VAk0cWBOE3rsa4fmfPOIf37skgeBK8Zk1jeBCROyL9gSaGlXYXkWhZgDqG
 ej0EF+8TaigUnsacV5n1lGFGf6x9OpugEDGzklLqoKPoAcuOsCTE5zp/BZUJqfYd8gK3
 Pl4stNKHgC1o6rsoAW/f98yG/a1Kj2imhAPeEkww5NyoM653PQgttds6u4DMGcOv/m1W
 ggnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oKNlyCPsrYqtDcdkDmExaZW9HMhPQq08FVwUYd1rLjI=;
 b=UatoL9rYqKkcCB7bHuQ6dLcapQ0o+JgUhPJN6T9GWCUQ3h4KMfcU7OXuIwzbHGglxk
 /yDWVbhGHLJKoCx0eOMvFjFcc1CqF/Rz/a05NNhP1h01RtEimPiKwEfg6xYc/zvKcxWF
 g9p8oVGWKgP/8PTjjWiyAqe2/mVrYEIw2cpkem62TXsgw3xnQvpPtTjZxOhI+Syua3iE
 qcQZSr1pSOVtc+jQRufoQ8MwErGIuHE6CaeKzIKM89KEvj22mQbVQ2cwFP8OVA++GHpW
 y65gEv2lLKV9C3PWuOJbJiaebLvaFu5SX4WOxxnkQqo2K4/VKTlLkkiu6Ym36d4hn9sP
 03xw==
X-Gm-Message-State: AA6/9RmZw9rfh5wehfyHoPCs7kU9NtemkSfQngCTZU8Rv0lbiwkoXnsW6R+VZqKyXxjn2gnRA8lCH31lTcd/9w==
X-Received: by 10.31.233.6 with SMTP id g6mr6856373vkh.148.1476403661090; Thu,
 13 Oct 2016 17:07:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 13 Oct 2016 17:07:20 -0700 (PDT)
In-Reply-To: <1475184427-144121-2-git-send-email-maxims@google.com>
References: <1474998214-12720-2-git-send-email-maxims@google.com>
 <1475184427-144121-1-git-send-email-maxims@google.com>
 <1475184427-144121-2-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Oct 2016 11:07:20 +1100
X-Google-Sender-Auth: _CSBhVPTHgxtR32AgkelenOHhFY
Message-ID: <CACPK8XfS3kY3PHK7r+aiGQ+5FXe8Wrs2p-FYr=_f58JrCRiQfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Fixed FUC -> FUN typo in SCU.
To: Maxim Sloyko <maxims@google.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 00:07:43 -0000

On Fri, Sep 30, 2016 at 7:27 AM,  <maxims@google.com> wrote:
> From: Maxim Sloyko <maxims@google.com>
>
> Fixed FUC -> FUN typo in SCU.

This lacks a signed off by as previously discussed.

You have not made a convincing argument for this change. I suggest you
drop the patch from your series.

Cheers,

Joel

> ---
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 65 +++++++++++++++--------------
>  arch/arm/mach-aspeed/ast-scu.c              |  2 +-
>  2 files changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b714fa9..aab032a 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -830,49 +830,50 @@
>  /* AST_SCU_FUN_PIN_CTRL5               0x90 - Multi-function Pin Control#5 */
>  #define SCU_FUN_PIN_SPICS1             (0x1 << 31)
>  #define SCU_FUN_PIN_LPC_PLUS           (0x1 << 30)
> -#define SCU_FUC_PIN_USB20_HOST         (0x1 << 29)
> -#define SCU_FUC_PIN_USB11_PORT4                (0x1 << 28)
> -#define SCU_FUC_PIN_I2C14              (0x1 << 27)
> -#define SCU_FUC_PIN_I2C13              (0x1 << 26)
> -#define SCU_FUC_PIN_I2C12              (0x1 << 25)
> -#define SCU_FUC_PIN_I2C11              (0x1 << 24)
> -#define SCU_FUC_PIN_I2C10              (0x1 << 23)
> -#define SCU_FUC_PIN_I2C9               (0x1 << 22)
> -#define SCU_FUC_PIN_I2C8               (0x1 << 21)
> -#define SCU_FUC_PIN_I2C7               (0x1 << 20)
> -#define SCU_FUC_PIN_I2C6               (0x1 << 19)
> -#define SCU_FUC_PIN_I2C5               (0x1 << 18)
> -#define SCU_FUC_PIN_I2C4               (0x1 << 17)
> -#define SCU_FUC_PIN_I2C3               (0x1 << 16)
> -#define SCU_FUC_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> -#define SCU_FUC_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> -#define SCU_FUC_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> -#define SCU_FUC_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> -
> -#define SCU_FUC_PIN_MII2_TX_DRIV(x)    (x << 10)
> -#define SCU_FUC_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> -#define SCU_FUC_PIN_MII1_TX_DRIV(x)    (x << 8)
> -#define SCU_FUC_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
> +#define SCU_FUN_PIN_USB20_HOST         (0x1 << 29)
> +#define SCU_FUN_PIN_USB11_PORT4                (0x1 << 28)
> +#define SCU_FUN_PIN_I2C14              (0x1 << 27)
> +#define SCU_FUN_PIN_I2C13              (0x1 << 26)
> +#define SCU_FUN_PIN_I2C12              (0x1 << 25)
> +#define SCU_FUN_PIN_I2C11              (0x1 << 24)
> +#define SCU_FUN_PIN_I2C10              (0x1 << 23)
> +#define SCU_FUN_PIN_I2C9               (0x1 << 22)
> +#define SCU_FUN_PIN_I2C8               (0x1 << 21)
> +#define SCU_FUN_PIN_I2C7               (0x1 << 20)
> +#define SCU_FUN_PIN_I2C6               (0x1 << 19)
> +#define SCU_FUN_PIN_I2C5               (0x1 << 18)
> +#define SCU_FUN_PIN_I2C4               (0x1 << 17)
> +#define SCU_FUN_PIN_I2C3               (0x1 << 16)
> +#define SCU_FUN_PIN_I2C(n)             (0x1 << (16 + (n) - 3))
> +#define SCU_FUN_PIN_MII2_RX_DWN_DIS    (0x1 << 15)
> +#define SCU_FUN_PIN_MII2_TX_DWN_DIS    (0x1 << 14)
> +#define SCU_FUN_PIN_MII1_RX_DWN_DIS    (0x1 << 13)
> +#define SCU_FUN_PIN_MII1_TX_DWN_DIS    (0x1 << 12)
> +
> +#define SCU_FUN_PIN_MII2_TX_DRIV(x)    (x << 10)
> +#define SCU_FUN_PIN_MII2_TX_DRIV_MASK  (0x3 << 10)
> +#define SCU_FUN_PIN_MII1_TX_DRIV(x)    (x << 8)
> +#define SCU_FUN_PIN_MII1_TX_DRIV_MASK  (0x3 << 8)
>
>  #define MII_NORMAL_DRIV                        0x0
>  #define MII_HIGH_DRIV                  0x2
>
> -#define SCU_FUC_PIN_UART6              (0x1 << 7)
> -#define SCU_FUC_PIN_ROM_16BIT          (0x1 << 6)
> -#define SCU_FUC_PIN_DIGI_V_OUT(x)      (x)
> -#define SCU_FUC_PIN_DIGI_V_OUT_MASK    (0x3)
> +#define SCU_FUN_PIN_UART6              (0x1 << 7)
> +#define SCU_FUN_PIN_ROM_16BIT          (0x1 << 6)
> +#define SCU_FUN_PIN_DIGI_V_OUT(x)      (x)
> +#define SCU_FUN_PIN_DIGI_V_OUT_MASK    (0x3)
>
>  #define VIDEO_DISABLE                  0x0
>  #define VIDEO_12BITS                   0x1
>  #define VIDEO_24BITS                   0x2
>  //#define VIDEO_DISABLE                        0x3
>
> -#define SCU_FUC_PIN_USB11_PORT2                (0x1 << 3)
> -#define SCU_FUC_PIN_SD1_8BIT           (0x1 << 3)
> +#define SCU_FUN_PIN_USB11_PORT2                (0x1 << 3)
> +#define SCU_FUN_PIN_SD1_8BIT           (0x1 << 3)
>
> -#define SCU_FUC_PIN_MAC1_MDIO          (0x1 << 2)
> -#define SCU_FUC_PIN_SD2                        (0x1 << 1)
> -#define SCU_FUC_PIN_SD1                        (0x1 << 0)
> +#define SCU_FUN_PIN_MAC1_MDIO          (0x1 << 2)
> +#define SCU_FUN_PIN_SD2                        (0x1 << 1)
> +#define SCU_FUN_PIN_SD1                        (0x1 << 0)
>
>
>  /* AST_SCU_FUN_PIN_CTRL6               0x94 - Multi-function Pin Control#6*/
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
> index 0cc0d67..280c421 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -394,7 +394,7 @@ void ast_scu_multi_func_eth(u8 num)
>                               AST_SCU_FUN_PIN_CTRL1);
>
>                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -                             SCU_FUC_PIN_MAC1_MDIO,
> +                             SCU_FUN_PIN_MAC1_MDIO,
>                               AST_SCU_FUN_PIN_CTRL5);
>
>                 break;
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
