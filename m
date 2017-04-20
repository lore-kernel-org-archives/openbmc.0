Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w7mHr0sndzDqCC
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 14:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K9qHMzHw"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WjFrOfUB"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EF17120A3C;
 Thu, 20 Apr 2017 00:35:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 00:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=FG4M5eAqPwSIOd3jenOfNVOm95LzgVHayJThOQ7bQ
 NI=; b=K9qHMzHwqKcAgmZ12Ru/PW1YxVCqbejO++gEZHQpLNlbMSHa8SowMakRO
 WfVgwYoKKII/Brbh2mvxu2W8MymnjvEboz2RbrHkRndoMeSaTE6j0CnP98puc0a/
 dbnVjo6JDUPf86t70dVHIhfPPns+he+slB+BhgxNoxceK4EKL6wlX3TzBfQxNNwA
 N91QIGmsw/2B+nhgc9WwO0qy2WrDHxqmu0s1Yx61YsLQ5QT8CZamkCy7JCjfs1ng
 D9plyCw3ajAKH5jutDgu2HZYHA+h1P1/cmdUb4GWe9WjCNzWcLWBZeT5OIPTji87
 cNTNOuLgswImcv1DvPOjV/020AaVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=FG4M5eAqPwSIOd3jen
 OfNVOm95LzgVHayJThOQ7bQNI=; b=WjFrOfUBg0p09yRcp8LRChjdVyVrGROGi+
 RI89f6H6AiVaSFf0iQvSCCB6tub+VqHmOIpvD+FulaM42vhPyCZAjvpWFPhPFjhF
 vN9TAdU2o1ljKR5pFDHM5d8zdasmql5nr5gznwqQpABV2f3QOczcSLvxr3u1yAUL
 ilPa3Ulmw8u8rWXlk5euMiHRlsU+yqP4l9XPVKI8AxV2WGojENCARVoa4tewIKrc
 IuOecNixDTRc5x/kvKth0B0sIv+c0w0UgW5KXF4HG9qyOVyUAbIBG5fTCbycnc5r
 FnWsWcR/SBBzILnH0esKcmel+8UigdXONst+3jTB6Gng6Pc/3xlg==
X-ME-Sender: <xms:dTr4WApMJPao9cfE_aIK2jcDfT17pu8gdLOlW4ShgVB9WYqM4iBR_Q>
X-Sasl-enc: HhO0GBOpTKxtlT5cPCoJbPA1VHp49ZJe/9d9F2ZcoPFj 1492662901
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DEB57E670;
 Thu, 20 Apr 2017 00:35:00 -0400 (EDT)
Message-ID: <1492662892.1011.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v3 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Thu, 20 Apr 2017 14:04:52 +0930
In-Reply-To: <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
References: <1492575497-1419-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492575497-1419-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492612195.1011.4.camel@aj.id.au>
 <F2CEC6F0-6FAD-41DB-9797-E6D63868FA6F@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-/CRrLOfBo37Dzt4zp5pT"
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
X-List-Received-Date: Thu, 20 Apr 2017 04:35:05 -0000


--=-/CRrLOfBo37Dzt4zp5pT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-04-19 at 10:38 -0400, Brad Bishop wrote:
> > > > On Apr 19, 2017, at 10:29 AM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> >=20
> > Hi Brad,
> >=20
> > If you do future revisions of these patches, can you please Cc me?
>=20
> will do.
>=20
> >=20
> > On Wed, 2017-04-19 at 00:18 -0400, Brad Bishop wrote:
> > > Enable gpio-keys events for the checkstop and water/air cooled
> > > gpios for use by applications on the Witherspoon system.
> > >=20
> > > > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> > >=20
> > > ---
> > > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 +++++++++=
+++++++++++
> > > =C2=A01 file changed, 20 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/=
arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > index e3a7b77..aa1708e 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > > @@ -31,6 +31,26 @@
> > > > > > > > =C2=A0		};
> > > > =C2=A0	};
> > >=20
> > > =C2=A0
> > > +	gpio-keys@0 {
> >=20
> > does the @0 give us a stable device name for userspace to open?
>=20
> No it doesn=E2=80=99t.=C2=A0=C2=A0This is my lack of DT skillz showing.=
=C2=A0=C2=A0I was looking
> into how we can give userspace a stable device name.=C2=A0=C2=A0I was goi=
ng
> down the udev path but I can=E2=80=99t find any any of the information fr=
om
> these DT nodes in the udev event.
>=20
> >=20
> > Do we really want to go this way? We now have useful unique codes for
> > the "key"s, why not use the one node? Or is your concern we've now tied
>=20
> Each gpio will have an application waiting for its state to change.=C2=A0=
=C2=A0My
> concern was waking up x number of applications every time any gpio change=
s
> state.=C2=A0=C2=A0Is that a valid concern?

How many applications do we expect to be reading the evdev? What are
our expected interrupt rates? What are the worst expected cases?

It's hard to judge without knowing the numbers, but considering the
chips we run on I agree we should generally favour performance if
design is getting in the way. But to make that trade off we should be
clear on the performance numbers.

Andrew
--=-/CRrLOfBo37Dzt4zp5pT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+DpsAAoJEJ0dnzgO5LT5CbwQAK/0D3lrxCxFdlGBFlrxbzPC
JD6KWj2QsTFgLS2CPLFJiQA820HjXw4xzngEL0FdaUh4OIy5FxKggrMM3R6uwG7w
ZN/rLtrBiGRktsES8ngDtcnW1tIw+JyLB0kQUGmTFaDkNBq+aB3rIensKboWdj52
LrQZ+T1yrEQAofZYUj4nu3AFppKGLpTFQUNVhgXus4tt06FhmtIp6jobg87l1Wkv
eliO0awpINv8bRMx8PEVI/c9fdBM5cJTgIaL9KlXzVftbQEg47Cqluuma+WHO9zE
MKeB9kiko5E/v2DXySqLjJHEo4GwJOLZHukxwcUlVmuLWh7cRkdTbMjAu6nCtntX
uovVGuxRLcU6gYn+uALDfwOHGpHY4QEm6VcrlZnunXfpk1z4WpxKXii0CyqdHuat
79AWjPIgxB/yLpY+fWorC9euR1DcGtNNobkQANLSz2TFP+1AdPFOOI4e/ggjcMKk
evLRJAQa9LWEVpcUGZWaD3VyH5TCP2Ts2ymnfeh8MNJyaG/A46NQJ1z3bsIgNRQc
Lz3K6o5bUS4xqEMnfi7o7KCMM2R87rMmeFDlPogWvW57c4pXXDHznj+P0L0vhw8c
c3OwhgpqVX6iRIh8bdf5GPfVTlrz5Z0jlt1gSSukMaqlba14qiKfCu5VIEy1u824
kNFG4mwMGNRZWtVgqxUN
=xzgl
-----END PGP SIGNATURE-----

--=-/CRrLOfBo37Dzt4zp5pT--
