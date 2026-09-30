Return-Path: <openbmc+bounces-2688-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD0BCA5FAC
	for <openbmc@archiver.kernel.org>; Wed, 30 Sep 2026 11:55:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvtlx0LBYz30C9;
	Wed, 30 Sep 2026 21:55:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790769340;
	cv=none; b=Z/LcVuG/U38BBD8oUaifAl8LeU4uDsbULjwMRA5G9ZY6IAJpo0rUMsJGp1aKRT0L+twfMGe+24cRwRgmx2m1wUSCzWFwdWQFiHsPWF8mSYQzfkK+cdl3fgktggUC4272EaILe2xIpB80Udf/oycN4+7Rn03MYGthjJqCeJ/6e21dxpPdb0Y9g8q1t2XduF4vBD6GTmDfIRstc0Fcqy0nh5tjT2HX/CYG0Mga8eoDSzpTnas71n3QiFICG3WM96Xxz6I4BOpAbwYcMUX8cBZWU6Ub0P3yKQOrxdoYTV0oCfsA7V3qmtWcM7tpYJYzGb7TWD2csjMR8nxAFQ2GtopEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790769340; c=relaxed/relaxed;
	bh=5meFYk8A6OECXcbERFC8vfkK/C/8PqfInrhYe4+ifGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYNoUscvB3zVuBR3D7zvWSP+au5e1O7f7bsG/Bc1xApVWd8p2N7BxC8FSOIAHnCGUKgsZObx9uz2HWNNcgxF6eb0uZxTjIdVNltBdzAP1uGBfwwThdlEQBb5fRFuPw83afJptp37Q3JGYCZt8DOLh/ZSlPzG7XcjLuyUG2duIRcZ3N+Wb4tOYePoq6bzc3Ew6ZT6KXSc1l1ThR93TXudyScW8vi4oxh+6W2QjycBWVvuPQGZe1WXWLIe43KqJVVGeOHI1026bnnRlrfVCoIa3zPKOjAaCCKE4p7SpByXy7z5fSfQ+ds1EOLZSq6sNKy4PdVyvSJFja3OgaHgKNOW7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzmNi4Da; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzmNi4Da;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvtlv4cfyz2xwP
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 21:55:39 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6563D40501;
	Wed, 30 Sep 2026 11:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C5A1F00893;
	Wed, 30 Sep 2026 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769336;
	bh=5meFYk8A6OECXcbERFC8vfkK/C/8PqfInrhYe4+ifGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LzmNi4Daa51WDFjSoir1xbp6dOJXW+dMjTMrMdtLb43+u6E0X6pmPHDFH7bUpBdfh
	 evfZ6y5kYwH7O3rue728Rh6422nWbNsJiGvmI69G89oEhXRrych7qKgXibxv1hYKwz
	 N+vOi6fWtCQBWveRnn0uYoRqLUF0GrziA4Fv2IqQGkFGzUxZP8z6wbkTucuvvvYWMZ
	 EOKuBMTp75lPiDRgzTL0iRS7hAdnIojvWjFXz4vg2MWEbWbXGsRjab/84bbEc8egYm
	 0ud5d0aIdWGMJRYc4jSJtLPOsTKDbT2fRrbzlsxKsSmIh4M9pnwQj5Y7bum73AL2Bn
	 pI1jB9Jl9vtNw==
Date: Wed, 30 Sep 2026 13:55:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v5 2/9] dt-bindings: clock: ma35d1: Document the missing
 crystal inputs
Message-ID: <20260930-asp-of-pragmatic-discussion-16abe9@quoll>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
 <20260929-perso-ma35d1-upstream-clk-v5-2-68533e935ee4@bootlin.com>
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
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-2-68533e935ee4@bootlin.com>

On Tue, Sep 29, 2026 at 04:44:45PM +0200, Miquel Raynal wrote:
> The MA35D1 clock controller takes two crystal oscillator inputs from
> the board:
> - HXT, a high-speed 24 MHz crystal for most of the system
> - LXT, a low-speed 32.768 kHz crytal for the RTC and low power modes
> 
> So far the binding was expecting a single crystal. The example named it
> HXT, but no real definition for it was given. LXT was not even
> described. In order to remain backward compatible, we will continue to
> allow either one (HXT) or two (HXT then LXT) input clocks. I propose to
> give those phandles a name to clarify what these entries expect, but I'm
> not listing the clock-names property in the required block, for backward
> compatibility. The rates are fixed by the TRM, so even if the second
> oscillator is not described, the OS can make an educated guess.
> 
> Fixes: 2f8b5eb589cb ("dt-bindings: clock: nuvoton: add binding for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


