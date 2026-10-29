Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B5606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WN/bnw+0
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFWwx66CSz30DZ;
	Thu, 29 Oct 2026 15:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793249377;
	cv=none; b=R01gfOOfwgr9UfzLat3FXrE0nKq2LCdLK2CROOGPQG9BmwIS5VrfgDGSdrzPM5x/lQ5X3qSIdyIHeztNf5Plf4n7SYfl6KDbtyyl8ocxeYUum8PzHEFqYaTpQrUiJ5oJbZM/I6ap1pm0CUFdCtC/ttqClUzk8astlqcj5II0barFaOaSmkhnDz7941Kyb6gi0NNeVDCaokkm8SobFv288504ktAw7mi3R9lQP9ei34oCPEKSSRGK2L+OxTqfm3+vbbg67SHA+kPe4CoQi6Hzhva2VQY9cOqSDai+qlsbUJFQE5fYXlwrV8S+bdrF7Ee5x+8t/YRUPP/cezoavK9IXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793249377; c=relaxed/relaxed;
	bh=KqlDv/lKIbXJf5MnUs8ijN9vV1MUr9em9UbgjbrVjp4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=clqGGNKLQ7L3Gmf+Y0gkFClePNPX8jsgsAb81vf85NQa+EwPz/yWzodFCWpiqW1aFfadg5J6BrNLD3fa4Ydkw9v23WbEu4sB9JAAMxAI1FOT6hcyKQM/t5iOKibgo8pZLwkhj4Wzocv2eE4rTqcvwqemf815PPqPTBrB0u+0nvyrLB3VLTeCUIJ2gcFkt6RgzsKhVbJ0dWBwtwI0UBKAFzYtA92WiE4eXL3TDGFFC01xjoCFFZWVHxarGCYx81BShAHUXXErszx0y+zoACpIS++RdAwc58vOJG0ec1TO1whr2lhutj98nGPkxM5Xwk/W4eidcm3joOcgiqMrM1H7RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WN/bnw+0; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WN/bnw+0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFWww6r8kz3048
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 15:49:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793249376;
	bh=KqlDv/lKIbXJf5MnUs8ijN9vV1MUr9em9UbgjbrVjp4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WN/bnw+0y3m6Pjcsm0QjQi5BduvBtb+74t+eWYCBkReO3Qm44q561l/KQ4MsF/SuQ
	 v0TlezfGFjth5gSUNS57/7IHsEpyOomnN9onB0NtnCbS3hx6sP8mzK3rzWdif2ufL8
	 Q8pUyDPsUu+UDrVbg7gHzSE23brHtj0AxpYxOJIXC87VjrbOolDCau/wVprT267oBk
	 yKlDOj16hKA4DJiQaUC+ObNKr/leK0/iBijdKAWRsmWZr/7bU/E3T43BvtVDOaqQU5
	 JHiiRMdRFItdErlUXdqK8k4aNBhT7ZKt+dlMJ1RG48ZwRKSHKsVYJV/eB+lfDYihF0
	 8rzg59BI0iC4g==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2D2D870D46;
	Thu, 29 Oct 2026 12:49:36 +0800 (AWST)
Message-ID: <eae7ce260fc3aa1538620bc51dd3fa0fdb1196ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/6] spi: aspeed: backport timing
 calibration improvements
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Thu, 29 Oct 2026 15:19:35 +1030
In-Reply-To: <20261029013428.277816-1-vince_chang@aspeedtech.com>
References: <20261029013428.277816-1-vince_chang@aspeedtech.com>
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
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-29 at 09:34 +0800, Vince Chang wrote:
> Backport six upstream Linux ASPEED SPI commits to OpenBMC dev-6.18
> to improve clock selection, timing calibration and address-window
> management.

Applied, thanks.

Andrew

