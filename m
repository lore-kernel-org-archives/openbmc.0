Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KP3SOJNi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KHaHEWm4"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJCsR3rmkzDqBc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 15:45:31 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C1C7620DCE;
 Fri, 20 Oct 2017 00:45:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 20 Oct 2017 00:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=73A0jcxx97djORmXTHFPZZ+XTZsy14HkFm9Tih4M+ug=; b=KP3SOJNi
 E8pJOkHa7hlkGPL7g3dWzCW5HXY8pP6VxxcG7eQdSRHmi/kvTf1Q8mMy+KtW3RHJ
 jXkNtxk9DvtAOyaiqYlSvaa2wGjuhHUXMnA21zz6VlTMaQ+euJTB4p1CWhUaUonR
 1sphNqJj9kUD5/eYaRjx3aov2s2jYmoWTaSQSFmabluWAv36lmLxcXL3PDtzrX9K
 UtMpdlBYWiFqXYYOcxGGksG4B2f+W036dFVk4/Sa4jtgdYuWJEvHrOmCQIsmoliy
 0XyegofOYhmbH92zCeDIQMjtSn0TasoKIln9UNL4wTtEBVVNoHOUift5p7YdbmkE
 oH2y5T0uFZMWag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=73A0jcxx97djORmXTHFPZZ+XTZsy1
 4HkFm9Tih4M+ug=; b=KHaHEWm4Y0hhrWaFgLmOhhZveI9xAR5TkMw2EV8wGwMRU
 MeLxtGXqe3lBezUlWC/WWhlm4XgmM1TNiJevB/PbkptWLIlsO55FMzb97VH7NhIV
 FL4mCUvuHnycLeVZaKe3rGmrTlOvcN4D2l7T9xfRJEqeZ35NN3J2JvjINGQGQIc1
 aEcVZZad+bRB5EeegIkSyaIgMhwE9otG29SQgND/4qtMEPuCvWJFTGk8fVLbzEhK
 QrxvNFjOEwF5dlopE6yC2eBeU1Y51etAQ7Ms84EpeGo7Op5fWFjCZT04EZVec+K4
 10kG2PJMumPOIeOYJGMqKkp8mR1RZCQnXSYDbGH/Q==
X-ME-Sender: <xms:aH_pWRUf1CrGAmq-8P8cnEtk6XC3hDuJWAfh3eqihqirJVDUHBmQEQ>
Received: from keelia26 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35BF87E3E2;
 Fri, 20 Oct 2017 00:45:26 -0400 (EDT)
Message-ID: <1508474720.24322.34.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] drivers: i2c: fsi: Add proper abort method
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 20 Oct 2017 15:15:20 +1030
In-Reply-To: <9932860b-efad-c836-a46e-ba8a1c258bbc@linux.vnet.ibm.com>
References: <1507840944-421-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507875532.5452.205.camel@aj.id.au>
 <9932860b-efad-c836-a46e-ba8a1c258bbc@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-L+q29N136rRurIaet4OT"
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
X-List-Received-Date: Fri, 20 Oct 2017 04:45:32 -0000


--=-L+q29N136rRurIaet4OT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-13 at 10:20 -0500, Eddie James wrote:
>=20
> On 10/13/2017 01:18 AM, Andrew Jeffery wrote:
> > On Thu, 2017-10-12 at 15:42 -0500, Eddie James wrote:
> > > > From: "Edward A. James" <eajames@us.ibm.com>
> > >=20
> > > =C2=A0=C2=A0
> > > Driver wasn't cleaning up on timeout or in an error situation properl=
y.
> > > Need to do a full reset if we fail in order to re-stablish a good sta=
te
> > > of the engine.
> >=20
> > Was there a particular use-case that triggered this behaviour or was th=
is just
> > found in general use? I feel a bit more context would be helpful here. =
It's a
> > fairly sizeable patch and I'm surprised recovery was overlooked initial=
ly.
>=20
> You'd have to hit either a timeout or some non-NACK error condition in=C2=
=A0
> order to trigger the problem. Somehow NACK doesn't cause the I2C engine=
=C2=A0
> to get into a bad state. And timeouts it seems to be somewhat=C2=A0
> intermittent. Probably depends what state the bus is in when the driver=
=C2=A0
> actually bails out.

I asked off-list about finding someone to provide at least a Tested-by
(and I'm hoping for a Reviewed-by) tag, did we get anyone?

Cheers,

Andrew
--=-L+q29N136rRurIaet4OT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ6X9gAAoJEJ0dnzgO5LT5jPsQAIpDB7b8u7YCXwkr5fWDoPMY
JDetJ10qr8lgqDT1sRzJ2JIUZZqV6tUXiEuLNlIqsacFWnj3yv7PfcBUfDV9rZzC
988Z/NacUA+aRfUwXsG9TwKK6U8zqWvCM6+/o97k0vcSc97DBzq/KnMbfK6/CWm1
IYNmJNppDusFHNbuKwD7wBp63D9UbJ+IVGcLEAJDpxJo85CN/pGH/MNF2CbhOyBs
Tau/RLkooHbp5bNOjQ1o7g+06+fNIDLQUZGpnLKBLvSup9GF2XSRvaA03t3mG+zR
HzbZHTHGxyP0uMf//Ceb0MHk9kVxQpVM4I7DezmDjQhqDThh0/L9/+oM9HXv47nz
eyIxxjJm5HvD5Oye9bN0xxCFJYXILzRqH9Cb2TMuvBWLTYH2auBP07uRRI4RJmdU
LtK+Uiiywg9kEqx08b0pQ4alnNQYBgGNXQtjnco/GmlTFCRGhhpGGmdscQUwMGpb
HCz2mQJpVnA3pXh0K9IOzuDzp0bq6FiMeXWM/YCglDGHsKdnNEX//fS8iojuYB3E
u46tTTXJ8l9xK69zwGXtHpxyw21RfxAUec5wUAK/ItB9RM9tkw0fe1Lv1aFa2x1S
ws/f+I7cvy6dPnC0htb1LP3x7R2HqMpHl6vsaO1G/tfWJWZIhCo6CYjfEV3hpG4U
28GJzz8+1qlDC/rBmvKk
=N5pT
-----END PGP SIGNATURE-----

--=-L+q29N136rRurIaet4OT--
