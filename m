Return-Path: <SRS0=DP8Q=EW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FA3C63697
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 03:35:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9162224B
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 03:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="QbtMGSSG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9162224B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZF7k5n68zDqPk
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 14:34:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QbtMGSSG; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZF6F5NXnzDq63;
 Mon, 16 Nov 2020 14:33:40 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id g17so11992322qts.5;
 Sun, 15 Nov 2020 19:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sp+Xd0qXLR5F3GGLG/m/VIpVfX8rv5kyrzW97rCHfyg=;
 b=QbtMGSSGq4rMRr95cxbyhkZXwyj3dBEBWqRsjEIQMkVzxgIBiDTnwXWGOR8OEhT6Ia
 facXJ4PrC2xTitPiKMh0E5bvbbLV4OMDxfCWgaWmeEPE01xBdXSdYUsWOdTTkkLsPwNU
 YfeSK/926BxBsxm0zxxbutrFtZXsCp2pcxFnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sp+Xd0qXLR5F3GGLG/m/VIpVfX8rv5kyrzW97rCHfyg=;
 b=bGLKjvvEaCYbLhimy8uEvE+V6SGRjzfxX8UDqwFQt7YQyPXdqqDqquCeMzg7uJE8fO
 QZ1Ohx31GzVxgsC534eIcR175H2tOs9iIeYvYRqDDhkSqMMz5l8XDJVk3/QaN5+HM5iQ
 jbCa14ZaGAuBFaKfGUNvNuQO6Iji+/lyRdVjZmdtneGF3MH9/F/yHxMfr98WaUkOYpjl
 tyY8SPHvHmgyZdC5idn/b03ZaaBPWBGEAwrcDCKM5So/TUqrVWAiWnd2MdJl8xbXJE/0
 a7Ja+lxz4ZZNNU3xdLtm2T14i6UzAtx1NzTmvC8tqlbr7HUmWdLFiHFp2m77fwJLxaCN
 VD4w==
X-Gm-Message-State: AOAM533s3qcGmVUkaj8TFe5Xf+0cPFJmKVQFh8jrm3BC1xrEjGeRxSp4
 kcux2x52sHFEBuLLMctzCcpoeLwJ1jmY1ZXBMrM=
X-Google-Smtp-Source: ABdhPJzsWj+yxl3qg6XjJcPGcwkO69M1HymTilFfhNlF7YBUOR+anj3VYmzWzAkwEZq6Gg3CRaGVdagtdgfvrvMw57M=
X-Received: by 2002:aed:33a3:: with SMTP id v32mr12755782qtd.263.1605497616267; 
 Sun, 15 Nov 2020 19:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20201110072159.7941-1-rentao.bupt@gmail.com>
In-Reply-To: <20201110072159.7941-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 03:33:24 +0000
Message-ID: <CACPK8Xcy=EAP4qTyBXoxExXthR31sqS_+gCu41X2yxL6aC8eMw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, 10 Nov 2020 at 07:22, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Update "data0" partition's size from 8MB to 4MB to fix "partition data0
> extends beyond the end of device" warning at bootup time.

Thanks for testing :)

> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply for 5.11.

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> index ad1fcad3676c..63a3dd548f30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> @@ -124,8 +124,8 @@
>                  * "data0" partition (4MB) is reserved for persistent
>                  * data store.
>                  */
> -               data0@3800000 {
> -                       reg = <0x7c00000 0x800000>;
> +               data0@7c00000 {
> +                       reg = <0x7c00000 0x400000>;
>                         label = "data0";
>                 };
>
> --
> 2.17.1
>
