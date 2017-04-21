Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8Gwz6RqtzDqKp
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 10:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="T3sm+Uiz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y/HQlsDQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C5E57207DD;
 Thu, 20 Apr 2017 20:35:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 20:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=YENG6FNtPCyEu7u/s9DXUIJkeywW+qMWo22RCwhRY
 Bw=; b=T3sm+UizajF4cHexVG6L+NEtbs9ZsGSWG95m1mZfA0gQ0DqrQhdmV6cDq
 057tPJ49Xaz1ZJg43lR4eroyJaIrw1sGQwk8C5QMr8+yELYg2Te8peKEN9iWv1Ja
 tSA8lu6lCMJbSJ9MKTuPZrNqVxTN9AQWeuo6eS7qBnQHiINswvX2DM1oowyJJyWL
 DuEf9oMnpWoWA9JyL9q3T+u4E712clXdiUCe6v76ORV5bFTTUrgb01hyr/Svbpk3
 XfxODULQABgx032AExnnko25b15dHDEki+4rnkJECs7UWtBwm/yBBP9eZRtXDUzk
 krTfgyTNv16yS6xwHlgNYNAyHSMIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=YENG6FNtPCyEu7u/s9
 DXUIJkeywW+qMWo22RCwhRYBw=; b=Y/HQlsDQIe0KLqkPz7VP8b+UY/febhe21G
 JvfCeHQg1VuOwFOa/C3SsT3TtYEpHxiuCnpLTrbEAryjhlMfAswNSPds9096tuHl
 BYFoZ1jTr+EVmDKNCxS1pGRWGABd4Hz6kRIYUdZ/lVK3ztE9C/9BVAJHMWyUM/Ig
 Ff81ElLsh4jTW1aZKzK2ZvrwYibb4cq3bDCVUsmY3rgq+QEPT+tAg2AIgJJ4C7mh
 4aiVbOs4ZM4MBzb57Zo3Osb+M4aZAH6KNeNf+8+pZBzqRvlQS0EMPp5C7JjQuAqA
 ubhRU/H/GPBCA64+TOzUwKYmHzxnNdiF5D/f9KsRUIkpht5jRW6w==
X-ME-Sender: <xms:0VP5WFzfNbSFgZfaCflfl4f1PPu6eBYROty2w3JJvZLtFoknn6-yDg>
X-Sasl-enc: 9JWa68X6s3WD3pyqD2hwFn7ie6hwc34dmSGFXzHxHsMG 1492734928
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55EB4246A5;
 Thu, 20 Apr 2017 20:35:28 -0400 (EDT)
Message-ID: <1492734921.1011.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 21 Apr 2017 10:05:21 +0930
In-Reply-To: <86B3586F-7CEC-4389-8CCC-38D5423A4CE7@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492612195.1011.4.camel@aj.id.au>
 <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
 <1492662892.1011.7.camel@aj.id.au>
 <86B3586F-7CEC-4389-8CCC-38D5423A4CE7@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-blySNxP2Nr17y90QggJQ"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 21 Apr 2017 00:35:33 -0000


