Return-Path: <openbmc+bounces-2067-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51509CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 07:20:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZxxv1D4Mz2yv2;
	Wed, 10 Jun 2026 17:20:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781076018;
	cv=none; b=XUgwNmHxWypzsYsMY9rTEyDgS3FsumqmIK8fEGGI+o4m2yqiQ7BKqfno7LTHHi0kjaaNsPA9t29FKg2alJhgEJr+gukBzqE7B+JE8taiu1hGmNkNzQ+j7WZrqoIIg9NnhyoZXwIzzYQUBLkykjqZminEy+wgJevHX9Y9TSquYXP/aZ2LyrNeiDd14yi0st8gtx5uxP2GPemnd/k+HEVqVrWZXv3o6Qd70hrWU7nldK+5EnjpD8ONzCB83or5nv6E3eXsZpL4uGVbwCGuj6suGvwVJUTmumqUe12aGdJia55g8YUgsUVvpULDzew4mxbeyMJhnP5KZ9ln4W/BaosgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781076018; c=relaxed/relaxed;
	bh=CCtSf4K4UeoThy86BYUBsZ/uQUCq2x1f4T70+U4q0Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/ZqLZ+zTrjBi7WIWmPeyA88RQi+qsguRBhTTrUDgftB11T3YWZOW2338whz9PRh41XDR1gDLuuaUWFXLA44K1GOqi75M5N+L6szFmg+T3HjgeqiVWBtnlOBHLjWYY0rRySmJTj68FHUAP3Gt09CIsmu5y+ODEztJ0co0XqD7Zu0K+HOH/oUaT3q/ex9HD1Z4Fuh+avCKwOLW7y4r+wjQnu8+QVvaE6S36jIA3n7HfLoZd7JYsOEvtUlQ59nFeFrrUrthyzka2FLNXQaTKlzSnvsiPr95or44naDLJCrZb4ysIUeuCmtag+/pk8YE26+Vc7/Lzx0cF4/x5nM4t67SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bd6IYTCh; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bd6IYTCh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZxxt2c7Gz2yb9
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 17:20:18 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 943866001A;
	Wed, 10 Jun 2026 07:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541901F00893;
	Wed, 10 Jun 2026 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781076015;
	bh=CCtSf4K4UeoThy86BYUBsZ/uQUCq2x1f4T70+U4q0Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bd6IYTChlH1Ys6Zyby8r6HWyEYpJXvpQClQ8GdOHlWqH3c6CaSvT/eOMVi3o8Gp2h
	 6brLwJb3atT40JgvqjOB0Wg+lrwxg+sYv5AbvwvQYxHMt5iFi2RaXF8IGLBLXION9k
	 fIOXiL46W3/6o4ohynRDzB0v+WkpZFxLIvN/X3LVMdgVm7bDY7QG29Ys/kviVcwjSC
	 esMZ1rGS/0YnkB6pP8hDeYFEAQ20dPykYh766aYctrGeYcTRlI85Ma9y9zXcCVkIPP
	 Uh5znHjCT648VfouQ8nq8SBdiDk5yAxSeYXtmHuIV6FxyeEzIpbkhlvMDj5eylzZT3
	 JYuX59omoCrGA==
Date: Wed, 10 Jun 2026 09:20:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com
Subject: Re: [PATCH v4 3/3] spi: dt-bindings: nuvoton,npcm750-fiu: Convert to
 DT schema
Message-ID: <20260610-competent-alchemical-chamois-275ddf@quoll>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
 <20260609163919.3321228-4-tmaimon77@gmail.com>
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
In-Reply-To: <20260609163919.3321228-4-tmaimon77@gmail.com>

On Tue, Jun 09, 2026 at 07:39:19PM +0300, Tomer Maimon wrote:
> Convert the Nuvoton NPCM FIU binding to DT schema format.
> 
> Document the required control registers and the optional direct-
> mapped flash window separately, matching the driver behavior
> when the direct mapping is not described.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/spi/nuvoton,npcm-fiu.txt         | 58 ------------
>  .../bindings/spi/nuvoton,npcm750-fiu.yaml     | 93 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm750-fiu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


