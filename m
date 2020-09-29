Return-Path: <SRS0=CIyz=DG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDE1C4346E
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:57:14 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C9920BED
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="RcvDzGkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C9920BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0pYz20DWzDqNJ
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 15:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RcvDzGkO; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pXd5H0xzDqHF
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 15:55:56 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id q13so13230192ejo.9
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpnMoy6o4Eke1erSKfYDY/eAFK7ybetzRhxyxUFCFkc=;
 b=RcvDzGkOOrMPl6SVn1PW4UOM6s22vIm+T3z3nVX5BCJBDGVKxgsHL8qberyl1fT9QE
 kONFlQdt1RFRtCutZUr/Iyh1FaXBriY6tG3ulIKJINLgBR94FA21LnspisYrhAdVqw8U
 zRGcsNlqe9JPurejuwsCsy48dpg271snqHRgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpnMoy6o4Eke1erSKfYDY/eAFK7ybetzRhxyxUFCFkc=;
 b=kPIK+0um/byEQUwS680smp0BoXv/poB+102U4/K65fWBOowlf0bhryeZtuxBGEJtHJ
 OzdokUB/7wTw1oInb8BXwYVKDVgtIpJQgAlL/Yqhy3M2+rlyZpOxcxfuVwJMkou12qfw
 0f2fFqzqn7aEx8aSOJ2GoIsRzSU90j4g8GwTpuQPepUvWB38rwoK+AHbEIhavLWyDJWz
 c8WGNqaNsbMjvIewMXOSsaR5wjevX9lBqAmDXWc4AnNiKumPCoakI6umWRTWd7rC4TY9
 nK2nfOQqWXXEi6QFortCktBLUl14xtUJ0bFMLW8GRzXB45P9RktrOo5f0m2HHQQv7Usd
 N1FA==
X-Gm-Message-State: AOAM530xxl8AIkGGyzhIX4s+a2gzErQPxCZt6ZEMngmm4JyxuUmjkbmt
 ChWWXT7B65aehiOQxvrmB6/4gs7kVBluuxfkumsrer07w1Q=
X-Google-Smtp-Source: ABdhPJzDmtfNZN7ks52EIwyvhzhWhDORhlgNRZoynxs5rLlhWKTR8OCFfCDb49tevtVrNINGFQoH9+HCfyoR1GO2OfM=
X-Received: by 2002:a17:906:4c4c:: with SMTP id
 d12mr2108681ejw.491.1601358952498; 
 Mon, 28 Sep 2020 22:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-2-zev@bewilderbeest.net>
In-Reply-To: <20200926212734.23836-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Sep 2020 05:55:39 +0000
Message-ID: <CACPK8Xd3gqt-QQPcKOF27Tv_PCQQ_rhoMv6Nzd_w+EXZbGC_kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] peci: fix error-handling in peci_dev_ioctl()
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Sat, 26 Sep 2020 at 21:27, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> peci_get_xfer_msg() returns NULL on failure, not an ERR_PTR.  Also
> avoid calling kfree() on an ERR_PTR.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Fixes: 90ddc4e972b5 ("peci: Add support for PECI bus driver core")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Applied to dev-5.8.

Cheers,

Joel

> ---
>  drivers/peci/peci-dev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/peci/peci-dev.c b/drivers/peci/peci-dev.c
> index e0fe09467a80..84e90af81ccc 100644
> --- a/drivers/peci/peci-dev.c
> +++ b/drivers/peci/peci-dev.c
> @@ -122,8 +122,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>                 }
>
>                 xmsg = peci_get_xfer_msg(uxmsg.tx_len, uxmsg.rx_len);
> -               if (IS_ERR(xmsg)) {
> -                       ret = PTR_ERR(xmsg);
> +               if (!xmsg) {
> +                       ret = -ENOMEM;
>                         break;
>                 }
>
> @@ -162,7 +162,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>         }
>
>         peci_put_xfer_msg(xmsg);
> -       kfree(msg);
> +       if (!IS_ERR(msg))
> +               kfree(msg);
>
>         return (long)ret;
>  }
> --
> 2.28.0
>
