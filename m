Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XxjBodSH"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GGLcdslc"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nLyk3LT1zF13r
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 18:32:46 +1000 (AEST)
Received: by mail-qk0-x243.google.com with SMTP id c137-v6so5807860qkg.2
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 01:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=1oh87VZ/ptql29xJsBK0Dz3fT9wMXXantoL5ulw7dJM=;
 b=XxjBodSHy99Noz1f+BZlksawxlbTmPCb2ifZ75b/OsTwZlFW2Yd+mdWzqbwfMtconS
 f5AJc6PeXAUpEP/u8R+fs0+QrQGuSa/OQcnaVBqWJqYjXsxITaHeuGfhFIeJflCP3XIx
 VoMjsHy5ondqHY9+uWXXGchU8bwYhRlEV3vrcufVxAuag9jXnhkO2S6TAYCW6b1SHNVA
 kcFtW/9STi3nLhzoxnYc0W5VdeIFEINx+ViKTGL5cIsrGi7p3DgCokN8NWVewajEJRq3
 8vNHRfgZ1lXjWF9VrINfNFHGdZkNtmwjkx4oKe73plX28ACo2rHpRyPVfgBc/bAPC2xV
 sSVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=1oh87VZ/ptql29xJsBK0Dz3fT9wMXXantoL5ulw7dJM=;
 b=GGLcdslcVtJRoQJYSbkz4wlbjsD3CrryruKum5OL2nheYHHIXbJsPY5ZjnyhU26kD8
 Oignt7Zgcufim8F4xu8s5RdOwym5PTjXbeLPsETH2oP6ZicmNKqnNonWFdocwNvNijzn
 NPcjvfTLwm17Ns+Nf5xpS36hh9HCWe675qKeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=1oh87VZ/ptql29xJsBK0Dz3fT9wMXXantoL5ulw7dJM=;
 b=kmLdGvXHB4ADs7FR1XZ989pFQHNP9AmqFcp5usp2O928wk+tbXScd6NOZ6LpDmEbVs
 IMhm6gSuS6fH2W+2BK8neitHt3d4OIxteiP+6Q3qpmT/ybLlcne8kkh4+tiBUFfu/ldK
 +tMNg+hdvKlws5F5J+bL82yD0mPRZ2dfj7zyTysQan+OCio+eJdIt6KgpRnnVsN8Gqm5
 CxiZnUhgOMdkW7Vne7b+W9NdiVmaz7VQfLYU9zjrihsr6wdsFtGZY3aEHvDv/Ww+podH
 x0ipskGJbCUkoOY8eQnX7dWc6A5jcmQ1nK8GsUJmJ4fjIzWybHyFxX12YGWswi9GmwXz
 SUOw==
X-Gm-Message-State: ALKqPwfGb0Z4Uhvqmi8qVuX8rLPZLlotOgMC4iDEKDvOL4F1dw2GH6sT
 tF+nyfxmwWJNqbMcLGzctH9tFCu6OJiZrnYw/2U=
X-Google-Smtp-Source: AB8JxZq2X04jD7N/KLz8fG3Wvay58GBN0TO+FFzKgip+/pZoFo7alw3fD9dulnsKiVedavyVXy+8WJC65toeanPiLE4=
X-Received: by 2002:a37:5d84:: with SMTP id
 r126-v6mr7674011qkb.352.1526632363275; 
 Fri, 18 May 2018 01:32:43 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Fri, 18 May 2018 01:32:22 -0700 (PDT)
In-Reply-To: <1526563450-20630-3-git-send-email-tmaimon77@gmail.com>
References: <1526563450-20630-1-git-send-email-tmaimon77@gmail.com>
 <1526563450-20630-3-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 May 2018 18:02:22 +0930
X-Google-Sender-Auth: Q26l7aRTgkXb6DuZFtkdT7Du09w
Message-ID: <CACPK8XcTM82naCWgpK8_jsMync6GoGXJiQhv7jeb0BkHRUgA7A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 2/2] pinctrl: npcm: add NPCM7xx pin
 control driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 08:32:47 -0000

Hi Tomer,

On 17 May 2018 at 22:54, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Add Nuvoton BMC NPCM7xx pin controller driver.
>
> The NPCM7XX Pin Controller multi-function routed
> through the multiplexing block, Each pin supports
> GPIO functionality (GPIOx) and multiple functions
> that directly connect the pin to different hardware
> blocks.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I've applied this to dev-4.13 with some minor fixes. How is the
upstream submission of this one going?

