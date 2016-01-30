Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com
 [IPv6:2607:f8b0:4003:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E41FC1A01D8
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 13:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=CZCJc46F; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=nVASgGri; 
 dkim-atps=neutral
Received: by mail-ob0-x243.google.com with SMTP id oj9so5674482obc.0
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=nCDzhmf98mEep0RECHwVfQ86tq4WDBMMJRbIP+nnX4Q=;
 b=CZCJc46FAwCrCDc/S2gyv9wYooqc3xaFDy2iZ4OILeY33aZuNLA41rsLtFwCJBeocC
 zZmyYWqne1xqpjaHXkay0c0cI0ptSjxyxw7Zk+AdmVS5ab3qXw2ECuxt/e37SwAorO3u
 fPiMsoZIwkx4CyT1MejON/Uc3h6za0zEc2gARXvEGNb0WrKjzLYdWy2najmgw+yGZKmV
 eK1n5eEvjJaK6/54A0/6MHL40PMKGUGnjQuT2AkhaFSvifdBo6OhLHZ0AG+jOiLgIDWe
 1b8siBJZwv/NtzqT3t8BNcmxKf9JE0G8UcKAI/wUteaxE9/BQX2edwhRAiJWjaF+Nj4L
 GELg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=nCDzhmf98mEep0RECHwVfQ86tq4WDBMMJRbIP+nnX4Q=;
 b=nVASgGri9LvHGf7EhWwSQtm9/Fq96yhEUdo5NnsIwfd1BBKtDDdDeS+vai0gyjZIxy
 QcoDnjOTbTtHyOr1ZWgElb79YmxICoUev+lFMIUFUvIE0pYp3DPNzuu/L5tWT1V5OgSi
 NAqJkycd8T0lSu5EY63yhMpXX9S/OTrg+ZGlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=nCDzhmf98mEep0RECHwVfQ86tq4WDBMMJRbIP+nnX4Q=;
 b=K0kYdiPcYc4IJwn98sPaHFFRXQt4RgDgu1NhLKdMnPrny4KtQkSLpjfweNhRleolBQ
 SQeOXm+Yj7RyTrFFpOCU/WXLJlAifBVUKmIcINhNBzTuhidbVF0/OQoDQU3Q96JNc/7P
 HaAsf5L2/TOzFvfp+WPEq+SYTID6hTq7Y/kZqoUaUBZaKItOYwtUX+K2Tzto1gMMl7Xo
 fOU8pVNBPOr9QYgiSZ2lp+GrT5f0pkvNkIRw4kNCg05UdfvNChb61NIFHHW4EnlLKCR7
 QE4FurvtnSoRPnfOvT+E6zejyaZiJt9R9z0fGJ7yse1zZxKApebA9q794rwZioav+l78
 z+LQ==
X-Gm-Message-State: AG10YOS8D3ef9HPPRr6Zg5Vwy68ZJ/p/K5wdPD/De75t+AOifnEgkjQszEt7Ufo24QZXJxgAuX+zQdzyEV9Crg==
X-Received: by 10.60.134.73 with SMTP id pi9mr9116402oeb.4.1454120478322; Fri,
 29 Jan 2016 18:21:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Fri, 29 Jan 2016 18:20:58 -0800 (PST)
In-Reply-To: <1454043348-11432-1-git-send-email-jk@ozlabs.org>
References: <1454043348-11432-1-git-send-email-jk@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 30 Jan 2016 12:50:58 +1030
X-Google-Sender-Auth: B3qm21pEsNELTZRxeUaAFdxyUC8
Message-ID: <CACPK8XfYt3yizyaGGGScacSbuRkdYaL81mqd01bsy0LjQXVEag@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers/serial: Add driver for Aspeed virtual UART
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jan 2016 02:21:25 -0000

On Fri, Jan 29, 2016 at 3:25 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> This change adds a driver for the 16550-based Aspeed virtual UART
> device. We use a similar process to the of_serial driver for device
> probe, but expose some VUART-specific functions through sysfs too.

Looks good to go! Some minor comments below.

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt |   1 +
>  drivers/tty/serial/Kconfig                        |  10 +
>  drivers/tty/serial/Makefile                       |   1 +
>  drivers/tty/serial/aspeed-vuart.c                 | 313 ++++++++++++++++++++++
>  4 files changed, 325 insertions(+)
>  create mode 100644 drivers/tty/serial/aspeed-vuart.c
>

> +#define AST_VUART_GCRA         0x20
> +#define AST_VUART_GCRA_VUART_EN                0x1
> +#define AST_VUART_GCRB         0x24
> +#define AST_VUART_GCRB_HOST_SIRQ_MASK  0xf0
> +#define AST_VUART_GCRB_HOST_SIRQ_SHIFT 4
> +#define AST_VUART_ADDRL                0x28
> +#define AST_VUART_ADDRH                0x2c

Many of our other drivers use aspeed_ as the prefix. I do prefer the
shorter ast_, but it's something we should settle on before
upstreaming.

> +
> +struct ast_vuart {
> +       struct platform_device *pdev;
> +       void __iomem            *regs;

I prefer *base, but there's nothing wrong with *regs.

> +       struct clk              *clk;
> +       int                     line;
> +};
> +

> +
> +static DEVICE_ATTR(sirq, S_IWUSR | S_IRUGO,
> +               ast_vuart_show_sirq, ast_vuart_set_sirq);
> +
> +/**
> + * The device tree parsinc code here is heavily based on that of the of_serial

Typo: parsing

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

A common pattern instead of these four lines is:

  resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);

The upside of this over of_address_to_resource is the of platform code
(drivers/of/platform.c) has already done the parsing of the device
tree for us, so we can use the already populated dev->resource[]
table.

Then devm_ioremap_resource below will do the error checking for us (it
checks that resource is valid and does a dev_err()).

> +
> +       /* create our own mapping for VUART-specific registers */
> +       vuart->regs = devm_ioremap_resource(&pdev->dev, &resource);
> +       if (IS_ERR(vuart->regs)) {
> +               dev_warn(&pdev->dev, "failed to map registers\n");
> +               return PTR_ERR(vuart->regs);
> +       }
> +
> +       memset(&port, 0, sizeof(port));
> +       port.port.membase = vuart->regs;
> +       port.port.mapbase = resource.start;
> +       port.port.mapsize = resource_size(&resource);

Could we call the local "uart" or something, so it's not a port.port?

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

We don't warn nor error if clock-frequency is missing from the device
tree. Is that okay?

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
> +       port.port.iotype = UPIO_MEM;
> +       if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
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
> +               | UPF_FIXED_PORT | UPF_FIXED_TYPE;
> +
> +       if (of_find_property(np, "no-loopback-test", NULL))
> +               port.port.flags |= UPF_SKIP_TEST;
> +
> +       port.port.dev = &pdev->dev;
> +
> +       if (port.port.fifosize)
> +               port.capabilities = UART_CAP_FIFO;
> +
> +       if (of_property_read_bool(pdev->dev.of_node,
> +                                 "auto-flow-control"))
> +               port.capabilities |= UART_CAP_AFE;
> +
> +       rc = serial8250_register_8250_port(&port);

Could this be:

vuart->line = serial8250_register_8250_port(&port);
if ( vuart->line  < 0)
...

So it's clear that the register call is giving us the line number?

> +       if (rc < 0)
> +               goto err_clk_disable;
> +
> +

Extra whitespace line here.

> +       vuart->line = rc;
> +       platform_set_drvdata(pdev, vuart);
