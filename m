Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHSjz6Pq1zDqmg
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 18:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="neoZ/Pi3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GjykhyKA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 141BA2094E;
 Wed, 26 Jul 2017 04:21:09 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 26 Jul 2017 04:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=9YA4xDu4MK0vce2JN29wmAUUSWNzsnJN9d/uowJFZ
 Tg=; b=neoZ/Pi3XOlDpR4mBvoNnSdgXwu9sMGH9ewEmGXZXUV/PRmB16bwQDm7V
 L5duYPGKpRcfaa8xyU34lHInngVKU16hAEBGdDajvUTr6ym8Sa1VNXWjASKG9JWE
 tP7eewybZC2kC9fhIayXUKFVNysiNl+DRHph/hbPy49jn4fy9sW1J8NBuwgj33TB
 kyuVlx2y18Y9zGXvEpw2wF9M96kCiJiz60DtKpv36oEGsAM+BaHzPhZdwIWG8TV1
 Emmh2eErv5SF/rDxj1LteOLX1RJf64aTSmaBnrX7IKHvfzucdacrEvnYdqR+Xp+B
 vqEJ+eFKAl2hRbxW2NC78z0B5NFrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=9YA4xDu4MK0vce2JN2
 9wmAUUSWNzsnJN9d/uowJFZTg=; b=GjykhyKAJBWh3OdPYDQypHO4X9YlrHZbvc
 3RqUZ9Txj9CmHmxCSUGBWIRusI/ytUreFsVFphtRceClZ78EGnYkJBSEeztTB+te
 9iuvQSmcwAbnpEDT+EQfSn82bW1z64HJ/XRs/imp1yTRfrxfrCigHLgWFSxQajq9
 KzhWIwy+rtwI75DXRTyDc65UaCgjulSq+kGDLJ+KSwBaJPfXT49lJ7ffCeeUHvqO
 iVub5MkhgofF8BDlzVWhv6Tnhu5IPsyxuTgjaQP6HywESkQLZSXa8JKc/h+O/R+m
 heWl1hGHfvMvU1TGepIHqWlDVJNnqrfo3+7x8Eov+WTxOGOddNVA==
X-ME-Sender: <xms:9FB4WWJ2L94xaCLPArizntv_8dsxC7SRrHzv1o-yusBwQ9K3Ih8GJA>
X-Sasl-enc: hkuVQ+JdAQ4SDvM/FV4ouSbN1q+mA8NmY3lnWYnhKj9+ 1501057268
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97881244C6;
 Wed, 26 Jul 2017 04:21:06 -0400 (EDT)
Message-ID: <1501057262.5179.14.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 0/5] pmbus: Add MAX31785 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: bradleyb@fuzziesquirrel.com, mspinler@linux.vnet.ibm.com, 
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Date: Wed, 26 Jul 2017 17:51:02 +0930
In-Reply-To: <20170721175131.17840-1-andrew@aj.id.au>
References: <20170721175131.17840-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FKb4jC8VHRfaxEybUEIX"
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
X-List-Received-Date: Wed, 26 Jul 2017 08:21:12 -0000


--=-FKb4jC8VHRfaxEybUEIX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some follow-up notes:

On Sat, 2017-07-22 at 03:21 +0930, Andrew Jeffery wrote:
> Hello,
>=20
> This is a backport to dev-4.10 of the series I intend to send upstream,
> which implements the MAX31785 driver using the PMBus subsystem.
>=20
> I'd like to see it cook for a bit in the OpenBMC tree to get some confide=
nce
> in the implementation (after recent indiscretions).
>=20
> Some caveats:
>=20
> 1. I've only updated the Witherspoon devicetree. Romulus and Firestone al=
so need
> =C2=A0=C2=A0=C2=A0to be updated, but I'm not sure what configuration they=
 require (it may not
> =C2=A0=C2=A0=C2=A0be too different to Witherspoon). If someone could prov=
ide feedback here I
> =C2=A0=C2=A0=C2=A0can send more patches.

Given Romulus and Firestone are IBM designs my expectation is the
max37185 configuration should be the same as Witherspoon, and we can
copy the nodes from Witherspoon into both devicetrees. Further, I've
taken a look at the Romulus schematic and it requires all 6 fans to be
configured. I haven't hunted down the relevant Firestone schematics,
but there's no harm in specifying nodes for all 6 fans (the driver will
simply ignore any fans that the hardware claims are not installed).
There is harm in *not* specifying the nodes, as the driver will mark
fans the hardware reports present as not installed if there is not a
corresponding devicetree node, as the devicetree should reflect the
system design.