> ---
>  drivers/pinctrl/Kconfig                   |    1 +
>  drivers/pinctrl/Makefile                  |    2 +
>  drivers/pinctrl/nuvoton/Kconfig           |   12 +
>  drivers/pinctrl/nuvoton/Makefile          |    1 +
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2133 +++++++++++++++++++++++=
++++++
>  5 files changed, 2149 insertions(+)
>  create mode 100644 drivers/pinctrl/nuvoton/Kconfig
>  create mode 100644 drivers/pinctrl/nuvoton/Makefile
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index e14b46c7b37f..25b7c1383631 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -351,6 +351,7 @@ source "drivers/pinctrl/uniphier/Kconfig"
>  source "drivers/pinctrl/vt8500/Kconfig"
>  source "drivers/pinctrl/mediatek/Kconfig"
>  source "drivers/pinctrl/zte/Kconfig"
> +source "drivers/pinctrl/nuvoton/Kconfig"
>
>  config PINCTRL_XWAY
>         bool
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 2bc641d62400..925d99b05e47 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -62,3 +62,5 @@ obj-$(CONFIG_PINCTRL_UNIPHIER)        +=3D uniphier/
>  obj-$(CONFIG_ARCH_VT8500)      +=3D vt8500/
>  obj-$(CONFIG_PINCTRL_MTK)      +=3D mediatek/
>  obj-$(CONFIG_PINCTRL_ZX)       +=3D zte/
> +obj-$(CONFIG_ARCH_NPCM7XX)     +=3D nuvoton/
> +
> diff --git a/drivers/pinctrl/nuvoton/Kconfig b/drivers/pinctrl/nuvoton/Kc=
onfig
> new file mode 100644
> index 000000000000..e174a83e8be2
> --- /dev/null
> +++ b/drivers/pinctrl/nuvoton/Kconfig
> @@ -0,0 +1,12 @@
> +config PINCTRL_NPCM7XX
> +       bool "Pinctrl driver for Nuvoton NPCM7XX"
> +       depends on (ARCH_NPCM7XX || COMPILE_TEST) && OF
> +       depends on MFD_SYSCON

This needed to be select MFD_SYSCON, or else I got Kconfig warnings.


> +       select GPIOLIB
> +       select GPIOLIB_IRQCHIP
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       help
> +         Say Y here to enable pin controller and GPIO support
> +         for Nuvoton NPCM7xx SoCs.

> --- /dev/null
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c

> +
> +#define DRV_DATE    "2018-05-14"
> +#define DRV_VERSION "2.0.0"

I don't think this is necessary.


> +/* Get slew rate of pin (high/low) */
> +static int npcm_get_slew_rate(struct NPCM_GPIO *bank,
> +                             struct regmap *gcr_regmap, unsigned int pin=
)
> +{
> +       u32 val;
> +       int gpio =3D (pin % bank->gc.ngpio);
> +
> +       if (pincfg[pin].flag & SLEW)
> +               return gpio_bitop(bank, opGETBIT, gpio, NPCM_GP_N_OSRC);
> +       /* LPC Slew rate in SRCNT register */
> +       if (pincfg[pin].flag & SLEWLPC)
> +       {
> +               regmap_read(gcr_regmap, NPCM7XX_GCR_SRCNT, &val);
> +               return !!(val & SRCNT_ESPI);
> +       }
> +       return -EINVAL;
> +}
> +
> +/* Get drive strength for a pin, if supported */
> +static int npcm_get_drive_strength(struct pinctrl_dev *pctldev,
> +                                  unsigned int pin)
> +{
> +       struct NPCM7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev)=
;
> +       struct NPCM_GPIO *bank =3D &npcm->gpio_bank[pin/GPIO_PER_BANK];
> +       int gpio =3D (pin % bank->gc.ngpio);
> +       u32 val, ds =3D 0;
> +       int flg;
> +
> +       flg =3D pincfg[pin].flag;
> +       if (flg & DRIVE_STRENGTH_MASK) {
> +               /* Get standard reading */
> +               val =3D gpio_bitop(bank, opGETBIT, gpio, NPCM_GP_N_ODSC);
> +               ds =3D val ? DSHI(flg) : DSLO(flg);
> +       }
> +       dev_dbg(bank->gc.parent, " pin %d strength %d =3D %d\n", pin, val=
, ds);

I got a warning here:


drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function =E2=80=98npcm_config=
_get=E2=80=99:
./include/linux/dynamic_debug.h:134:3: warning: =E2=80=98val=E2=80=99 may b=
e used
uninitialized in this function [-Wmaybe-uninitialized]
   __dynamic_dev_dbg(&descriptor, dev, fmt, \
   ^~~~~~~~~~~~~~~~~
drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1560:6: note: =E2=80=98val=E2=80=
=99 was declared here
  u32 val, ds =3D 0;
      ^~~

It might make sense to move the dev_dbg up into the if ().


> +       return ds;

In the case where DRIVE_STRENGTH_MASK is not supported, should you
instead return EINVAL like you do for the slew rate above?


> +}
> +
> +/* Set drive strength for a pin, if supported */
> +static int npcm_set_drive_strength(struct NPCM7xx_pinctrl *npcm,
> +                                  unsigned int pin, int nval)
> +{
> +       int v;
> +       struct NPCM_GPIO *bank =3D &npcm->gpio_bank[pin/GPIO_PER_BANK];
> +       int gpio =3D (pin % bank->gc.ngpio);
> +
> +       v =3D (pincfg[pin].flag & DRIVE_STRENGTH_MASK);
> +       if (!nval || !v)
> +               return 0;
> +       if (DSLO(v) =3D=3D nval) {
> +               dev_dbg(bank->gc.parent, " setting pin %d to low strength=
 "
> +                                        "[%d]\n", pin, nval);
> +               gpio_bitop(bank, opCLRBIT, gpio, NPCM_GP_N_ODSC);
> +               return 1;
> +       } else if (DSHI(v) =3D=3D nval) {
> +               dev_dbg(bank->gc.parent, " setting pin %d to high strengt=
h "
> +                                        "[%d]\n", pin, nval);
> +               gpio_bitop(bank, opSETBIT, gpio, NPCM_GP_N_ODSC);
> +               return 1;
> +       }
> +       return 0;
> +}
>

Cheers,

Joel
