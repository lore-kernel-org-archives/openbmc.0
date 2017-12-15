Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RY3dKi3D"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyXzb3jkzzDq66
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 12:34:50 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id u127so4699866lff.5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 17:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7QJ8nLxL+Gv1swUx+O6TFcjv3hCm9EON0ntZfG3iuxo=;
 b=RY3dKi3D8ZzTgifk6Msj2ECHD64DLxMTUSILZZTyfZzPX87caQNWT/vacdcvqTfP39
 3LRcrZHbP29NEGjU7CyORPRoqbwdrwvt3EcznrdLRYcqKQU4aqndqL8F+B0KZvO/FY0s
 o9IHo0rZT2/Y3kxuYImdwwk+kl7+XVFF0vm+/+ApXmTv4vNPECQvtJfARbPFTUx9k4vK
 deBPlATgoyDuq5k4Aj3b+BjSYFSeNRTbH86LVwFPU7jk2YkPRkKKdNXdUOwZPzmO5U+Z
 zFerxsCJ122oYKOIMFE64SlVt3E2j8OUuMA0VbnS6h2qtgj0lxn/OwVfV1TiJ4gTvqSW
 N/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7QJ8nLxL+Gv1swUx+O6TFcjv3hCm9EON0ntZfG3iuxo=;
 b=tYzgaA9zhLv79OK+sNK0MXDQfpV8OuXu8b7/neRc5C5XOqQ1D/b9VLyDa1HDfN+tQs
 4nlaeDvTFyattlbxjgLaYcyD23I6l/tMbVXQ5Vubbq9r5GCqEmQu8xe4WRlaOZK+QMt0
 hmxVvmLbLgDber8WRf1Fz9EHxe7JdoRXI6h4g5KLpLfr8LUOu2fgOlh6nJJOPAHf/QYs
 /otv4ybrFVj1x4pUumhb8E0d8309nye+mt+BQPtebzFkYKH2Yd/ISd2e9Q1/lMikwGsn
 JH/wYsUTWeoHg30RMD+AwDrDf2JUGzfVwDrVzzlpjcqGELhiU8z6gQHwmr/BmmMxCjN5
 83Xw==
X-Gm-Message-State: AKGB3mI0kwSPr2jCNRRJIRibwpz03jWLgfDBeRu+vHVg0ghBeUPNqVCn
 R1qtEMGhqCagaLnKpKFBzJDaATp9lj8TwEGA3lY=
X-Google-Smtp-Source: ACJfBouV57E3nQbdTdJCW41I/QpethzEYMLSCg8Gxvl8yUlWr+jdEsRzDZtdxoxYwmKvxLfiZLOtqLOS+3LBF09UKr8=
X-Received: by 10.46.32.230 with SMTP id g99mr5093560lji.147.1513301687166;
 Thu, 14 Dec 2017 17:34:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 14 Dec 2017 17:34:26 -0800 (PST)
In-Reply-To: <1513268971-13518-3-git-send-email-oleksandrs@mellanox.com>
References: <1513268971-13518-1-git-send-email-oleksandrs@mellanox.com>
 <1513268971-13518-3-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Dec 2017 12:04:26 +1030
X-Google-Sender-Auth: JExSN6WpQ7llinFy6hw1q-9nih4
Message-ID: <CACPK8XdXuqi6Xi+6v==SgpQX7xndeGZ+CGfWr9UF7ppv9zbfAQ@mail.gmail.com>
Subject: Re: [patch v14 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org, 
 Vadim Pasternak <vadimp@mellanox.com>, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 01:34:52 -0000

On Fri, Dec 15, 2017 at 2:59 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Driver adds support of Aspeed 2500/2400 series SOC JTAG master controller.

Looks good. I have a few small things below, but I am happy to see
this merged from my point of view as ASPEED maintainer.

Cheers,

Joel


> +
> +menuconfig JTAG_ASPEED
> +       tristate "Aspeed SoC JTAG controller support"
> +       depends on JTAG && HAS_IOMEM

Add ARCH_ASPEED || COMPILE_TEST

> +       ---help---
> +         This provides a support for Aspeed JTAG device, equipped on
> +         Aspeed SoC 24xx and 25xx families. Drivers allows programming
> +         of hardware devices, connected to SoC through the JTAG interface.
> +
> +         If you want this support, you should say Y here.
> +
> +         To compile this driver as a module, choose M here: the module will
> +         be called jtag-aspeed.
> diff --git a/drivers/jtag/Makefile b/drivers/jtag/Makefile
> index af37493..04a855e 100644
> --- a/drivers/jtag/Makefile
> +++ b/drivers/jtag/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_JTAG)             += jtag.o
> +obj-$(CONFIG_JTAG_ASPEED)      += jtag-aspeed.o
> diff --git a/drivers/jtag/jtag-aspeed.c b/drivers/jtag/jtag-aspeed.c
> new file mode 100644
> index 0000000..99277d2
> --- /dev/null
> +++ b/drivers/jtag/jtag-aspeed.c
> @@ -0,0 +1,783 @@


