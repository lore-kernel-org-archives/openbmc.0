Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lsE0gsdU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1JPblRei"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447dSv3r0bzDqJs
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 10:29:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0311E22C10;
 Mon, 25 Feb 2019 18:29:33 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 25 Feb 2019 18:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type:content-transfer-encoding; s=fm2; bh=0uQ5d860eq5ui
 ZHjd2kxVq15uxuoNuXu0Kcq9kfLkR4=; b=lsE0gsdUxphZ7BEvk3bjYOygLyUgP
 Co4pmFbXUQ4Do90Uu2EwIThgGV0F4JTS1h7o+Xp0X73ncXlA7np4G5Va8b+uzesO
 vpV8qtNYeYypV/tyMnwzhjZLnIiihRlrLCiWlY9gj20/4pBunJbsrYjQfqrkM6cS
 GYVCjRcTjH8yYtZKh+U2ETILyzZOf1tKp1UUSxwENfh4kVMAStu+alz+N1mhdH4W
 uVNHavcyUfVHZy6ZnxD7WuF2yckQiHfjctpTSHmwZskKuqr8KuhJX6LoLSa06Ew3
 ADv+jViwmel9MgSR7t2nS1gSN5sWMAcNlPygQl3x8s3a8KC9kuytIzkug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0uQ5d860eq5uiZHjd2kxVq15uxuoNuXu0Kcq9kfLkR4=; b=1JPblRei
 mtFKA3OCnviBbMcmfKvvUWYeZ5J/TbeQu2Qfuk8BsOFaimypen33asaqKRh1Bh11
 EwPU+RyYhmRiDvBfMJ5ivhyNSa/4ypGDJQW8u6XXQNYQnPkhdyaWmnodsnzAMQBB
 6wPGvGnw45jYmcwyqpI9rflY2sHj42LVwwq6t+txSNfBIuWJoRYxGSZSHj0/ij7n
 amvYjLVFTVOAK3w+6QdQGemipTObCx9SEO+C6U17+FtPEf7+CuEI/+s9gr97j+oC
 83ADQh6gWYJHFgLnsfWvqlI1Sw1Z7Ie9B8dR2R8E33wYpSzjhJhWEvDyypUbQjAz
 HpisrFMNqUXgUQ==
X-ME-Sender: <xms:W3p0XL6f5GNbQx6vtx17jBwM7z1fdd2SxUw6JDN6oWkemh-oumDtcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudekgddutdculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:W3p0XJvFvnXNcJqrSVUgBWDxcaiMP7IJiUygGdf2pPjuOthmz939yA>
 <xmx:W3p0XDwWebq1Z0SzFbAwGzBgzoPvbroRwVT1aeKUKP_85IbUWuZRPw>
 <xmx:W3p0XBZkB1Lm_2bIIf9giorTdx0yN898I5Rjg_3c-m5vpNyjazDoxw>
 <xmx:XHp0XH-3PPLJz4ifsEBbNj39XCnz6aGasd-0qJ1JgL2iP9JSzcdLCA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F07B67C1A3; Mon, 25 Feb 2019 18:29:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <60aeb06f-9885-4b17-bbfc-4071bce56276@www.fastmail.com>
In-Reply-To: <VI1PR0502MB38692DFF848268A3BB778560DD7A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <VI1PR0502MB38692DFF848268A3BB778560DD7A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Date: Mon, 25 Feb 2019 18:29:30 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Thompson" <dthompson@mellanox.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: Patches for U-Boot v2016.07-aspeed-openbmc?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Feb 2019 23:29:36 -0000



On Tue, 26 Feb 2019, at 04:59, David Thompson wrote:
> =20
> The latest OpenBMC 2.6 is based on U-Boot v2016.07-aspeed-openbmc.
>=20
>=20
> I have a few patches I=E2=80=99m considering upstreaming,=20

"Upstream" in this case being OpenBMC, or to the actual u-boot project?

> one of which is a new
>=20
> U-Boot machine/board. Should I send in patches based off this older,=20=

>=20
> but currently used, U-Boot branch?

If you're planning to send to the u-boot project you certainly can't bas=
e it
on OpenBMC's fork :)

> Or, should I just be sending in=20
>=20
> patches based on latest upstream U-Boot, with the intent that=20
>=20
> eventually OpenBMC will be picking up a newer version of U-Boot?

Our u-boot is in a pretty bad state at the moment, and no-one really see=
ms
to have the time to improve it. Several factors make it a bit of a pain:=


* Aspeed's chip team produces a monolithic platform.S file to initialise=

hardware and work around chip bugs where they can
* platform.S includes DRAM initialisation
* upstream u-boot includes a C implementation of DRAM initialisation
that is almost but not quite entirely unlike the strategy used in platfo=
rm.S

An easy way forward would be to dump platform.S for each generation into=

upstream, but the suspicion is we'd need a pretty damn convincing argume=
nt
for it and for the removal of the C-based DRAM initialisation. Convertin=
g it all
to C doesn't really seem feasible either, as we'd need to analyse all th=
e
assembly for each release of the SDK and port the new fixes on each rele=
ase.
That's a pretty tedious task. Maybe some middle ground can be found thou=
gh?

I do know that Joel is keen to turn the situation around andmay have som=
e
feedback when he comes back from leave.

In the mean time I guess you can send the patches here? At least that wa=
y
you won't be carrying them in the yocto tree.

Andrew

>=20
>=20
> Thanks in advance,
>=20
>  * Dave
>=20
>=20
> David Thompson
>=20
> Sr. Staff Engineer, System SW
>=20
> Mellanox Technologies
>=20
> 1900 West Park Drive, Suite 290
>=20
> Westborough MA USA 01581
>=20
> Direct: +1 508-475-6375
>=20
>=20
>
