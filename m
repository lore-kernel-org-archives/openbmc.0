Return-Path: <openbmc+bounces-2308-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C6AC4452D
	for <openbmc@archiver.kernel.org>; Wed, 22 Jul 2026 07:52:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h4mgR3MF3z2ydn;
	Wed, 22 Jul 2026 17:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784706739;
	cv=none; b=nTMr3T4e6RzrZbrB8u4YKYdwlClMbwkUg9swsYwQBmhVlCCfrAwTiDjEOCGI8QY6fHxt2cfV+KEOiiNbWRDwNJu4itBcXQvXy7YDNeow7KTlWxzCVrJvqqtN82DkQgG8SHv/SBNfA0dS66nHR8d9zforo9+wNjMH2SYrV9kyra5hks8kzyWxWCFFZBKSTj8hdNcoU0xDHOVf1Ht7DAqgiSdbei7vxzDKBX98r1jkkuhuBOhz0XYEHnZnZ/B2QAePquGjiqwi2pAHs9irhLfoBXNstiQe5tj8bxSnTLgwia2Kh03WyLzcNk5l9S7E0jleJ4OvksHqmju6FhPU6aIoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784706739; c=relaxed/relaxed;
	bh=F0DOZ6IJ9ra0/dlBSWtiIdXa1p1W7GVECGzod3oAz00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JI8hwPgX7E1lBd2D1bB4hiA8Gu876BQ6idIj/GRbL67z0hdC3EWQVzWoUzxdZLNNlJvcdnwWccM/o0+hj/3D9jEB1oaMO8BOKHdcCH8At1gcvAvzp/xaAHCDLk152lWZzIL3XjIs67XYfOGKb8KH5OjNi+o2v6ArqJ2OpqPATCpfcnChGGZM46r0PenvwcJOBOGmSGel76K249z6ltnHrvXF3D26CTH0YG7gg96YS+/LJunqj0i5Et3lPM2a0viBO7RJQxx8UODSp7/N9df66RCI0Vw5IyED2MvkyzG2AXUxlyeXRfkvTOItXvtNHy5Dk2iFL2i5YD7hX3avaISNdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dGfWOxgQ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dGfWOxgQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 400 seconds by postgrey-1.37 at boromir; Wed, 22 Jul 2026 17:52:18 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h4mgQ5qWNz2xJT
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 17:52:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784706337;
	bh=F0DOZ6IJ9ra0/dlBSWtiIdXa1p1W7GVECGzod3oAz00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dGfWOxgQM8b6nirRFWRn9PTfUHrA5xIHQZBzIx9qrKgUwiomGtO1iWJ5XwL/JnDo1
	 jg7gjWJfkrUEqXd+2QnhKu8NO1p0ScMontpwibmhx3uTJxzeX+7zwbep6nJZbI9OSx
	 IPO3D0OyTjPs0o7+u/wU6oWLtvSOMfT0xw1pIx0hmHI2tXwJs7xeWkHCz6wtiGehrB
	 E5gCcMaQlYKxVUNZexGGUlPH9+Pp0sQe0kc2jGVhkUPyoA/LH8GgzCtEeCC91xfHjU
	 wIWGUI6OT38gJReLxhRh7NP12NFcRRhypHRQtODNP/yEJI/zK6mu1eNCfwRMlGSyop
	 nQrVYOTMewLAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 424E8662E1;
	Wed, 22 Jul 2026 15:45:37 +0800 (AWST)
Message-ID: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 22 Jul 2026 17:15:36 +0930
In-Reply-To: <20260710054849.3178747-3-jackyhuang@nvidia.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
	 <20260710054849.3178747-3-jackyhuang@nvidia.com>
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

Hi Jacky,

On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
>=20
> MAC0 uses phy-mode =3D "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays.=C2=A0 The matching U-Boot device tree does no=
t
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.
>=20
> The corresponding U-Boot change has been submitted to openbmc/u-boot:
> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvi=
dia.com/
>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>=20
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts=C2=A0=C2=A0 | 901 +++++=
+++++++++++++
> =C2=A02 files changed, 902 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nv=
l-bmc.dts

We now have scripts/dtc/dt-check-style, and going forward I'm asking
that all new devicetree submissions pass in strict mode.

Currently:

   $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspee=
d/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
   152

Can you please address those?

Andrew

