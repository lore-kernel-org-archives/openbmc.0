Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcWLD4XnGzDvkS
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SzR1FnjJ"; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id p9so3617949vkd.1
 for <openbmc@lists.ozlabs.org>; Sun, 11 Dec 2016 21:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=O8g1+HBo5bXbCl9gF6x6+YhF+sYrGEsYgfkFFRv1WrM=;
 b=SzR1FnjJfE/qxaFQQABUNISV68arwEdUHTfX38gCre6fNzCAYTy/9DpZ1faBS1nebP
 hDC5NiQHuF6UKjKIejK7fpMKSYTLsNBUMgJ4v5Mgev97HIkD/8lm5hKmdZoJXuQ+BC68
 VeAuy/U8E76V4nUmjhQQWFlQzyJYDuTx9YTYkSnQxagHTYpMaRZQltLon+VCPNgWx/tH
 5TahSaOAfiU49hj7IMVMVYbajevk1psi+mvClt4qLz2XrDU3F6iynu8lVykftuloDr37
 943QQwEDyRg5S3/IbTUFNfsM+R9NTrjwL2upZek0NAIyA2U6Vnl433+CyzGN7aby0c1J
 00IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=O8g1+HBo5bXbCl9gF6x6+YhF+sYrGEsYgfkFFRv1WrM=;
 b=iu936cQSvzM4r3B9KWzrlLDEEaNt9eueA2sWvmQuoaVaYxsU7Yqno/Zh6f001u4/ue
 93MGzamnMkRBgJni/ee0wgCXtmkERaV253Y0h383vtcuAANwhBQhKkDLnF7YoDdssEMP
 EThQFOzXVgaDEoCXPp4xiYeNResjHlMLsJQFBTNE5bGk9P8VN6Z9MpjWyjqsxiCqzk8c
 eJIvgQpAZ9S7f8C3BxydXRIzrpAp9MbzrKZkSIV4OA4TYTXH7SllZlWllQyIEsNAHc/+
 RL9p8ppQy6Y4VnG5UraTY8et/mIHhDRznFXnAl1IZDqRujg5ekaP5K4UQLbe4ZxULOjJ
 /8VA==
X-Gm-Message-State: AKaTC02c9/UbYX/A+JunHrujuP6HwEfTq7tsjCr+IND3ubQIfTpINP08hP6YcGHKEW4AMnKXbswhGDV5yJcuUQ==
X-Received: by 10.31.168.7 with SMTP id r7mr34130865vke.148.1481519842025;
 Sun, 11 Dec 2016 21:17:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Sun, 11 Dec 2016 21:17:01 -0800 (PST)
In-Reply-To: <1481067363-3782-2-git-send-email-brendanhiggins@google.com>
References: <1481067363-3782-1-git-send-email-brendanhiggins@google.com>
 <1481067363-3782-2-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 16:17:01 +1100
X-Google-Sender-Auth: D-tEmqdlVAe35kGRHBAQGsrvigo
Message-ID: <CACPK8XcHHgNzh9MGyZpR2EmDC4kJZebLMXgTvqp2NmSp3VRLHg@mail.gmail.com>
Subject: Re: [RFC linux 1/2] spi: aspeed: added generic spi master for Aspeed
To: Brendan Higgins <brendanhiggins@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
X-List-Received-Date: Mon, 12 Dec 2016 05:17:25 -0000

Hi Brendan,

On Wed, Dec 7, 2016 at 10:36 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added initial generic spi master support to the Aspeed 25XX SoCs.

Can you expand on what you mean by "initial"?

I've got a few comments below. Once you've fixed them I suggest that
you send this directly upstream from here, ccing Cedric and myself.

>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/spi/Kconfig      |  12 +
>  drivers/spi/Makefile     |   1 +
>  drivers/spi/spi-aspeed.c | 582 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 595 insertions(+)
>  create mode 100644 drivers/spi/spi-aspeed.c
>
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 4b931ec..c9dcc71 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -59,6 +59,18 @@ config SPI_ALTERA
>         help
>           This is the driver for the Altera SPI Controller.
>
> +config SPI_ASPEED

This is currently taken by the SPI NOR driver. We may need to come up
with a different name.

> +       tristate "Aspeed AST24XX/AST25XX SPI controller driver"
> +       depends on ARCH_ASPEED

or COMPILE_TEST.

> +       help
> +         This enables support for the SPI controller on the Aspeed AST25XX SoCs
> +         as a generic SPI master.
> +
> +         The Aspeed AST25XX SoCs have three SPI controllers intended as SPI
> +         flash controllers; nevertheless, they are flexible enough to support
> +         the Linux SPI master framework and are physically capable of
> +         supporting some other SPI devices.

