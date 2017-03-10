Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vg1Pc1sYFzDqGk
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 08:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LAyaQbTl"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XfQMAtxA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E082B2097F;
 Fri, 10 Mar 2017 16:59:13 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 10 Mar 2017 16:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Akwfnmoav4NZfsJ4HCQynJTxcCw=; b=LAyaQb
 TluNH+wsaOnARV3rbO+FQhnvtSNeIaAdNhPWVWaWwNHsp6uyBSwpROfYlUqxx8Lj
 KCPO0A52T0mqR4NaL15lV1kRORXMhizxgVl2xG8RdTV67XxCfnSOawXGl/YmIiRD
 kWpCYBM1YG2j/PiUCQQtPVCk482ZiVoSQlChQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Akwfnmoav4NZfs
 J4HCQynJTxcCw=; b=XfQMAtxAWTe9ZzaDKdRzPYvfnE0pcfkhUvouC25GtnWQ7b
 GOnulMFEZ9VZ+Yj3UF8ir0stE8W044lwp2tvD5dvm8kLUnHfofJCnEORdLISnxYF
 qKd5W9+nc77QlxJbaVbVS9Oqbk+79iyhSxHTm3SKk6y84ROZbOU0uUvjb7vB0=
X-ME-Sender: <xms:sSHDWO8W--LOlacxMHM2gfgNzy9ZMX3n0og7s9POpUOSm7qUUznViw>
X-Sasl-enc: v6oqvXoa32by07BRouKi3dtkBOysTnKSDQiL2YcBH8mz 1489183153
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5C557E670;
 Fri, 10 Mar 2017 16:59:10 -0500 (EST)
Message-ID: <1489183143.26468.7.camel@aj.id.au>
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, joel@jms.id.au
Cc: miltonm@us.ibm.com, wghoffa@us.ibm.com, patrick@stwcx.xyz,
 xow@google.com,  openbmc@lists.ozlabs.org
Date: Sat, 11 Mar 2017 08:29:03 +1030
In-Reply-To: <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
References: <20170310122135.29827-1-andrew@aj.id.au>
 <1e540c49-0053-087b-0021-3ca259d2ca32@kaod.org>
 <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hdCJaYGpijR/E29lOOS4"
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
X-List-Received-Date: Fri, 10 Mar 2017 21:59:17 -0000


--=-hdCJaYGpijR/E29lOOS4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-03-10 at 15:20 +0100, C=C3=A9dric Le Goater wrote:
> On 03/10/2017 02:38 PM, C=C3=A9dric Le Goater wrote:
> > On 03/10/2017 01:21 PM, Andrew Jeffery wrote:
> > > Protect against suspect hardware causing the bus to read off more dat=
a
> > > than defined in the SMBus specification.
> > >=20
> > > Some investigation that suggests that the DEVICE_ID command (0xfd) to
> > > a UCD9000 occasionally returns all 0xff, causing the bus driver to
> > > overrun the 34-byte data buffer provided by the I2C core with a 255-b=
yte
> > > broken response. This patch should prevent trashing the stack and als=
o
> > > cause the UCD9000's probe to fail.
> > >=20
> > > The I2C core doesn't help itself in this case as it does not provide =
any
> > > means for the bus driver to sanity check the caller-provided
> > > response-buffer length against the device-provided payload length. At
> > > the point where we perform the I2C transfers for the SMBus protocol
> > > we've lost the information about what type of transaction is being
> > > performed (i.e. that we're performing an SMBus block transfer), so we
> > > cannot in general make assumptions about the buffer size based on the
> > > protocol (i2c, SMBus, PMBus).=C2=A0=C2=A0Further, struct i2c_msg is d=
efined in the
> > > uapi headers so no further members (e.g. a length field) can be added
> > > without breaking userspace.
> > >=20
> > > Instead, let's expand the buffers such that they will fit any payload
> > > length reported by the bus.
> > >=20
> > > The patch has been tested on a Zaius system, consecutively unbinding =
and
> > > binding the UCD9000 driver over 1000 times. Whilst errors were report=
ed
> > > during probe in some cases ("ucd9000: probe of 0-0064 failed with err=
or
> > > -74"), the BMC remained stable and did not reboot. Triggering the bug
> > > without the patch typically at most requires in the order of 100
> > > unbind/bind attempts, often significantly less.
> >=20
> > I could not reproduce the issue on a witherspoon after a 1000 unbind/bi=
nd
> > but there were some errors still :
>=20
> It failed after 1720 unbind/bind ... So I applied the patch but with it, =
the=C2=A0
> device as a weird id :=C2=A0=C2=A0
>=20
> [=C2=A0=C2=A0165.830000] ucd9000 11-0064: Device ID =EF=BF=BD
> [=C2=A0=C2=A0165.830000] ucd9000 11-0064: Unsupported device

A couple of notes were missing from the commit message - the warning of
 stack corruption and stack trace that Xo mentioned, and that the
driver will produce this message when we see the failure that the patch
is working around. If the kernel didn't panic/reboot after seeing this
then the workaround was successful.

The bus driver can't determine whether the buffer is invalid or not at
the point of assembling the response, and so can't error out. Instead,
we pass the buffer back out to the ucd9000, which errors out during
probe as the response is not what it was expecting.

I can send again with an updated commit message if there's no other
feedback.

Cheers,

Andrew
--=-hdCJaYGpijR/E29lOOS4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYwyGnAAoJEJ0dnzgO5LT5VNIQALFxetFuQx/yxTvwLfEqQHZ4
ZwZoYv3IpKPhhDrDwXhcXj8WQ4nUXVumkx2tcLb8TE39bRKKWd3YS8md/9/PDJ8Y
0zcXcz1klABj0XNADxGxPKxUt/SbUelYfuOIshQrqcKfCDGAGz+p/9F2ol8/9JPo
CbfpiInD6KaawF97/sBM3vgKGv7PoEuOZK/KHKo4X3cHGC+0eElfHODBSj7UuW2w
nREy6XQ3Xwa++sG/loAL3C9w+1DhKUPDfJ/jJGvyHPAbYedFoRQTZwgsh1o0SWSS
cYE3pkm0RNX26NY39VTMjXuV6DusdqbSnrXHP8r1PegCT2D6ZKoIY8ONwI1TqXsa
vz51ojK48PWnXXff/iWyMRtijeurkGnUHusdc7kx0RHPxZCrB2+iIxrFzCG3oRag
xbpIf6l5Bpg6L/l7S1hcnVJ1YY5ewVJ0eNYF0I30rJdm7gFF2C8PNmiAM/XVj6Mt
KBSUsDvlDA0IlanaFJvOjpXGUv1qylf94Q+LfzeaTIq3ifzUw+qbHlVulKwEcmOg
qafQoUL5GE8eu4OiRfm5qtosQhSQbGE8tJWyTNJNnFpHPWMiYrQdGnNFGDSoYJZt
lMjTTb96x4SLxCeV2L+b4lPAVzkk3hMmBclAFrpEVstOU1BSVtT8PPXHWAnZ6ftS
SSU+Vyuwl/IoNz1t4FPg
=DE+9
-----END PGP SIGNATURE-----

--=-hdCJaYGpijR/E29lOOS4--
