Return-Path: <openbmc+bounces-384-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C5C83F22
	for <openbmc@archiver.kernel.org>; Mon, 21 Jul 2025 02:13:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blkSk0hQmz30T3;
	Mon, 21 Jul 2025 12:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753063973;
	cv=none; b=aKmMYTHu31HD9A4R8uNwhiUJZyPn6uxOrVUS/5zxv1jCRgql/IuZnL5gQvDCQ/luxe/pGsynoqzUCFEy9o88CT1HqqsEaZ1F2qoCkIgS0N6Sal13iCWD+nbEIbUx0gPNfxmvf/cD8xGCJPjNNaGcAyfcrFsbR0oYZvkQvox87IwHTw+K1pA4g0ggRb629h8XqIdQiCNkAibMA7wTpL+OTW0c/12tf1ggEFvyeh9FtBrko4/m62GwltMyJhkBumamnycxzKIJTm3HsiiHeR25muTkaVinTwrmQ4JYfDY46pC0jbCk13E6GFMnJ58BMyOnPXvhLJmfrJNvLqRwcGBe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753063973; c=relaxed/relaxed;
	bh=FkhA3zlKJ7B2nNbB5q6wEMsFaY29unq8WxRmb9v+A+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HwgB6IkSKuq1FibqbJkayJfYffHjzljrqFwrBoWQ9L0lNs3Br5y4oECpLA2h61R6VOFvMaun9+aN4L0avIrG+d8ye7dyq2ug7ZaXQZhlE50bNpJEBzFw7yI1MYNYiYbVec7ChkdgkDz42N+o6hFZp3YtxoZgqLtl0QVQUwT8N6D2LhQFG3ZFHTZGsnD+x81h+jRibh++XLCbczPNd+ylUOAKL9vKU0TeiJT7XSUNqk3y3h4dcuJCGWAQU2WQrfM2Xvr7Xt+hv+nw1XXhpZPjdn+ZUJxb6iVKvug34oiCfW4iVDOhwJyXcwhFpexeteMbaaNqcHSHui9sOL1/UcMaRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=W9yrvj3r; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=W9yrvj3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blkSj19Kxz2yFP
	for <openbmc@lists.ozlabs.org>; Mon, 21 Jul 2025 12:12:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753063967;
	bh=FkhA3zlKJ7B2nNbB5q6wEMsFaY29unq8WxRmb9v+A+Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W9yrvj3r975nfRIB2Azd+aPqn8wG7OJiffxAhFNOUEbpLuLY8iqYshtb/HN45Gwd0
	 PeyzZ2wco4eqZibpbfCk9oA7zZ87jLcjHsiOO4IhvBIWYKRfySqqaG7mX454E0i3So
	 6owCi7NrpqqF+X2FwFSe7Csj/AYMNZuRByqjgGweYiQ/bleoaS87fDIPX/bji5KPI3
	 E83OOpH5vRfyydo0dK3VA5Tu7Ir1QCc9IHQUD5nsw1hE7HIDxRl7mhE2oLupvrNXS7
	 /gHzt7q1vqPpxXR0huEOvlFikQmQyN1z7fXOTabUk6uFAoSi/i/UZvprkWnXA46hHS
	 OMU5GvbOVP58g==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 13F6B640A2;
	Mon, 21 Jul 2025 10:12:45 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, 
 joel@jms.id.au, venture@google.com, yuenn@google.com, 
 benjaminfair@google.com, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250706153551.2180052-1-tmaimon77@gmail.com>
References: <20250706153551.2180052-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: nuvoton: npcm845: Add pinctrl groups
Message-Id: <175306396590.1248080.10609062611312790046.b4-ty@codeconstruct.com.au>
Date: Mon, 21 Jul 2025 11:42:45 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 06 Jul 2025 18:35:51 +0300, Tomer Maimon wrote:
> Add 64 missing pinctrl groups to the NPCM845 device tree source file to
> support additional pinmux configurations defined in the npcm845-pinctrl
> driver.
> 
> This enhances the pinmux configuration for the NPCM845 SoC, enabling
> further hardware pin functionalities.
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


