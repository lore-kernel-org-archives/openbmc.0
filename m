Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tsx7Q4yS3zDqCn
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2017 12:24:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="e8zCBycd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bYryjyvX"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B25CB20981;
 Mon,  2 Jan 2017 20:24:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 02 Jan 2017 20:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=sa/eZar1/IRgHxT8mk/FGQMTdi0=; b=e8zCBy
 cdYIG1QOpb6eRsICbf8Kd3L2wa9K3KdDFc9dR8fvOAgq+Z+VoZR84JMq2cq6gbGQ
 qwG78B4fYqbEIZsdSDJZFkqNQRol9tnWeWzO/bzSjjwsySuQf4OMmut6ZuhMbpw/
 bo5Skp0HVhCM1yCxMmWTLFFFCRVvkmbN309mg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=sa/eZar1/IRgHx
 T8mk/FGQMTdi0=; b=bYryjyvXSMuUKkgNtP3THUO+5N54t+IkDBpt83bBXKnwPg
 fjE3N9nv1Yo7pPCMItgokUOy4r+69CK/Mf7r4iWxPQKUkL8IcTUBgolFGST8t384
 jZ4ec3qdiI4JWzln1O92M3lS4w/SzWRidXu0JaOXCQCpvLZTTdzJR2avsslZY=
X-ME-Sender: <xms:Tv1qWBptlQ2w-rql9xyOUzHkQeN6Q-2xP3bJgSPHnoGkTkG7vHAaDw>
X-Sasl-enc: mJivfsWq6mqyMMxloqUkka8xQOfTDMIm4FpIDa5ndTRo 1483406669
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 736937E709;
 Mon,  2 Jan 2017 20:24:28 -0500 (EST)
Message-ID: <1483406661.7801.1.camel@aj.id.au>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 03 Jan 2017 11:54:21 +1030
In-Reply-To: <1482479795.14044.5.camel@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ykdnJkLQ8403ZAshd+LE"
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
X-List-Received-Date: Tue, 03 Jan 2017 01:24:35 -0000


--=-ykdnJkLQ8403ZAshd+LE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-23 at 18:56 +1100, Cyril Bur wrote:
> On Fri, 2016-12-23 at 13:12 +1030, Andrew Jeffery wrote:
> > On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> > >=20
> > > +
> > > +static void mbox_outb(struct mbox *mbox, u8 data, int reg)
> > > +{
> > > +	regmap_write(mbox->regmap, mbox->base + reg, data);
> >=20
> > We could use regmap_update_bits() here, but ultimately it's not going
> > to matter. Should we say something if regmap_write() fails (it
> > shouldn't, but if it does that's extra concerning)?
>=20
> regmap_update_bits() to about touching the reserved section? Probs a
> good idea.

regmap_update_bits() will just write back what it read for the
untouched bits, which should be 0 in accordance with the datasheet.
It's not really a change in behaviour as we will still be writing to
reserved bits, but I think it makes the intent clear.

> Yeah I thought about putting a dev_err() in there. I'm not opposed, I
> sort of though, we'll you never see them or when you do something
> really bad has happened you'll probably notice everything broke...
> Still in the incredibly unlikely event that a print proves useful I'm
> happy to add it.

I feel an OCD itch to have something there, but I will leave it up to
you.

> > > > +	switch (cmd) {
> > >=20
> > > +	case ASPEED_MBOX_IOCTL_ATN:
> >=20
> > I think we should rename the IOCTL as what we do below doesn't
> > necessarily raise an interrupt.
> >=20
>=20
> Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?

That suggestion works for me.

Andrew
--=-ykdnJkLQ8403ZAshd+LE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYav1FAAoJEJ0dnzgO5LT5Yl4P/0tC9rJm8qlNClG25/wHHiEf
V0QV4sfEWHuuv0vIb4jc/VvF+MK2iCRM6bGKMEULW3xUREDVuS9e4alMFPQdX2Nm
8i5tZxC5aX0w9sym87JYye0pjv4O+yMDQTGD2PUQb21y/O4x77lfMFJJvgMjJan4
z9upDJ1XiwZZuQR+0qabtPU4qMIdxIy1cEJR/OoGSEu4zBg2cRpPS54MYeFCq+NU
2PDPeUGZEe7TU/flmLT/BmiGwTde884tRyPF9odyRwaUtLqFKQpYarzYs05nsK30
yy97hTkDyrO4FG9b2R3PrzJ8LJm7rUusdhd+uC4NyBXZz2HdgtHHDS75gWdQqEUI
QF49gpm5saVWKTEPulkd8snq5zSQRHtWK6bKVw7u9WIUEbF8DrifD2xLkmhFiwmv
jjs9mQHYeYOTCNB0xnvgREDQqMI1wPUBZj6qkYwIkvyvtcocfHiHJWKTniQ52siR
HLTCQoRuSZLbMwVWOPzwm+DM83yazoHfTz3V5cctQ3NpEL3Ni92HmOMmDVPliYJu
xdQ8+J3Lo3txRihklx/DwbzUDiQ3ptARZM4GAuFWEy1rs+TcJUxflfXrWFRERnkR
Au1eTQ39NFa4mjg4bLHREwfi2U6Gr5vSULRxqSMuUGmuAfGIjZiS98CeJzNRhQRs
6pi+BXe3SjSrJd4Rbh0M
=1TTN
-----END PGP SIGNATURE-----

--=-ykdnJkLQ8403ZAshd+LE--
