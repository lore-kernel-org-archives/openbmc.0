Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HwI2wB+M"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpNLB5SkdzDrVv
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 13:37:22 +1000 (AEST)
Received: by mail-lf0-x243.google.com with SMTP id l196so593742lfl.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2017 20:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZvJd0yoNFX6VisP8gcT2i4FIlBdEWUkqNS19LXktIRI=;
 b=HwI2wB+MGxh3kWP49IEVEeDPczhdK0JnbOZxQXwzyVcZRYeWaxI8lv10NF/3AUFzUm
 FhkmIeqK59rsC5erhHJguRVWYjaXtWuRyiurr0ecMnTgWCFcLXSlYUF2XrVkSG3QNCiq
 dDXPqjimZV6wyXn9QGK81SIWQfYuueXwDrSBBjYHr4KqeNIC4Fi1LIuPWQYfDvKc6rPV
 wq7NmZZZFyXBB9cyC5hCHho+RiBdTdrr2l8Qmi/wp5jJnPz3QARkhQRrMJrKdHLwVteV
 SGtcY5a8b8AmMXJvVLYhxJUoAAAC2e6YD+ORsqmKgeCbpdoJfA0r+d96dDhznrxsvuIv
 Mjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZvJd0yoNFX6VisP8gcT2i4FIlBdEWUkqNS19LXktIRI=;
 b=bMsz1lwPV8xvsbESkNml++IZujkeO2Uw7HdYgw7HS8oKQ4jdh1HcxaXmOU8+R8OdJs
 AvaB/ECZg4Kv6LOTkwi4Ui+LhUua5g0yCwCkK0jxv0ZZHSVEVSJ11yN1uccVEh6Pb6z1
 L2ZyU9wT+iSea29JVEmjiXhuf8EFR29fanbJ1YoeC5HnaXAbwQClF1oykR/Ukda5amZE
 5Jsi3pE/a7pQ8jEDWgWi6R0UcdDMvKdDbhpw9oemHUDuwA+pF2lHnOa1xbeF7up50mwq
 DGO1pAIuAbRyk3uX49asVOxgLiEvHXBXFRQlePmRuwFeZpaUbYYexPavE52NXT89VzVM
 OvlA==
X-Gm-Message-State: AHPjjUjUPTtuZWKm+O8WBqqlXu+/sG7rsv0QxkcMocoSV7FHlwISha0Y
 T8PE97jLUOm2ePO2rN+Kf/UxzU3JeA==
X-Google-Smtp-Source: AOwi7QAJA4Xv3ROc23sC0GQWfMPq2QQ6FdfHtzV7F8RMS9ZHAMWQK5Gi7LAMgL80wLHb7BmpxGyvYupoRe+4ux4rnzo=
X-Received: by 10.46.88.22 with SMTP id m22mr385279ljb.138.1504841838283; Thu,
 07 Sep 2017 20:37:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Thu, 7 Sep 2017 20:36:57 -0700 (PDT)
In-Reply-To: <1504281966-6199-3-git-send-email-oleksandrs@mellanox.com>
References: <1504281966-6199-1-git-send-email-oleksandrs@mellanox.com>
 <1504281966-6199-3-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Sep 2017 13:06:57 +0930
