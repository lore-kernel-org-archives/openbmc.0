Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJlj83xPZzDqGj
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 15:39:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eb8Vb/NG"; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 96so14541313uaq.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 20:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oP0/JtXF3UwWhXZRAoIITIJjsIUX/8l+zt/3gPNdgfE=;
 b=Eb8Vb/NG4YugdFnc9DXwhs7sr+VUKQBoyiD7KQ/AbAUoDqvX4G+eNQhDSnZr6xkBd4
 pHEWZo9N/kXMVtgsDkGwItkBcobMg8/jBwYVdSmZsxN45N6sCZXvA0lLO6H1KEeKc8Wk
 EZIx8eWHP5ZV6CzXSKw9/7D/SZOZjCQAqPH77NAdPH9cfLc+EkRGmRaarKolEh4V7XpC
 IGhDCgdT63r37/M63ZiqUPnGrdgChENrQwl5Q0PzqylVcPdiCqVXmO4SEFZuFQX0x9kt
 TFZpQpL+7D2Yf6qZ4993aTCXHmKN/3SO1l/lFjoflTMUyo1PTUcIw+PKpqtvm0cr+1bc
 crww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oP0/JtXF3UwWhXZRAoIITIJjsIUX/8l+zt/3gPNdgfE=;
 b=NxHph62ZTs4ZwbKKLi4JDagXm6qMBXbnUO9Tb99/Pt9krkBe+Bu5LTjYhXAhNDFKHk
 34UlxtEhdJY/x8755s8dy/O5/c6kKFVjwYN8wZTSEDLvanszJUTO4yfWWkrg10B0qpOq
 PCNdSrQ6LW3LjOPOCHhHE7HRiWNdUlh+M5+L0cz9Fo6Cd2gul3XMQgGUrz5SJBuICECm
 O8LnVr6FBzCqR962UVQ40zKIkhqi/4WQ67YiZ6VXuy7EhOtVXMBXk3Ggru+GlbrS8Jyj
 nOKc3j+tbqlS7mCoN1dJfTRpuFbLUbMIfxYgJQFMzNzGEnz/6dBc8gmWAcXEFgPdRDC1
 WyRQ==
X-Gm-Message-State: AMke39nji493+zcoq/mGAc4TZR2SJBw0oU9x4D+AEyRVJp683smHHQ28NzRxT0O+BZxsXrf6d4wunROkJlzHog==
X-Received: by 10.159.38.229 with SMTP id 92mr654909uay.102.1486615162290;
 Wed, 08 Feb 2017 20:39:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 20:39:01 -0800 (PST)
In-Reply-To: <20170207233623.18737-1-cyrilbur@gmail.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 15:09:01 +1030
X-Google-Sender-Auth: q19PoiVfiLbJxBahI-uSX_tJY4Y
Message-ID: <CACPK8XcELMZT+e1Q-uYK7SFb3QtihvhG8Ot_+QmT3z808oW0JA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Feb 2017 04:39:25 -0000

On Wed, Feb 8, 2017 at 10:06 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> This provides access to the mbox registers on the ast2400 and ast2500
> SoCs.
>
> This driver allows arbitrary reads and writes to the 16 data registers as
> the other end may have configured the mbox hardware to provide an
> interrupt when a specific register gets written to.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> V2:
>    s/ASpeed/Aspeed/
>    Reword Kconfig options
>    Use tristate for config symbol
>
>  drivers/mailbox/Kconfig       |   8 +
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/aspeed-mbox.c | 334 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 344 insertions(+)
>  create mode 100644 drivers/mailbox/aspeed-mbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ceff415f201c..e24044d5c219 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -152,4 +152,12 @@ config BCM_PDC_MBOX
>           Mailbox implementation for the Broadcom PDC ring manager,
>           which provides access to various offload engines on Broadcom
>           SoCs. Say Y here if you want to use the Broadcom PDC.
> +
> +config ASPEED_LPC_MBOX
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +       tristate "Aspeed LPC Mailbox Controller"
> +       ---help---
> +         Provides a driver for the MBOX registers found on Aspeed SOCs
> +         (AST2400 and AST2500). This driver provides a device for aspeed
> +         mbox registers

You repeat yourself.

Mention that this driver is for the the BMC side.

> diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c

> +static int aspeed_mbox_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_mbox *mbox;
> +       struct device *dev;
> +       int rc;
> +
> +       dev = &pdev->dev;
> +
> +       mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +       if (!mbox)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(&pdev->dev, mbox);
> +
> +       rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
> +       if (rc) {
> +               dev_err(dev, "Couldn't read reg device-tree property\n");
> +               return rc;
> +       }

I think we want to use of_address_to_resource here.

> +
> +static const struct of_device_id aspeed_mbox_match[] = {
> +       { .compatible = "aspeed,ast2400-mbox" },
> +       { .compatible = "aspeed,ast2500-mbox" },
> +       { },

I didn't see the bindings in this series. Have they already been accepted?

Cheers,

Joel
