Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxNZ65Mx0zDq7Z
 for <openbmc@lists.ozlabs.org>; Mon,  3 Apr 2017 17:11:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxibaiKj"; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id f204so27304105ybc.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=tVDf8AvhFfo6o49RtwVUb3EVtdOlpHhPZd6UViHYlsQ=;
 b=bxibaiKj8+9hzYjwTtvOsSmkgG+Zx7Kr8rOp1f846h5mdTVmxhLUrWeQv1QFp8hePS
 NI+nC6dQIvFLRpfHjZBCmmlsHA77i6EQ3ELZqiQ1T9V/Uz/nT2M44slfWrqUsyEkqiba
 R2tTj5iI2xVcc7ulORsMUBqjFcxezCgXL62LjSc1JHGT1uuWforzsvt1ioYRBtXtf0b8
 QJFuA6IxJUjFfUWiPJp70jJNVTwZCWkwT3lAN0FaXgK3Qc3lLEr5bl6wBWfW1ybxAHxS
 jdABJUptcqUkcaZl6Ca9WRKHFF00uTRtv7wGpkHl/uZDN1+THmzmXRuKyMwlBzEp4nQm
 79Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=tVDf8AvhFfo6o49RtwVUb3EVtdOlpHhPZd6UViHYlsQ=;
 b=SzMyE7RrSdEfUW/rcLQycl38OBsl1S3UXPfMPUq7If5IsQWH7omsueQ3R5+krAO8PH
 tLmZ0oVZ794uszoh25281ZyBbF0a5omi0SIYp/ankMIGSeC1faur88kZ2eInX64+6xhb
 ZOdnOEzIZXHgzOY3+yT0nfneRvVRsNBuXBEPQKtOM3D+k/qceIJoTD16LOqw47+e12ZE
 t5xF5kp22RHCSeMy6SMojqMCLRJavAJNTJ0PBH3IJegZoit2lpytGtuEPPxpu49QjdCD
 lfTIbF/NebMthx4vHUOh5fY7N0ApBz/M7VjReuvQq4MeE0VJT288eP2v+ajmD7jicSQ2
 3Ibg==
X-Gm-Message-State: AFeK/H3yOm9Ys7KLPOWykf4uXpPaCaXmbgP7N9eIapU+AUVCuXDQ9YINtPFwnC3I0pyBijHptOyccdlbbWPm/A==
X-Received: by 10.37.2.147 with SMTP id 141mr8218854ybc.167.1491203484080;
 Mon, 03 Apr 2017 00:11:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.20.87 with HTTP; Mon, 3 Apr 2017 00:11:03 -0700 (PDT)
In-Reply-To: <CAHp75VfmbHrPFXO3UFmSciCnVuoB+5vFxy7iOnwVS5YBSPO3+Q@mail.gmail.com>
References: <20170328054458.29341-1-joel@jms.id.au>
 <20170328054458.29341-3-joel@jms.id.au>
 <CAHp75VfmbHrPFXO3UFmSciCnVuoB+5vFxy7iOnwVS5YBSPO3+Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Apr 2017 16:41:03 +0930
X-Google-Sender-Auth: W7V2_pcdI_ic8IIWVfK5ibrNfsE
Message-ID: <CACPK8Xd0U9sbWb-ScJ-MR8qwsXwxhP6_mrnEj4AXkGO66X=7kQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers/serial: Add driver for Aspeed virtual UART
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@ozlabs.org>, 
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 devicetree <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Mon, 03 Apr 2017 07:11:28 -0000

Hi Andy,

Thanks for the review. I've incorporatd most of your comments in a v2
that I'll send out once I've given it a spin on hardware.

On Sun, Apr 2, 2017 at 10:37 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>> +static ssize_t ast_vuart_show_addr(struct device *dev,
>> +               struct device_attribute *attr, char *buf)
>> +{
>> +       struct ast_vuart *vuart = dev_get_drvdata(dev);
>> +       u16 addr;
>> +
>
>> +       addr = (readb(vuart->regs + AST_VUART_ADDRH) << 8) |
>> +               (readb(vuart->regs + AST_VUART_ADDRL));
>
> It looks like you have register shift 2 bits and byte accessors. We
> have some helpers for that (serial_in() / serial_out() or alike).

Thanks for the pointer. I took a look at this. It looks like I need to
define my own accessor?

I don't think it's worth it for the one read and one write we have in
this driver.

>
>> +
>> +       return snprintf(buf, PAGE_SIZE - 1, "0x%x\n", addr);
>> +}
>> +

>> +static int ast_vuart_probe(struct platform_device *pdev)
>> +{
>> +       struct uart_8250_port port;
>> +       struct resource resource;
>> +       struct ast_vuart *vuart;
>> +       struct device_node *np;
>> +       u32 clk, prop;
>> +       int rc;
>> +
>
>> +       np = pdev->dev.of_node;
>
> And if np == NULL?

The driver will fail to probe due to the of_property_read_u32 calls
returning an error.

>> +       /* If current-speed was set, then try not to change it. */
>> +       if (of_property_read_u32(np, "current-speed", &prop) == 0)
>> +               port.port.custom_divisor = clk / (16 * prop);
>> +
>> +       /* Check for shifted address mapping */
>> +       if (of_property_read_u32(np, "reg-offset", &prop) == 0)
>> +               port.port.mapbase += prop;
>> +
>> +       /* Check for registers offset within the devices address range */
>> +       if (of_property_read_u32(np, "reg-shift", &prop) == 0)
>> +               port.port.regshift = prop;
>> +
>> +       /* Check for fifo size */
>> +       if (of_property_read_u32(np, "fifo-size", &prop) == 0)
>> +               port.port.fifosize = prop;
>
> Perhaps you need other way around, check for error and supply a
> default in such case.

We leave port.fifosize unmodified (set to zero) if there is no valid
device tree property. As the property is optional, it's not an error
if it's not present.

>> +
>> +       /* Check for a fixed line number */
>> +       rc = of_alias_get_id(np, "serial");
>> +       if (rc >= 0)
>> +               port.port.line = rc;
>> +
>> +       port.port.irq = irq_of_parse_and_map(np, 0);
>
>> +       port.port.irqflags = IRQF_SHARED;
>
> This is set by core. You already supplied correct flag for that below.

By setting UPF_SHARE_IRQ the core does correctly requset_irq with
IRQF_SHARED set. However, it does not store this in in port->irqflags,
so other tests in eg. serial8250_do_startup that test for IRQF_SHARED
will fail. This is a bug that we hit the other day.

Would you like a patch to the core that either tests for
UPF_SHARE_IRQ, or set IRQF_SHARED early on?

>
>> +       port.port.iotype = UPIO_MEM;
>> +       if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
>
> You hide an error code from of_property_read_u32() here. Why?

The property is optional, so if it doesn't exist we want to continue
without error.

We return EINVAL if the property is invalid, as the device tree code
will give us ENODATA or EOVERFLOW, which I don't think is informative
for a driver to return.

> And if there is an error you are continuing with what? 0?

we continue with port.port.iotype = UPIO_MEM from above.

>> +               switch (prop) {
>> +               case 1:
>> +                       port.port.iotype = UPIO_MEM;
>> +                       break;
>> +               case 4:
>> +                       port.port.iotype = of_device_is_big_endian(np) ?
>> +                                      UPIO_MEM32BE : UPIO_MEM32;
>> +                       break;
>> +               default:
>> +                       dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
>> +                                prop);
>> +                       rc = -EINVAL;
>> +                       goto err_clk_disable;
>> +               }
>> +       }

Cheers,

Joel
