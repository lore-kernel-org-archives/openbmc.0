Return-Path: <SRS0=3dQF=GS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B81C433DB
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:29:50 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30570235DD
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 06:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30570235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHB9k2QggzDqCl
	for <openbmc@archiver.kernel.org>; Fri, 15 Jan 2021 17:29:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Xih1MYKt; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHB7M277LzDqBN
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 17:27:42 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id r9so5355982qtp.11
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 22:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ONgmOsq4FyRujVnNjMwhCd0/VW3FeqahE1DcbicyN0M=;
 b=Xih1MYKtsOdRMl3TkQGTWKZNEt3R0BuGPr5bnlhxt0fVHp4PI5KlgJtJl/efxNj+xC
 5bylx846MoiKF1HHsiirtJSwHdQApBRBDDGonCtgP86HmXx/MvA6/rtOCDaDqSzFoMIe
 XBqLb6A7rwHeYcVGB5dpI1X8TzEkzZw2LLK/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONgmOsq4FyRujVnNjMwhCd0/VW3FeqahE1DcbicyN0M=;
 b=Hp2w+Iaxyc6mOoa+KNxwXQ/4j4fUYyS6qBUzuHKrnKX52jtJb0q6JObrO6dxkhajEx
 O4s9k/JUpYiBqAHzhBRP+Rv0PvIN8rtk0LHIU6D5YddHbI3vYZkfYoGYi3ypfwO1OS19
 KfXMzdTWhtSO32ZuEvMMCa0AHIBhNorMmz2/PEn04cCUv/+Rp2LnxWWUmNkK1SMKFQ8P
 Oi5mCLjFyOA+rFrGE4BhXx1aC+KVU7zao7JMYkiNRm2pbDOufPjjW92x802GkmJ5wyKd
 XNjpubMkj2LKNfmXE3KPu7BPGBXslXLsXfcEcqLg2uA/r8wSxGICxEfpGB4BTCfWRYd9
 LGqA==
X-Gm-Message-State: AOAM532vFjaj/kPgKnb+rU+QKR2b6W0MyTAuA+sQNs0U/jTH1BR/M4ey
 HRI8AmUJkcCQFP4O2KK0rwiyuvs2NrGg2Vq9e+I=
X-Google-Smtp-Source: ABdhPJxe0hXZaz++A+1rOdpg+PV5JYoCe6dRW5aQqaAakXxM2YTP9yCRmxo8iwacL+ycKz9NTem44/eUV+yckMnyDmU=
X-Received: by 2002:aed:2266:: with SMTP id o35mr10502512qtc.176.1610692057727; 
 Thu, 14 Jan 2021 22:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
 <20210113200010.71845-3-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-3-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 06:27:26 +0000
Message-ID: <CACPK8XdV0nnX-muuUGTKZb+3UNYHeRgNdbrABsxg411Vo1E2tg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 02/12] dt-binding: iio: add syscon
 property to NPCM ADC
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 13 Jan 2021 at 20:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add syscon property to NPCM ADC to handle FUSE
> registers.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> index ef8eeec1a997..faf9f9b54f5b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> @@ -14,6 +14,7 @@ Optional properties:
>  - vref-supply: The regulator supply ADC reference voltage, in case the
>                            vref-supply is not added the ADC will use internal voltage
>                            reference.
> +- syscon: a phandle to access FUSE registers
>
>  Example:
>
> @@ -23,4 +24,5 @@ adc: adc@f000c000 {
>         interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>         clocks = <&clk NPCM7XX_CLK_ADC>;
>         resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
> +       syscon = <&fuse>;
>  };
> --
> 2.22.0
>
