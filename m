Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl4p76gRGzDrZr
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 16:45:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Mk8qoBbd; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 51so2181388uac.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IJUcHkTsBlBRkaSIUhM6Lk2xJqrIEEUMaCigeZiNBCA=;
 b=Mk8qoBbdjsu03QprBAoEgIblNvetqSimE7b8XiOY9linlmB5+JKRyv2/P/l0X7uv6G
 NHPeNg0hDfbDkucjgy46IY7Re7OE9SmOwUS1u/wZMSRncVb4iIuzzr4ZIoCqHqFxVY0C
 YDylwG5Hdq9Fhr9ksx+B8LoRqigN2wHfcpKM4as9/Wzt5h9RNRSHj6/d3oy2Spc4rTpm
 Rv09JhQDFIiWSBvy1S8ghcrL3Q+VcJz1PRhqfQcoTUrM8VY7K+OD4/PqqYacz8ebrQ5L
 IOkjhtASrtwQe49VeoH5iW5j2OPXVECPD5F52m25bYVHmpmNhr7BLqFhIxQafeXSvIwa
 o6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IJUcHkTsBlBRkaSIUhM6Lk2xJqrIEEUMaCigeZiNBCA=;
 b=ZRPax3my9k6f21L7Soi8rmKM8+P7vyBeLjo7UromszRLwWCiJX7u2Ub339YeQko7Vh
 C1JEti6mJqlzDNixViajowRtuWdmRA/0HRgrmNF2raqwU2v+sUPB3SblDD9cDM7nD6Pc
 N/f3KTiQyx34mbCp9KDIgmX2AfmRoWaeDrTSfYiCDMGQuCVbuMcncuyTpYOohJPbd5al
 xjSnr1QQcFXMQlM0Q8yUBLYLMEzeeurGTcdALheAr8/QIm8cIsJ7pC/A5Mj+kMubG9nZ
 fqg1IGpuQ6HymXSjZ6YqPGGyl7CKtCFm1wrjZkg1qKF3w4SDvyi9sGeH/BpDAYXPZHHS
 PVqg==
X-Gm-Message-State: AA6/9RnGec0CghNuC2YwN1XV315XvjqJ2c22FUcdZ82VifCiPayOqk4xcJoqtNCgjKDkOzsp1NsuqA1yTgFVKw==
X-Received: by 10.176.5.169 with SMTP id e38mr7794528uae.7.1475131533665; Wed,
 28 Sep 2016 23:45:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 23:45:13 -0700 (PDT)
In-Reply-To: <a266046d34009e6e92c4c76699c550c2ba44bd5c.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a266046d34009e6e92c4c76699c550c2ba44bd5c.1474986045.git-series.andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 16:15:13 +0930
X-Google-Sender-Auth: WZdsvlZqobhajRprITp3Nnpz_CQ
Message-ID: <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Enable capture of off-SCU pinmux
 state
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 29 Sep 2016 06:45:36 -0000

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The System Control Unit IP in the Aspeed SoCs is typically where the
> pinmux configuration is found.
>
> But not always.
>
> On the AST2400 and AST2500 a number of pins depend on state in one of
> the SIO, LPC or GFX IP blocks, so add support to at least capture what
> that state is. The pinctrl engine for the Aspeed SoCs doesn't try to
> inspect or modify the state of the off-SCU IP blocks. Instead, it logs
> the state requirement with the expectation that the platform
> designer/maintainer arranges for the appropriate configuration to be
> applied through the associated drivers.

This is unfortunate.

This patch kicks the can down the road, but doesn't solve the problem
for a user who wants to configure some functionality that depends on
the non-SCU bits. Because of this I'm not sure if we want to put it in
the tree.

However, I'm not sure what a proper solution would look like. Perhaps
Linus can point out another SoC that has a similar problem?

Cheers,

Joel