This is worth putting in the commit message too.

> +
>  config SPI_ATH79
>         tristate "Atheros AR71XX/AR724X/AR913X SPI controller driver"
>         depends on ATH79 && GPIOLIB
> diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> index 3c74d00..6b49aed 100644
> --- a/drivers/spi/Makefile
> +++ b/drivers/spi/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SPI_LOOPBACK_TEST)               += spi-loopback-test.o
>
>  # SPI master controller drivers (bus)
>  obj-$(CONFIG_SPI_ALTERA)               += spi-altera.o
> +obj-$(CONFIG_SPI_ASPEED)               += spi-aspeed.o
>  obj-$(CONFIG_SPI_ATMEL)                        += spi-atmel.o
>  obj-$(CONFIG_SPI_ATH79)                        += spi-ath79.o
>  obj-$(CONFIG_SPI_AU1550)               += spi-au1550.o
> diff --git a/drivers/spi/spi-aspeed.c b/drivers/spi/spi-aspeed.c
> new file mode 100644
> index 0000000..80c941a
> --- /dev/null
> +++ b/drivers/spi/spi-aspeed.c
> @@ -0,0 +1,582 @@

You must include a copyright header in each file.

> + * TODO: This is taken from drivers/mtd/spi-nor/aspeed-smc.c we should discuss
> + * sharing code between the two implementations. It appears that there is a
> + * spi_device implementation of a spi_nor device, so it probably makes sense to
> + * just move the entire non-dma implementation here.

I've added Cedric so you can discuss this.

The defines above could be shared as well.

> + *
> + * In user mode all data bytes read or written to the chip decode address
> + * range are transferred to or from the SPI bus. The range is treated as a
> + * fifo of arbitratry 1, 2, or 4 byte width but each write has to be aligned
> + * to its size.  The address within the multiple 8kB range is ignored when
> + * sending bytes to the SPI bus.

> +       if (divider > 16) {
> +               WARN_ONCE(true,
> +                         "device requested clock speed, %u, less than minimum clock speed, %u.\n",
> +                         requested_speed, base_speed / 16);
> +               divider = 16;
> +       }
> +
> +       if (divider % 2 == 0)
> +               return (16 - divider) / 2;
> +       else
> +               return 8 + (15 - divider) / 2;

I think these could be collapsed into the one line.

> +static int aspeed_spi_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_spi_master *aspeed_spi_master;
> +       struct spi_master *spi_master;
> +       struct aspeed_spi_bus *bus;
> +       struct resource *res;
> +       int irq, ret = 0;
> +
> +       spi_master = spi_alloc_master(&pdev->dev,
> +                                     sizeof(struct aspeed_spi_master));
> +       if (!spi_master)
> +               return -ENOMEM;
> +       aspeed_spi_master = spi_master_get_devdata(spi_master);
> +       platform_set_drvdata(pdev, spi_master);
> +
> +       aspeed_spi_master->dev = &pdev->dev;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "could not get register memory.\n");
> +               ret = -ENOMEM;
> +               goto err_out;
> +       }

The common pattern is to let the ioremap call error check for you.
Check out the documentation for devm_ioremap_resource in lib/devres.c.

> +       aspeed_spi_master->base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(aspeed_spi_master->base)) {
> +               dev_err(&pdev->dev, "could not ioremap register memory.\n");

Drop the dev_err.

> +               ret = PTR_ERR(aspeed_spi_master->base);
> +               goto err_out;
> +       }
> +

> +       spi_master->num_chipselect = ASPEED_SPI_BUS_NUM;
> +       /* TODO: Should also be able to support 2 bit transfers. */
> +       spi_master->mode_bits = SPI_MODE_0 | SPI_MODE_3 | SPI_LSB_FIRST;
> +       spi_master->bits_per_word_mask = SPI_BPW_MASK(8);
> +       /* TODO: This is just the clock speed of the AHB; should we make a fixed
> +        * frequency clock for the AHB and use that here?
> +        */

Yeah we should.

I have a driver for creating struct clks for all of our clocks that I
need to finish. For now we can create fixed-clocks in the device tree
and wire them up to the drivers.

> +       spi_master->max_speed_hz = 100000000;
> +       spi_master->min_speed_hz = spi_master->max_speed_hz / 16;
> +       spi_master->flags = SPI_MASTER_HALF_DUPLEX;
> +
> +       spi_master->max_transfer_size = aspeed_spi_max_transfer_size;
> +       spi_master->set_cs = aspeed_spi_set_cs;
> +       spi_master->transfer_one = aspeed_spi_transfer_one;
> +       spi_master->dev.of_node = pdev->dev.of_node;
> +
