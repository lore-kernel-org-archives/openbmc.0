Return-Path: <openbmc+bounces-1667-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690261091936
	for <openbmc@archiver.kernel.org>; Fri, 20 Mar 2026 00:12:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcNLK0jnDz2xnj;
	Fri, 20 Mar 2026 11:12:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773965560;
	cv=none; b=T2ibwXdvDXLPOSjogLsB/sS+HA3tM3ah7XVTdIW6E135p8OPmrXXnW+cJFKfCiIAmz1Da/+eN8RQuxUHk38BrfcRtaJDWzNfGYU4PoT6zj26nb4W8B4wsy/ikhcQfK5V6UjHpzl5R1Rb1eY7zZ9v5f27PcBsIOVLJmzONfbWZspR3KPOXGgX5sWEEhb62KkjI/cGdBRzAwAX/+yyj/ura3Ir1DoKAqwG853qS3ciR4D0A/KdFH5xKpxj7gSHrd1g/HOnme7NaM4Ke6k4gSU8jStmU7hb1hXZ/K5hJx4Bf/e2Whgg6kY/cDOc5fjRvlNJuJcx3wMmskEkhvFCEy+Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773965560; c=relaxed/relaxed;
	bh=3q0ePvMKE1iZqvjWhvLwnXUMyxmtUwEJF4J917E4tXU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KU126N9spuHTyj8oT4kPp+rfzxGJcLlQJZ87pQ+TdAOZuBUpCiImscBnm83ibactnJ8HcofBQSPxljATZouqgWnHs1tUGc13Rxr/C5OCRQOrbN+/fO0KeTX7if15VTsYbxXMZboqro+X78Jjx8aw5/R4D2myIsjlTHCj5DV5rFLgI2qYtSb+p/x6Qkij+02GST1oLmJHHOazP/N1YGfU1dWvP83cVUYUfaeeY28FCV+4huYMiA/Xat5TMK02wbnSIxWSjPlVSnLUV5lSPaoQnpsBAPofPewFFconUQUxj1dPmO4bQ1t/GgvUvc4Hw/XzZvyvjjn6/lZ0BlLF26DZiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bPJuMq3U; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bPJuMq3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcNLH5p1nz2xN2
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 11:12:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773965558;
	bh=3q0ePvMKE1iZqvjWhvLwnXUMyxmtUwEJF4J917E4tXU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bPJuMq3UBE8ewS1Bsq7zqjVw6mfyga+/l/5jr5ZEeOj4xrvNdeSwmP1vYsF909H1N
	 o7biIk7q4DzUDEV0lm8A43HOlJoamLgtVHxN17VMJ1k7p0kmM0vVJFhSmStpLjv7Rw
	 ggKSxo+2B96GjVlctIU8GWYT+njb0wQ60lW8wPxEczGxTB5r4myAzDzTbsFynpFyYj
	 zTbaKmyqLf4GPBRnNuA3SHe8NshkqsjFNWSMEm3czS6RafmQGDOSc7oFdV3T8UezgC
	 U4pRHdjwLWZIFcvFh5NKBfoHBYpVcMQtyyTYA1YeRbhwFoyY+zrNqgtfjmx3AQMM+p
	 5mVjTo4sdSI+A==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E408B60C33;
	Fri, 20 Mar 2026 08:12:37 +0800 (AWST)
Message-ID: <4abc5db08e32525ff923f4e3bf5fe91b3b94e2e3.camel@codeconstruct.com.au>
Subject: Re: TOF elections for 2026H1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Fri, 20 Mar 2026 10:42:36 +1030
In-Reply-To: <absG_8pQilMHGMnO@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Wed, 2026-03-18 at 16:11 -0400, Patrick Williams wrote:
> With this being the most nominated-for election in TOF history, I would
> strongly encourage candidates to reply to this email with a [brief]
> campaign: who are you, what work have you done for the community, why do
> you want to be on the TOF, etc.

Hi,

I'm Andrew, and I've nominated myself for another term on the TOF.

I'm interested in maintaining a seat there to provide input from the
perspective of the bootloader and kernel layers. I maintain the
project's Linux and U-Boot forks. An important portion of that work
boils down to ensuring contributors follow sustainable practices.
Sustainable contribution practices require early work upstream, with
all the technical and social expectations that entails.=C2=A0

In the case of Linux I'm the upstream maintainer of the BMC tree. The
BMC tree looks after BMC-related devicetrees as well as SoC-specific
drivers and build infrastructure. I tend to review a lot of ASPEED-
related patches.

I also maintain some elements of OpenBMC's communication plumbing.
Specifically:

 * libpldm, a broadly applicable implementation of the various and
   related PLDM specifications from the DMTF, and
 * mctpreactor, a nexus daemon sitting between entity-manager and mctpd
   for configuring MCTP networks in OpenBMC

I maintain other bits and pieces in the project as well, but those
listed above are the most significant.

I use my experience in these areas to provide input on queries raised
to the TOF. So far I feel I've helped influence decisions in helpful
directions, and I'd like to continue to do so with your vote.

Thanks,

Andrew

