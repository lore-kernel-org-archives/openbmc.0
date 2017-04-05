Return-Path: <andy.shevchenko@gmail.com>
Received: from mail-qt0-x22c.google.com (mail-qt0-x22c.google.com
 [IPv6:2607:f8b0:400d:c0d::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyjQR1bNbzDqGv
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 20:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XpQhqv4D"; 
 dkim-atps=neutral
Received: by mail-qt0-x22c.google.com with SMTP id n21so6852339qta.1
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 03:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=a4hcjGQEG5A1HH+tgYDIXNxO7iNJRayhRJX8JmZHG70=;
 b=XpQhqv4DJd13dU19pFhtuR+1/HZzHXuFbnhBv9aPTscYKB0PD7OfmyZT1HNfBEnEzH
 72xrcdLde72IJO83tVJ+P6hvAou11/5146dYxY4ZtKTR6HLh/h56SyBzrvFOKR5T7CbV
 0VY2Xc/IUnM2Wv2Q1wcKdzlJPSggeZ8O3lUIUSiQECShxMSbzuWFaHzRT3Ksuad4LgRf
 ICa7Y2ahyOi8T8VCBOK/I3xpus2Fgq/kFBKOq7R33sr74oocyt5NyBAUS5tl/TgztbIO
 D1Z6CrYRfMDyaF5THHs3li/3PqnaNvv9AutX8WQrG3/+8G4IiLQhnWoaQtYcZXj/YFyV
 1iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=a4hcjGQEG5A1HH+tgYDIXNxO7iNJRayhRJX8JmZHG70=;
 b=R8FCTQzoGOfTh53Z14+SO5kW4PxhAiou9QxbV3Prcyh/e3DkY19TNQHIOWsThT1/MM
 oIlsiu0cONPxpGSL3JbhMLOam1vGRWdVa2VffQtRQFxzqq7KR8a1P7DJE1NHKoDNdyi5
 46FFEx3N4574Hqrz3p34LNeW5fjuSAetTrRkJsa5vVC4QU72cgjwwW5EnaW6fnNF02hF
 zj3Z57dGouWrptgdeA5jt66lKPvPnfBmTYO+LyO+H5zke9AQV8976fv950LqakMspl4a
 X+e+6QWwgRN1XXaw3Txoocm4QlYlomRHMwP05mWjmUtcPfMFXw7rIlBIGMv3LV+1IF3y
 pEFw==
X-Gm-Message-State: AFeK/H3kSdyqzvfNLubYHjZlWthbAP2BviJN4frel0MptW/sJOIFyNIpjrmomPg/mW8qlMMNhdlyn69brljQDQ==
X-Received: by 10.200.42.151 with SMTP id b23mr27288406qta.163.1491389660678; 
 Wed, 05 Apr 2017 03:54:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.153.93 with HTTP; Wed, 5 Apr 2017 03:54:20 -0700 (PDT)
In-Reply-To: <20170405040352.5661-3-joel@jms.id.au>
References: <20170405040352.5661-1-joel@jms.id.au>
 <20170405040352.5661-3-joel@jms.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Apr 2017 13:54:20 +0300
Message-ID: <CAHp75VckYiBccVN+_K+Tm38kcdC10=sekQZg7Uz_HwS4xyW2UA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Joel Stanley <joel@jms.id.au>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 05 Apr 2017 10:54:24 -0000

On Wed, Apr 5, 2017 at 7:03 AM, Joel Stanley <joel@jms.id.au> wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>
> This change adds a driver for the 16550-based Aspeed virtual UART
> device. We use a similar process to the of_serial driver for device
> probe, but expose some VUART-specific functions through sysfs too.

I would go with vUART abbreviation, but it's up to you.

>
> The VUART is two UART 'front ends' connected by their FIFO (no actual
> serial line in between). One is on the BMC side (management controller)
> and one is on the host CPU side.
>
> This driver is for the BMC side. The sysfs files allow the BMC
> userspace, which owns the system configuration policy, to specify at
> what IO port and interrupt number the host side will appear to the host
> on the Host <-> BMC LPC bus. It could be different on a different system
> (though most of them use 3f8/4).
>
> OpenPOWER host firmware doesn't like it when the host-side of the
> VUART's FIFO is not drained. This driver only disables host TX discard
> mode when the port is in use. We set the VUART enabled bit when we bind
> to the device, and clear it on unbind.
>
> We don't want to do this on open/release, as the host may be using this
> bit to configure serial output modes, which is independent of whether
> the devices has been opened by BMC userspace.

>  - Move to 8250 directory
>  - Rename ast -> aspeed to match other Aspeed drivers

>  drivers/tty/serial/8250/aspeed-vuart.c             | 341 +++++++++++++++++++++

There is a pattern 8250_x[_y].c
So, I would go with 8250_aspeed_virt.c or 8250_aspeed_vuart.c or alike.

> +config SERIAL_8250_ASPEED_VUART
> +       tristate "Aspeed Virtual UART"
> +       depends on SERIAL_8250
> +       depends on OF

> + *  2 of the License, or (at your option) any later version.

> + *

Redundant line.

> + */
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk.h>

> +static void aspeed_vuart_set_host_tx_discard(struct aspeed_vuart *vuart,
> +                                            bool discard)
> +{
> +       u8 reg;
> +
> +       reg = readb(vuart->regs + ASPEED_VUART_GCRA);
> +

> +       /* if the HOST_TX_DISCARD bit is set, discard is *disabled* */

Perhaps "disabled" for better readability?

> +       reg &= ~ASPEED_VUART_GCRA_HOST_TX_DISCARD;
> +       if (!discard)
> +               reg |= ASPEED_VUART_GCRA_HOST_TX_DISCARD;
> +
> +       writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
> +}

> +static int aspeed_vuart_probe(struct platform_device *pdev)
> +{
> +       struct uart_8250_port port;

> +       struct resource *res;
> +       struct aspeed_vuart *vuart;
> +       struct device_node *np;

Longest line upper.

> +       u32 clk, prop;
> +       int rc;
> +
> +       np = pdev->dev.of_node;
> +
> +       vuart = devm_kzalloc(&pdev->dev, sizeof(*vuart), GFP_KERNEL);
> +       if (!vuart)
> +               return -ENOMEM;
> +
> +       vuart->dev = &pdev->dev;
> +

> +       /* The 8510 core creates the mapping, which we grab a reference to
> +        * for VUART-specific registers */

/*
 * Multi-line comments.
 * Look like this.
 */

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       vuart->regs = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(vuart->regs))
> +               return PTR_ERR(vuart->regs);
> +
> +       memset(&port, 0, sizeof(port));
> +       port.port.private_data = vuart;
> +       port.port.membase = vuart->regs;
> +       port.port.mapbase = res->start;
> +       port.port.mapsize = resource_size(res);
> +       port.port.startup = aspeed_vuart_startup;
> +       port.port.shutdown = aspeed_vuart_shutdown;
> +       port.port.dev = &pdev->dev;
> +
> +       rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
> +       if (rc < 0)
> +               return rc;
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
> +
> +       /* Check for a fixed line number */
> +       rc = of_alias_get_id(np, "serial");
> +       if (rc >= 0)
> +               port.port.line = rc;
> +

> +       port.port.irq = irq_of_parse_and_map(np, 0);

Isn't better to get this via platform_get_irq() ?

> +       port.port.irqflags = IRQF_SHARED;
> +       port.port.iotype = UPIO_MEM;

> +       if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {

I would still go with usual pattern.

> +               switch (prop) {
> +               case 1:
> +                       port.port.iotype = UPIO_MEM;
> +                       break;
> +               case 4:

> +                       port.port.iotype = of_device_is_big_endian(np) ?
> +                                      UPIO_MEM32BE : UPIO_MEM32;

Hmm... And this one is not in align with IO accessors used in this
driver. (readx()/writex() are little endian IO accessors).

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
> +       if (of_property_read_bool(np, "no-loopback-test"))
> +               port.port.flags |= UPF_SKIP_TEST;
> +
> +       if (port.port.fifosize)
> +               port.capabilities = UART_CAP_FIFO;
> +
> +       if (of_property_read_bool(np, "auto-flow-control"))
> +               port.capabilities |= UART_CAP_AFE;


-- 
With Best Regards,
Andy Shevchenko
