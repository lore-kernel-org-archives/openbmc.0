Return-Path: <openbmc+bounces-2069-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C5CD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 11:57:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb45F51WNz2ykX;
	Wed, 10 Jun 2026 21:57:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b134" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781092625;
	cv=pass; b=d4ytdG25Tn6mAbNMtmXo9LaK1I0wlbhIuG6JTUhFATZCFrfvV2pM3LAbrhR35NyUikWCvQ518YUA33V3pNRoml9x2OBIKxn9tOz7t1+T1snyvDNhntjMFqSNPsSYu0UWrWFvcX5O0I4/MlWs27KU5LL2hYvgQC9hsQsxJn5+guMbv77r3c9PGgHoVtJc3ZwTj6vNFbZb0Bqa9Wc1qkOYAtUFsqR/wsTU9epwKgsNaF5wCdZPJRZ+i6S2VqpjToYwaPjGmB6i5A5zp+fEaQ0GyQmWfL/66xMdJdQ1eqRcz7T3HmhIq5JJ74Bpjf3N/lMWZcHN1iUNttYTqptAy7gP3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781092625; c=relaxed/relaxed;
	bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojX5j7yF9aHuh6yoduRLzZqKtLGVzjxgYslBen3VJ6ozpK0l5Ql0HgcUv5UePSM4sPy3WARL6PLku9z/HEDMMX1JGVGkCte9MLM/xC1h+HybxCgTJhaA6RwtCcjVjKd+DFUiIlKXHkdXzDS3rw6igmQmxixxwk7LsPEyRJcm7oP5TVJnPTJtPZ87g9QnrUSoDARKjSyjlpwxl4xknAfCUDGk77Xm2xnQQ9k5RWaezMf/Qtp1d2Q3kavvxrTC/nz7vMJJjLmSTaPxwOBamnSJg6kkChN8c6aIZZkPIlpxRDW36/ykOGGdyI7V5R4SpVJzO4ccxeLo8f17BgmAa7CGFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GqvjpOtb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b134; helo=mail-yx1-xb134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GqvjpOtb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b134; helo=mail-yx1-xb134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb134.google.com (mail-yx1-xb134.google.com [IPv6:2607:f8b0:4864:20::b134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb45D4KNKz2xYg
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 21:57:03 +1000 (AEST)
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-660512d80b4so7098306d50.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 04:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781092621; cv=none;
        d=google.com; s=arc-20240605;
        b=LrAoGZoBh4IdWjjbyKX89pzVbnYB6ifU2NaaSiHortrSOR+Q2kmVPnO78qoOK1/peo
         slgDl047kHR4RkTP61r0KwLWPKSyq79KSITMJECNj/IbNIITEfmzzddtYfdyIVsIzTdO
         3fOiPymiolqF0fZme2dR9sCo6Dz6Mud1y1A1zgvNZPKGX4fTnugrHrugaX9u1FkEQmp3
         R/Ilv2XRu/i4zVFndV1itjYaRHtvduwq8fUe7CqK03B+ag/8xBycy0HzbOczXXj7EC5X
         jwOwIRFN+2lIhIJWSOQKqheJJN6xYLe1PtdWH3RljJPjfFEG/IqsjMWcHoYoncUCu+w/
         S33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        fh=LGayjSElga3Z0yOeZzno9LSZG+9nP0YRn/Dn9wVAA6E=;
        b=ZgmNvzEScLr+VqgvZENRuRQNYrWPzqG3/LBU3Narkrr7+O809FHDUTeuoteH0GqM2z
         U7nsciWHvtgK2lwL9Kvo1NAwAV1YJGE4jfYwicIDa/wga3YFPUWPfsdYR6CHphOZWR9u
         282foMer/Y7LLGH0UBinNDtOvRl2FetLCglCoFUSFxxCaFMJYOjF/yNFAC+EZ8TktYHW
         U9hDZ4lAfDKszlUxMtqsimzlVjNe+QGfRuhNoSyJI0PA8Kh7VVCAZW3Y36WAMxHyAjho
         pJwrxdZAhRHydfUsSKYFY6m7HzKAkYIX+iCoUGasnCT+iiOnG9EPFaq1SbKnvC3CSDL9
         Vduw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781092621; x=1781697421; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        b=GqvjpOtbBVcXzZiH6o2hGv3CFdOD8XKC3ZJJjgK+swZzHC/G1QIWiYXW6vLrh4ZSdr
         eJPmUVQ8u/kkTSapGmcGUFI/eB8CKeOfFOKDq21x4BzSedD1aH4m489oJ6A/dYQx6HyA
         qo7rtaAT2rHEXmHltyCaqbi1KkCyrJspfDVQFhQZ1wbBiPQ8/Kaft7LJnTblbdr83NmV
         IYI2Y4Ar6BuUkNje43nTiKNafac1XDQrpc0g5TkDz5NYLgTyN3by9v5G/gBoUNwD4BNO
         XUKp5A1bOwSBas0ValOYFhkt3sVsdZQ5G58s+z+UUhZjZt6yLEVYsUcvOSjhsuJV5Jh7
         f/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092621; x=1781697421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        b=n3R1zbDG2Yf/r7OPNL7rr4GM9cy9/z8+M11RCuWBHBKUxHkBxbLmCZ0RpXEO/Y/eX1
         aRqoBw1f3uQ0iBnxcYtBr87YmwMgUBqQLkVcOWjHMNg+BiSLJSQTPRysyKsU5UknxB9s
         HMzNum103h5dnZBsf2O1purWdIEWB05v8I/QQCyvy0eaGi5OM4I+y7bEWLZSR13L72ok
         y7kFxjsyvzWluubYCfvPoVdK+FkiL4whZ1zQW4Arfv42UXxcdvHwH6ZACMC/JVjOsuhh
         ktE1XEjZotr7i71/FiBhD+Wz2jXCb5T06b0RCWU3ghRU1hzzDs2Rj8CmLZ+cK7AfRDe2
         +Gbg==
X-Forwarded-Encrypted: i=1; AFNElJ9u3NVU8dW64pWR2YQelOkh6e3oNBqshqHLqnjiOTv1eKf0nUZsRI1JEKsMNTOCccQAKYLYQr4r@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfLTaqRZSuDtWH8do4G7H/0VeK1of+0Ta9qCHYGKFoiKFnKPjR
	UGaUyc1Tk4sO5wBHD6eYzcqzu1QKhtI1TEQ6NL7MIfN5hShaZ45+JX8IW8WyaLnHc+NVOt4oAJS
	MglLkeWoWgssXJw+rgJidTKa/57dybhY=
X-Gm-Gg: Acq92OEHN3DZ77dCZrq7nkk2RnnBXxPHlJ1gOmTQQOjMxec7o0/va1YGTkdg/NKWN5e
	9OAc950Z6qv9yaSpj8dOI2YXb69CDeNCXa5w9oeEGTT2wdP43EdLxSmAUmmpL7q6ehHyDizMp6q
	lbVVWETq45InxQ6wvSFWZKDQm1Wn8j8RIaFSIxA9gPE3tLv1p1joRV73E9zM0zkzDgwBfV3EAef
	CG1VjJS46ibtnU793Ia7SZbqYMxatFejg4CVNmDW0K68NPwifFMvUsgd4WZbBuK/qAWvrqLNdwL
	yr2f2BNvxlmvnlStNyj6A2fo6oAFjSo=
X-Received: by 2002:a53:ac87:0:b0:660:6e93:1958 with SMTP id
 956f58d0204a3-6610a1bdbecmr18780971d50.0.1781092620933; Wed, 10 Jun 2026
 04:57:00 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260609163919.3321228-1-tmaimon77@gmail.com> <20260609163919.3321228-3-tmaimon77@gmail.com>
 <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
In-Reply-To: <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jun 2026 14:56:50 +0300
X-Gm-Features: AVVi8Ce1xyKX-eTc7JFGyjnn8l2QiZByZq625HpF-ttuxQcOhnM9x3cJlI6wb60
Message-ID: <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 13:49, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> > The NPCM7xx FIU controller driver gets its single clock with
> > devm_clk_get_enabled(dev, NULL) and does not perform a named
> > clock lookup. Drop the redundant clock-names properties from the
> > FIU controller nodes so the DTS describes only the resources the
> > driver actually uses.
>
> The devicetree is a description of the hardware in the form documented
> by the bindings. Generally it's not right to discuss Linux drivers
> here: they're only relevant in the context of Linux, but the devicetree
> binding governs devicetrees over multiple projects.
>
> From a quick look it seems that these names are not described in the
> corresponding binding, therefore no drivers should be using them and as
> such they can (and should) be dropped. A driver would only be worth
> mentioning if it did use the undocumented names (as that would be a
> complication).
>
> Can you please rework the description?
do you mean change the description as follows
"
The NPCM7xx FIU controller nodes reference a single clock,
but the FIU binding does not describe their clock-names properties.
Drop the undocumented names so the DTS matches the binding.
"
>
> Andrew
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > index a16450abea0e..83cd10b47273 100644
> > --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > @@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
> >                       reg = <0xfb000000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPI0>;
> > -                     clock-names = "clk_spi0";
> >                       status = "disabled";
> >               };
> >
> > @@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
> >                       reg = <0xc0000000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPI3>;
> > -                     clock-names = "clk_spi3";
> >                       pinctrl-names = "default";
> >                       pinctrl-0 = <&spi3_pins>;
> >                       status = "disabled";
> > @@ -217,7 +215,6 @@ fiux: spi@fb001000 {
> >                       reg = <0xfb001000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPIX>;
> > -                     clock-names = "clk_spix";
> >                       status = "disabled";
> >               };
> >

Thanks,

Tomer

