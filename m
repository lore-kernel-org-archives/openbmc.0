Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jTQDZniv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E/1f2Wg5"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxkKg3V8czDqBd;
 Wed, 20 Sep 2017 12:32:23 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4900E210F2;
 Tue, 19 Sep 2017 22:32:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 19 Sep 2017 22:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ezJoJpmCJrAXjkjgFH6TuMNOMVj53qD71iGwqVcmf
 Uc=; b=jTQDZniv9Ua6MCuhKWmEfg4yUm2sOPP8DGsU05VtPtCIGlGz0BHfAnE0s
 1dxkGdVds9EsW7KpwjURkFFe+Q8G5k6u5IWB05XrBj+BJVux7p6XUIwiFsbqUNIA
 eypVw3HUK4Ep1RcvAU0BuOZpKXUshRS0bP6JMpeohf6VJyltva+qLqpwu4MdIaoL
 O/zOUw5mZ89MNvmj/Cg8Dic3GJFLuZWph2YM45tOCBEFJkdZgYrysCSXcZ3BSBjN
 cCN27m5ZxsMXWedMIsdFuJXr9sawIsr4i6NvAvgspfdVf+16ii1VBVL/H6l/LzpT
 cKBk0rd/ylowfkTz97hqqZw3ikmAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ezJoJpmCJrAXjkjgFH
 6TuMNOMVj53qD71iGwqVcmfUc=; b=E/1f2Wg5Xc0cTxf2Gy6jJfM536aE7/LF9B
 8Mg3c6JuMrZ5nxnx6zPwHClsLvNCt8a08udp9tjfUQCqUG4ZBsOCxj6h9tXwf9p2
 X3ISBp5JadKbfzkhoBlAlQVATJUfjsGnmxemPKxfXhT78m1M0Udn6NMa6elseiyq
 zOuSU0VjSolftE0MmosDeTDkEjXJ5yqWd4Doz2s/rJM3+quV4J/ce1QTc4ZIMqzh
 C9cMpAb2bUzYVflLzYo6ZZ1oNtbZ3IYP2vB6l0BttsP8RFpPk//QwmH+6ScuaQx6
 k3rG/s4C8b6qd/W+t5dFRuyVfUiTwo2BSlBCNs1cy+Q8Kl2SV1JQ==
X-ME-Sender: <xms:MtPBWSLjkbT19tfxmNmqn7adi-9fiqQUiUQiYLc-GTUakyVM0tPpFg>
X-Sasl-enc: 8j11RB7N0BOB4wy6uBrC4FSz2TqvpkMUYSueJTZXMoVN 1505874737
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E2F4B2432B;
 Tue, 19 Sep 2017 22:32:14 -0400 (EDT)
Message-ID: <1505874728.30138.3.camel@aj.id.au>
Subject: Re: [PATCH 1/4] watchdog: aspeed: Retain watchdog enabled state
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, Ryan Chen
 <ryan_chen@aspeedtech.com>
Date: Wed, 20 Sep 2017 12:02:08 +0930
In-Reply-To: <CACPK8XezE6ZSfSQ7Aq7g85imqXLuahWGu_SQzG=+LAq0UxSdyA@mail.gmail.com>
References: <20170918054905.16470-1-andrew@aj.id.au>
 <20170918054905.16470-2-andrew@aj.id.au>
 <CACPK8XezE6ZSfSQ7Aq7g85imqXLuahWGu_SQzG=+LAq0UxSdyA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Odyj8GvFf/6ZqGGVO+tI"
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
X-List-Received-Date: Wed, 20 Sep 2017 02:32:25 -0000