X-Google-Sender-Auth: MRHARrM6WB_sqRNjUpVPHhlMXBc
Message-ID: <CACPK8XeV9aBY+avimjiOsKZgzj-C6MTeaR0tJC-Tu+zWiAoWPw@mail.gmail.com>
Subject: Re: [patch v7 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, jiri@resnulli.us, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 mec@shout.net, vadimp@maellanox.com, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 03:37:24 -0000

Hello Oleksandr,

On Sat, Sep 2, 2017 at 1:36 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.

Looks good. I have some small comments. The most important is the
compatible string.


> --- a/drivers/jtag/Kconfig
> +++ b/drivers/jtag/Kconfig
> @@ -14,3 +14,16 @@ menuconfig JTAG
>
>           To compile this driver as a module, choose M here: the module will
>           be called jtag.
> +
> +menuconfig JTAG_ASPEED
> +       tristate "Aspeed SoC JTAG controller support"
> +       depends on JTAG && HAS_IOMEM

You could add this if you want:

 depends ARCH_ASPEED || COMPILE_TEST

> +       ---help---
> +         This provides a support for Aspeed JTAG device, equipped on
> +         Aspeed SoC 24xx and 25xx families. Drivers allows programming
> +         of hardware devices, connected to SoC through the JTAG interface.
> +

> +
> +static char *end_status_str[] = {"idle", "ir pause", "drpause"};
> +
> +static u32 aspeed_jtag_read(struct aspeed_jtag *aspeed_jtag, u32 reg)
> +{
> +       return readl(aspeed_jtag->reg_base + reg);
> +}
> +
> +static void
> +aspeed_jtag_write(struct aspeed_jtag *aspeed_jtag, u32 val, u32 reg)
> +{
> +       writel(val, aspeed_jtag->reg_base + reg);
> +}
> +
> +static int aspeed_jtag_freq_set(struct jtag *jtag, __u32 freq)

What's the __u32 for (the __ part)?

> +{
> +       struct aspeed_jtag *aspeed_jtag = jtag_priv(jtag);
> +       unsigned long apb_frq;
> +       u32 tck_val;
> +       u16 div;
> +
> +       apb_frq = clk_get_rate(aspeed_jtag->pclk);
> +       div = (apb_frq % freq == 0) ? (apb_frq / freq) - 1 : (apb_frq / freq);
> +       tck_val = aspeed_jtag_read(aspeed_jtag, ASPEED_JTAG_TCK);
> +       aspeed_jtag_write(aspeed_jtag,
> +                         (tck_val & ASPEED_JTAG_TCK_DIVISOR_MASK) | div,
> +                         ASPEED_JTAG_TCK);
> +       return 0;
> +}

> +
> +static int aspeed_jtag_xfer(struct jtag *jtag, struct jtag_xfer *xfer)
> +{
> +       static const char sm_update_shiftir[] = {1, 1, 0, 0};
> +       static const char sm_update_shiftdr[] = {1, 0, 0};
> +       static const char sm_pause_idle[] = {1, 1, 0};
> +       static const char sm_pause_update[] = {1, 1};

Nit: I was confused by the char, perhaps u8?

> +int aspeed_jtag_init(struct platform_device *pdev,
> +                    struct aspeed_jtag *aspeed_jtag)
> +{
> +       struct resource *res;
> +       int err;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       aspeed_jtag->reg_base = devm_ioremap_resource(aspeed_jtag->dev, res);
> +       if (IS_ERR(aspeed_jtag->reg_base)) {
> +               err = -ENOMEM;
> +               goto out_region;

Can you just return here?

> +       }
> +
> +       aspeed_jtag->pclk = devm_clk_get(aspeed_jtag->dev, NULL);
> +       if (IS_ERR(aspeed_jtag->pclk)) {
> +               dev_err(aspeed_jtag->dev, "devm_clk_get failed\n");
> +               return PTR_ERR(aspeed_jtag->pclk);
> +       }
> +
> +       clk_prepare_enable(aspeed_jtag->pclk);
> +
> +       aspeed_jtag->irq = platform_get_irq(pdev, 0);
> +       if (aspeed_jtag->irq < 0) {
> +               dev_err(aspeed_jtag->dev, "no irq specified\n");
> +               err = -ENOENT;
> +               goto out_region;
> +       }
> +
> +       /* Enable clock */
> +       aspeed_jtag_write(aspeed_jtag, ASPEED_JTAG_CTL_ENG_EN |
> +                         ASPEED_JTAG_CTL_ENG_OUT_EN, ASPEED_JTAG_CTRL);
> +       aspeed_jtag_write(aspeed_jtag, ASPEED_JTAG_SW_MODE_EN |
> +                         ASPEED_JTAG_SW_MODE_TDIO, ASPEED_JTAG_SW);
> +
> +       err = devm_request_irq(aspeed_jtag->dev, aspeed_jtag->irq,
> +                              aspeed_jtag_interrupt, 0,
> +                              "aspeed-jtag", aspeed_jtag);
> +       if (err) {
> +               dev_err(aspeed_jtag->dev, "aspeed_jtag unable to get IRQ");
> +               goto out_region;
> +       }

Can we grab the IRQ before enabling the clock? If not, we should
disable the clock in the error path.


> +       dev_dbg(&pdev->dev, "aspeed_jtag:IRQ %d.\n", aspeed_jtag->irq);
> +
> +       aspeed_jtag_write(aspeed_jtag, ASPEED_JTAG_ISR_INST_PAUSE |
> +                         ASPEED_JTAG_ISR_INST_COMPLETE |
> +                         ASPEED_JTAG_ISR_DATA_PAUSE |
> +                         ASPEED_JTAG_ISR_DATA_COMPLETE |
> +                         ASPEED_JTAG_ISR_INST_PAUSE_EN |
> +                         ASPEED_JTAG_ISR_INST_COMPLETE_EN |
> +                         ASPEED_JTAG_ISR_DATA_PAUSE_EN |
> +                         ASPEED_JTAG_ISR_DATA_COMPLETE_EN,
> +                         ASPEED_JTAG_ISR);
> +
> +       aspeed_jtag->flag = 0;
> +       init_waitqueue_head(&aspeed_jtag->jtag_wq);
> +       return 0;
> +
> +out_region:
> +       release_mem_region(res->start, resource_size(res));

I don't think this is necessary.

> +       return err;
> +}
> +
> +int aspeed_jtag_deinit(struct platform_device *pdev,
> +                      struct aspeed_jtag *aspeed_jtag)
> +{
> +       aspeed_jtag_write(aspeed_jtag, 0, ASPEED_JTAG_ISR);
> +       devm_free_irq(aspeed_jtag->dev, aspeed_jtag->irq, aspeed_jtag);

The IRQ freeing happen automatically thanks to devm.

> +       /* Disabe clock */

Disable

> +       aspeed_jtag_write(aspeed_jtag, 0, ASPEED_JTAG_CTRL);
> +       clk_disable_unprepare(aspeed_jtag->pclk);
> +       return 0;
> +}
> +
> +static const struct jtag_ops aspeed_jtag_ops = {
> +       .freq_get = aspeed_jtag_freq_get,
> +       .freq_set = aspeed_jtag_freq_set,
> +       .status_get = aspeed_jtag_status_get,
> +       .idle = aspeed_jtag_idle,
> +       .xfer = aspeed_jtag_xfer
> +};
> +
> +static int aspeed_jtag_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_jtag *aspeed_jtag;
> +       struct jtag *jtag;
> +       int err;
> +
> +       if (!of_device_is_compatible(pdev->dev.of_node, "aspeed,aspeed-jtag"))
> +               return -ENOMEM;
> +
> +       jtag = jtag_alloc(sizeof(*aspeed_jtag), &aspeed_jtag_ops);
> +       if (!jtag)
> +               return -ENODEV;
> +
> +       platform_set_drvdata(pdev, jtag);
> +       aspeed_jtag = jtag_priv(jtag);
> +       aspeed_jtag->dev = &pdev->dev;
> +
> +       /* Initialize device*/
> +       err = aspeed_jtag_init(pdev, aspeed_jtag);
> +       if (err)
> +               goto err_jtag_init;
> +
> +       /* Initialize JTAG core structure*/
> +       err = jtag_register(jtag);
> +       if (err)
> +               goto err_jtag_register;
> +
> +       return 0;
> +
> +err_jtag_register:
> +       aspeed_jtag_deinit(pdev, aspeed_jtag);
> +err_jtag_init:
> +       jtag_free(jtag);
> +       return err;
> +}
> +
> +static int aspeed_jtag_remove(struct platform_device *pdev)
> +{
> +       struct jtag *jtag;
> +
> +       jtag = platform_get_drvdata(pdev);
> +       aspeed_jtag_deinit(pdev, jtag_priv(jtag));
> +       jtag_unregister(jtag);
> +       jtag_free(jtag);
> +       return 0;
> +}
> +
> +static const struct of_device_id aspeed_jtag_of_match[] = {
> +       { .compatible = "aspeed,aspeed2400-jtag", },
> +       { .compatible = "aspeed,aspeed2500-jtag", },

The convention is to use ast2500 for our compatible strings, so these should be:

 aspeed,ast2500-jtag
 aspeed,ast2400-jtag

Cheers,

Joel
