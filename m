Return-Path: <SRS0=RQMm=FP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2142C433FE
	for <openbmc@archiver.kernel.org>; Fri, 11 Dec 2020 10:50:39 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C9D923EF1
	for <openbmc@archiver.kernel.org>; Fri, 11 Dec 2020 10:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C9D923EF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csncr5Kn3zDqnT
	for <openbmc@archiver.kernel.org>; Fri, 11 Dec 2020 21:50:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OehnmWu2; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsnZ013SzzDqwD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 21:48:07 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id z11so7946191qkj.7
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 02:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slJzPe2kxpeboENlm296s1XTEsliSEBNiEhHKDscyco=;
 b=OehnmWu2Cq/GIdeHzMBdt7eg2/pOQSLhzCkYFSTgSU0KXqnjYzFMPeaiVfLnIiK9EN
 GwaVNUlRlL37Wme+PaYrCsPv7W+u1gIf5ituKCEq0gIFZqnu/XnevzEsV9OhyeVB1QP0
 9mlk7FlEz63Xi4jNPJbv1u7b2cfY5J7DZfylo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slJzPe2kxpeboENlm296s1XTEsliSEBNiEhHKDscyco=;
 b=NXQwBX9Y3HbzmGEiuuimDuNSn5iJXS9Pp6kYWGuUv6l/ktxPV+g+p+C0EQtBlrlPWA
 BtPRWhLImCkBYTLDFHwBPbj28PRP4Zd5yZ40LnIG1VF83iPMff7avdVQy93Ia5hujK7Q
 TETQgdO/KZkRvqyhe23HMf+6kUo3EVbyiBBP2jDESW0cc/KDwxYCdDodIfkFzlQPb0bO
 oMisG8IhKWLgZYg5ukl3SLoWKA47WJZqN+jkpe2Bso2CocmG4zlTW408hHVy0afbvpiM
 dxruPBzatXd8n/UmUctJCcOeZGs17DYhp6zMgD6G6PNQyY51WF+qk46t9evAZnoiC4t+
 uawA==
X-Gm-Message-State: AOAM532LYwqGtkavUlQPWX/+1srMhjm9n9k8qxDZG5D0al2WchEs/Dfw
 mGPWKnib6fNVazuLzVBPpHymlQK4dBJkzLOsem8=
X-Google-Smtp-Source: ABdhPJzg2WTxy73n8cI6aM4pXLpltBhz2Y+OJehXxLYWrPMSeoZy3znBgwwPa4Mk+vg4QVPQZeTHp8jtpE01U3XfRxw=
X-Received: by 2002:a37:6790:: with SMTP id
 b138mr14527869qkc.465.1607683682174; 
 Fri, 11 Dec 2020 02:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20201211040002.1030-1-wangzhiqiang.bj@bytedance.com>
 <20201211040002.1030-2-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201211040002.1030-2-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 10:47:50 +0000
Message-ID: <CACPK8Xep2sN0JMh1HUVtfSFc-erOyPv1Tu8tjep8SYEHPB6Mew@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: g220a: Fix some gpio
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 11 Dec 2020 at 04:00, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> The NCSI_BMC_R_SEL and EN_NCSI_SWITCH_N should be active-high
>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> index 3a4bf3db400c..8baefd2d6962 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -912,14 +912,14 @@ fan@5 {
>  &gpio {
>         pin_gpio_i3 {
>                 gpio-hog;
> -               gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_LOW>;
> +               gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
>                 output-low;
>                 line-name = "NCSI_BMC_R_SEL";
>         };
>
>         pin_gpio_b6 {
>                 gpio-hog;
> -               gpios = <ASPEED_GPIO(B, 6) GPIO_ACTIVE_LOW>;
> +               gpios = <ASPEED_GPIO(B, 6) GPIO_ACTIVE_HIGH>;
>                 output-low;
>                 line-name = "EN_NCSI_SWITCH_N";
>         };
> --
> 2.25.1
>