> 2. There may be some userspace breakage around what fans are exposed: Onl=
y
> =C2=A0=C2=A0=C2=A0fans configured in the devicetree will have attributes =
in sysfs, and the
> =C2=A0=C2=A0=C2=A0first and second tach input attributes are always conti=
guous. That is, if
> =C2=A0=C2=A0=C2=A0only one fan is specified in the devicetree and it is c=
onfigured as dual
> =C2=A0=C2=A0=C2=A0tach, then the input attributes will be fan1_input and =
fan2_input.
>=20
> Anyway please review and test! I've given it a spin on a Witherspoon syst=
em and
> it looks to be functional. I haven't done much testing with the OpenBMC
> userspace to shore up the second issue mentioned above, so that needs fur=
ther
> investigation.
>=20

As a note, I have been tracking down an issue where I occasionally see
IO errors when writing e.g. fan1_target. It turns out that the max31785
is NACK'ing a transfer, but doesn't appear to set any bits in
STATUS_BYTE to indicate a problem. Issuing the same command immediately
after succeeds. I was concerned I may have some undefined behaviour in
the driver but it appears that's not the case in this instance.

It turns out that I can hit the NACK issue with the current hwmon
implementation, and I suspect Timothy's original driver was susceptible
to it as well. As such the new driver is issue-compatible with what we
have currently, and applying it is not a regression. Some more
investigation needs to be done to resolve whether it's there are issues
in PMBus core, the max31785 and/or the I2C bus driver.

Cheers,

Andrew

> Cheers,
>=20
> Andrew
>=20
> Andrew Jeffery (5):
> =C2=A0 dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
> =C2=A0 ARM: aspeed: Update max31785 node in Witherspoon devicetree
> =C2=A0 hwmon: pmbus: Add fan control support
> =C2=A0 hwmon: Remove MAX31785 implementation
> =C2=A0 pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
>=20
> =C2=A0.../devicetree/bindings/hwmon/pmbus/max31785.txt=C2=A0=C2=A0=C2=A0|=
 113 +++
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts=C2=A0=C2=A0=C2=A0|=
=C2=A0=C2=A055 +-
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A010=
 -
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 =
-
> =C2=A0drivers/hwmon/max31785.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 893 ---------------------
> =C2=A0drivers/hwmon/pmbus/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A010 +
> =C2=A0drivers/hwmon/pmbus/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/hwmon/pmbus/max31785.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 655 +++++++++++++++
> =C2=A0drivers/hwmon/pmbus/pmbus.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A029 +
> =C2=A0drivers/hwmon/pmbus/pmbus_core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 222 ++++-
> =C2=A010 files changed, 1068 insertions(+), 921 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ma=
x31785.txt
> =C2=A0delete mode 100644 drivers/hwmon/max31785.c
> =C2=A0create mode 100644 drivers/hwmon/pmbus/max31785.c
>=20
--=-FKb4jC8VHRfaxEybUEIX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZeFDuAAoJEJ0dnzgO5LT5Hc8QAJQBE9Z3m3ZcyxAeUYYclP5k
onAUqWBPZaQ44PQZLjvksNzzXY9tZPc14+TneGk5T14yT/B1HEn3js4LxBc4QBIa
oEvLlk/eVANXbp1Q8DpsVk6xgfxdChwTWvtc4b8t7D2mJ3m2bdhDN+t3lj3GO/GG
TbpcvN/ETD6ilNVHnYCsH2Duj71u/8MfmcpRCh06I7wEjPgQ49fdTx2gQfC48o2Q
FR2lsXyHr1UyPM4JYSd5ICdz0vWcZIN+gKNfwtByI8L1VtCYzJshH9c8SVZMPZCf
pdoN9r+3qIpPpF/a3I3VMPBAZnW1HW/xmBaXvzy1u3y/HMmD7XLVydiJZe5O82jT
/6avnw5s1/BrEiPeS/WcE9FeWF0WKA8CfEtM2XiFYCELW/kHvB2N8xStj+m2+QKi
8QjbfJwpVAW6e3YHMaf1HPsjyErNMnUVQtbiJfoiYNYamiWvNC7c7X0ACPhjDJC2
jYB9vwixYBD7cOpt6cT8alduwEe8t8OwSGEDmyqcaoFUtp5xpGkNs+1j5fNviW9x
RlauohpuukKsmF5KuDJB3UlV4vpcO3EiOosykWSblSTRUeQJfaQsw810EEHiDFr/
UpmglyqjshLoo7yjektQ6+LrllKr31OBMes+jif54dtzZo1FfdzCcoVV/EYofFrb
IqTG2glSYfe4BXTgL7BH
=NfpJ
-----END PGP SIGNATURE-----

--=-FKb4jC8VHRfaxEybUEIX--
