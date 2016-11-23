Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNl1y2rwJzDwC6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 12:22:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iVFi8MrX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MrX+YumO"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 40417206B4;
 Tue, 22 Nov 2016 20:22:28 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 20:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=hZkpzHRuenQIFan9CkhZh93xyFQ=; b=iVFi8M
 rXY0hVusITJ6B7Z+qJmGnCVPOQtBz6tazN1D9rzOd374AMro6EZ4dwniT5Aj2+uU
 HAAlwiTuAzrODyueIDhEkNf+OjKQ9ngbwhSLs5pRFbSZKitl5TAYoQO9xQ/TNGT3
 VyiacO9GbP2ETZ2Rv+XpO4BcXS+jtfAf2ZLKY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=hZkpzHRuenQIFa
 n9CkhZh93xyFQ=; b=MrX+YumO5qnw9y/1ORU6RNu3YH/vSH426hcnYGhGo6M6Qm
 B9ubKwXjUslNksRWC05nnP0nC9LEXEXdRSa/frKXERHSQa58buPxv6NwG3/s8UBM
 Pn99R10CzgLn23bqBdU0qJIV81O/vVnbatcULgCsmny0HNFHm/u0+ifOXDpYA=
X-ME-Sender: <xms:VO80WPr_phmQXKRW3mUonlkrPffHZtpg5mGmYb6nshUSZwAWH7mW3Q>
X-Sasl-enc: kGjaHVjXCB/hx84RjhMFOMcUSiya48kasC5mosv6Qn+s 1479864147
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D492D243C8;
 Tue, 22 Nov 2016 20:22:26 -0500 (EST)
Message-ID: <1479864143.2503.44.camel@aj.id.au>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Wed, 23 Nov 2016 11:52:23 +1030
In-Reply-To: <b6082460-d8a0-9dfb-9b84-9f98a660e6aa@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
 <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
 <1479784251.2503.18.camel@aj.id.au>
 <b6082460-d8a0-9dfb-9b84-9f98a660e6aa@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ejYZoQuWn1NrRL42sGxm"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 01:22:31 -0000


--=-ejYZoQuWn1NrRL42sGxm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 08:21 +0100, C=C3=A9dric Le Goater wrote:
> > > So we should set or unset these SCU regs when the SoC is created
> > > and=C2=A0
> > > derive the wdt2 enablement from them. I suppose that the helper
> > > routine=C2=A0
> > > to check for the conditions would be under SCU.=C2=A0
> > >=20
> > > or do we start a simple pinctrl model and slowly add the
> > > enablement
> > > of the pins we need ?=C2=A0
> > >=20
> >=20
> > From the discussion on IRC last night between C=C3=A9dric, Joel and
> > myself
> > we decided to start on a pinmux backend to help manage these
> > issues.
>=20
> Do you have a rough idea of an API that the SoC could use ?=C2=A0
>=20
> 	enum AspeedAST2500Function {
> 		FWSPICS0,
> 		FWSPICS1,
> 		FWSPICS2,
> 	};
>=20
> 	enum AspeedAST2400Function {
> 		ROMCS1,
> 		ROMCS2,
> 		ROMCS3,
> 		ROMCS4,
> 	};
>=20
> 	bool aspeed_pin_is_enabled(AspeedPinmux *p, int func);

Largely this looks good.

But bikeshedding a bit, but I think the function name should focus on
functions, not pins. The function maps to some pin in the physical
case, but for qemu's purposes we don't care about that just yet. Even
if we do care in the future we can internally map functions to pins
behind a pinmux abstraction. As such I think we can get away with a
small tweak:

bool aspeed_pinmux_is_enabled(AspeedPinmux *p, int func);

Did you have any thought about how we hoist ourselves from a
AspeedPinmux to say an AspeedAST2500Pinmux with this interface? As it
stands (without specifying parts of AspeedPinmux) we don't have the
context to correctly interpret the func arg. Already with these few
functions we have to test different bits depending on the SoC at hand,
and the 2500 has the extra requirements of talking to the GFX and LPC
controllers in other cases.

I expect having a tag field internal to p is enough. I'll have a think
about it.

Andrew

>=20
> Thanks,
>=20
> C.=C2=A0
>=20
--=-ejYZoQuWn1NrRL42sGxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYNO9PAAoJEJ0dnzgO5LT5jtkP/08pSaUIhHSmdr2vB7d+FpR0
ANI9ahJVc8kwsMOGZqgQ+LPEgRAAF7fUhT2tQqaBCZ3S05tJTQKbVjjr34GNb9mO
d4wpfg7IyuTpneijwiabF5o/04ybRNOqf9evMGBYNI27YlGf5hdhI97PgkN9SbUQ
eSekch1sFWuyEQABHer71vRuAA6YVY3s0CUoz7YuKuG9pwryPB1tda+XM5rZetpN
b7CjmTM3HOTfh4dUPFNCLKP/p9why3/ya3C4yJbHQQwD1vmpTEFIDpzcjNtHBET3
0N2R4rboDujAlD3k9vgP54xNS0jwLdpmPTWSyTUs5xaVZCSWONHBS2veAdKWVo4e
Y99t+xJE8FeweDlu2o+kj0bdm7nwqdy45bRxXNjk+rYNPKtYNWthliLKKOI7vvBY
T9tdyoM/4loKuyhvuhGlEaNif3Z6jl+SdrvZCtG88Ca9chosqWKnqfRutLJnsUxW
SGCo4/T13sET5uYKpmhVZgc5rsgscTnDHRm3Uk5Y6HoilT5KYhXU6oU8T8xYFwJa
Cb/S5anWe4m0oKZzDrs1EzuZNizMeNLlvJq3oLQxd+U1Y6PD4fj5q+7o9gx//acH
XmSWhhIlERPejwMQeZmiP3795x+YWhJPc7h78Gx8cpq6QCoJ87pfs1lPt5hsNIOQ
ELZKdnW6Rzpey4B/ruLN
=vsnN
-----END PGP SIGNATURE-----

--=-ejYZoQuWn1NrRL42sGxm--
