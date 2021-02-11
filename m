Return-Path: <SRS0=fhgC=HN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8692C433E0
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 02:46:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A505460232
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 02:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A505460232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbgx22gCQzDwhF
	for <openbmc@archiver.kernel.org>; Thu, 11 Feb 2021 13:45:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=EsynKwC9; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbgvK3lmkzDwjv
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 13:44:26 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id b14so3977268qkk.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 18:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6te9h6yqkP9W8hfwVoLUPmFab1lNl6NGBWaDGT5GF8=;
 b=EsynKwC91M1LekTNc6KagOkCYCG/EZlmd5tlTlT97YlwvpPzd/tQQ3/ROrU9p4S8dL
 GeDd2u7l/QoRaLIcPxyOeK3TK/fONJDAy5x6B8/9rgCaWxZdkb7cEJo5VDhuxUlM1qTb
 DknkbHaXrY4fAPPTcfZqmG418r0No7lj5o9v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6te9h6yqkP9W8hfwVoLUPmFab1lNl6NGBWaDGT5GF8=;
 b=D0ZaKmSiTg6E65OD+/jrfzR5O8GG0ejKUaDbycFLzLUD0QHriM7+snfkdhQ+DtF8Kc
 o1vVadCBrxF7QYUllNxQ4urZ0nrTVSxn3uCkMTktd+iW0uMWDBeUi/hQpoFbqQlj2bx8
 WEonI9dLqeL3zKZ8uzAi/BrStQeLYVIbvCozM5AvlAsFpWLpHAHIEk5aCdcN5nX1qyLp
 2XRTDkuEBMHtR4yGiuhfzDSaZhd2sVIfZU53CbCvPgloBMfWh5exyiVj1P2lSWmjh+U0
 AWUTftns5JrlY6uaYlgIPXIUip25NQUxHR+sGlDns7FN5/KfKdvVOts7UODGoy5IHxj2
 HKvg==
X-Gm-Message-State: AOAM532tIyYt8moTC2vHmRB80zRxmbEmvGxe1zPSgQZEg8jcd5s5ejl3
 kLKT14wEKegWUm+3cRK/8kLA4qRamDQsni7p/ICFALPw
X-Google-Smtp-Source: ABdhPJxln5O1xdd7/6lM4KQe8cRZMLxDzQ/RjrAdahm0pFIoLD38uOqOepJAZ5HWcdQemelTNBMrswiIb+nUJDsYcSg=
X-Received: by 2002:ae9:e314:: with SMTP id v20mr6596028qkf.66.1613011463055; 
 Wed, 10 Feb 2021 18:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20210210204613.49560-1-eajames@linux.ibm.com>
In-Reply-To: <20210210204613.49560-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Feb 2021 02:44:11 +0000
Message-ID: <CACPK8XdB93-H-TChZXUse7iQ0vk4OtdY1=PGBhrO+080TfO8TQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] fsi: aspeed: Set poll timeout based on
 clock divider
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 10 Feb 2021 at 20:46, Eddie James <eajames@linux.ibm.com> wrote:
>
> The timeout for polling for transfer acknowledgment on the OPB
> was very long, occasionally resulting in scheduling problems.
> Instead, use a timeout based on the clock divider specified with
> the module parameter. In benchmarking, the worst case poll times
> didn't increase significantly with increased divider until it
> reached 16 and higher. The average poll time increased linearly
> with the divider.
>
> div  1: max:150us avg: 2us
> div  2: max:155us avg: 3us
> div  4: max:149us avg: 7us
> div  8: max:153us avg:13us
> div 16: max:197us avg:21us
> div 32: max:181us avg:50us
> div 64: max:262us avg:100us

Nice testing. How did you create these numbers?

As this is an upper bound (normally the operation will complete and
the opb_read/write will return within seconds), I think we should set
the timeout to a constant. Choose something sensible (300us? 500?).
There's no need for it to scale, as in most cases the loop will go
around a few times and exit.

Please mention in your commit message the backtrace you saw that
motivated this patch. I'm not completely sure this fixes the root
cause, but it's a good improvement nonetheless.

Finally, submit your next version on the upstream lists. I can apply
it to the openbmc tree at the same time as the fsi tree.

Cheers,

Joel

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index c71d7e9a32b0..13f7e07beacc 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -25,6 +25,7 @@ struct fsi_master_aspeed {
>         void __iomem            *base;
>         struct clk              *clk;
>         struct gpio_desc        *cfam_reset_gpio;
> +       int                     timeout_us;
>  };
>
>  #define to_fsi_master_aspeed(m) \
> @@ -92,8 +93,6 @@ static const u32 fsi_base = 0xa0000000;
>  static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
>  module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
>
> -#define OPB_POLL_TIMEOUT               10000
> -
>  static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
>                        u32 val, u32 transfer_size)
>  {
> @@ -110,7 +109,7 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
>
>         ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
>                                 (reg & OPB0_XFER_ACK_EN) != 0,
> -                               0, OPB_POLL_TIMEOUT);
> +                               0, aspeed->timeout_us);
>
>         status = readl(base + OPB0_STATUS);
>
> @@ -157,7 +156,7 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
>
>         ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
>                            (reg & OPB0_XFER_ACK_EN) != 0,
> -                          0, OPB_POLL_TIMEOUT);
> +                          0, aspeed->timeout_us);
>
>         status = readl(base + OPB0_STATUS);
>
> @@ -609,6 +608,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>         dev_set_drvdata(&pdev->dev, aspeed);
>
>         mutex_init(&aspeed->lock);
> +       aspeed->timeout_us = min(10000, max(1, aspeed_fsi_divisor / 8) * 300);
>         aspeed_master_init(aspeed);
>
>         rc = fsi_master_register(&aspeed->master);
> --
> 2.27.0
>
