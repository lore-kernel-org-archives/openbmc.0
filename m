Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71904C28D13
	for <openbmc@archiver.kernel.org>; Tue, 23 Aug 2022 00:23:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBVLc48M0z3bxC
	for <openbmc@archiver.kernel.org>; Tue, 23 Aug 2022 10:23:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LOucV1wi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LOucV1wi;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBVKr6pq2z304J;
	Tue, 23 Aug 2022 10:22:22 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id a4so15129833wrq.1;
        Mon, 22 Aug 2022 17:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Mz0byrLcRTsU0F5GvVr/+gvi7taYHKM3YuyQL8j7nNQ=;
        b=LOucV1wiHZHotBZZ9b5YkGXXXjfFuWz3ppGvlnqWCa7QIFMjgJeA9a0zrYU2ocFs8J
         oz0UkvhlzmPuoOfBVzzNc2QurNAXE8GsX6jxirfeN1og8baaJriiQiyHRPtTd0xJngBq
         4HJ+eHVkbmkeFpLSNpatKx68srJZ1gbmiZ7Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Mz0byrLcRTsU0F5GvVr/+gvi7taYHKM3YuyQL8j7nNQ=;
        b=eWVhBzQrKWu8/MumnkQtJ9RbXtnZgauAVxbaWc5/dTuiof30rRosdlxc4MRrg9oMvg
         tAgvB/dDnKxtIyARhE7e7oxPhawHj9oHtlE27KmPXNbjnE0P3eX2QLQ+sj5AXxSL6lE8
         E6wjvdZRcn8nWWY1/4r4fefAeQEPpwg2OPu6X+9O5CrDlsJJTO9T8jEEG2uab7ne2Qmh
         NyQ5J2OMST+o7n9iOANsEriqeHDe1cfSSR+GqdzT4avhly5N99IK9gErwaT1+mksQGq6
         3b5P2ksqFIhCxVh5MeQ8tSnozwJjkDCpIv6BZaJpx8ZVOLHZ20glvM/L8YabEHX/CF2f
         SWQQ==
X-Gm-Message-State: ACgBeo0RpOp0AGhLu4pPh7fjfPLuCzrF5Y9IKffXoxv0KZ+zLZWuLIh3
	6os5ezk58LGJncqzty4Bwmuo0Wlqd8pdvlo59Z8=
X-Google-Smtp-Source: AA6agR7Btjdk0SI6WHiOceolZFSYZ80nCvqqc97cKVSAbqPfqxJzMNT7rFnn8uI6otZfk9oS0BvZubzamgD7yOO/lTw=
X-Received: by 2002:a5d:6484:0:b0:225:55d8:d528 with SMTP id
 o4-20020a5d6484000000b0022555d8d528mr4561198wri.3.1661214139760; Mon, 22 Aug
 2022 17:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <fb81dda34f9db0b9f743b247a2464576dcccd7c9.1661094034.git.i.kononenko@yadro.com>
 <ad3cd046c4dcb9169aaff6c0b739b23d0a06014d.1661149313.git.i.kononenko@yadro.com>
In-Reply-To: <ad3cd046c4dcb9169aaff6c0b739b23d0a06014d.1661149313.git.i.kononenko@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 00:22:07 +0000
Message-ID: <CACPK8Xfe+hPLXcgwWxZtb5H_WG8GRJ7pLfRXG3jupk8ANc7wgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ipmi:kcs_bmc: Add cleanup regmap(interrupt-regs)
 on a shutdown.
To: Igor Kononenko <i.kononenko@yadro.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, 22 Aug 2022 at 06:36, Igor Kononenko <i.kononenko@yadro.com> wrote:
>
> The previos v1 [PATCH 1/3] have error of getting `struct kcs_bmc_device`
> pointer from `struct platform_device *`. Replaced to retriveing pointer by
> `platform_get_drvdata()`

Can we get a v3 with your original commit message added? You had a
good write up in v1 but it was dropped in v2.

This change looks like the right thing to do. We should get Andrew to
review too, as he spends more time with the KCS controllers.

The missed irq issue was seen with the other LPC sub drivers because
the clock wasn't enabled. We ended up with this patch:

https://lore.kernel.org/all/20201208091748.1920-1-wangzhiqiang.bj@bytedance.com/

Do we need to do something similar for KCS?

>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index cdc88cde1e9a..8437f3cfe3f4 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -636,6 +636,14 @@ static int aspeed_kcs_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static void aspeed_kcs_shutdown(struct platform_device *pdev)
> +{
> +       struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
> +       struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
> +
> +       aspeed_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF), 0);
> +}
> +
>  static const struct of_device_id ast_kcs_bmc_match[] = {
>         { .compatible = "aspeed,ast2400-kcs-bmc-v2" },
>         { .compatible = "aspeed,ast2500-kcs-bmc-v2" },
> @@ -651,6 +659,7 @@ static struct platform_driver ast_kcs_bmc_driver = {
>         },
>         .probe  = aspeed_kcs_probe,
>         .remove = aspeed_kcs_remove,
> +       .shutdown = aspeed_kcs_shutdown,
>  };
>  module_platform_driver(ast_kcs_bmc_driver);
>
> --
> 2.25.1
>