--=-Odyj8GvFf/6ZqGGVO+tI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 11:17 +0930, Joel Stanley wrote:
> > On Mon, Sep 18, 2017 at 3:19 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > An unintended post-condition of probe() is that the watchdog is
> > disabled. Rework probe() such that we retain the value of the "enabled"
> > bit from the control register, and take the appropriate actions with
> > respect to the watchdog core if so. Otherwise, just configure the
> > watchdog as directed.
> >=20
>=20
> This should have a fixes line. The code as it stands in 4.14-rc1
> unconditionally disables the watchdog at boot :(

I'll add a fixes line.

>=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/watchdog/aspeed_wdt.c | 9 +++++----
> > =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index 79cc766cd30f..99bc6fbd8852 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -221,7 +221,8 @@ static int aspeed_wdt_probe(struct platform_device =
*pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0config =3D ofdid->data;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wdt->ctrl =3D WDT_CTRL_1MHZ_=
CLK;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wdt->ctrl |=3D readl(wdt->ba=
se + WDT_CTRL) & WDT_CTRL_ENABLE;
>=20
> If we go back to before b7f0b8ad25f3 ("drivers/watchdog: ASPEED
> reference dev tree properties for config"), the driver set up the
> cached ctrl value and then tested the hardware state to decide if we
> should have the watchdog enabled.
>=20
> Looking at the driver now there's little reason to keep the cached
> ctrl value. I'd suggest reworking the driver to not have it so we can
> avoid bugs like the ones that b7f0b8ad25f3 introduced.

Alternatively, we can just drop the write I moved to the else branch
and rely on aspeed_wdt_start() to configure the control register for
us.

Guenter: This means we retain the call you questioned. It's name might
be slightly misleading in terms of the effect it gives us (configuring
the watchdog to match the driver's assumptions), but doing it that way
effectively turns my original patch into a one-liner to delete the
writel(). If the watchdog is disabled at the point of kernel
initialisation then the configuration doesn't matter until userspace
opens the chardev, at which point we'll write the configuration via
aspeed_wdt_start() anyway.

Andrew

>=20
> Cheers,
>=20
> Joel
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0wdt->ctrl |=3D WDT_CTRL_1MHZ=
_CLK;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Control reset o=
n a per-device basis to ensure the
> > @@ -243,11 +244,11 @@ static int aspeed_wdt_probe(struct platform_devic=
e *pdev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (of_property_read_bo=
ol(np, "aspeed,external-signal"))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0wdt->ctrl |=3D WDT_CTRL_WDT_EXT;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(wdt->ctrl, wdt->base =
+ WDT_CTRL);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (readl(wdt->base + WDT_CT=
RL) & WDT_CTRL_ENABLE)=C2=A0=C2=A0{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (wdt->ctrl & WDT_CTRL_ENA=
BLE) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_wdt_start(&wdt->wdd);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0writel(wdt->ctrl, wdt->base + WDT_CTRL);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (of_device_is_compat=
ible(np, "aspeed,ast2500-wdt")) {
> > --
> > 2.11.0
> >=20
--=-Odyj8GvFf/6ZqGGVO+tI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZwdMoAAoJEJ0dnzgO5LT584UP/229TQ2s++HAO3WAcDBRa7bR
Vgh4DzwfVjFFs3LtZg9FNFM2SjfOmlFVWyod7pFjMiLKrLqEghFivpL+ZP0ESItG
/Y0L8DKAVtY3SIkIdJOg1Wq9/0Unc9Ci4CqnW3ZSw6LM5ehkOxVfF8TsH6ipcsJz
Is5419Ql1YsC4yUvh17zMSTbHmB18AVoYiNgWMKJ0PO5dbsKf9aqJO0KOiL9ca/g
BP/VXmYcYyTqU0frXZAc2EggcdukAP3AjmTB4pRsUt0vp6k1f0nfGdWgF0eNSRmi
3/6/NaFak5ES8m3DSmfv5ur2WIfbamefWGNUNwRIMaw85eYpUp2wwIOV12388PYa
b1s4QO+88MEBLUgk5aCYiKyk3KiiRXxAC5ew5UrdeOoeWFRuyGPrLz78rZhTS4mW
OYx3gfLCEJzQgxHIItHDHx7yD8d+OCH1YxqwnO/TZkmMJk9+WTYGh/Genl4Oqv/2
8fvC/WyZz4f9D1dwDV7Ac1oviz78/qZlEzC9/ZVLth2QAIgMBsb/83l5+tF2242M
jKvQvBAXdVd6Wpts5sIABI64U++dD7MEVE2+bOnoqsGnf+QGZAOCcgxC+modGDb4
bD10l2hh8RuXEcS0hsBM0Vd5xv7ZscLyHcrM+I0c9eVRzojcpOBZh4nLvVLA6iM0
2kLMIb682UDnBIHAqY2g
=Z7jK
-----END PGP SIGNATURE-----

--=-Odyj8GvFf/6ZqGGVO+tI--
