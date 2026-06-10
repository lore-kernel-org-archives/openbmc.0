Return-Path: <openbmc+bounces-2066-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50C3CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 07:19:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZxxJ3SXLz2ykX;
	Wed, 10 Jun 2026 17:19:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781075988;
	cv=none; b=aSzW26vz6thdBQ6r5WUhl2MLaRykIwBiGlvdlDFppapweFnLqoUHVHUpZRaqIT7GiPjeaMGA0Oso3idLYhST7/se7GnReGwr+RTIjCZ/45i4I+wBW1CTThICjb5sOetUk37/UQqyqiiXqmBEdtnn4n4e8+gg+LTxsY6+ukDTGxF+LNnfj0fTyCCoqDZ2toY07vHHpiyzaQlEvjiEHPMwawTyTvqmwkPDI7gXkKGoqKg3osu93W1z/XKaZ40/qicxSn87b4io6CtYsJN/VupOy4S2PTNsDh76Jd6KOGzXJsR0g6t/nSHYJD06hzuOPf3PlwHk/Oqx32tHgd70oezOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781075988; c=relaxed/relaxed;
	bh=rjwFTRdNvLxvPPDpr+jTY+IlrAUHfWKYH4EjDiBodsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9tgOhloLyHZzgKbaVNoFXmR4l0aQI+pxTwBACxs4TVvlnAMUobuCFsaC8HuSBJhi+RHCM/yH8ZAj1iWK0HSw9xwwBP6DY1Zd7Xj+4H6Un0iakUCOUMvRySflTjzUH9jMzX0jf5d0ux/RcCf5dP3nZUaBUY/dlrW6y33zquIS99dsiv4IMuBaH6BocHwuK+0VpM5yTPcULdgeuEwW0NrNI9ULFZ7eCmnWF4MztcsndBAC87mWV9SKOdaDezw5RBcn/HTeW9sIxenk+NFpwbEPO+A0JgqpuZa4BknhybjmGPL7uZE/hkE8jf+KBDqw4T9oPN1sUpr7ECHEJHgNbKiyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjR92Mzz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OjR92Mzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZxxH280Qz2xwN
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 17:19:47 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D98B5433E9;
	Wed, 10 Jun 2026 07:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893601F00893;
	Wed, 10 Jun 2026 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075983;
	bh=rjwFTRdNvLxvPPDpr+jTY+IlrAUHfWKYH4EjDiBodsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjR92MzzJWslYuE6T0shpgjS7wJOOfv03jGQhmaxottEXFvfl0Jbo3EVz4f/W96Ad
	 PF+mdEoZCpRmhYbfIC9TRY58HTXViD0cW+9qGQg6hSL70QznoymlLAGy/2TYEnVT4h
	 iN/GytwXF9t0Yf9Bbe9WW0EGMAncaCwo3Ltas+dq58NfOceesfEJDsjrRXMAKSJ8fh
	 ImJEXAOaHuH3dRTwilKN5pKJl2h7N/8NpC2ncKWRJvQVmreMk66HRKkrm5WL///lmP
	 vhbbmXZC3JPh4m4Q/ekCuaYOM32pgdpRQyNzol+BcxgvJRO9WfhEbNUrVg48IcvFva
	 2zma4BN31YwQg==
Date: Wed, 10 Jun 2026 09:19:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU
 clock-names
Message-ID: <20260610-ethereal-warping-beluga-e499b8@quoll>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
 <20260609163919.3321228-3-tmaimon77@gmail.com>
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
In-Reply-To: <20260609163919.3321228-3-tmaimon77@gmail.com>

On Tue, Jun 09, 2026 at 07:39:18PM +0300, Tomer Maimon wrote:
> The NPCM7xx FIU controller driver gets its single clock with
> devm_clk_get_enabled(dev, NULL) and does not perform a named
> clock lookup. Drop the redundant clock-names properties from the
> FIU controller nodes so the DTS describes only the resources the
> driver actually uses.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


