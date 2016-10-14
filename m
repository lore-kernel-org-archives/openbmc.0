Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw7F9251zzDt1l
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 11:06:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mfiZGSId; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id b186so4321374vkb.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eXQBtmK4gZU4o3+SL/8V48qLDqrmruNgaHggaeZBTy4=;
 b=mfiZGSId4DRASmxiufENYHaqGlQr8xrja3aKmAPeRJNCd5s9hN72wWvuWQp6Iv049M
 jBeVCTt5PwrbJ4fYxX0UKhYHCzICsB1kKu7jB021QGZ62qeproJNLAdc0gEhEMCmoeTR
 MF4Yjq39FsENuEUh1g2ObSYhbFpZcCXfDvnat6uBXqhKxl1eXVrXvz/QBcEaXatrzD9r
 mc9cr/pvedTuaVUGeBTlJhaoJ36tjbb2X/Q9/ZX0cL2on1RXE3zp0lfffkKVTT+v7C6j
 TPHbO56SHOrVyHC+XKzHIIITYzWHb6v4nb5qQqN2u785ns3XHI2CVL85t2apxLTLtqvP
 DjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eXQBtmK4gZU4o3+SL/8V48qLDqrmruNgaHggaeZBTy4=;
 b=Xn4ASYEImvvBvHiVxmFlUcGu1Scqp7Co7KK0uGwrjDwDnRt5XIa3F75SdVBbGNH01B
 Awe2tqJRFKzgwFK1yWcW8GjveZDMIl5wXPWH5w9s/V5WNs8H9JqTHudluzcWgaqephiy
 AL/ORz0HvsXW+4wSulgZXL5uwMIfmpsSqOeHZO4acA0NQa7ekD6zSzHArOMmzfD4vb16
 3MopNcO2FAYeRgV/p0UIDL3a6qKBxKolNTRAK5eqEjATYPSYR4HD8idze/SQTuazBept
 OvsrGpExOWxog8tNUbtYtiwTlYTYz7k07pWu7TOYW4yIpema+jC5e6qgGS9DOJWqElrf
 D/fA==
X-Gm-Message-State: AA6/9RnDQxOv/tqzS/RTsSEHSQyd2lsFKe+W3q5TzPNnIDJiTjdD5+Pmcy5LWH+RAtSo7Y+O/Dexr4XtRua1/g==
X-Received: by 10.31.102.6 with SMTP id a6mr5884237vkc.151.1476403610988; Thu,
 13 Oct 2016 17:06:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 13 Oct 2016 17:06:30 -0700 (PDT)
In-Reply-To: <1475520957-78581-1-git-send-email-maxims@google.com>
References: <1475184427-144121-3-git-send-email-maxims@google.com>
 <1475520957-78581-1-git-send-email-maxims@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Oct 2016 11:06:30 +1100
X-Google-Sender-Auth: 7kOJQiP3lyHDq1reSkd6e9sFJMI
Message-ID: <CACPK8Xc7C9m-t_mKuBr4FdDQEE2F_rFUJKqf8SQyzdVhfXskbQ@mail.gmail.com>
Subject: Re: [PATCH] aspeed: SCU helper functions for I2C.
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
X-List-Received-Date: Fri, 14 Oct 2016 00:06:54 -0000

On Tue, Oct 4, 2016 at 5:55 AM,  <maxims@google.com> wrote:
> From: Maxim Sloyko <maxims@google.com>
>
> SCU helper functions for configuring I2C pins and accessing APB clock.

This lacks a signed off by as previously discussed.

Please send two separate patches, one for the apb change and one for
the unrelated scu change.

Make sure you send your patches with a version number for the series.
It also helps to add a u-boot prefix so I know if the patch is for the
kernel or u-boot.

git format-patch --to=joel@jms.id.au --to=openbmc@lists.ozlabs.org
--subject-prefix "u-boot" -v 2 ....

Cheers,

Joel

> ---
>  arch/arm/include/asm/arch-aspeed/ast_scu.h  |  6 +++++
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |  8 ++++++
>  arch/arm/mach-aspeed/ast-scu.c              | 38 +++++++++++++++++++++++++++++
>  3 files changed, 52 insertions(+)
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
> index aab032a..4c869c1 100644
> --- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
> @@ -915,6 +915,11 @@
>  #define SCU_FUN_PIN_ROMA4              (0x1 << 18)
>  #define SCU_FUN_PIN_ROMA3              (0x1 << 17)
>  #define SCU_FUN_PIN_ROMA2              (0x1 << 16)
> +/* AST2500 only */
> +#define SCU_FUN_PIN_SDA2               (0x1 << 15)
> +#define SCU_FUN_PIN_SCL2               (0x1 << 14)
> +#define SCU_FUN_PIN_SDA1               (0x1 << 13)
> +#define SCU_FUN_PIN_SCL1               (0x1 << 12)
>
>  /* AST_SCU_FUN_PIN_CTRL9               0xA8 - Multi-function Pin Control#9 */
>  #define SCU_FUN_PIN_ROMA21             (0x1 << 3)
> @@ -950,4 +955,7 @@
>  /* AST_SCU_BMC_CLASS                   0x19C - BMC device class code and revision ID */
>  /* AST_SCU_BMC_DEV_ID                  0x1A4 - BMC device ID */
>
> +#define SCU_I2C_MIN_BUS_NUM                    (1)
> +#define SCU_I2C_MAX_BUS_NUM                    (14)
> +
>  #endif
> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
> index 280c421..1dbd667 100644
> --- a/arch/arm/mach-aspeed/ast-scu.c
> +++ b/arch/arm/mach-aspeed/ast-scu.c
> @@ -318,6 +318,17 @@ u32 ast_get_ahbclk(void)
>
>  #endif /* AST_SOC_G5 */
>
> +u32 ast_get_apbclk(void)
> +{
> +       u32 h_pll = ast_get_h_pll_clk();
> +       /* The formula for converting the bit pattern to divisor is
> +        * (4 + 4 * DIV), according to datasheet
> +        */
> +       u32 apb_div = 4 + 4 * SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
> +       return h_pll / apb_div;
> +}
> +
> +
>  void ast_scu_show_system_info(void)
>  {
>
> @@ -496,3 +507,30 @@ void ast_scu_get_who_init_dram(void)
>                 break;
>         }
>  }
> +
> +void ast_scu_enable_i2c(u8 bus_num)
> +{
> +       if (bus_num < SCU_I2C_MIN_BUS_NUM || bus_num > SCU_I2C_MAX_BUS_NUM) {
> +               debug("%s: bus_num is out of range, must be [%d - %d]\n", __func__,
> +                         SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
> +               return;
> +       }
> +
> +       /* Enable I2C Controllers */
> +       clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> +
> +       if (bus_num >= 3) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
> +                                        SCU_FUN_PIN_I2C(bus_num));
> +#ifdef AST_SOC_G5
> +       /* In AST2400 aka AST_SOC_G4 SDA{1,2}/SCL{1,2} are fixed function pins,
> +        * so no need to change their function. */
> +       } else if (bus_num == 1) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                        SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
> +       } else if (bus_num == 2) {
> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> +                                        SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
> +#endif
> +       }
> +}
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