>
> The IP block of interest is encoded in the reg member of struct
> aspeed_sig_desc. For compatibility with the existing code, the SCU is
> defined to have an IP value of 0.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 53 +++++++++++++++++++++++---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h | 16 +++++++-
>  2 files changed, 61 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 49aeba912531..21ef195d586f 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -14,6 +14,8 @@
>  #include "../core.h"
>  #include "pinctrl-aspeed.h"
>
> +const char *const aspeed_pinmux_ips[] = { "SCU", "SIO", "GFX", "LPC" };
> +
>  int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>         struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
> @@ -78,7 +80,9 @@ int aspeed_pinmux_get_fn_groups(struct pinctrl_dev *pctldev,
>  static inline void aspeed_sig_desc_print_val(
>                 const struct aspeed_sig_desc *desc, bool enable, u32 rv)
>  {
> -       pr_debug("SCU%x[0x%08x]=0x%x, got 0x%x from 0x%08x\n", desc->reg,
> +       pr_debug("Want %s%lX[0x%08X]=0x%X, got 0x%X from 0x%08X\n",
> +                       aspeed_pinmux_ips[SIG_DESC_IP_FROM_REG(desc->reg)],
> +                       SIG_DESC_OFFSET_FROM_REG(desc->reg),
>                         desc->mask, enable ? desc->enable : desc->disable,
>                         (rv & desc->mask) >> __ffs(desc->mask), rv);
>  }
> @@ -105,6 +109,8 @@ static bool aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
>         unsigned int raw;
>         u32 want;
>
> +       WARN_ON(SIG_DESC_IP_FROM_REG(desc->reg) != ASPEED_IP_SCU);
> +
>         if (regmap_read(map, desc->reg, &raw) < 0)
>                 return false;
>
> @@ -142,9 +148,19 @@ static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
>
>         for (i = 0; i < expr->ndescs; i++) {
>                 const struct aspeed_sig_desc *desc = &expr->descs[i];
> +               size_t ip = SIG_DESC_IP_FROM_REG(desc->reg);
> +
> +               if (ip == ASPEED_IP_SCU) {
> +                       if (!aspeed_sig_desc_eval(desc, enabled, map))
> +                               return false;
> +               } else {
> +                       size_t offset = SIG_DESC_OFFSET_FROM_REG(desc->reg);
> +                       const char *ip_name = aspeed_pinmux_ips[ip];
> +
> +                       pr_debug("Ignoring configuration of field %s%X[0x%08X]\n",
> +                                ip_name, offset, desc->mask);
> +               }
>
> -               if (!aspeed_sig_desc_eval(desc, enabled, map))
> -                       return false;
>         }
>
>         return true;
> @@ -170,7 +186,14 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>         for (i = 0; i < expr->ndescs; i++) {
>                 bool ret;
>                 const struct aspeed_sig_desc *desc = &expr->descs[i];
> +
> +               size_t offset = SIG_DESC_OFFSET_FROM_REG(desc->reg);
> +               size_t ip = SIG_DESC_IP_FROM_REG(desc->reg);
> +               bool is_scu = (ip == ASPEED_IP_SCU);
> +               const char *ip_name = aspeed_pinmux_ips[ip];
> +
>                 u32 pattern = enable ? desc->enable : desc->disable;
> +               u32 val = (pattern << __ffs(desc->mask));
>
>                 /*
>                  * Strap registers are configured in hardware or by early-boot
> @@ -179,11 +202,27 @@ static bool aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                  * deconfigured and is the reason we re-evaluate after writing
>                  * all descriptor bits.
>                  */
> -               if (desc->reg == HW_STRAP1 || desc->reg == HW_STRAP2)
> +               if (is_scu && (offset == HW_STRAP1 || offset == HW_STRAP2))
>                         continue;
>
> -               ret = regmap_update_bits(map, desc->reg, desc->mask,
> -                               pattern << __ffs(desc->mask)) == 0;
> +               /*
> +                * Sometimes we need help from IP outside the SCU to activate a
> +                * mux request. Report that we need its cooperation.
> +                */
> +               if (enable && !is_scu) {
> +                       pr_debug("Pinmux request for %s requires cooperation of %s IP: Need (%s%X[0x%08X] = 0x%08X\n",
> +                               expr->function, ip_name, ip_name, offset,
> +                               desc->mask, val);
> +               }
> +
> +               /* And only read/write SCU registers */
> +               if (!is_scu) {
> +                       pr_debug("Skipping configuration of field %s%X[0x%08X]\n",
> +                                       ip_name, offset, desc->mask);
> +                       continue;
> +               }
> +
> +               ret = regmap_update_bits(map, desc->reg, desc->mask, val) == 0;
>
>                 if (!ret)
>                         return ret;
> @@ -343,6 +382,8 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>                 const struct aspeed_sig_expr **funcs;
>                 const struct aspeed_sig_expr ***prios;
>
> +               pr_debug("Muxing pin %d for %s\n", pin, pfunc->name);
> +
>                 if (!pdesc)
>                         return -EINVAL;
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> index 3e72ef8c54bf..4384407d77fb 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
> @@ -232,6 +232,15 @@
>   * group.
>   */
>
> +#define ASPEED_IP_SCU  0
> +#define ASPEED_IP_SIO  1
> +#define ASPEED_IP_GFX  2
> +#define ASPEED_IP_LPC  3
> +
> +#define SIG_DESC_TO_REG(ip, offset)    (((ip) << 24) | (offset))
> +#define SIG_DESC_IP_FROM_REG(reg)      (((reg) >> 24) & GENMASK(7, 0))
> +#define SIG_DESC_OFFSET_FROM_REG(reg)  ((reg) & GENMASK(11, 0))
> +
>  /*
>   * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
>   * references registers by the device/offset mnemonic. The register macros
> @@ -261,7 +270,10 @@
>    * A signal descriptor, which describes the register, bits and the
>    * enable/disable values that should be compared or written.
>    *
> -  * @reg: The register offset from base in bytes
> +  * @reg: Split into three fields:
> +  *       31:24: IP selector
> +  *       23:12: Reserved
> +  *       11:0: Register offset
>    * @mask: The mask to apply to the register. The lowest set bit of the mask is
>    *        used to derive the shift value.
>    * @enable: The value that enables the function. Value should be in the LSBs,
> @@ -270,7 +282,7 @@
>    *           LSBs, not at the position of the mask.
>    */
>  struct aspeed_sig_desc {
> -       unsigned int reg;
> +       u32 reg;
>         u32 mask;
>         u32 enable;
>         u32 disable;
> --
> git-series 0.8.10
