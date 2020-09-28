Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA85EC2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:51:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F290323119
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="Sa/EiThb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F290323119
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0CqB1FrtzDqDM
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 16:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Sa/EiThb; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0Cnf4SWXzDqCk
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:50:12 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id e22so82538edq.6
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPQQfm230iKZbTo5sNdcg8TCjm5eRE+Zk8cMM2lxBEs=;
 b=Sa/EiThb5/iQpRGiGNeXVkJMcui89vutnmZtFiqtGw/XzN8mtyznHyHbYYV/dpWNKG
 hdKO/k6qUCpphRTCIj/qWSTWYVqJKZAPjquiFK8mIjob3pUo9L0LfSCbKvGrx3eQGsZ9
 XG6EgVTiOe32ogdDjtWkK0nMr2kKFaZ1lHN6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPQQfm230iKZbTo5sNdcg8TCjm5eRE+Zk8cMM2lxBEs=;
 b=e3dk6xI5VheLkccoHgL6e0JpRNWyoGk8pK0ddwOlcCdWo260hzbWFIS6jzud1HdPoj
 wfEI+DDvCTietxd8m9T9ZgjvTJo3hk/WqX/OLntBGS0MeljCohZl8onfe2gJgzHF6BIZ
 GYMjNUzWxe1Tn7ciFemcMg4rdqULnGBhMsYeb0AcMo8OYYgwGhk/HdvMR/WPbL8xgUdq
 QgwynfkmHc5RNIj7+ItlMd0J2swxvFvLgypv5c++pPT5N8NS+3G00YIb2+1hZ5QLUagh
 i6iEmTfCdNnptE0/eSLo1tBUIgjy7S/ULMkIIV6RX05IxnKx0oXSsILA4y5/Gl6uBixG
 ijJQ==
X-Gm-Message-State: AOAM533a3LZHAIV16IGyEMCRVB+N5vdNBKypBLPoPp5i9VbAaJ1kimA8
 wvTw5g7RnsPqECMhRtdxoF64zmEhZmJ7z2MSOhmnRhDm4uI=
X-Google-Smtp-Source: ABdhPJw7wWdgEPeFQ6cCL1zLwuAjKzEjflANmuFJ6/cgy7qRgBlPCGmXeX2uQT6Pn2xfaH1mHkv3y1HuzoWIMt0DKAI=
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr135929eds.191.1601275809387; 
 Sun, 27 Sep 2020 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064303.1961-1-wangzhiqiang.bj@bytedance.com>
 <20200928064303.1961-2-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20200928064303.1961-2-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:49:57 +0000
Message-ID: <CACPK8XdPsDHWBes2b++fB_Pn5+AGowE_gs7OPB6eJfxeKALbaA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 1/2] ARM: dts: Add 64MiB OpenBMC flash layout
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

On Mon, 28 Sep 2020 at 06:43, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> This is an alternate layout used by OpenBMC systems
>
> The division of space is as follows:
>
>  u-boot + env: 0.5MB
>  kernel/FIT: 5MB
>  rofs: 42.5MB
>  rwfs: 16MB
>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Looks good to me.

Are you confident your kernel and u-boot will fit as you add features?

Do we have a location in the OpenBMC documentation that lists the
various flash layouts? If not, it would be good to add something at
github.com/openbmc/docs

> ---
>  .../arm/boot/dts/openbmc-flash-layout-64.dtsi | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> new file mode 100644
> index 000000000000..18c8047c1d0c
> --- /dev/null
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0+

Add a copyright notice referring to the copyright holder and the year.

> +
> +partitions {
> +       compatible = "fixed-partitions";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       u-boot@0 {
> +               reg = <0x0 0x60000>; // 384KB
> +               label = "u-boot";
> +       };
> +
> +       u-boot-env@e0000 {
> +               reg = <0x60000 0x20000>; // 128KB
> +               label = "u-boot-env";
> +       };
> +
> +       kernel@100000 {
> +               reg = <0x80000 0x500000>; // 5MB
> +               label = "kernel";
> +       };
> +
> +       rofs@a00000 {
> +               reg = <0x580000 0x2a80000>; // 42.5MB
> +               label = "rofs";
> +       };
> +
> +       rwfs@6000000 {
> +               reg = <0x3000000 0x1000000>; // 16MB
> +               label = "rwfs";
> +       };
> +};
> --
> 2.25.1
>