--=-blySNxP2Nr17y90QggJQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-04-20 at 10:24 -0400, Brad Bishop wrote:
> > > > On Apr 20, 2017, at 12:34 AM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> >=20
> > On Wed, 2017-04-19 at 10:38 -0400, Brad Bishop wrote:
> > > > > > On Apr 19, 2017, at 10:29 AM, Andrew Jeffery <andrew@aj.id.au> =
wrote:
> > > >=20
> > > > Hi Brad,
> > > >=20
> > > > If you do future revisions of these patches, can you please Cc me?
> > >=20
> > > will do.
> > >=20
> > > >=20
> > > > On Wed, 2017-04-19 at 00:18 -0400, Brad Bishop wrote:
> > > > > Enable gpio-keys events for the checkstop and water/air cooled
> > > > > gpios for use by applications on the Witherspoon system.
> > > > >=20
> > > > > > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > > > >=20
> > > > > ---
> > > > > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 +++++=
+++++++++++++++
> > > > > =C2=A01 file changed, 20 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/a=
rch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > > > index e3a7b77..aa1708e 100644
> > > > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > > > @@ -31,6 +31,26 @@
> > > > > > > > > > =C2=A0		};
> > > > > >=20
> > > > > > =C2=A0	};
> > > > >=20
> > > > > =C2=A0
> > > > > +	gpio-keys@0 {
> > > >=20
> > > > does the @0 give us a stable device name for userspace to open?
> > >=20
> > > No it doesn=E2=80=99t.=C2=A0=C2=A0This is my lack of DT skillz showin=
g.=C2=A0=C2=A0I was looking
> > > into how we can give userspace a stable device name.=C2=A0=C2=A0I was=
 going
> > > down the udev path but I can=E2=80=99t find any any of the informatio=
n from
> > > these DT nodes in the udev event.
> > >=20
> > > >=20
> > > > Do we really want to go this way? We now have useful unique codes f=
or
> > > > the "key"s, why not use the one node? Or is your concern we've now =
tied
> > >=20
> > > Each gpio will have an application waiting for its state to change.=
=C2=A0=C2=A0My
> > > concern was waking up x number of applications every time any gpio ch=
anges
> > > state.=C2=A0=C2=A0Is that a valid concern?
> >=20
> > How many applications do we expect to be reading the evdev? What are
> > our expected interrupt rates? What are the worst expected cases?
>=20
> For Witherspoon/Zaius or any OpenBMC platform?=C2=A0

Yes, this is what I was asking about, given they are concrete systems.

> =C2=A0I obviously can=E2=80=99t say for the
> latter case.=C2=A0

Yep.

> =C2=A0On a bigger/enterprise systems I can see on the order of 10 to 100
> applications looking at these.=C2=A0

Okay; having 10-100 processes woken is something we'd want to avoid.

> =C2=A0I don=E2=80=99t have a good sense of how often.
>=20
> On Witherspoon/Zaius, sure, we only have a handful of applications and th=
e
> interrupt rate should be very infrequent.

That was my thought, which was why I wanted to check. While it might be
low, if we're waking up to 100 applications it's not ideal.

>=20
> I think you typically see all the gpio keys mapped to a single device bec=
ause
> the usual thing to do is have a single application (Xorg) treat it like a=
 keyboard.
>=20
> We aren=E2=80=99t structured that way so rethinking the usual approach se=
ems reasonable.=C2=A0

Sure; I was never against rethinking it. I just wanted a clear
explanation of why we would choose this route.

> =C2=A0
> Another reason I went for per gpio devices because it prevents applicatio=
ns from
> reacting to each others events without any special library code.=C2=A0=C2=
=A0
>=20
> I=E2=80=99m not saying there aren=E2=80=99t disadvantages to this approac=
h - I just don=E2=80=99t know what
> they are?

It's a bit strange from a design perspective as we now have two unique
identifiers for an event; the input device *and* the keycode emitted by
the event on the input device, which is the *only* keycode emitted by
the device.

For someone new to the system I expect this would seem a strange
redundancy if they weren't aware of the performance implications
inherent to the distributed nature of the application design.

>=20
> >=20
> > It's hard to judge without knowing the numbers, but considering the
> > chips we run on I agree we should generally favour performance if
> > design is getting in the way. But to make that trade off we should be
>=20
> Again, what exactly is being traded-off ?

The "oddity" in the design with respect to the "redundancy" I described
above.

Anyway, I think what you have outlined is reasonable.

Cheers,

Andrew
--=-blySNxP2Nr17y90QggJQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+VPJAAoJEJ0dnzgO5LT5MNgP/1x1Ojx2KxIL1nkJI0E1cxvN
lZm2XMBPQn3uLGmFDWOR9E1qt9iA00w9x9YN025Jrf+dbzUawEztX4mcOwCqERxH
8WRDBGIX6Ote03/ftNhzSutgflP2+ENe4STbiSusoVHtrdhDRUe0x96y/xsva6MR
IFmjME1gkE1rV5W04JB0Ut71FzuDqemBN1Naf8JHiOS7huhGfi7xmdjJ4i+uN/7x
J6BSN7HaW1CKnTmrh/qWAEP9pria7GNNj2tFg8nSjl/Nc2wGETf8JSGEy/uWMniK
wruH/3DnFpgTzAJa84p3TcYLJJ43dzBkkgQzDqZLoUhvFxqSAa5Q9rln/OwZowF2
9TlqI/ITkXzH39uqUskZo05lBhKu8yVXHTcvJCOentLbDGlIlicYZAISw2H5gZVa
AbQ3Ruxm7vzNZlmAJ6raVIR1wpzgYc+/uciiRipWdIu5Nh5P1q3oE9kH3Ii41VBY
KAQ0DJ8x6Chwcx3nSmL7kBK9+Hkcpsftds77HyZjPkoFr61b3I8aPXTGEh4LGS9D
aChQ8E4hkiBRFyVWGsWVvX5OZNUMbjS5nxPtTmfWiDsKkKKzrCxl31oa0T33ZmGQ
xcHeMCA1hajuwfu5sPaPvQrLL6bSpRPeqEsaTakEW1ONeXnA6sBOwCdJqzAk2Cbh
SJT6j81cFlq9bqs+Laa+
=LhsO
-----END PGP SIGNATURE-----

--=-blySNxP2Nr17y90QggJQ--
