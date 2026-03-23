Return-Path: <openbmc+bounces-1691-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B72F4613F
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 23:42:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffqTm6TPQz2yhG;
	Tue, 24 Mar 2026 10:42:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774309356;
	cv=none; b=cU+jjGMRFGz4MV+qMQvs+sJdH8yELID6OqJey0NKRT4JvQn0WXxdXyL5RjtIaa17H9vhvQi+E+B/WhBBgf8lBBtJkEGnkqU+E+8DqWta5tOQv1Bj1s65ZByc9e2FQ2Kjj0ohtFDoSz8eGunUpzd/u+DXC+vY/dqlzHlR1ODONhI4c04qsOCxvqirg5D8Ra2zkWuHdSwulFsGyeWqqOhmyags8zyVg+NfGPfasoaId3KOWQp7K+27yMmtdOIVxy/mE6aOfyj731ttP5yXulzg31lm9Xo8yo0a6GWmajpiB5mb9/Z9AR7KSIFMlEzQ0nrS0jKoLEo82Jhh9L1/hJue8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774309356; c=relaxed/relaxed;
	bh=0javaRN6hkCgHy3LVYDA6Yfus4ok8bY/RS9BNxd7lpk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VGv7zfqiJGjf6BxwQ/xuSKR3Oh22gTeKB+0uLR4gcpS4cwVvh3VKDTXFwmoKXjJM9onvXg8FwEo+Gtkyhw2p6nScltG7D7R1/vu7k/4J+fOqFzp7msRROFWN8LxnSe9wRK8RanHMvBUE3VS0nvDD4gg5eBODvN2wjTYivZi15pkRgpuBVKdLhZpNs0C30vpfYc/XxsUSYZD0zhm64vPQ3piiuiPH18ydt8wfItW/4T7P424RC5zySid018WpMOChZIhT7nRPF+U52dV5e0nvxUABiopaUvYtz7bdI+xnS4TqgPLwfe/DhNMTDmkxg8zsrz29xgGOTM0W6USqstQSig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cl55PgCh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cl55PgCh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffqTl2vjqz2xqD
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 10:42:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774309353;
	bh=0javaRN6hkCgHy3LVYDA6Yfus4ok8bY/RS9BNxd7lpk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cl55PgChKhMDmaMZ3K0LsqUKFOaIDnUAh55JeSdtp+6wT9TgSgNZjBajmuYyA+5V8
	 oFN88H9FlVdjFnVT/8iqPDeiyGr/PjaN2dlRX8wr6Ei7djgRaoWq7traKrgmOsi5et
	 X+6e+BgA2BgBbDEfUe6YScr3axln5cQg8AbzfEnBAa9mrj7jqtUYLN4RbMozNiwqkH
	 HrFWaItvKxb3hMkw9cocI70IaBFyMngxxrihK0Qd6QnWH7zVYz0m+VcRUaRyEywJq7
	 aaWETYIWSdKZgdkiLqQR7W/QgHNY9G0pDtELCYBHHrxy0rtgn6hevi2MWKwdU407c9
	 FTCvGGGqOdUBA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 056756024D;
	Tue, 24 Mar 2026 07:42:32 +0800 (AWST)
Message-ID: <61cb0ad57b4c79d3a026d8ebf316ea95552fff93.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Tue, 24 Mar 2026 10:12:32 +1030
In-Reply-To: <CAJ13v3RhazyeTJZKnh7SOK2O51F2-jW7SYSbs4ro70pdvfKncg@mail.gmail.com>
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
	 <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
	 <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
	 <CAJ13v3RhazyeTJZKnh7SOK2O51F2-jW7SYSbs4ro70pdvfKncg@mail.gmail.com>
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

Hi Anirudh,

Sorry for the delay in reply to this thread.

On Sat, 2026-03-21 at 17:24 -0500, Anirudh Srinivasan wrote:
> Helo Andrew,
>=20
> After doing some more reading and experimentation, I think I might
> have a clearer understanding of how things work.
>=20
> Andrew Lunn's suggestion in the patch series from Aspeed was to patch
> u-boot to not insert clock delays anymore. And then use rgmii-id as
> the phy mode in u-boot and linux for all new device trees.
>=20
> I tested this by setting the mac2 clk delays to 0 in the u-boot device
> tree like this
>=20
> &scu {
> =C2=A0=C2=A0=C2=A0 mac2-clk-delay =3D <0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0 0>;
> };
>=20
> Setting the phy-mode to rgmii-id now gives us working networking in
> u-boot and linux.
>=20
> So how do you suggest we proceed here?
> 1. Add this DT to u-boot now, set phy mode to rgmii-id and set
> mac2-clk-delay values to 0. Networking will work in u-boot and linux.
> Update the DT to remove the clk delay values once Aspeed updates
> u-boot
> 2. Add this DT to u-boot now. set phy mode to rgmii-id. This means
> networking won't work in u-boot, but it works once you're in linux
> 3. Add this DT to u-boot now without networking. Add networking later
> when Aspeed updates u-boot based on the discussion in that thread.
> 3. Wait for aspeed to update u-boot, then add this DT to u-boot.
>=20
> In any of these cases, we can also now add networking to the linux DT
> for this card (it's missing currently) with phy-mode set to rgmii-id.
> No need to wait for Aspeed to update the linux driver (or I think
> they're not gonna make any updates at all if it's just u-boot that
> needs fixing).

Working backwards here, yes, I think we should add the correct (but not
necessarily yet functional) description to the linux devicetree
(probably best to point out the lack of functionality in a comment in
the relevant devicetree node).=20

Then, do your first option 3 above, except add the description of
option 1 in the commit message so people understand how to make
networking function for both environments. That way it's apparent that
anyone who has enabled networking in u-boot is also aware of the
(future) problems of doing so, as they likely will have read that
description. Please add links to the relevant discussions between
Andrew Lunn and Jacky to the commit message as well.

Any concerns with that approach?

>=20
> Let me know what you think (or if I've gotten any info incorrect here).

That all sounds about right to me.

Andrew

