Return-Path: <openbmc+bounces-1665-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BD21091930
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 23:15:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcM474XvQz2xnj;
	Fri, 20 Mar 2026 10:15:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773962119;
	cv=none; b=QU2oCZrBtGlsaV0lrUooG4ul1L058edX609I5K9qmj4W4EPZpPIvrIFY5D+qh4+xHZGEkrDFRu6/W+QMSghEVkpHipl9kvPZCYkTm0n8y1z6PK84LeQWzaAL6O7Zj8Dz9x3+lzKKwd5292ET6HLuRfNoQJeDxUAyOvBQWNFiU8H7MQg2sQfECkSiTTWqxgx5idpt9OypD+J42CmTAWJJ//XscP5fKovywfCzy4uJn92lZaGQ/xlSmX9qyz33UrLLyjK+sATSvWJQSvSwlAW+sN6EVXGYBzFhUElYtRQgUWu4MpQyqV3LfW9yRA1eNUiI90GLTneMNUq1oPpe0nQHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773962119; c=relaxed/relaxed;
	bh=8kspLYssXEfN1OwOd3UdOkgBnmEYfiKpsp6Xq3hKlsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuY9O6hWlr4H2vuCFbohWdoHoC6pYdFRwwBvc1MnJcAkArLbX4ZClvleoZPOC262r2I5/cHLbyLYW9gznzo9JXJtlT5rEIGwcBDCg4wrJINLhbH/3FgdA/p5QuK+uPwuqRClwf1kP4L/5/fMp9Q+XaTck8oOas4zUeWFR6/08rJN+MTmCA71fR2yT8vno9Z+he0GijnlysJ+V8CIHhMAaO4RxvOFLtD/WYB9wbqDzjlE+QdRCSTGnDdZtryL7YqLGbeTealN71cTVL55AoZq69r0olWFFmprgj2AH5d+i6EFhzj0LOLuyiL2rMm/LhdMuUs58VWfmt2SwBxbDiW4RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NehrajKM; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NehrajKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcM4644C1z2xN2
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 10:15:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 179B360053;
	Thu, 19 Mar 2026 23:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C13BC19424;
	Thu, 19 Mar 2026 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773962114;
	bh=ykzcs1kIHC7HeFzO4sQnuPf9xEymI7+Cy5DsxqC7jQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NehrajKMSFGpGnxRGsWhkazvNOwX0Aktu/wcEIC9/8OBL6uxiiDaSzb0mlUJwJx6+
	 WCcYPsouUyoSWQLEELbb4vWxVuctnO3Ur2yrwG2wUrxVxJJV0maBwdriPL9JJL2e0S
	 lHnJKoxixcpWaVEoyZx5E91HWWOr2HuGO9JzpDU4mg7q8yQW2IgoMybo+m0UfF350G
	 1Ij3Ycjc8s5W+oz9oemP2+J4b47QzZlC8z1yn7bllzJINPW8hLkdFh67AV4rrY/hbs
	 AhATMO1pKS70MXZ/6kNurWfVB+XZpgdCSIGaeueDUM1jHnXRSBhFk3+9v/AaJJbkjF
	 DhZwSOZUc3oKQ==
Date: Fri, 20 Mar 2026 00:15:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: npcm7xx: Use NULL instead of 0 for pointer
Message-ID: <abyDR-UDvBbID_OD@zenone.zhora.eu>
References: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On Mon, Feb 16, 2026 at 09:58:26AM +0100, Krzysztof Kozlowski wrote:
> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
> 
>   i2c-npcm7xx.c:1387:61: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

merged to i2c/i2c-host.

Thanks,
Andi

