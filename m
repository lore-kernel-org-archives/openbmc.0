Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyC8n2WxfzDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 11:10:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="f7kK1A71"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uNOaOv/E"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B3DE20F67;
 Mon,  9 Jan 2017 19:10:31 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Jan 2017 19:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=od+07WtbyQNrUjUkiH3GySZ+/3c=; b=f7kK1A
 71RDoPR8Y66Y2RjtoCVgazrWfY4m33iF0SQW8dLyV7fIeCOrksNJNCosjmFUDuMF
 ajnTsFBrNpRuWh5F0v3RqX5x0yDsjZuJNbasAFERH5pdYMCj0z7Ull7vSCNn5vAB
 gHbnHcPQHWBWFfNwB8AcOS4ODYR3RAfBL5GXk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=od+07WtbyQNrUj
 UkiH3GySZ+/3c=; b=uNOaOv/EoL6LaStLAftEDyqWGJ83o7QTwYPIUMEOhW+p6C
 tH6vU8P96cPYjSL6rvEAysVUnMEa48fBWtKaPFZkEygeD33FANSnrJayYO9VOzTF
 y1ulh8SjK/1JGA4O9o5JIiRqMdmh+2R+yZrsdgWPcQovf9qaXdghQDDyVpfLQ=
X-ME-Sender: <xms:dyZ0WJEOdCTAJ6bKfNV8HtDaTHpr2UTngwzWibPstKqKla_CNDxhOA>
X-Sasl-enc: pnaaK7hmJwAAKeDbRdImKRXzTNpiCKxmfjZUIBKz/+uh 1484007030
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B71C7E8E2;
 Mon,  9 Jan 2017 19:10:28 -0500 (EST)
Message-ID: <1484007025.12800.7.camel@aj.id.au>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, benh@au1.ibm.com, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 10:40:25 +1030
In-Reply-To: <1484006838.6236.10.camel@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
 <1483999740.6236.2.camel@gmail.com> <1484002504.12800.1.camel@aj.id.au>
 <1484006838.6236.10.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-c8KsjcqeTdyvv4DBl3H+"
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
X-List-Received-Date: Tue, 10 Jan 2017 00:10:34 -0000


--=-c8KsjcqeTdyvv4DBl3H+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-10 at 11:07 +1100, Cyril Bur wrote:
> On Tue, 2017-01-10 at 09:25 +1030, Andrew Jeffery wrote:
> > On Tue, 2017-01-10 at 09:09 +1100, Cyril Bur wrote:
> > > On Sun, 2017-01-08 at 15:45 -0600, Benjamin Herrenschmidt wrote:
> > > > On Tue, 2017-01-03 at 11:54 +1030, Andrew Jeffery wrote:
> > > > > > > I think we should rename the IOCTL as what we do below
> > > > > > > doesn't
> > > > > > > necessarily raise an interrupt.
> > > > > > > =C2=A0
> > > > > >=20
> > > > > > =C2=A0
> > > > > > Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?
> > > > >=20
> > > > > That suggestion works for me.
> > >=20
> > > Sorry about the blank one, I'll try typing something this time.
> > >=20
> > > > If we are going to do that, maybe we should make this a write()
> > > > at a specific lpos...
> > > >=20
> > >=20
> > > Andrew, Joel what do you think of this, a write of count 1 at a
> > > specific pos. I like this since it removes ioctls all together
> > > and
> > > isn't any harder for userspace.
> >=20
> > I'm in favour of removing the ioctl. So the logic would be:
> >=20
> > 1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we
> > do
> > currently
> > 2. If lpos is non-zero, assume a single byte write
> >=20
>=20
> Ok so I started writing it - and I thought myself, wait why limit to
> single byte writes of lpos is non-zero... I mean, they can do what
> they
> want... what if they want to update two consequtive bytes, it seems
> silly to have to require two write()s to do that no?

Sure, that was predicated on not checking count. Which was partly what
the question below was about. If we check count then I don't see why
there would need to be constraints beyond the number of mailbox data
registers.

>=20
> > On that, should we be testing the assumptions about buffer sizes?
> > Currently we don't (we use the MBOX_NUM_DATA_REGS rather than
> > count).
> >=20
> > Andrew
--=-c8KsjcqeTdyvv4DBl3H+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYdCZxAAoJEJ0dnzgO5LT5zIAQAJQQU4nJQZgdntvOEzuozKwn
wJfECienACkeE5/YgPQCcLtw69SZ/w3zSEchhT6+Ork5gDnNcOQKCXbVPAcNkjFn
htW2Xuw3zbWzGnz9K4q0GKRlc4gF5awuG+W3sjBEe447Y259hzXEliECMeCeAfIo
l8vNZcylJ26BmgdK4MotwdCk/fwukfbaqW20rQYpjiVq7cSj5CMkV0KdyEMmaRhI
pbiKKs873sD+7N2OQXjUmTxGqAk+A2aUG0OTIQjvuHUvnxpLUFqLMmC1W89CRT/s
IzWEj0ahzl2wiv7Mmou0L4RQfDVCaBkUT/vfs23nUUhWTVRZxEzRsQ4SfunkPHG9
PuiAEqKQUh+b12RNdH4DHULJdJkrKdUOVBzW/Z3OS3OUHwmja6b7O6VYhXn6GKzf
k4tH7A3YLlsKHMLDOgM4/5NdfAgPJvoT/yAgzTTmVaLaS/QCeourfvz4fipVf40l
oGeiiG0OryF8vFiXD4BJfbNmGURGsdLonsC4PNwN4rRnE4f9aCUVXamV9AiYIJhP
VoEYSUoZrAkAgPpRaR/xbCXGNxyA2yxv0OpHHal9K78krJivLpWvB7ffi/S/9/Is
7IyZcoT2UR8pttCYh+SIIvhQ7FbDYCZyWj1xj7heKSBOrTINVz4h3OViXvk6hg2X
gXQfhYIE5oj0ekeTWxGv
=9RUf
-----END PGP SIGNATURE-----

--=-c8KsjcqeTdyvv4DBl3H+--
