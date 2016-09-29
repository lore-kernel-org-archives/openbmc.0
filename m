Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
 [209.85.213.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skxDx0XRvzDsTW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 11:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WUNYdJcm; 
 dkim-atps=neutral
Received: by mail-vk0-f65.google.com with SMTP id 192so2247261vkl.2
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 18:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mWQIJec2tQq5IkFMmPEz/x01Bbe4cVMfMAjAo7R02rw=;
 b=WUNYdJcmJw0SDjI1c1mEgRIC51+NnCcH3tZhQZCQU1784zCzaW6FHmfh0H6JAoOt9b
 eHLkVSMi1U3y7ljID//PATMYtv5D1fbpOqN2bGGX96KQIb+TZX2bB1fEySy+AbnXaD4v
 TNDFoYKomMc4jiaf/wyOtzZIuPGFdJ8rxt3TQQ0Z9rjvdO2AQ3AlBNM2N0zUFkJvkaVj
 PTIBxRGoutcn1TYK+ZMboEX5d+vsIoNn6L1Jj6aqTj8ptltNkoPL7I6bkDS1jPjDAJ/5
 6pcig+5TvZM6OH2gSKUIk00YuXN6XMRixP/fDCWrB6EbwUEKslXA/Pkh/LxJr10DqdaA
 WPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mWQIJec2tQq5IkFMmPEz/x01Bbe4cVMfMAjAo7R02rw=;
 b=U6EA3ULyF+zfbVCLVRYEFO55E5yGiHsuXTk1Ti8OUkoOlWsX2QGALMMnH805nfBIRA
 tnEg0eFKuFOGuybqhOedqtfeGMks/BQ0COIJz5GAMwqEoo6AajiRN06XmjOsvpnslJQp
 gHe0MSfpoq4dGhvgXwit0nADNgbANhXy9y6win1o48N8b1CZ14FOG/exFQsL6VyYWAqS
 uq1XwldPFXhBK8RgnSB99DGK2X/KzRpoifTEte9qtkRnijTeno/vZOuV+qZqYXmiR+Yc
 K95JP600bblD4E5Ylo+WMsW2gHocbwNuDEOK4GSLAMbjuzYetuajvAWafoup6HzgmZSj
 Ei9g==
X-Gm-Message-State: AA6/9RmZlw5XKiPYUBx2zuas66yk/eHuyParch2wMw06OLnsO8wcTJPjFbVAXEKofLkYoInDP+nbK9AER/vENQ==
X-Received: by 10.31.183.78 with SMTP id h75mr18745230vkf.148.1475111026719;
 Wed, 28 Sep 2016 18:03:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 18:03:26 -0700 (PDT)
In-Reply-To: <1474998214-12720-2-git-send-email-maxims@google.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-2-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 10:33:26 +0930
X-Google-Sender-Auth: kGLDgsqA7JyENL0gIevsFCl62pA
Message-ID: <CACPK8XfgUCEfcgmZ8P2wpMCRHn-jaVup_X5cpq93bYMkZy-jTw@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed/g5: helper SCU functions for configuring
 aspeed I2C
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
X-List-Received-Date: Thu, 29 Sep 2016 01:04:49 -0000

On Wed, Sep 28, 2016 at 3:13 AM,  <maxims@google.com> wrote:

You need a commit message.

> From: Maxim Sloyko <maxims@google.com>
>
> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h | 74 ++++++++++++++++-------------

Please put the reformatting of header files in a seperate patch.

>  arch/arm/mach-aspeed/ast-scu.c              | 30 +++++++++++-
>  3 files changed, 75 insertions(+), 35 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> index d248416..80ebd6f 100644
> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> @@ -38,6 +38,7 @@ extern void ast_scu_get_who_init_dram(void);
>  extern u32 ast_get_clk_source(void);
>  extern u32 ast_get_h_pll_clk(void);
>  extern u32 ast_get_ahbclk(void);
> +extern u32 ast_get_apbclk(void);
>
>  extern u32 ast_scu_get_vga_memsize(void);
>
> @@ -45,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
>  extern void ast_scu_multi_func_eth(u8 num);
>  extern void ast_scu_multi_func_romcs(u8 num);
>
> +/* Enable I2C controller and pins for a particular device.
> + * Device numbering starts at 1
> + */
> +extern void ast_scu_enable_i2c(u8 num);
> +
>  #endif
> diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> index b89df82..92ce84a 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -10,8 +10,8 @@
>   *    1. 2012/12/29 Ryan Chen Create
>   *
>  ********************************************************************************/
> -#ifndef __AST_SCU_H
> -#define __AST_SCU_H                     1
> +#ifndef __AST_REGS_SCU_H
> +#define __AST_REGS_SCU_H                     1
>
>  #include <asm/arch/aspeed.h>
>
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

It looks like you're just changing the SCU_FUC_ to SCU_FUN. Without a
commit message I'm not sure why you're doing this, can you explain
why?

I don't think it is required.

If you were to make a change like this you should perform the renaming
and update the call sites in a separate patch to any other changes.
This makes it easier to review.


> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
> index 0cc0d67..1452b93 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -318,6 +318,14 @@ u32 ast_get_ahbclk(void)
>
>  #endif /* AST_SOC_G5 */
>
> +u32 ast_get_apbclk(void)
> +{
> +       u32 h_pll = ast_get_h_pll_clk();
> +       u32 apb_div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
> +       return h_pll / apb_div;
> +}

This will do for now. We suspect need to write a clock driver that
will live in drivers/clk/ to do it properly.

Can apb_div ever be zero?

> +
> +
>  void ast_scu_show_system_info(void)
>  {
>
> @@ -394,7 +402,7 @@ void ast_scu_multi_func_eth(u8 num)
>                               AST_SCU_FUN_PIN_CTRL1);
>
>                 ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
> -                             SCU_FUC_PIN_MAC1_MDIO,
> +                             SCU_FUN_PIN_MAC1_MDIO,
>                               AST_SCU_FUN_PIN_CTRL5);
>
>                 break;
> @@ -496,3 +504,23 @@ void ast_scu_get_who_init_dram(void)
>                 break;
>         }
>  }
> +
> +void ast_scu_enable_i2c(u8 num)
> +{

Is num the bus? Perhaps a better name would be "bus_enable" or similar.

I think you mentioned that num must be > 0. If so, check for zero, log
an error and return.


> +       /* Enable I2C Controllers */
> +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> +
> +       if (num < 3) {

How do we enable buses number 1 and 2 when AST_SOC_G5 is not set?

> +#ifdef AST_SOC_G5
> +               if (num == 1) {
> +                       setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                                SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
> +               } else {

Make the else check for num == 2, as that's what you're looking for.

> +                       setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                                SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
> +               }
> +#endif
> +       } else {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5, SCU_FUN_PIN_I2C(num));
> +       }


> +}
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
