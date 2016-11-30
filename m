Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT2DJ5hGGzDqW1
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 12:01:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GEvRcwgQ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="X7F2paaS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 376E120910;
 Tue, 29 Nov 2016 20:01:07 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 29 Nov 2016 20:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Z0vaQ61sVby57g6BEELrHkNtCw0=; b=GEvRcw
 gQtK1r4x7fiQrJ5UxZgw/9hP4fSx+pQdrAA6p/G/MXmVc2nMebnOQmmlTgnX1028
 GR9mbe4gCLp/vBsFW6TcLsq/bmI7eFWtq71PeYyjIhOFHfF4PSDQ5p+tEv8fqkl2
 l/dvXO6u6xBICgmz8kBxJeZGEz2D4L/SE4ezI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Z0vaQ61sVby57g
 6BEELrHkNtCw0=; b=X7F2paaS3g32hW5DjA/W3lZPFWjS/84YIMhxOIvan/pLiO
 jJet3G0Kprm+f7twiBexl/FNfcyqq+4ioMFJhqWmJRF5tuc+IISCe2cbB5JC2Ebv
 NOHBbUGxL2Kl3dZb/E7ELpzwQUmkPhIJOhzsNRYmpNZqAVPiGlWlY7uiW8ZKg=
X-ME-Sender: <xms:0yQ-WGJlFWdvedSRDPtaDsB05aLsKlidwqad9e6XG7M2QTArrbY0Aw>
X-Sasl-enc: 0GZshvDRUaMDboza9i5VbvnLW01XDxB+4hjSxBMXMUj2 1480467666
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2441A2461E;
 Tue, 29 Nov 2016 20:01:04 -0500 (EST)
Message-ID: <1480467654.2503.96.camel@aj.id.au>
Subject: Re: [RFC PATCH linux 6/9] hwmon: occ: Add hwmon implementation for
 the P8 OCC
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames.ibm@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, "Edward A . James" <eajames@us.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 30 Nov 2016 11:30:54 +1030
In-Reply-To: <CALpMbd=eu5gmjZ_-5mt0mkXs+RKXVjQ6ddLXmYzawa4PJJob9A@mail.gmail.com>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
 <a8d6f13b45861401ffc6ea5b2e1d89519301483a.1478835488.git.andrew@aj.id.au>
 <CALpMbd=eu5gmjZ_-5mt0mkXs+RKXVjQ6ddLXmYzawa4PJJob9A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-5p4skEs9ul62UIUIc9zY"
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
X-List-Received-Date: Wed, 30 Nov 2016 01:01:37 -0000


--=-5p4skEs9ul62UIUIc9zY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:00 -0600, Eddie James wrote:
> > +
> > +static int occ_p8_probe(struct i2c_client *client,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 struct i2c_device_id *id)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct occ *occ;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct occ_sysfs *hwmon;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 occ =3D occ_p8_start(&client->dev=
, client, p8_bus_ops);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(occ))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return PTR_ERR(occ);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon =3D occ_sysfs_start(&client=
->dev, occ,
> &p8_sysfs_config);
>=20
> I see why you defined those here. But I guess I don't see why
> occ_sysfs_config has to be separate from occ_config structure. It
> could be populated in occ_p8_start and then passed to occ_sysfs_start
> here.

I admit getting to this point was a little tricky, and I'm not
completely satisfied by what I've come up with. Here's my reasoning:

I felt that only half of your struct occ_protocol dealt with SCOM
protocol problems, specifically the command_addr and response_addr
members. num_caps_fields and caps_names were only used in the sysfs
code where they are relevant for interpretation of the payload, but are
not in transacting SCOMs. Therefore I removed them from struct
occ_protocol.

I also renamed struct occ_protocol to occ_config. I could live with
either name but my feeling is it's more obvious that the consumer of
the API needs to populate a struct with 'config' in its name.

Given I'd removed num_caps_fields and caps_names I had to put the
information somewhere. One place might be in struct occ as I've
interpreted your suggestion above. However, I was trying to keep struct
occ opaque so in occ.c could fully encapsulate its behaviour. As struct
occ is opaque, occ_sysfs.c has no visibility into its members and thus
can't access anything we stash in it, e.g. num_caps_fields and
caps_names.

That leaves us with needing some other solution, one of which I've
implemented above. It achieves the goals I was outlining above and
keeps the sysfs code free of any implementation specifics, at the cost
of describing the information in a slightly weird spot.

An alternative might be to define struct occ_sysfs_config in occ_p8.c
and add an extern to occ_p8.h. That bakes sysfs knowledge into the p8
header which to me feels more unfortunate than my current approach. Or,
define say p8_caps_names and p8_num_caps in occ_p8.c and extern those
in occ_p8.h and use them to define a struct occ_sysfs_config here. What
do you think?

Andrew

--=-5p4skEs9ul62UIUIc9zY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYPiTGAAoJEJ0dnzgO5LT5WKwP/jqtXBId4HFPCNKGxjr3D3EF
haP80lT9RyoryJoM6D6rmA0cEAZIYP0w1YFNDtflkleCokwBN8WG1qQe8hT6FbKs
UsF16aq3VDO2/5YM3B+GSIgCZq86d1DQcL0Ae7Wf7IJA8xsAWuhvf1Gow6qyJt1b
PbrI3I1rypLwHyPB/JFdJjIV4jP+2N9FgJhUVlHgDfeRuuq8HBf9WP239d/aieWn
1RB7oqOhmEKODWGKoZKg/exIuzxEdv1CItIhTH0LT9UgSn2GLU8BQY/OgCzM3b56
tJidDM2itk/eO5ZfIde8JesuirU7p54k5AY6IwCBGjZz9GbPS25r1gkpFE/zXxua
DqBrp2+2YmjiFFFo/UvfkrDsIKZIyRoHWtbayLKkk4Pvggu9ELxCLq4VzAZiB1J+
PLkuFVNVEyxPcC1aw4DA8UJyqrvuuGy8DXj59ggyTmcooGsUAuMZtuWotkrRETB/
3GvUJXBJvmK5SWX10Np/2Xfsb5RdwCt2JkFlUiMl+Sq2aqMji/p7Pn9RYDoVlM24
JAmdc663FH2BWvqRQ+SwsH/OTtNX5xNli37/l9JSOQkfeKQvLIVQajPbcCm239DC
sdqFxg99VI7o0CKteG6ZcYyN5p1rf9HXaSgXA+9ltpBvHD0spuKIZyBvhszy6KIX
mqyPztgLP05yC0QW+hYM
=YfVG
-----END PGP SIGNATURE-----

--=-5p4skEs9ul62UIUIc9zY--
