Return-Path: <openbmc+bounces-1710-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27834F54ADD
	for <openbmc@archiver.kernel.org>; Tue, 24 Mar 2026 23:24:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fgR1v41jFz2yVB;
	Wed, 25 Mar 2026 10:24:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774394643;
	cv=none; b=kpvC+IUJ+vE7d+XpI2HJMKQhy8NthLC6iecMezPg5HRm0X/xTLg9TCd8P2QNHkqdMIfJfFL26wYpjRB63nDrQKeAG+I3ruvwISe1Y2IljbaN7FXjk8VoAIHoLyQv1SDKex4j9170/b05j0v5Zgza5LB50ldlG+s0PUfFgm+IhpOB5fc05bkOFSc9JSFUdFRblDuryYePaCCve3HKmjdB0yUVgcZ/S++/qPPmK3PTY9F4iKwXRc+sba/rTEQZ6SNY3S7CGeRfQoBQbcD0qNT2hA2Tx5g3IAKyiRB9PveUd6bPajZZvIfSQT/IxXYTZv2Pmrlxq61KqbuIluxrXkd6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774394643; c=relaxed/relaxed;
	bh=KoYPkRKQjDLtnqfqADgKxI+g6lwwOpujQjVT0+dk9pI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EU/PA6D4L38ffcL/4M88sRRfETq8F6ZCyP8HHvK+o7rbPtHTy6Yu91wyLcjDuRjO7jfg1R5JB58Q1HMKiwrtkjlsppvxZeH3D1P5rgN/hx/34H06xr96R2duV6Gp0t+EYjGGWHcRiJpyR7jq2sCeQp+TPeP8FYY6aMaEDybeATAHbu0Jo6I2TFDQQkoNtnFb+v2cqZyQReMQahLt5BivvA7EgXMSpHM61509Zgpp9ikjAYuAx48dXJz8PBXQXnVmllRXivhbs0M0Ywwi1zCsFJ+9uoQ7CMRAcWX6u9MgzrIDeBCLd7BPK44oGeXMMGdIYplFP0peA0MTh438LVwvOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GxbekWtE; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GxbekWtE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fgR1t43Bpz2xd6
	for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2026 10:24:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774394640;
	bh=KoYPkRKQjDLtnqfqADgKxI+g6lwwOpujQjVT0+dk9pI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GxbekWtEu1RCRbkVyCQu65dqcUq/zlRmpMGpvI/Lh9VULQP09jPoOKK1m9JiuA1RU
	 Vx30Rbn1U1y3c2e+qMDFZBSj6qZ9e9ylQO2KxbTnBznGAQp8Zhp4ANCHhqqyYaGf0E
	 c5icmQp1phgWYxtNsaOx2TO4QfF6RcK7bY5Wzd08YHhI9+WXsAVRwtDk0u4Kl/kwvu
	 5YX2FgzkoXE/6bJOAhl6Nyqy7TG0jZ8p4fnTcThfrRrkYY6HyAGqeaqi6GJ3d19yU1
	 U+KRmqumOcL6MqBY+j87Q1rvTthKh2O86XILzcUWICEKLG0maUWuVq4mslLVz/e7ZB
	 kCgKoAIUlstJQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E0C186452E;
	Wed, 25 Mar 2026 07:23:59 +0800 (AWST)
Message-ID: <afdbdf52f644585ce6bf1df8bdf39a5ace5e4150.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Wed, 25 Mar 2026 09:53:59 +1030
In-Reply-To: <CAJ13v3QLjmikAYVuxU3CN-GNq+PMq-531x8MJEciV3B7HZc1dw@mail.gmail.com>
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
	 <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
	 <CAJ13v3R-3p5mV0b3AqHyF8m4A=HnX4rrNoKQXYi69Mod=OsEmQ@mail.gmail.com>
	 <CAJ13v3RhazyeTJZKnh7SOK2O51F2-jW7SYSbs4ro70pdvfKncg@mail.gmail.com>
	 <61cb0ad57b4c79d3a026d8ebf316ea95552fff93.camel@codeconstruct.com.au>
	 <CAJ13v3QLjmikAYVuxU3CN-GNq+PMq-531x8MJEciV3B7HZc1dw@mail.gmail.com>
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

On Tue, 2026-03-24 at 00:08 -0500, Anirudh Srinivasan wrote:
> Hi Andrew
>=20
> On Mon, Mar 23, 2026 at 6:42=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Anirudh,
> >=20
> > Sorry for the delay in reply to this thread.
> >=20
> > On Sat, 2026-03-21 at 17:24 -0500, Anirudh Srinivasan wrote:
> > > Helo Andrew,
> > >=20
> > > After doing some more reading and experimentation, I think I might
> > > have a clearer understanding of how things work.
> > >=20
> > > Andrew Lunn's suggestion in the patch series from Aspeed was to patch
> > > u-boot to not insert clock delays anymore. And then use rgmii-id as
> > > the phy mode in u-boot and linux for all new device trees.
> > >=20
> > > I tested this by setting the mac2 clk delays to 0 in the u-boot devic=
e
> > > tree like this
> > >=20
> > > &scu {
> > > =C2=A0=C2=A0=C2=A0 mac2-clk-delay =3D <0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0 0>;
> > > };
> > >=20
> > > Setting the phy-mode to rgmii-id now gives us working networking in
> > > u-boot and linux.
> > >=20
> > > So how do you suggest we proceed here?
> > > 1. Add this DT to u-boot now, set phy mode to rgmii-id and set
> > > mac2-clk-delay values to 0. Networking will work in u-boot and linux.
> > > Update the DT to remove the clk delay values once Aspeed updates
> > > u-boot
> > > 2. Add this DT to u-boot now. set phy mode to rgmii-id. This means
> > > networking won't work in u-boot, but it works once you're in linux
> > > 3. Add this DT to u-boot now without networking. Add networking later
> > > when Aspeed updates u-boot based on the discussion in that thread.
> > > 3. Wait for aspeed to update u-boot, then add this DT to u-boot.
> > >=20
> > > In any of these cases, we can also now add networking to the linux DT
> > > for this card (it's missing currently) with phy-mode set to rgmii-id.
> > > No need to wait for Aspeed to update the linux driver (or I think
> > > they're not gonna make any updates at all if it's just u-boot that
> > > needs fixing).
> >=20
> > Working backwards here, yes, I think we should add the correct (but not
> > necessarily yet functional) description to the linux devicetree
> > (probably best to point out the lack of functionality in a comment in
> > the relevant devicetree node).
> >=20
> > Then, do your first option 3 above, except add the description of
> > option 1 in the commit message so people understand how to make
> > networking function for both environments. That way it's apparent that
> > anyone who has enabled networking in u-boot is also aware of the
> > (future) problems of doing so, as they likely will have read that
> > description. Please add links to the relevant discussions between
> > Andrew Lunn and Jacky to the commit message as well.
>=20
> Sounds good. I'll do things in this manner:
> 1. I'll send v2 of this u-boot patch without networking support, with
> a description of how to enable networking in the commit message.
> 2. I'll send a kernel patch to enable networking with rgmii-id as the
> phy mode. The commit message will mention that this requires patched
> u-boot without the clock delays (with a link to the above u-boot patch
> series).
>=20
> I'll add links to the discussion between Andrew and Jacky in both.
> Once aspeed updates u-boot, we can add networking in u-boot.

Sounds good!

Thanks,

Andrew


