Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5147C2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:37:31 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8700221775
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 06:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="hBmKYDc/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8700221775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0CVw09ZNzDqL8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 16:37:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hBmKYDc/; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0CTV2K7nzDq9G
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:36:11 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id g4so71022edk.0
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nKB/odECC+5oqZhSa7bIP3FBFtIvg26fikzOMA8o1U=;
 b=hBmKYDc/kEi7zflj1bZ9+9WwU93fZ3m2wYbDRdaX9IGB3F3ZfNlsCEdoppa3RM7VVc
 DEiyc52dDgzqn0d9p1kTWZFRM3KK/magW2NJSSRG/xIjZEZdrp/dcVvtX3G85ekpcoz/
 l9/pccUo9GrE/5t8nqSkxTuFjcNa6M+Us2rPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nKB/odECC+5oqZhSa7bIP3FBFtIvg26fikzOMA8o1U=;
 b=bYZnqWkI99M5DGkalZ1Fi1atrSGNZdBVZ7SMPFfQXvZ0unm4gzD/Xz6uKflcjg6YaA
 KPq+dtVgkqOJnjidx/PS2ROXCEUL6a+gdTqc8QOWPtR0V3drWzaiKkfTdXmegDHkjsPV
 sMdrC28sj4+NxBeabYSvsLLwTfbOxFIkj2A2IjH+r3S9MSor5XwlLSTW0M9dPf9K0HQk
 GNHkN5v6cuN9CbXjJFHkbC0Jqmq/Huv12E6bgmOCA+hIStu0k2owXqmB0/5RgtMqwXci
 R61vYaze0RDZHvvt/CzbosPTE2jjQAnGm/yitpj8eHi9MeUNNQnrYcedsXIPKPSpMath
 k8ZA==
X-Gm-Message-State: AOAM532jNvRGw+INpCpmDJwoD6KKGfpAy5GeFS1ddp2Wg2L8Wc07BAzt
 sCNEK5+018LkYyD+ppg0JN6kkz6WS0yvweIQQns=
X-Google-Smtp-Source: ABdhPJyD4DRT+j+TjKP/dgAT8V8/M4iWxU6Zg+ZnI6IDRF/j+WOqGaSTMSlUw9s0o0su2LDEv+FCRh0AwzTCUuWdcxY=
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr94667eds.191.1601274968942;
 Sun, 27 Sep 2020 23:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200923164730.176881-1-tmaimon77@gmail.com>
 <20200923164730.176881-4-tmaimon77@gmail.com>
In-Reply-To: <20200923164730.176881-4-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:35:56 +0000
Message-ID: <CACPK8Xfe9Bh_botSMPx72TPnDt_Ar_s+o6QcE_THrb07v4N-2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] arm: dts: add pinctrl and GPIO node to NPCM7XX
 device tree
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 23 Sep 2020 at 16:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add pin controller and GPIO node to NPCM7XX device tree.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 565 ++++++++++++++++++
>  1 file changed, 565 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 72e364054e72..5df77a617e77 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -185,4 +185,569 @@
>                         };
>                 };
>         };
> +
> +       pinctrl: pinctrl@f0800000 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "nuvoton,npcm750-pinctrl", "syscon", "simple-mfd";
> +               ranges = <0 0xf0010000 0x8000>;
> +               status = "okay";

Nodes are enabled by default, so there's no need to add status="okay"
here. It's no biggie, you can fix it up in a follow up patch.

Reviewed-by: Joel Stanley <joel@jms.id.au>
