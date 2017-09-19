Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NXR5xX2T"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ieMFgczc"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xx6Ld6dd7zDqF3;
 Tue, 19 Sep 2017 12:31:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D31BD20BC4;
 Mon, 18 Sep 2017 22:31:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 18 Sep 2017 22:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=IfnWRW4zR1Hgl6pHODzVV7T1T62VPc2Dpl+I+u2XJ
 nM=; b=NXR5xX2T7YacgVDcot8dmxACs9JUaav6IsO56pXMMsn8E8Id71GLqayqg
 TjsFDfW800mJ7HveqWY0smpOO5aEfsVZI9085MtgjLJ18fpRRJXMuWKywWmmZZjh
 FUYJhK4pyo0hYxUQ3sXOvkdI0265D/E+sC3rorckw4rgcHTW44trDtoGhNFA0nDz
 Upwg6kf+KcvE58/SJF1ywVNIUInLdJroO+T5Q+OLX/xZW3WF8kePkMSRlG2dJV3K
 rRHV6QHYMK3Ea4b9dREPcz/Cpl6N5vbky5hONdgVPHphJeg792ZzNoPLVQ5hJUm9
 +LceJ7uPNzGz+Ee8h78sAsa7gCqoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=IfnWRW4zR1Hgl6pHOD
 zVV7T1T62VPc2Dpl+I+u2XJnM=; b=ieMFgczc+0WtoAlCVrpDavn3Lrn1vND8ay
 E8T7LWJyAqxJOMAXSYc23MrbIT2VErd6yeKoCO4f7oIlroeer/2qwBIhXVMqUW3i
 b1+Z2mi1UjmKuTmpGDPHR/pSko/4r3BI/njTcBNeNkVMbCff54760bOzo6K2SrCt
 sXAGTi/+3nkGNO9aetMsQqsSYyJ9JKIzwdZ4pX2n8X0QcBVI7+zB1MYStKvfe9c6
 HDfACpYg+DFGG7fBxNpRzNyn2SoB2WOk5+iXUdeNZRjrs5Od1L9avSBMgMQSS29s
 d8o1QVYGo8FBIUKibbSOP4TD9qAbUG495cCUCnII8L5HzaeGvktw==
X-ME-Sender: <xms:Z4HAWT7RmgDiaGAbhSRBfQK9RnpOG1PUGMHlJhcftTutDUiOOBRaww>
X-Sasl-enc: amukjCYBg50ZrY8VWvxUq0T9na9Pt+mZZ8mEIi6y5/ho 1505788263
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76406248ED;
 Mon, 18 Sep 2017 22:31:00 -0400 (EDT)
Message-ID: <1505788256.4080.24.camel@aj.id.au>
Subject: Re: [PATCH 1/4] watchdog: aspeed: Retain watchdog enabled state
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc: wim@iguana.be, joel@jms.id.au, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, 
 ryan_chen@aspeedtech.com
Date: Tue, 19 Sep 2017 12:00:56 +0930
In-Reply-To: <bef08c5f-b0ae-a2e4-34a1-c9e1500b4234@roeck-us.net>
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-2-andrew@aj.id.au>
 <bef08c5f-b0ae-a2e4-34a1-c9e1500b4234@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7O0ssMshb1jqry7wQGKh"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 02:31:06 -0000


--=-7O0ssMshb1jqry7wQGKh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-09-18 at 06:25 -0700, Guenter Roeck wrote:
> On 09/17/2017 10:49 PM, Andrew Jeffery wrote:
> > An unintended post-condition of probe() is that the watchdog is
> > disabled. Rework probe() such that we retain the value of the "enabled"
> > bit from the control register, and take the appropriate actions with
> > respect to the watchdog core if so. Otherwise, just configure the
> > watchdog as directed.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0 drivers/watchdog/aspeed_wdt.c | 9 +++++----
> > =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index 79cc766cd30f..99bc6fbd8852 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -221,7 +221,8 @@ static int aspeed_wdt_probe(struct platform_device =
*pdev)
> > > > =C2=A0=C2=A0		return -EINVAL;
> > > > =C2=A0=C2=A0	config =3D ofdid->data;
> > =C2=A0=C2=A0
> > > > -	wdt->ctrl =3D WDT_CTRL_1MHZ_CLK;
> > > > +	wdt->ctrl |=3D readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE;
> > > > +	wdt->ctrl |=3D WDT_CTRL_1MHZ_CLK;
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	/*
> > > > =C2=A0=C2=A0	=C2=A0* Control reset on a per-device basis to ensure =
the
> > @@ -243,11 +244,11 @@ static int aspeed_wdt_probe(struct platform_devic=
e *pdev)
> > > > =C2=A0=C2=A0	if (of_property_read_bool(np, "aspeed,external-signal"=
))
> > > > =C2=A0=C2=A0		wdt->ctrl |=3D WDT_CTRL_WDT_EXT;
> > =C2=A0=C2=A0
> > > > -	writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > -
> > > > -	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_ENABLE)=C2=A0=C2=A0{
> > > > +	if (wdt->ctrl & WDT_CTRL_ENABLE) {
> > =C2=A0=C2=A0		aspeed_wdt_start(&wdt->wdd);
>=20
> Why call the start function in this case ?

... Good question. It was already there so I didn't touch it. I expect
it can be dropped - I'll look into it.

>=20
> > > > > > =C2=A0=C2=A0		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status); > +	}=
 else {
> > > > +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > > > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0
> > > > =C2=A0=C2=A0	if (of_device_is_compatible(np, "aspeed,ast2500-wdt"))=
 {
> >=20
>=20
>=20
--=-7O0ssMshb1jqry7wQGKh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZwIFgAAoJEJ0dnzgO5LT5YO0P/2w012SKGaAuLhqb3hI3Vxm4
K2UYvo4pGUZ50RpJAh+rRXmM6WcF4zYYeD3KvtHTeug6BXcAjnJLQE99NEDMnTlx
OdWGbM7mcLPDrb00UUkwJ7FK5pgNAIB04kmSkg5Ey1PXaUS8Yy9167BbVKbsA3iW
4po/s4cFMJU9PnEofXmGvpSeyckt95gYMc2r7t7SOKQk0WujNNAtacjS283EG+Gk
X/eIE2EfARVQTbBsIsjrD0Ah9FvajkEnu1Foc/v6Fb5a/oYBin798SFfXAjRxP/B
B5mGPmmTZuRnOET7OsoeVKw67a6bVwCzG+l1tvmQ/nADH866JMjihRLNucAsOtiu
v9IDNvaNHL+PqTdzOi+XHqliRBGDZP+R3afPniN4SH57NrH3rP4K7SyPeM3tc8K2
ofbj60kqOyUcXqSyzMM6t8F+hgzvRuZacBl+EujFYVf1gq+MAbca0eTilthAAxoE
VL44baTg4ePV/3KFiYGoFHditPC6jJffdehpcacLHr6RE38STDcYd8/2E+fqnSXo
DRt1ypKo3XAVmrukvUVH5uthSK76yIP1gtSGQT+uLFqyYTNv3qWIGOGTx5Q0qKDE
WT1q2mdVbiljqY+N4gJ/Z7Sgp7d+ZGKXPRef/F5G43Ox7nIq2Mnp9PiWCP1twZQv
e/MicuUiFu6d8Yw+AzbZ
=uKuz
-----END PGP SIGNATURE-----

--=-7O0ssMshb1jqry7wQGKh--
