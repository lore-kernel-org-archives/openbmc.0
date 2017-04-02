Return-Path: <andy.shevchenko@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vwwX26yGmzDqGx
 for <openbmc@lists.ozlabs.org>; Sun,  2 Apr 2017 23:08:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sHTykrHk"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id r45so15794327qte.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Apr 2017 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=erELhUe1gvLcauaqx8ct1MvoTl7ZYf2Kt+qhe56JPxM=;
 b=sHTykrHk9j11iBaZeEOX3HcRzP0eiqJUh7d9/lZrWuvpWXQ5TwG5Mw4iQS6fz4lYfe
 zrJUQxe5Flzz3H84/uJMAShcf0gjaLrthzBhyBTh736J+IAffcM7cP5F5ZHnZtrY9e7L
 6BkVo8bxZsPyHNNQs0JjcW3bIpGTJgM0e9z+4MvTgIwMmjzD4ai/dfg3zhELgZ0p+ZQS
 N+0oH0OYqOTEIU7Czrnna4SjgOcRFIvwCQTgM/Z05tERtmAPWePZxuELkjOXqYDJEqxz
 0+5jo0bAVp4jkkDxNJNn/atdVubxKvj/PkBloGNDKj0Wz3JOVarS06j4rWt8AoCKiGMW
 hG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=erELhUe1gvLcauaqx8ct1MvoTl7ZYf2Kt+qhe56JPxM=;
 b=F5wWxI7uTJqmnQ42p0akzkzMzfni8x714kR6EwbEABnvBvaJRu/NxIe0+mDHpQMvCr
 7e0EpHzFOmr7YcYbBWtc7Hnj6dsrwwozHLkKGbBiOPh5+eaXRMCqRPCeg79RN7VpDQd8
 Yh+UbV2XmVVYZHKPjjSW++2LCifTWZCQkgS98xWX2hHe8O7o0F+rpVCsSLUjGclUYH3N
 b84RG6N+rwTsDeXvT7YfQklUZ0Lww9tWkjhTum4sobO+69JNgyK3CtwZqZ+DPH8krva8
 aT+uSnhuoQ+7TgKRCpA/QiL3c12ZoyWZIH0p5Axh5Hvn++QCJ17Boz8iXnrxYKS3KRdY
 K6CA==
X-Gm-Message-State: AFeK/H0cvoG2YCPffHweR/4wEP/k64Q4QrNMOMfL+rw28fxrSK+PaNls1Ps0u28OGEsbMnCoB/hEd7z+nlZdLQ==
X-Received: by 10.237.33.240 with SMTP id m45mr12490914qtc.246.1491138479805; 
 Sun, 02 Apr 2017 06:07:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.93 with HTTP; Sun, 2 Apr 2017 06:07:59 -0700 (PDT)
In-Reply-To: <20170328054458.29341-3-joel@jms.id.au>
References: <20170328054458.29341-1-joel@jms.id.au>
 <20170328054458.29341-3-joel@jms.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 2 Apr 2017 16:07:59 +0300
Message-ID: <CAHp75VfmbHrPFXO3UFmSciCnVuoB+5vFxy7iOnwVS5YBSPO3+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Sun, 02 Apr 2017 13:08:03 -0000

On Tue, Mar 28, 2017 at 8:44 AM, Joel Stanley <joel@jms.id.au> wrote:
> This change adds a driver for the 16550-based Aspeed virtual UART
> device. We use a similar process to the of_serial driver for device
> probe, but expose some VUART-specific functions through sysfs too.
>
> OpenPOWER host firmware doesn't like it when the host-side of the
> VUART's FIFO is not drained. This driver only disables host TX discard
> mode when the port is in use. We set the VUART enabled bit when we bind
> to the device, and clear it on unbind.
>
> We don't want to do this on open/release, as the host may be using this
> bit to configure serial output modes, which is independent of whether
> the devices has been opened by BMC userspace.

>  Documentation/devicetree/bindings/serial/8250.txt |   2 +
>  drivers/tty/serial/Kconfig                        |  10 +
>  drivers/tty/serial/Makefile                       |   1 +
>  drivers/tty/serial/aspeed-vuart.c                 | 335 ++++++++++++++++++++++

