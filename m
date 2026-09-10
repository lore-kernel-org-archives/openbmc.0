Return-Path: <openbmc+bounces-2580-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A813AC79FBB
	for <openbmc@archiver.kernel.org>; Thu, 10 Sep 2026 23:36:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hgvF373sTz2ypw;
	Fri, 11 Sep 2026 09:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:39::10"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789058740;
	cv=none; b=kZ9ddCOGp/96Yfo4EMZNU7euabksf9galsQ9MVAZxa0wQ+xd9wz1D9zQnFXZ5OZpd0cM7TT0mhVWNB5Fk6DTGIqpmUBX4hlxgZO4Qm+BLJynZZWGOiYJk0lOgAYoMeY0k56W4A9hj5HgDBxfACmU+zayu/CZpjRUnA7pWE5nRFeuuAnC7h2Q3oLuW8yHexYZuvoYrGzbaO9RXZ0ZIPfMOiKnn8afhtK263Ic0D5jNu494W+vsOmRfvolapHMeZ1B4hiJb58DcMICXN0mM3RGs7KtpAT6w0jJ4AeIZmiOCO7Aw3l+LbVq7zy/FUK2rOcaY5SkTKc0K4/i2V4fhh0nwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789058740; c=relaxed/relaxed;
	bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfaWiuoqaxh1dLx3eQ0HrD/59o4ZVwhLZYyYVQUuG/WSi3R6Dd0TF7JQZ6HutvVCvI5M9Bova1HysMaMXrzhU7cTDoePeqJ3SyTQzcYoxxfj5zkfwTpIY1oLE8OIw4PnGw0H9MEzL5sZE6xdIYt5snSaMUNqiUZ/ZzwWmoIehONYGVDGx/FB8TTeQDxFp1epQtR4oOPmWUjjH5zd+htgxh1qK0foNr7x9NMcN0sw8nrKp3vKkAfDLXegJaZCC38rsXgZh3bR5rG8dZ+jUmKQGOX+bAGFYw5fp8wcQ+AUCx2svJx1LiiaP0z0r7Dg32LbrgCrgo7B02PB0LR7faCwGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FlANRYkK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=ychuang570808@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FlANRYkK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=ychuang570808@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com [IPv6:2607:f8b0:4864:39::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hgk7l2FV0z2xkr
	for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2026 02:45:39 +1000 (AEST)
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1509189a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2026 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058737; x=1789663537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=FlANRYkKJqDh0QHmVWXgJRL8J/wSdfq3936QPb/aUbJKiZremduSybg97wREIha76f
         yUQBVg3GzYQkU+x93NPVC4XtRK6duZz3NmWRtvTC5K1R8ZsVDjgHhC7mhXsQ1WQ5LzKZ
         1SMCJtIXTAfgFj4V9T+0WUwWhFiWdxqAg2dWUprKVBdbFnhxlBKu6ZGPuoEjpGVy4h88
         4tXkyZTVLHkeNB/3zlHc5BL6gL13TW875qkk+gwANNJS38cMtDYUaDcBZDoGV8OQdI/u
         9L28mHcaSFfnP0ZsS5rI/AOat3k7tfq9C7QQ86Bcps8dIg3WBNDd6XV3H2o784MEYj1z
         +nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058737; x=1789663537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=WtjozHEShyFK7GmEemwJqY5MdCCuJTpOMfkaMdVYvj6tfFfAc3+nM8es6yUOdXxPYJ
         /8zCeqQGVhKTp/bpqiTSYRSogyzvTMo7IXEIRb4EudEE6FfkjLcp2X65UBKWcmi55qTt
         L2t3fSYhel4qI1/qinyxXEr303ccM81+TeSGA4H4V3VJhdPNW55ykJuNhJ4efP420onD
         RosetDfnSPwlRAKxLQx3Bmt+h2nyTBYuFtyzld5gRf6vMqFPDMzvNIYfUsC0yM6YjHII
         Km/HUO38cOTETU4E9sNSnxoSYItlAXAU3vRkya1dyV57daUD2W4M/MQR/35SvXiEs+Jv
         efTg==
X-Forwarded-Encrypted: i=1; AKwUvBwJFfdpXyE5+bn5t4YzSg84Io6PWTAMyx/faUSRXgTEa18QLcCFxtFawtb97GDXsM3lS1xk9msf@lists.ozlabs.org
X-Gm-Message-State: AFuF++nrxP/cd+V73/9gHZm4KH3G9XwQBLFbt1ZF0yl+GU8vfelLssD+
	wc7LYxL+UN4nAlKzR2iyXIiVHByQV2gBRgxwC5pH1I3IKHyb/xKPRcvL
X-Gm-Gg: AYBFou1g0tRN6mCfBZAKJeu5UbNlifDT/eiNW/fblV8kWxN9MhDnY0gvW8qMZ4zH2lK
	TCTMf4i77ajU/7CpswDCiV914LGDlx1OxF3q5gD7wraTkYMMbOZ6WXxBaSqwOsvJYhokLsDU/XA
	JJ+uNVth2sij/D2ychjxVjikNOBk922cYP0oArndZFvgkR9sKZPjgaVhY9NEGFnaf7FcBICRViP
	54l2nP4MvE8MFeYuTli5nigijm/P5Y9hniKKyNkFF+krDJltatYvJjMpPc4vIu30StDGKoIp6ck
	2OaoLnNo+asfVunh5nf14YGJBH51O3drk7HNTWWF39dkKG+0JJwcitYl8t6a+dTtHwY5A+GRono
	FNXseudMx98nrhhSL55PBrtj9E/ZNoeFKdBcYeHytQTCG05wZ3E4boIM4RPeHLieYSBGTEdwu/u
	NGXHPLinMJEMQafLevDAV4Q4pcwmDIzYMRIrhmknV7vdGRQ/YFTQEoK8AhpNde1yySbD9yxfVMg
	gQcDFvsAu7sp+B3q88igahb0voTRKvpXUJkG5nj6eJsXJki9yO3vQM=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr12712034a91.10.1789058736550;
        Thu, 10 Sep 2026 09:45:36 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm496465a91.1.2026.09.10.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:45:35 -0700 (PDT)
Message-ID: <3b6ec7ca-f3f0-4605-af1e-4f6197c7c1a6@gmail.com>
Date: Fri, 11 Sep 2026 00:45:30 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
> for it have already been contributed.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..9eec44128d28 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -431,5 +431,16 @@ mdio1: mdio {
>                                  #size-cells = <0>;
>                          };
>                  };
> +
> +               qspi0: spi@40680000 {
> +                       compatible = "nuvoton,ma35d1-qspi";
> +                       reg = <0x0 0x40680000 0x0 0x100>;
> +                       interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk QSPI0_GATE>;
> +                       resets = <&sys MA35D1_RESET_QSPI0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
>          };
>   };
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


