Return-Path: <openbmc+bounces-1952-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE78CD4F49
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 14:10:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gK08F2w60z2yDs;
	Tue, 19 May 2026 00:10:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779113453;
	cv=none; b=bChXG420oKggCmv9y1vSUD+ANhLrbWEP6nheqK/J3wLMlZ7LMULxRawp0aOa+5cNEaOTN5w4/EuKfWkfa8QC7WZkBI0yyDL45X3MC05t++2gCuoyo7Xtyq7DCo6UiymnW0tjpI+BPYq8QZ/1L0OndkqDSMEi6ejd1rlpMD2o26Mb1DpxjIabBuAxdTseK16snDNE9bKkslhrWL3bO+Baq9q7xkU9tNh1a+sYNK35MqZ1IftQgIrbDhy1qWpzx3SGDk8RR+mn33CrmdlmuyUnQvn+m6nLgTaF0kk43EUM4ETSS3TuEx1BeF7lF2z7sZCfxQyOMAetiSler8dp3NCxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779113453; c=relaxed/relaxed;
	bh=1alSj94YuEfukPWP4WcXUEcaLgnZ1EGa4nv6Uf1+JHw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bYyCAW+J5nlAsrmVqHmVKSZFBnLdNXRD+M9fgTDFBZRovNcqGukdxwf0zDYwLM2IFlvsByHePjWsyUEGu1LpT0XfqvrbP5l42w7XFvQ05/OpWqq9LKkgcHXe/2BNsRg1lK69Ja7pbmy81o3VxbLyrf888ZuGnObXyKB2akEWAOQ1FnkHPJXyp/zkR+BD+LNrBWjMmjKMGdJcO84PoPpXrenhHmTM4Mr2PttE9H1ny+ltg6z6Z0DDzlazgx8m+JBmhR5FbOmM5CEW3bYjbPWY7IfOAC1gPDr0hyfB8zdQnL6g/7arby5NwfXddJ7I0l9smtepsjqhJ8BcfNAA2wdFZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G+6YWXxT; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G+6YWXxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gK08D2hSxz2xPb
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 00:10:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779113451;
	bh=1alSj94YuEfukPWP4WcXUEcaLgnZ1EGa4nv6Uf1+JHw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G+6YWXxTTQ3RyWv6z/ZgHjx9+dVPjy1gRaTV9TaZ4JXiHhUKCdV0UCDffEaa6dHgU
	 stGQnFS3d+CzZcalhZkvzA74lsLPFWiYPZ1sGrdwc8RUTe8ibb3OA+j4zDH28BsU5/
	 UVQWJ1nHn0L2u90sNjirUKh4D8Iiyh/rcVHoEXmLqT2zGlgeFPC8MFZNk0+Rr/CiLA
	 IOg/14xJAt2bxuLKEd5e0Ehq6cTajodsYrin2LVRDPKXErbsHJT27AeoQstV1P57fX
	 QI9jkcajKcOf0RpIXomFepaBpGfbl/UUQ0AJxhtPGoUZXrJt9TkpJfrj28I7uuEMPM
	 0nRhfOn1Lxp2Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2A90A6025D;
	Mon, 18 May 2026 22:10:50 +0800 (AWST)
Message-ID: <b9439e9501bb50ebb4a60dfbfac9b33a68c62878.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/3] ARM: dts: aspeed-g6: I2C/APB cleanup
 and AST2600 I3C enablement
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Cc: maciej.lawniczak@intel.com
Date: Mon, 18 May 2026 23:40:50 +0930
In-Reply-To: <cover.1778692820.git.dawid.glazik@linux.intel.com>
References: <cover.1778692820.git.dawid.glazik@linux.intel.com>
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

On Wed, 2026-05-13 at 19:30 +0200, Dawid Glazik wrote:
> Hi OpenBMC maintainers,
>=20
> This series enables AST2600 I3C support:
> - moving AST2600 I2C controller nodes directly under APB for
> =C2=A0 consistent SoC layout
> - documenting `aspeed,ast2600-i3c-global` in syscon binding
> - adding AST2600 I3C controller nodes in aspeed-g6.dtsi
>=20
> Upstream status:
> - submitted upstream and under review
> - no unresolved design concerns known
> - review received from Krzysztof Kozlowski (`Reviewed-by`)
> - upstream thread:
> =C2=A0 https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linu=
x.intel.com/#t
>=20
> Please carry this series in OpenBMC temporarily to unblock
> platform bring-up while upstream integration completes.

I've applied the changes upstream and backported them to openbmc/linux
dev-6.18 as part of that process.

Cheers,

Andrew