And why it's not under 8250 folder?

> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk.h>
> +
> +#include "8250/8250.h"
> +
> +#define AST_VUART_GCRA         0x20

> +#define AST_VUART_GCRA_VUART_EN                0x01
> +#define AST_VUART_GCRA_HOST_TX_DISCARD 0x20

BIT(x) ?

> +#define AST_VUART_GCRB         0x24

> +#define AST_VUART_GCRB_HOST_SIRQ_MASK  0xf0

GENMASK() ?

> +#define AST_VUART_GCRB_HOST_SIRQ_SHIFT 4
> +#define AST_VUART_ADDRL                0x28
> +#define AST_VUART_ADDRH                0x2c
> +
> +struct ast_vuart {

> +       struct platform_device *pdev;

Ususally there is no need to keep pointer to sturct platform_device,
rahter we need struct device *dev.

> +       void __iomem            *regs;
> +       struct clk              *clk;
> +       int                     line;
> +};
> +
> +static ssize_t ast_vuart_show_addr(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +       struct ast_vuart *vuart = dev_get_drvdata(dev);
> +       u16 addr;
> +

> +       addr = (readb(vuart->regs + AST_VUART_ADDRH) << 8) |
> +               (readb(vuart->regs + AST_VUART_ADDRL));

It looks like you have register shift 2 bits and byte accessors. We
have some helpers for that (serial_in() / serial_out() or alike).

> +
> +       return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
> +}
> +
> +static ssize_t ast_vuart_set_addr(struct device *dev,
> +               struct device_attribute *attr,
> +               const char *buf, size_t count)
> +{
> +       struct ast_vuart *vuart = dev_get_drvdata(dev);
> +       unsigned long val;
> +       int err;
> +
> +       err = kstrtoul(buf, 0, &val);
> +       if (err)
> +               return err;
> +

> +       writeb((val >> 8) & 0xff, vuart->regs + AST_VUART_ADDRH);
> +       writeb((val >> 0) & 0xff, vuart->regs + AST_VUART_ADDRL);

Useless & 0xff.

> +
> +       return count;
> +}

> +}
> +
> +

Extra empty line.

> +/**

If you are going to use kernel doc do it in accordance with howto.

> + * The device tree parsing code here is heavily based on that of the of_serial
> + * driver, but we have a few core differences, as we need to use our own
> + * ioremapping for extra register support
> + */

