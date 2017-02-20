Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRzzL50GhzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q/etsY0V"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id q127so2965320ywg.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=zNHnqKLXC7yq13/bcDvA1dvQMa1DkDgdLRjGKKEw2RM=;
 b=q/etsY0VrkegQLCaEv+cIncjXrm8xcOEtqTijHNq8+HCudNS8nGjzx21r/ycvcZEcN
 ksBRG+lpaOCt64FtRYJkAL7i4PDShYZr4DaWY/DPqc0lzXwLc1Unl24Zcn8RNTFXtKMM
 A/KRnfzn+3xTVUp2nGRiikVo+iEXjBfGGeDR1DLKgnWZT1jxPskrMw6McQT1dWOTX9/H
 UjCr1IF3f9F5wJTeEohvFVzkw11DW40VFzCZelk4WSl6YypNxfftwgnFeP3/YPJXLnwm
 KsPTepdBF/AxNKIR7lVOVXx/WSoTO5KAxMN5cP657JdvyEvYG17I22674YMTB427CGBJ
 bcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=zNHnqKLXC7yq13/bcDvA1dvQMa1DkDgdLRjGKKEw2RM=;
 b=TF6pa0TtFUbK2iTwHhTq4nxBp3efFVARf7j6lowfTZrEnMZ7roQX+606WD9hJ9Zrv5
 2RE7rhNqW4KMBAthOu7MTWICklPXbYb2oHGs3h6EvCCj7aFF0Y59m4Irf68PH23sNRtT
 +01FKH+SQkN4Rd7yNo9DwOIXPWlpGzNSdOffOq49x24fXgzn5COkEO9F3mB+21tH8iSY
 FS7SCnwxNT+sxy1jcW09cWPFNF0v52pifJxMIkMWqsVkMb/w1p75ZPP/MT2XEXkW+tTp
 YJDMYJ1V1xY2KL+N1njScShjv95ToCdrKS7tSiBUt1HUfqhmqAQ55iQSR4ZkoZ8HGAlJ
 EY7Q==
X-Gm-Message-State: AMke39mnQXDyxaZHNrgOQzdW9tIzLWY0tyYlrnOAStWxccOjX04MhTru6qzsXe61nCge6QKYNQi33QrAfb+kRQ==
X-Received: by 10.13.202.69 with SMTP id m66mr6245333ywd.11.1487632603755;
 Mon, 20 Feb 2017 15:16:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:16:22 -0800 (PST)
In-Reply-To: <20170220152300.3422-1-andrew@aj.id.au>
References: <20170220152300.3422-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 09:46:22 +1030
X-Google-Sender-Auth: emMVG66NJWHzRwSekDglrRAQKVo
Message-ID: <CACPK8XdkKSWcDzMCpYnwxNKgXRnwRTEW9p0m=rsdb=euy0idcg@mail.gmail.com>
Subject: Re: [PATCH v2] ipmi: bt-bmc: Use a regmap for register access
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Corey Minyard <minyard@acm.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 openipmi-developer@lists.sourceforge.net, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 20 Feb 2017 23:16:47 -0000

On Tue, Feb 21, 2017 at 1:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The registers for the bt-bmc device live under the Aspeed LPC
> controller. Devicetree bindings have recently been introduced for the
> LPC controller where the "host" portion of the LPC register space is
> described as a syscon device. Future devicetrees describing the bt-bmc
> device should nest its node under the appropriate "simple-mfd", "syscon"
> compatible node.
>
> This change allows the bt-bmc driver to function with both syscon and
> non-syscon- based devicetree descriptions by always using a regmap for
> register access, either retrieved from the parent syscon device or
> instantiated if none exists.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel

> ---
>
> v2: Address Joel's review with some minor cleanups
>
> * Add '|| COMPILE_TEST' to Kconfig depends
> * Const-ify the regmap configuration struct
> * Remove some redundant output from the WARN formatting
>
> Propagating regmap_{read,write}() failures makes the change more invasive=
 than
