Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A3606A31F
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 05:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eT4g/5/V
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFX8f67QSz30T8;
	Thu, 29 Oct 2026 15:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793249986;
	cv=none; b=j7czyB6J+tQZ8oc1/eKLmjhHDvf0Ij82V05jECU7AwmwipnPY4Kn+2uE6H9TUpo1wZ/ZKECV7w/T8/mqvQAPpTCzx68TRI/IqxM3wXtf5AtrKH4wDAnEi0cZiSBf+CjGU7K6tGomHOQ77g4ji+p+XEVoKzyNFY0tdfBzFnG90U3l0JIm8ZdYpqg/d3w6wriWvfeKG2v/PKxdb1OPYY7xMlzUg9CAbVcj/NPWHB1S4QU24ArcWX2x45iAVrcgnpX+VUaX1Ie++pGGS4KXvA86Q8/5wKqzyUYQgfRZ+PqAD8B/wBfsthINXlxn5ESkEIaMECBVArYnxCaiWmgaVUQ4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793249986; c=relaxed/relaxed;
	bh=gfpl829Um8rHLscAJWjoEGk0eQ3Gdeo95iov00U9n1E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bU85w3teWd0ZsejcUeZ8bO7UKhDLoSAN51XWL4kAsiSmREHtXrPfeJ4lZhrAVUtI+GGYFuBUfrxkVyGhC1ERinXSn48zjr5lPl85jLVAxO998FlMu5XIazTHG90dYIOtG3hfZ0a0n5jaiAtNk5M3sIo+a2OVrC7/AvzkMD/oZOccjXo1sYmFdeEO40f0k5wsvwcpgB5dO508OCyScVbxtLmzXOkMaCLbffAVPSmFapRMMUwbpX/AynC0DgC/J/zPe6xiWQg1h1J59jqEB7rUR9hARn00gnchiDemfLf8VD1gxl1FI5cuMDB5CEWehH1SIf/B3ZipgHPd4FgXW+8q5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eT4g/5/V; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eT4g/5/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFX8f0xjKz30FB
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 15:59:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793249985;
	bh=gfpl829Um8rHLscAJWjoEGk0eQ3Gdeo95iov00U9n1E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eT4g/5/Ve6pRlOQri/BcX27WQ+CPqSuhwAd+Lq+Ut1l5Ta1Co64NdWncUssuGEcSo
	 blpS+TwSQkAcfDxfb2ShGUm92p+yb4FLoPEyjQE0C3pnMG8OOhVjztcmIhatc+i9K+
	 MqHQGiZfd5dggZFwMh2FzGD4AxuoyQuHLgd2PCV6QkuI5+C8lTAgC0nnu5c8OdXUE+
	 R2tGA3NDDIArkPlfI8HBQQ1Tnya1KnBCEPQwXhpVPvEgm8fUoTV0OMxwot3Sh9ORl0
	 Hm+KogD8O5UaVOZ95JUKQs6BFej0PpG+yptfAX5H2AGeHj76nFykfhEKT8ZXLGsTIJ
	 QVRmnQOghGSNg==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6553170CF0;
	Thu, 29 Oct 2026 12:59:45 +0800 (AWST)
Message-ID: <2c61959376d9e06a6adfb9fc24f9a4b855cde9c3.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/4] spi: aspeed: backport AST2700 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Thu, 29 Oct 2026 15:29:44 +1030
In-Reply-To: <20261029020205.335352-1-vince_chang@aspeedtech.com>
References: <20261029020205.335352-1-vince_chang@aspeedtech.com>
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

On Thu, 2026-10-29 at 10:01 +0800, Vince Chang wrote:
> This series backports four upstream Linux ASPEED SPI commits to OpenBMC
> dev-6.18. It adds AST2700 controller support and bindings, Quad SPI page
> programming, and 64-bit bus address support.
>=20
> This series depends on:
> https://lore.kernel.org/openbmc/20261029013428.277816-1-vince_chang@aspee=
dtech.com/
>=20

Applied, thanks.

Andrew