> +static int aspeed_jtag_xfer(struct jtag *jtag, struct jtag_xfer *xfer,
> +                           u8 *xfer_data)
> +{
> +       static const u8 sm_update_shiftir[] = {1, 1, 0, 0};
> +       static const u8 sm_update_shiftdr[] = {1, 0, 0};
> +       static const u8 sm_pause_idle[] = {1, 1, 0};
> +       static const u8 sm_pause_update[] = {1, 1};
> +       struct aspeed_jtag *aspeed_jtag = jtag_priv(jtag);
> +       unsigned long *data = (unsigned long *)xfer_data;
> +       unsigned long remain_xfer = xfer->length;
> +       unsigned long offset;
> +       char dbg_str[256];
> +       int pos = 0;
> +       int i;
> +
> +       for (offset = 0, i = 0; offset < xfer->length;
> +                       offset += ASPEED_JTAG_DATA_CHUNK_SIZE, i++) {

It looks like offset is unused.

> +               pos += snprintf(&dbg_str[pos], sizeof(dbg_str) - pos,
> +                               "0x%08lx ", data[i]);
> +       }
> +
> +       dev_dbg(aspeed_jtag->dev, "aspeed_jtag %s %s xfer, mode:%s, END:%d, len:%lu, TDI[%s]\n",
> +               xfer->type == JTAG_SIR_XFER ? "SIR" : "SDR",
> +               xfer->direction == JTAG_READ_XFER ? "READ" : "WRITE",
> +               aspeed_jtag->mode & JTAG_XFER_HW_MODE ? "HW" : "SW",
> +               xfer->endstate, remain_xfer, dbg_str);
> +
> +       if (!(aspeed_jtag->mode & JTAG_XFER_HW_MODE)) {
> +               /* SW mode */
> +               aspeed_jtag_write(aspeed_jtag, ASPEED_JTAG_SW_MODE_EN |
> +                                 ASPEED_JTAG_SW_MODE_TDIO, ASPEED_JTAG_SW);
> +
> +               if (aspeed_jtag->status != JTAG_STATE_IDLE) {
> +                       /*IR/DR Pause->Exit2 IR / DR->Update IR /DR */
> +                       aspeed_jtag_sm_cycle(aspeed_jtag, sm_pause_update,
> +                                            sizeof(sm_pause_update));
> +               }
> +
> +               if (xfer->type == JTAG_SIR_XFER)
> +                       /* ->IRSCan->CapIR->ShiftIR */
> +                       aspeed_jtag_sm_cycle(aspeed_jtag, sm_update_shiftir,
> +                                            sizeof(sm_update_shiftir));
> +               else
> +                       /* ->DRScan->DRCap->DRShift */
> +                       aspeed_jtag_sm_cycle(aspeed_jtag, sm_update_shiftdr,
> +                                            sizeof(sm_update_shiftdr));
> +
> +               aspeed_jtag_xfer_sw(aspeed_jtag, xfer, data);
> +
> +               /* DIPause/DRPause */
> +               aspeed_jtag_tck_cycle(aspeed_jtag, 0, 0);
> +
> +               if (xfer->endstate == JTAG_STATE_IDLE) {
> +                       /* ->DRExit2->DRUpdate->IDLE */
> +                       aspeed_jtag_sm_cycle(aspeed_jtag, sm_pause_idle,
> +                                            sizeof(sm_pause_idle));
> +               }
> +       } else {
> +               /* hw mode */
> +               aspeed_jtag_write(aspeed_jtag, 0, ASPEED_JTAG_SW);
> +               aspeed_jtag_xfer_hw(aspeed_jtag, xfer, data);
> +       }
> +
> +       aspeed_jtag_write(aspeed_jtag, ASPEED_JTAG_SW_MODE_EN |
> +                         ASPEED_JTAG_SW_MODE_TDIO, ASPEED_JTAG_SW);
> +       aspeed_jtag->status = xfer->endstate;
> +       return 0;
> +}
>
> +
> +static irqreturn_t aspeed_jtag_interrupt(s32 this_irq, void *dev_id)
> +{
> +       struct aspeed_jtag *aspeed_jtag = dev_id;
> +       irqreturn_t ret;
> +       u32 status;
> +
> +       status = aspeed_jtag_read(aspeed_jtag, ASPEED_JTAG_ISR);
> +       dev_dbg(aspeed_jtag->dev, "status %x\n", status);
> +
> +       if (status & ASPEED_JTAG_ISR_INT_MASK) {
> +               aspeed_jtag_write(aspeed_jtag,
> +                                 (status & ASPEED_JTAG_ISR_INT_MASK)
> +                                 | (status & ASPEED_JTAG_ISR_INT_EN_MASK),
> +                                 ASPEED_JTAG_ISR);
> +               aspeed_jtag->flag |= status & ASPEED_JTAG_ISR_INT_MASK;
> +       }
> +
> +       if (aspeed_jtag->flag) {
> +               wake_up_interruptible(&aspeed_jtag->jtag_wq);
> +               ret = IRQ_HANDLED;
> +       } else {
> +               dev_err(aspeed_jtag->dev, "aspeed_jtag irq status:%x\n",

using dev_err will give you sensible prefixes for any messages that
print out. You could remove "aspeed_jtag" from this any any other
prints you have.

> +                       status);
> +               ret = IRQ_NONE;
> +       }
> +       return ret;
> +}
> +
> +int aspeed_jtag_init(struct platform_device *pdev,
> +                    struct aspeed_jtag *aspeed_jtag)
> +{
> +       struct resource *res;
> +       int err;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       aspeed_jtag->reg_base = devm_ioremap_resource(aspeed_jtag->dev, res);
> +       if (IS_ERR(aspeed_jtag->reg_base))
> +               return -ENOMEM;
> +
> +       aspeed_jtag->pclk = devm_clk_get(aspeed_jtag->dev, NULL);
> +       if (IS_ERR(aspeed_jtag->pclk)) {
> +               dev_err(aspeed_jtag->dev, "devm_clk_get failed\n");
> +               return PTR_ERR(aspeed_jtag->pclk);
> +       }
> +
> +       clk_prepare_enable(aspeed_jtag->pclk);

Can you move this below the platform_get_irq? that way you can return
an error if the getting the IRQ fails, without having to clean up the
clock.

> +
> +       aspeed_jtag->irq = platform_get_irq(pdev, 0);
> +       if (aspeed_jtag->irq < 0) {
> +               dev_err(aspeed_jtag->dev, "no irq specified\n");
> +               err = -ENOENT;
> +               goto clk_unprep;
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
> +               goto clk_unprep;
> +       }
> +       dev_dbg(&pdev->dev, "aspeed_jtag:IRQ %d.\n", aspeed_jtag->irq);

Again, remove the aspeed_jtag prefix.

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
> +       aspeed_jtag->mode = 0;
> +       init_waitqueue_head(&aspeed_jtag->jtag_wq);
> +       return 0;
> +
> +clk_unprep:
> +       clk_disable_unprepare(aspeed_jtag->pclk);
> +       return err;
> +}
> +
> +int aspeed_jtag_deinit(struct platform_device *pdev,
> +                      struct aspeed_jtag *aspeed_jtag)
> +{
> +       aspeed_jtag_write(aspeed_jtag, 0, ASPEED_JTAG_ISR);
> +       /* Disable clock */
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
> +       .xfer = aspeed_jtag_xfer,
> +       .mode_set = aspeed_jtag_mode_set
> +};
> +
> +static int aspeed_jtag_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_jtag *aspeed_jtag;
> +       struct device *dev;
> +       struct jtag *jtag;
> +       int err;
> +
> +       dev = &pdev->dev;
> +       if (!of_device_is_compatible(pdev->dev.of_node,
> +                                    "aspeed,ast2500-jtag") &&
> +           !of_device_is_compatible(pdev->dev.of_node,
> +                                    "aspeed,ast2400-jtag"))
> +               return -ENODEV;

Given the Aspeed device only ever probes with device tree,  can you
drop these redundant checks?

> +
> +       jtag = jtag_alloc(sizeof(*aspeed_jtag), &aspeed_jtag_ops);
> +       if (!jtag)
> +               return -ENOMEM;
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
> +       { .compatible = "aspeed,ast2400-jtag", },
> +       { .compatible = "aspeed,ast2500-jtag", },
> +       {}
> +};
> +
> +static struct platform_driver aspeed_jtag_driver = {
> +       .probe = aspeed_jtag_probe,
> +       .remove = aspeed_jtag_remove,
> +       .driver = {
> +               .name = ASPEED_JTAG_NAME,
> +               .of_match_table = aspeed_jtag_of_match,
> +       },
> +};
> +module_platform_driver(aspeed_jtag_driver);
> +
> +MODULE_AUTHOR("Oleksandr Shamray <oleksandrs@mellanox.com>");
> +MODULE_DESCRIPTION("ASPEED JTAG driver");
> +MODULE_LICENSE("GPL v2");
> --
> 1.7.1
>