> +static int ast_vuart_probe(struct platform_device *pdev)
> +{
> +       struct uart_8250_port port;
> +       struct resource resource;
> +       struct ast_vuart *vuart;
> +       struct device_node *np;
> +       u32 clk, prop;
> +       int rc;
> +

> +       np = pdev->dev.of_node;

And if np == NULL?

> +
> +       vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
> +       if (!vuart)
> +               return -ENOMEM;
> +
> +       vuart->pdev = pdev;


> +       rc = of_address_to_resource(np, 0, &resource);
> +       if (rc) {
> +               dev_warn(&pdev->dev, "invalid address\n");
> +               return rc;
> +       }
> +
> +       /* create our own mapping for VUART-specific registers */
> +       vuart->regs = devm_ioremap_resource(&pdev->dev, &resource);
> +       if (IS_ERR(vuart->regs)) {
> +               dev_warn(&pdev->dev, "failed to map registers\n");
> +               return PTR_ERR(vuart->regs);
> +       }

Can you use platform_get-resource() + devm_ioremap_resource() ?
If no, why?

> +
> +       memset(&port, 0, sizeof(port));
> +       port.port.private_data = vuart;
> +       port.port.membase = vuart->regs;
> +       port.port.mapbase = resource.start;
> +       port.port.mapsize = resource_size(&resource);
> +       port.port.startup = ast_vuart_startup;
> +       port.port.shutdown = ast_vuart_shutdown;
> +
> +       if (of_property_read_u32(np, "clock-frequency", &clk)) {
> +               vuart->clk = devm_clk_get(&pdev->dev, NULL);
> +               if (IS_ERR(vuart->clk)) {
> +                       dev_warn(&pdev->dev,
> +                               "clk or clock-frequency not defined\n");
> +                       return PTR_ERR(vuart->clk);
> +               }
> +
> +               rc = clk_prepare_enable(vuart->clk);
> +               if (rc < 0)
> +                       return rc;
> +
> +               clk = clk_get_rate(vuart->clk);
> +       }
> +

> +       /* If current-speed was set, then try not to change it. */
> +       if (of_property_read_u32(np, "current-speed", &prop) == 0)
> +               port.port.custom_divisor = clk / (16 * prop);
> +
> +       /* Check for shifted address mapping */
> +       if (of_property_read_u32(np, "reg-offset", &prop) == 0)
> +               port.port.mapbase += prop;
> +
> +       /* Check for registers offset within the devices address range */
> +       if (of_property_read_u32(np, "reg-shift", &prop) == 0)
> +               port.port.regshift = prop;
> +
> +       /* Check for fifo size */
> +       if (of_property_read_u32(np, "fifo-size", &prop) == 0)
> +               port.port.fifosize = prop;

Perhaps you need other way around, check for error and supply a
default in such case.

> +
> +       /* Check for a fixed line number */
> +       rc = of_alias_get_id(np, "serial");
> +       if (rc >= 0)
> +               port.port.line = rc;
> +
> +       port.port.irq = irq_of_parse_and_map(np, 0);

> +       port.port.irqflags = IRQF_SHARED;

This is set by core. You already supplied correct flag for that below.

> +       port.port.iotype = UPIO_MEM;
> +       if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {

You hide an error code from of_property_read_u32() here. Why?

And if there is an error you are continuing with what? 0?

> +               switch (prop) {
> +               case 1:
> +                       port.port.iotype = UPIO_MEM;
> +                       break;
> +               case 4:
> +                       port.port.iotype = of_device_is_big_endian(np) ?
> +                                      UPIO_MEM32BE : UPIO_MEM32;
> +                       break;
> +               default:
> +                       dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
> +                                prop);
> +                       rc = -EINVAL;
> +                       goto err_clk_disable;
> +               }
> +       }
> +
> +       port.port.type = PORT_16550A;
> +       port.port.uartclk = clk;
> +       port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
> +               | UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
> +

> +       if (of_find_property(np, "no-loopback-test", NULL))
> +               port.port.flags |= UPF_SKIP_TEST;

You perhaps meant _read_bool() for sake of consistency.

> +
> +       port.port.dev = &pdev->dev;
> +
> +       if (port.port.fifosize)
> +               port.capabilities = UART_CAP_FIFO;
> +

> +       if (of_property_read_bool(pdev->dev.of_node,
> +                                 "auto-flow-control"))

One line?

> +               port.capabilities |= UART_CAP_AFE;
> +
> +       rc = serial8250_register_8250_port(&port);
> +       if (rc < 0)
> +               goto err_clk_disable;
> +
> +
> +       vuart->line = rc;
> +       ast_vuart_set_enabled(vuart, true);
> +       ast_vuart_set_host_tx_discard(vuart, true);
> +       platform_set_drvdata(pdev, vuart);
> +
> +       /* extra sysfs control */
> +       rc = device_create_file(&pdev->dev, &dev_attr_lpc_address);
> +       if (rc)
> +               dev_warn(&pdev->dev, "can't create lpc_address file\n");
> +       rc = device_create_file(&pdev->dev, &dev_attr_sirq);
> +       if (rc)
> +               dev_warn(&pdev->dev, "can't create sirq file\n");
> +
> +       return 0;
> +
> +err_clk_disable:
> +       if (vuart->clk)
> +               clk_disable_unprepare(vuart->clk);
> +
> +       irq_dispose_mapping(port.port.irq);
> +       return rc;
> +}
> +
> +static int ast_vuart_remove(struct platform_device *pdev)
> +{
> +       struct ast_vuart *vuart = platform_get_drvdata(pdev);
> +
> +       ast_vuart_set_enabled(vuart, false);
> +
> +       if (vuart->clk)
> +               clk_disable_unprepare(vuart->clk);
> +       return 0;
> +}

-- 
With Best Regards,
Andy Shevchenk
