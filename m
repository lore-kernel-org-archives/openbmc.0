Return-Path: <openbmc+bounces-2021-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20051CD6E55
	for <openbmc@archiver.kernel.org>; Tue,  2 Jun 2026 01:51:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTv292Pvwz2yN8;
	Tue, 02 Jun 2026 11:51:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780365089;
	cv=none; b=cgHLaFVPyM1h1311czO0sWh57r2NiEyzmB5DOsDwLVoyQiqgf18FHPGQcarM21pZ95ZIYp/Zc8K1F+c6m2YT4idTjKjVdQ47jMxM4u7HpI1NFQ+Q8cjBmyEjN5k1se66OI2x2exJgYN0wFik6o5j2J1NirKJvQrxr0hYLRHS1+RcI3Zt9VG6uJacHp1/ekzjLhTDYisEsYz6l3j+lXzuxtJrkHOE7qx4MmelqCBdbb/3cI27ZtCO/U+9UnjRuNP/N1b+AxkfsZ4fekqmYPgiGqkBfTaCOaYwgPbrNRCaIx0Sx/VwGubnAKB2rDF9MPDh1K2YWN/VF90FR2s06C/6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780365089; c=relaxed/relaxed;
	bh=P5HpxtY/sXByaT89CvWSVX08qqDkOd9dnXXgEil/58M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TdS7eQeqWV9Jf9wsFKtA4ta1NND2OeF68r8vWRLU3Am2ZMHs5/HGWqG1SG+3MBYE9jtsSAc8GcTOLFxNeuxbP1610IAMAyzqLE4A2tC6Z7lZZyHkLOV1skObVSkIITLqmxIsJT0FWndHjjBlPHl0hOYguJjHINmy2CB35iaai8O3e7FFFwvNqy25olcmema/MNHpLJcDh2RHCZZ9GUIRQidXlZ5fAbJChUYvfgSfNWu5McoF37Au4LCIvGUR8vmgMRnxLkXUPeSX62KofYYtbgh8WD4kgEqYF3Ivmlcmcnd6Z8/8iLIRoIFil3rBWesGqc7rljs0fEK8pqXkHA7ivA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DQpX3WqC; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DQpX3WqC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTv276bzSz2xdb
	for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 11:51:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780365086;
	bh=P5HpxtY/sXByaT89CvWSVX08qqDkOd9dnXXgEil/58M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DQpX3WqCx9d7Jim42Q+nUaXn473z9UOlK74IrkcO49eGvwSeSYKVGfLExp0CPUVrg
	 AGsEM0LB6miQRyyCyKKGuYmJAgn3PmUGtZSDHXD7vlk9Zy5l0l+4cOne33yZMgnkmQ
	 tqb9XbRVbkJpMqflTXcXo46Ow77JJLk96dKXL2PVDDc4ljnDPghvMVwSFYpj7AEkZT
	 It0tZ6Ypnfa4lUieOTgARdGmFOwnaH5zDnq0U1NC9VakjqdEcqVgnxvDUiyy7CWhZk
	 2XzbhfBxqVXVdXKFY+yGoBSRfXekrmvd/qZqQF59fuihCoiyNDUpWrtxxAA9Fx9JEo
	 ohcpY7xI5t/2g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CA32A6024D;
	Tue,  2 Jun 2026 09:51:24 +0800 (AWST)
Message-ID: <6290059801029d8fa701744f199cebbebfbad515.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v3 0/2] Fix default value of mac clk delays and
 add DTS for Asus Kommando
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Ender Hsieh <andhsieh@nvidia.com>, Marc
 Olberding	 <molberding@nvidia.com>, Chia-Wei Wang
 <chiawei_wang@aspeedtech.com>
Date: Tue, 02 Jun 2026 11:21:24 +0930
In-Reply-To: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
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

On Mon, 2026-05-25 at 21:03 -0500, Anirudh Srinivasan wrote:
> This series adds a DT for Asus Kommando, a pcie ipmi card based on
> AST2600. Previous versions of this series didn't have networking support
> because networking wasn't working in rgmii-id mode properly. Following
> the discussion in v2, v3 of this series aims to fix the underlying
> issue in the clk driver in u-boot that adds in mac clk delays even when
> none are requested.
>=20
> First patch in the series updates the clk driver to use a default value
> of 0 for the ethernet mac clk delays. This patch also updates 3 existing
> DTs that use an rgmii based mode, but do not specify a value for the clk
> delays in their DT. These DTs are updated to use the old default value
> that we changed to 0. Second patch in the series adds a DT for Asus
> Kommando.
>=20
> To: joel@jms.id.au
> To: andrew@codeconstruct.com.au
> Cc: openbmc@lists.ozlabs.org
> Cc: Ender Hsieh	<andhsieh@nvidia.com>
> Cc: Marc Olberding <molberding@nvidia.com>
> Cc: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
>=20
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>

Applied to openbmc/u-boot.

Thanks for the fixes!

Andrew