> I would like, so I have favoured keeping the WARN()s
>
>  drivers/char/ipmi/Kconfig  |  3 +-
>  drivers/char/ipmi/bt-bmc.c | 80 ++++++++++++++++++++++++++++++++++------=
------
>  2 files changed, 61 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 7f816655cbbf..90f3edffb067 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -78,7 +78,8 @@ config IPMI_POWEROFF
>  endif # IPMI_HANDLER
>
>  config ASPEED_BT_IPMI_BMC
> -       depends on ARCH_ASPEED
> +       depends on ARCH_ASPEED || COMPILE_TEST
> +       depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
>         tristate "BT IPMI bmc driver"
>         help
>           Provides a driver for the BT (Block Transfer) IPMI interface
> diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> index fc9e8891eae3..d6f5d9eb102d 100644
> --- a/drivers/char/ipmi/bt-bmc.c
> +++ b/drivers/char/ipmi/bt-bmc.c
> @@ -12,10 +12,13 @@
>  #include <linux/errno.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/poll.h>
> +#include <linux/regmap.h>
>  #include <linux/sched.h>
>  #include <linux/timer.h>
>
> @@ -60,7 +63,8 @@
>  struct bt_bmc {
>         struct device           dev;
>         struct miscdevice       miscdev;
> -       void __iomem            *base;
> +       struct regmap           *map;
> +       int                     offset;
>         int                     irq;
>         wait_queue_head_t       queue;
>         struct timer_list       poll_timer;
> @@ -69,14 +73,29 @@ struct bt_bmc {
>
>  static atomic_t open_count =3D ATOMIC_INIT(0);
>
> +static const struct regmap_config bt_regmap_cfg =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +};
> +
>  static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
>  {
> -       return ioread8(bt_bmc->base + reg);
> +       uint32_t val =3D 0;
> +       int rc;
> +
> +       rc =3D regmap_read(bt_bmc->map, bt_bmc->offset + reg, &val);
> +       WARN(rc !=3D 0, "regmap_read() failed: %d\n", rc);
> +
> +       return rc =3D=3D 0 ? (u8) val : 0;
>  }
>
>  static void bt_outb(struct bt_bmc *bt_bmc, u8 data, int reg)
>  {
> -       iowrite8(data, bt_bmc->base + reg);
> +       int rc;
> +
> +       rc =3D regmap_write(bt_bmc->map, bt_bmc->offset + reg, data);
> +       WARN(rc !=3D 0, "regmap_write() failed: %d\n", rc);
>  }
>
>  static void clr_rd_ptr(struct bt_bmc *bt_bmc)
> @@ -367,14 +386,18 @@ static irqreturn_t bt_bmc_irq(int irq, void *arg)
>  {
>         struct bt_bmc *bt_bmc =3D arg;
>         u32 reg;
> +       int rc;
> +
> +       rc =3D regmap_read(bt_bmc->map, bt_bmc->offset + BT_CR2, &reg);
> +       if (rc)
> +               return IRQ_NONE;
>
> -       reg =3D ioread32(bt_bmc->base + BT_CR2);
>         reg &=3D BT_CR2_IRQ_H2B | BT_CR2_IRQ_HBUSY;
>         if (!reg)
>                 return IRQ_NONE;
>
>         /* ack pending IRQs */
> -       iowrite32(reg, bt_bmc->base + BT_CR2);
> +       regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR2, reg);
>
>         wake_up(&bt_bmc->queue);
>         return IRQ_HANDLED;
> @@ -384,7 +407,6 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>                              struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       u32 reg;
>         int rc;
>
>         bt_bmc->irq =3D platform_get_irq(pdev, 0);
> @@ -405,18 +427,17 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bmc,
>          * will be cleared (along with B2H) when we can write the next
>          * message to the BT buffer
>          */
> -       reg =3D ioread32(bt_bmc->base + BT_CR1);
> -       reg |=3D BT_CR1_IRQ_H2B | BT_CR1_IRQ_HBUSY;
> -       iowrite32(reg, bt_bmc->base + BT_CR1);
> +       rc =3D regmap_update_bits(bt_bmc->map, bt_bmc->offset + BT_CR1,
> +                               (BT_CR1_IRQ_H2B | BT_CR1_IRQ_HBUSY),
> +                               (BT_CR1_IRQ_H2B | BT_CR1_IRQ_HBUSY));
>
> -       return 0;
> +       return rc;
>  }
>
>  static int bt_bmc_probe(struct platform_device *pdev)
>  {
>         struct bt_bmc *bt_bmc;
>         struct device *dev;
> -       struct resource *res;
>         int rc;
>
>         if (!pdev || !pdev->dev.of_node)
> @@ -431,10 +452,27 @@ static int bt_bmc_probe(struct platform_device *pde=
v)
>
>         dev_set_drvdata(&pdev->dev, bt_bmc);
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       bt_bmc->base =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(bt_bmc->base))
> -               return PTR_ERR(bt_bmc->base);
> +       bt_bmc->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> +       if (IS_ERR(bt_bmc->map)) {
> +               struct resource *res;
> +               void __iomem *base;
> +
> +               /*
> +                * Assume it's not the MFD-based devicetree description, =
in
> +                * which case generate a regmap ourselves
> +                */
> +               res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
> +
> +               bt_bmc->map =3D devm_regmap_init_mmio(dev, base, &bt_regm=
ap_cfg);
> +               bt_bmc->offset =3D 0;
> +       } else {
> +               rc =3D of_property_read_u32(dev->of_node, "reg", &bt_bmc-=
>offset);
> +               if (rc)
> +                       return rc;
> +       }
>
>         mutex_init(&bt_bmc->mutex);
>         init_waitqueue_head(&bt_bmc->queue);
> @@ -461,12 +499,12 @@ static int bt_bmc_probe(struct platform_device *pde=
v)
>                 add_timer(&bt_bmc->poll_timer);
>         }
>
> -       iowrite32((BT_IO_BASE << BT_CR0_IO_BASE) |
> -                 (BT_IRQ << BT_CR0_IRQ) |
> -                 BT_CR0_EN_CLR_SLV_RDP |
> -                 BT_CR0_EN_CLR_SLV_WRP |
> -                 BT_CR0_ENABLE_IBT,
> -                 bt_bmc->base + BT_CR0);
> +       regmap_write(bt_bmc->map, bt_bmc->offset + BT_CR0,
> +                    (BT_IO_BASE << BT_CR0_IO_BASE) |
> +                    (BT_IRQ << BT_CR0_IRQ) |
> +                    BT_CR0_EN_CLR_SLV_RDP |
> +                    BT_CR0_EN_CLR_SLV_WRP |
> +                    BT_CR0_ENABLE_IBT);
>
>         clr_b_busy(bt_bmc);
>
> --
> 2.9.3
>
