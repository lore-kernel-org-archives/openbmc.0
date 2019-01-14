Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="K6nSldNn"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dWfz4TntzDqTM
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 22:37:47 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id w204so10314946qka.2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmEzO4e1e6vFLZAGRiwbe+TNqzVuSwUaxHWL6mc1/OU=;
 b=K6nSldNnEVLux1II+czubi/ovE96RuKcxERez8EcGBmtEfO4+Ky5lsl31tamkrhQXZ
 sKR6TYzarSTA9+JzTd7SQRVRtzfIOVvcjyCiD/zQ/FSSR1AOl6JorN0iG0w+1e77vjD0
 mvt71MncS+1oUEsk0Hx68K6Sx19Kugsne8V6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmEzO4e1e6vFLZAGRiwbe+TNqzVuSwUaxHWL6mc1/OU=;
 b=Vj+HBJnpTusHiyNj1xlXvrAsMv2maeTAZUdmjlZejsF4wDz3Xf+c2eZ6be51MbPhdk
 XuYVJEZegFIoKtZlephQuFruZMLm6vddG/lXAh4vUfmbhG23r2fBlnT5Is6On2wVPz+I
 0LTRbYxqDKRU/NMq31cWsQ9dEMmsKX5dqV5IRaojWEGERgjmtG/QKvfjRvRxaTm02P+B
 u+4UpVtslR299RjHptlJATyPoFdvL4oYKxJn0uZCMeI6xeoAM5ApFC6WODJRVkRWi6OU
 hD/GNA/St6gUzDS/4dATDBfehCI8Qxup6fYE15tfcn/BnJT7qYIXCBqPLGGYBx61hXg2
 BqUg==
X-Gm-Message-State: AJcUukegr6x0PtAcVRL1NZXPf7lwFx+mQ5fqgIt+ZrhPS4p4LO6gg2pO
 ldljDaJJjtD6YOAfT8cPqSDQ41/fOKkcsoCb4RA=
X-Google-Smtp-Source: ALg8bN7LPJ07kFDCuOMIc6pxJ5nGRgnv7nRFpcAdAx9MGwowUaOAStHoGffUAT1A2DWZwCw8wqnUau8msM9pg6jy5XM=
X-Received: by 2002:a37:bc06:: with SMTP id m6mr22839295qkf.336.1547465865164; 
 Mon, 14 Jan 2019 03:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-7-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 22:07:33 +1030
Message-ID: <CACPK8XfMyXfomepZEPJCr=A-cCPw-CVAZ0B2CuKn7oXCNz6LbQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/12] peci: Add a PECI adapter driver for Aspeed
 AST24xx/AST25xx
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 11:37:48 -0000

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> +       ret = of_property_read_u32(priv->dev->of_node, "cmd-timeout-ms",
> +                                  &priv->cmd_timeout_ms);
> +       if (ret || priv->cmd_timeout_ms > PECI_CMD_TIMEOUT_MS_MAX ||
> +           priv->cmd_timeout_ms == 0) {
> +               if (!ret)
> +                       dev_warn(priv->dev,
> +                                "Invalid cmd-timeout-ms : %u. Use default : %u\n",
> +                                priv->cmd_timeout_ms,
> +                                PECI_CMD_TIMEOUT_MS_DEFAULT);

As this property is documented as optional, I'd split out the checks
so you only warn when the value provided is invalid.

> +
> +       regmap_write(priv->regmap, ASPEED_PECI_CTRL,
> +                    FIELD_PREP(PECI_CTRL_CLK_DIV_MASK, PECI_CLK_DIV_DEFAULT) |
> +                    PECI_CTRL_PECI_CLK_EN);
> +
> +       /**

Just the one *.

> +        * Timing negotiation period setting.
> +        * The unit of the programmed value is 4 times of PECI clock period.
> +        */
> +       regmap_write(priv->regmap, ASPEED_PECI_TIMING,
> +                    FIELD_PREP(PECI_TIMING_MESSAGE_MASK, msg_timing) |
> +                    FIELD_PREP(PECI_TIMING_ADDRESS_MASK, addr_timing));

> +static int aspeed_peci_xfer(struct peci_adapter *adapter,
> +                           struct peci_xfer_msg *msg)
> +{
> +       struct aspeed_peci *priv = peci_get_adapdata(adapter);
> +
> +       return aspeed_peci_xfer_native(priv, msg);
> +}

It looks like you could do the peci_get_adapdata in
aspeed_peci_xfer_native and drop the need for this wrapper.

> +
> +static int aspeed_peci_probe(struct platform_device *pdev)
> +{

>
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base)) {
> +               ret = PTR_ERR(base);
> +               goto err_put_adapter_dev;
> +       }
> +
> +       priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +                                            &aspeed_peci_regmap_config);
> +       if (IS_ERR(priv->regmap)) {
> +               ret = PTR_ERR(priv->regmap);
> +               goto err_put_adapter_dev;
> +       }
> +
> +       /**
> +        * We check that the regmap works on this very first access,
> +        * but as this is an MMIO-backed regmap, subsequent regmap
> +        * access is not going to fail and we skip error checks from
> +        * this point.

Why do you use a regmap for this driver? AFAICT it has exclusive
ownership over the register range it uses, which is sometimes a reason
to use a regmap over a mmio region.

I'm not sure if you've ever disassembled drivers/base/regmap/regmap.o,
but if you do you will find that a single mmio read turns into
hundreds of instructions.

Cheers,

Joel
