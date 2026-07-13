Return-Path: <openbmc+bounces-2261-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C53C43458
	for <openbmc@archiver.kernel.org>; Mon, 13 Jul 2026 00:55:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gz3rn5mY8z2yRl;
	Mon, 13 Jul 2026 10:55:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783904137;
	cv=none; b=fLxApH5ZBvlEnJsVuNOkscvPFkebPTGPa8sOJgck27/77sJ4zg5n0/ueO+TEeJ6VwpJwnJ00DWV2EgFxp17RHyWA5Mo//9WvsMXW6BLYOlJwlp/MfDQutDOwkre38dP7czO0g7oxOrz9pfR1kuKB8E93CqAFh3jQEn2Rbc2MRu0R/XOPCaCVVeqqOn/LjiCNg7OvaHDnh3dX0pUlaVBtAnW4r/WvTyUUlSGCVgzMY0IyzrbQjkQ0vcUKXfBRM+fgmvzIT8LgyBcbEmn9v7ajj8tQQne+wy24FpG0uUOLKhci8UBuFAflhdng+tudGGc3jExrCzLwx6nBzLRIl8O4sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783904137; c=relaxed/relaxed;
	bh=xKtXzBNDxmDejN6/N5cmcHllaakS+IwJHtcrIj6XkOY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=MeXhbL4MIgblKSsNmKslomlmM2m4YWK1FsSzfvDqYsu21iAVyjlRLq5Z6tzs1oyQW4lvyI/i9ECw52Ldh4YxzTm8pgCUaKOD5SkQqEITUhEthqdHZfEQbP+lOMTfYIY3kvHyQFuZqVtlIHztA+emGT23FV4dyiYu+gGxcMsLv6WAS7EN7ZIwBe4UDgPk7IIIMqJPY5PoSads/4jJ87lQ0x9Sr104lBlpRUYP8iK/YhPFk9CLkJAwjmYEyxblsVK1IhYwxo42OF9x5H6v4jx+yqYrfi+2yLVpV84bPDHN9AOar9OGma5pmDz85wsihfEXkk1YREv6qQGJ6NPBdfB1IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=plj6QCWe; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Dk00ztJr; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=plj6QCWe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Dk00ztJr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gz3rk4qbzz2xqM
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2026 10:55:33 +1000 (AEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DA6161400112;
	Sun, 12 Jul 2026 20:55:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 12 Jul 2026 20:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783904129;
	 x=1783990529; bh=xKtXzBNDxmDejN6/N5cmcHllaakS+IwJHtcrIj6XkOY=; b=
	plj6QCWeABLj0WyItB4+c7CDKuQuMeK5clR2PQhAhGx9oc6fnRPdvYGT1fFvRsl4
	Kxr1Wvxw2riXEzPjaXkr32XwHHHjD38edpEFKI3axcQXxAqT8pH5+fWulTpMwVca
	VSPFT2g0lqZrwmDhrmniQaQpTkFGcwdKyoZnv3iVm4Rvasz5fnFjhenSRNTO+rAC
	zwfXCg854nuk01aSRS90K7aKYy6YRvrNCmflsJ+yLJ6pIeMO4/nonaDi5KZkUJ9q
	G9fXq2bNfKFljoRID0TVhF5Jmsh2D18gbDkJB5Tv3wPlqIpnyU0/FiAFLDyBdaXd
	ev+77YjafoQMbdwByZ40+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783904129; x=
	1783990529; bh=xKtXzBNDxmDejN6/N5cmcHllaakS+IwJHtcrIj6XkOY=; b=D
	k00ztJrfo2ZkB2jhGzkrLFCw+L//aBCbqlt+x5eRDEo90HbHgDqsbOOMDWXsl4Tt
	WjlRgKh/vCIrciP6yZkfgSEuFuThF9Jv4Z1NSuyXQyuSvZ+gohzEIAnXMFOqfEk9
	iysHkoph4Yg3YC0WZocDEmTa6S7W94+fcdZdqe148pOP7YA+3NPP1C8RsJL0TB5Q
	jeqUSUxRAu2dS9DI6qNl+egc1oKbI9JAFFnRhNNRbG0dM1X40x6+ZOcUHTK/FuYL
	BJPzkWvVfL8EGpPRfKL9sP794uPjqnPVWKoncFfGfmDaUPYgAjRl+cGsR6O+/bg2
	53iYg+pToJVa4CzSN7tfQ==
X-ME-Sender: <xms:gTdUaty02QA540Dla0vQE5zIAJV0wo1kwcGStCjERaZmQDW3gF9DVA>
    <xme:gTdUauzToP2N8-9VGIOHOJ-eVuPioARi7wO_SIQ1h_usG_YBwsX4ViWhkO4sP2_2E
    DSVpuDXylz40e0iEpqL1FoMKuGUwnDoBcpBczbIoIE0apkTFMJ2ve0>
X-ME-Received: <xmr:gTdUanYAhrbzMdD1AA1jDjemXqps2ILiIWuIVFvFnvvtIMFKCRmX6K5xWCB5lxgsmG3L>
X-ME-Proxy-Cause: dmFkZTGQLS3pfeEvRe47bqsLTG7MJ1sW20SwoMCIPbaLob3gEIHjWgvzyVjfMHWHWJIn2k
    2TWtpYNlnzx+nyPPJfakxpCVYzQ6Ciue9WVTnw+G/uRzkx0mRsXOYXQn5/Ih354ZUUClpT
    r7CzCiWqPkr/rCMd2jYTUAA2os0WAuCwVgiDOSxkLaLlGnObn0alxRIwGSgA3C0YTl8wAR
    a2SfB8Rga4M3WPpV/R+sDIlhFoZGBCltPSeqmkscFmZ8OkNbUiNLs6f2+LOv+WALzk518H
    h3yWu4U8ZUFrba1cqFlSk6H1JbO3gHW3NCTzAI7bi7YA4mzYsa5rX2NcdxdD/LfWBHL0Sy
    lb6UmzSQODVH1xGj0xzISSs/zUbY4ysEenYe4biIuNO9oUo09lBqz6ITWwYMBGzEV51kcO
    qDCJMweKc1TawsUpOGzjGl243UcOqJRMpvF+HLLapNjLFE/T5a92BvsVtbynycdPr7riW6
    yjKH3NazBAFvVdvM7gCJp37r2MYgqF7+xvQmx0K2qJyMl8nLhVRfcI4UNlaIRRGAcj8QT1
    UWcRUL71L54pAuGJL7hE2UF8MlnIdty9gTqZgIqDEVVyzIgd+1X7uA3vGLogFEhra2rQYo
    PJoZYvpr9dc8S54w2UNWkECWCA8f638QzjPTmhj65IW1Lj1Tn4Lct2HsR4Sw
X-ME-Proxy: <xmx:gTdUavWPPOCQM5uBCvcVBvCRXQUvorGqUetIGQJMdAUyHGPadFTfrg>
    <xmx:gTdUalixNGXKstDZI3BFZsP0vkQgfNITaqOaNkicDyp7XLlJ-YRPzg>
    <xmx:gTdUatvTVTPBkXUI_kpESEqRQELSt4eruWKfHz9y4yt517KL2uLVnw>
    <xmx:gTdUau5QiXi13e-_oMEzgHV8x88amzuQyPhsKYVRTGyUPjBBwyEqVw>
    <xmx:gTdUaiO0RNw9jRxdTwko1vEQPPXWN856PDWk62dGHXeEtEfcwVfa2eQX>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 20:55:29 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Patrick Williams <patrick@stwcx.xyz>
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
Mime-Version: 1.0 (1.0)
Subject: Re: [bmc-redfish-validation][FAIL] read-only 172.19.221.49 2026-07-12-155018
Date: Sun, 12 Jul 2026 20:55:18 -0400
Message-Id: <340B0096-CABB-422F-97D0-19160A16A5B6@stwcx.xyz>
References: <20260712225805.8F2CBCC1282@sjc-ads-692.cisco.com>
Cc: sridevra@in.ibm.com, openbmc@lists.ozlabs.org, gkeishin@gmail.com,
 ttruong@cisco.com
In-Reply-To: <20260712225805.8F2CBCC1282@sjc-ads-692.cisco.com>
To: Tri Truong <ttruong@cisco.com>
X-Mailer: iPhone Mail (23F84)

Let=E2=80=99s not send automated failure reports to the mailing list please.=
=20

=E2=80=94
Patrick Williams
patrick@stwcx.xyz

> On Jul 12, 2026, at 6:59=E2=80=AFPM, Tri Truong <ttruong@cisco.com> wrote:=

>=20
> =EF=BB=BFbmc-redfish-validation release regression report
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Host:        sjc-ads-692
> User:        ttruong
> Time (UTC):  2026-07-12 22:58:05 UTC
> Overall:     FAIL
> Results dir: /nobackup/ttruong/regression/redfish-validation-results/relea=
se-readonly-2026-07-12-155018
>=20
> Phase summary:
>  api-surface                  FAIL (exit=3D1)
>  full-stack-read-only         FAIL (exit=3D1)
>  chassis-CB                   FAIL (exit=3D1)
>  chassis-COMe                 FAIL (exit=3D1)
>  chassis-DCSCM                FAIL (exit=3D1)
>  chassis-PDB                  FAIL (exit=3D1)
>  chassis-Pinnacle             FAIL (exit=3D1)
>  chassis-SB                   FAIL (exit=3D1)
>=20
>=20


