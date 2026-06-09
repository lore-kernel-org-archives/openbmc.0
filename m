Return-Path: <openbmc+bounces-2054-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469E4CD8CAD
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 07:13:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZKrp2ljfz2yRF;
	Tue, 09 Jun 2026 17:13:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780989226;
	cv=none; b=WO6C38AOHW6W0EbRpgBErZyfPHPf96S24dS/DRSVXRU/GhWBDGvmqACu9Z12GmtMzn9+BKD3hH5p59EdIlChUNRCekNoZr0s2MmRCdx6ZXDfTIWXzGzzWYWhi+NreCOBznTKNnMdwWMRehUOv9QmxgItn2sMc8IxLZRSol7GYUe6If5SjjQakR4p59FdwR63fu7/DhiHKBIMDZ51rvevFGl0vulxt6lMTg+Nd+zjGMB8XYZeY5x8dbt/rorNXjZeKrsvVr6ipkJ9gD7RL8RGQ3MVKZvNeDY9kMu1/Vo9szUviVsxlDC9tjDVIeVD+tghWx7p5OnWeGt/ntyfoQ4ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780989226; c=relaxed/relaxed;
	bh=xpvqltnPyHaKeLXzA9Xq8lTFZuFUY8y5YG012UOsqCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIO81cuojK589W351d3bM6iDJvbRpsc+e5jFPYtmcdDnMNBZPOwnBasIUNAdPUjJs8aOAIjka8CbuMbnzcAc381Ho8l6t55SDFayRv+AoJgz6aG++se0r3HwYFUvm5XdSpnw/WAc0yRDlFC5CEbrtkJ0uYfyD2UYPZpeX1TsR6EW3VoawAyazXJ8HSU6QDJV3DzjT8/v0m0CFthjcFEz+UDKnUuK/k7l3sjut4m7LQPCbEeOPj55bbxsa7YpIKu+wCoTkd/rc8q1b2kKnLKRdmUD354zyH3Ca0bLSUyykQbJk7EN5N7FGW48D7t5KWHMM8j2DqYcSUcazsCe196yUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjxcx0sB; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjxcx0sB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZKrn0rs4z2xM7
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 17:13:44 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FEE601DC;
	Tue,  9 Jun 2026 07:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D341F00893;
	Tue,  9 Jun 2026 07:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989221;
	bh=xpvqltnPyHaKeLXzA9Xq8lTFZuFUY8y5YG012UOsqCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rjxcx0sBgDiEMRzB/7X8XkxLuCVjsO7TGrmnDfdnehXL9KI9qfxXwIJvseL1RwT0x
	 gJzwPNXoDsWIwK8j72/iv0G+SPQcKO2l0t4LNadxY7JYN56Z1PJwFkxzedWXHNhx4g
	 t6nDooNTkEIxmd/kBELBlOMadB9VpZQiIrlrYQqa7As/HHTX1df7zVa8ydlJsOKsr8
	 3/Xd3+m2QzWoRasoQ3mAtG5KFss1UjF0u8UDsAKGz+B9Inq9384bYHa9y7T5NlbLM5
	 IQ3M/80ubT7AlkRBtDeMvI5c2sHKXo1oKpxCoyBHK8BMRq3wBlXf0f6UgXmcsJRyRa
	 kNHdlmDtKOVWQ==
Date: Tue, 9 Jun 2026 09:13:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com
Subject: Re: [PATCH v2 1/2] arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory
 reg-names
Message-ID: <20260609-tidy-defiant-kestrel-cd813e@quoll>
References: <20260608175418.1936892-1-tmaimon77@gmail.com>
 <20260608175418.1936892-2-tmaimon77@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608175418.1936892-2-tmaimon77@gmail.com>

On Mon, Jun 08, 2026 at 08:54:17PM +0300, Tomer Maimon wrote:
> The NPCM7xx FIU controller nodes only describe the control register block,
> but they still advertise a second "memory" entry in reg-names. Drop the
> bogus name so the DTS matches the resources actually present in each node.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


