Return-Path: <openbmc+bounces-2642-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4F2C9831E
	for <openbmc@archiver.kernel.org>; Fri, 25 Sep 2026 02:07:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hrYxb6F8hz2yqq;
	Fri, 25 Sep 2026 12:07:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790302051;
	cv=none; b=Y8uywj3jpNSOSmffkYHgb0f1bn8qn/emIr+vLZKZOH/WboY+PH7Ft12/M6ctdFAbBC/H4E6cMOwrfbBnMWuxUtD0Fs1csBeBRBn8LVA3eWDPx1wiq4AZVObCMqD99YT+/rH9QV3xlQVDDUa66/2Oe41h00vYqntfxcrTIEhXcKfAVP6wKz0ZrDG4Oxf1LyHra/HAI15asfL7k9O2zZ6FrGw2cMKr75ekmIsjGekWkOtJr82OePCrhlaXBiGBQPa2LgQarhyCdd8xVY4sXe59kJOY8we5BiZoLHUcjAyMiQMpV/JLDFxp2fpLojXz1C/pHAEtBkY6jRzoNpBTqQ6rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790302051; c=relaxed/relaxed;
	bh=SuC+Si5CoLwUqZAYShu0+3OnrzJPb7S4zX7HnpY4R4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAGrh6QNDZsiNnoQ2K7Se+oFDDhyAJZ7qg/ee06zp7N/RTv6vHtaSQnykU7t/mwBXkzYuXpP3j+3rQiUPBBre/RmB0Ljl3Nes80YpC6auSQWuH4g5gOzJwSX+SdOjo1n8GY9W+tuVuNFypxYnirqQyb26GLM77V2A9G3/X1boA0Ov5yRmtseBE0vK+4wc+Dc/E79g0X2ezsgriOMQUYTZ/zkLNNzkTtf1T1J/MT0O8xM/fjuKxxDw0pQ0G69JUuJWDwZR7mFAv1j05HG16NUn2BZSMTP0/vGmQiTRv+ZoQ77oyxjo4abMCNEOY90+mHG0yBxH4w5E8VKPCXR0QU6xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG/P+1A3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZG/P+1A3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hrYxZ5X5Sz2y21
	for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2026 12:07:30 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15DED6022E;
	Fri, 25 Sep 2026 02:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1121F000FF;
	Fri, 25 Sep 2026 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302046;
	bh=SuC+Si5CoLwUqZAYShu0+3OnrzJPb7S4zX7HnpY4R4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZG/P+1A3VgL/YdkJt/Hw2oq9jvajyESPCXj9yNhoT5XCoCBNfwYWz+vUOtZTH9mRF
	 qn3kHLI5hDYDcTvDp3fvCL0BVJPok/Ie1vCauJTYoO1uFLWwdYiiuWqTNGZJZF1/X2
	 6iBiQiWnvCu2VrMYU3ImjYcR1L5XyGXjYNB/0V+5ISj6dPSd0wQRgrSE1UuMm2kOKY
	 5lscoSdbbqES02EAmqOVpL5HeFwAltG2nY8VW0+dAN39at2zJC850nvJlW6x7ZZfbH
	 Y7FiC7+FNanOZ0Meiil217FeVhXgN/Slc4QtmsdqZh5zTb3bbasgUa1TAPa7k67++h
	 B5KGQSbiA7oOQ==
Date: Thu, 24 Sep 2026 21:07:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
	Patrick Venture <venture@google.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Nancy Yuen <yuenn@google.com>,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: soc: nuvoton: Fix NPCM845 GCR compatibles
Message-ID: <179030204429.2927607.14425350535266461647.robh@kernel.org>
References: <20260921232509.3126844-1-robh@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232509.3126844-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:25:08 -0500, Rob Herring (Arm) wrote:
> The Nuvoton NPCM845 GCR doesn't have any child nodes and therefore isn't
> a simple-mfd device, so drop the compatible for it. This matches the DTS
> files.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 

Applied, thanks!


