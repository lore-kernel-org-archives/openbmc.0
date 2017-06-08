Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjyN84X8vzDqCt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 17:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XIj9AUop"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OFw2af2d"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2327B208AC;
 Thu,  8 Jun 2017 03:53:24 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 08 Jun 2017 03:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=12NrNximvCqal1/sigIuXPHKYjQyJC8nMavb59j0B
 J4=; b=XIj9AUop0b8AhPlsRJ3hIGrGw64lZxJozcovnrWxt8vEp9RKC4UJClhbm
 NM8b72gkLedcouX5Y51vIALJRKXetzNpChm59SEUMwFe4KWID/2aeTLF43toeQnt
 C/5B9a8lnjOgNGC2Acpq3EEMRsFaXOAOqHOf0kwOu3JbFSGBc4c6WRbvYuS8dh+E
 XYysOZ3DIJiR/6tKO2PNIEKfOG3f4cIDZ2fnueVfJLSd7nLxH0eWTHDwaZ57Iz5h
 xbiljUV27fI7v7D00Qj6yyUfKINtX5z6EddqwgNQ0C1CaTgOFrb9F2pFOTiWSNsZ
 OxCo63xRFsR9U4vyyJPw6nPPyOAUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=12NrNximvCqal1/sig
 IuXPHKYjQyJC8nMavb59j0BJ4=; b=OFw2af2d5EiuadyoZl4RXoImJI/1ssZ0c7
 5EHUlUMe/zmqxE2MT3HOdrZTX1xfbrdxEiMvGmOqtC6RmiGrFGeYtftufQUK4QSS
 P8AxUiGAYpMS0wEiaf9ZuqDZfKtbrLys370N5SX3lLE5iejFwZi5s8jEPpNT0JhI
 rbEKa3dMHgKTiKI7tbFRr/10CNOk+u/xyuQISKCD4wBSlIPYDUlz0PJg6oxnktRE
 aBIWhFic6AS9umakVBcA3jBhcqSU9ge2IuP1/6yBERRK1uUC/Jo9VF1NL1/oielC
 SuvLBwvbVFSMcJ6cmfSH5X+lrxusCeFWyct26xN2CbSul114oe7g==
X-ME-Sender: <xms:dAI5WfoByZhhYTbRyR8JHWPXSdw2MufITdhv9IGOCHa_FVQwdoyIuA>
X-Sasl-enc: s0Z5qPuOmrfLqdgtkB8Wt+6zJKxYQp7icQ1RwqU45kOe 1496908403
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2CDE37E5F1;
 Thu,  8 Jun 2017 03:53:19 -0400 (EDT)
Message-ID: <1496908393.23335.3.camel@aj.id.au>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
 msbarth@linux.vnet.ibm.com, tpearson@raptorengineering.com, 
 openbmc@lists.ozlabs.org
Date: Thu, 08 Jun 2017 17:23:13 +0930
In-Reply-To: <20170607155526.GA18946@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
 <20170607155526.GA18946@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-dPriNvg8PqsVjycTF7RB"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Thu, 08 Jun 2017 07:53:30 -0000


--=-dPriNvg8PqsVjycTF7RB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 08:55 -0700, Guenter Roeck wrote:
> On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
> > Add a basic driver for the MAX31785, focusing on the fan control
> > features but ignoring the temperature and voltage monitoring
> > features of the device.
> >=20
> > This driver supports all fan control modes and tachometer / PWM
> > readback where applicable.
> >=20
> > > > Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > Hello,
> >=20
> > This is a rework of Timothy Pearson's original patch:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0https://www.mail-archive.com/linux-hwmon@vger.k=
ernel.org/msg00868.html
> >=20
> > I've labelled it as v3 to differentiate from Timothy's postings.
> >=20
> > The original thread had some discussion about the MAX31785 being a PMBu=
s device
> > and that it should thus be a PMBus driver. The implementation still mak=
es use
>=20
> After thinking about it, that is what it should be. If I accept it as non=
-PMBus
> driver, it will be all but impossible to convert it to a PMBus driver lat=
er on,
> and that just doesn't make any sense.

Hopefully not being too ignorant here, but can you expand on why it
would be all but impossible to convert?

>=20
> With no one interested in writing that driver, I'll try to give it some m=
ore
> priority myself. I do have an evaluation board somewhere, which should he=
lp.
>=20
> Note that the second fan reading should be implemented as just that, not =
with
> a non-standard attribute.

Agreed.

Andrew
--=-dPriNvg8PqsVjycTF7RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOQJpAAoJEJ0dnzgO5LT5vsEP/1Mgcwy5LEWtEVc12XiXNjgW
/WZ/je5R4e/q6BoTGwts3KpnjKyWefPOVyF6Cwr13SJ2NX9fEdmK4QWdPF25S+1x
ifjxhPClDn8tyGmczfOEeF11fcX28r5g1+mqXHHwuexxqMOtvwk5h8UxSCBR5zSz
fbxVVPO3EWaJy2AEsacxlQ7w3JJQ1rZ9mgwRDmQM+59+t21vdzukkgS3LojRTPQ3
KjQyeW1ubnTyeQWUopbJCHsrCImTZ9p8K/LMfzDP8Mip5cYj+7IBXyX5ZCbeTZo4
j9x7PiVcgoppLdjBb1v/KiHfl4UDAZKmTnDNMw1JxOcEmrNprOI3p+eRobA/RXoW
jB93tWHnHhYxPF5utjrL36BS3lbc0G8OloRgjV7Hutl3h2ZiBhHofpgHpfy6G137
DzJI82tluNWaAw2tIiZpIlXacuYjTTfgaSampQgaGpE7dupujin+a+PQkyojI+vy
hC7TnNHxyjgZf3TClLgR3ebnoADux3D585fdwWARdH/Z9x6pvaFaABRYmPfPm/pw
EOZwalpdsgdK2k2Cu+UPsDGd+nWB8L1abcR8X5ngXuV9wElFp543v7dWUJPn1TRM
HZ1qaoFg793O5SmqxsjoL0RfxH6gEYyA9WZmvFcKEqsHa1hYhfkcIZFLoAFhfZXl
5whzFbXHZifyFN9vBjyC
=59lu
-----END PGP SIGNATURE-----

--=-dPriNvg8PqsVjycTF7RB--
