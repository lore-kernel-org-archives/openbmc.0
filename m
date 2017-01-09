Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ty9Tv5PX1zDqLd
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 09:55:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QmmDbedP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N86K9+j2"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C171C21E55;
 Mon,  9 Jan 2017 17:55:12 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Jan 2017 17:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=cJF1/SZLKgfA4kcA6YB3V454iTU=; b=QmmDbe
 dPnSojb/skhhwDR0xPCLkPoRkSrTc3i7gm5qHGRDr+h42tfsnwADW1OSMvJUI6x+
 dN+fFj3vBR+X6xoocJG7Lrun1NO0vq9ozQdi20jRV37SCRW2YDdoUa4zutUSo/SL
 UXvjmkpIBB8Pn5RezKzds9c51JEE65uNLuAZY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=cJF1/SZLKgfA4k
 cA6YB3V454iTU=; b=N86K9+j2/HCg3FPyZMxOnNR47vhVCglXoPPDHYdx4WDB6I
 mRVWmlvxNgpuFlVY91DLyahLDcpVhAfkNWMGGi0x/hxpMeuoeRmz6ydcTbYtDyH4
 hm8YTZUFONQxZAu1m/kkVAqGfRCmNuA3WtOVrlyZ07+yIf/l0cHOqA2/+afg0=
X-ME-Sender: <xms:0BR0WNLgBiIbbOZYxPqvAh1qjONLF_Cc3X8d2z7GMmFqV7CODKDh4A>
X-Sasl-enc: Ydi0yueYzwTqXlI9QBFoaT80qmHYFcBSpuzYoCX1cmpN 1484002511
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEBF07E955;
 Mon,  9 Jan 2017 17:55:10 -0500 (EST)
Message-ID: <1484002504.12800.1.camel@aj.id.au>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, benh@au1.ibm.com, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 10 Jan 2017 09:25:04 +1030
In-Reply-To: <1483999740.6236.2.camel@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
 <1483999740.6236.2.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FgkcwtRmCkcOoHjTPfLT"
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
X-List-Received-Date: Mon, 09 Jan 2017 22:55:16 -0000


--=-FgkcwtRmCkcOoHjTPfLT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-10 at 09:09 +1100, Cyril Bur wrote:
> On Sun, 2017-01-08 at 15:45 -0600, Benjamin Herrenschmidt wrote:
> > On Tue, 2017-01-03 at 11:54 +1030, Andrew Jeffery wrote:
> > > > > I think we should rename the IOCTL as what we do below doesn't
> > > > > necessarily raise an interrupt.
> > > > > =C2=A0
> > > >=20
> > > > =C2=A0
> > > > Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?
> > >=20
> > > That suggestion works for me.
>=20
> Sorry about the blank one, I'll try typing something this time.
>=20
> > If we are going to do that, maybe we should make this a write()
> > at a specific lpos...
> >=20
>=20
> Andrew, Joel what do you think of this, a write of count 1 at a
> specific pos. I like this since it removes ioctls all together and
> isn't any harder for userspace.

I'm in favour of removing the ioctl. So the logic would be:

1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we do
currently
2. If lpos is non-zero, assume a single byte write

On that, should we be testing the assumptions about buffer sizes?
Currently we don't (we use the MBOX_NUM_DATA_REGS rather than count).

Andrew
--=-FgkcwtRmCkcOoHjTPfLT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYdBTIAAoJEJ0dnzgO5LT5wDsP/AubHB4B6ZixhTvUGRwGK3G/
4H+ES+PNtamtpjyy6xt+HFDj/17atXhZwY0sePsIHHbzOxvSr3ZB7CvgtvqG5s1X
3g/6acz5YO8QsD3AqmhjPAHBjxo67Oz4N1cYHgZOh8EFreaEQ6pPJS7LaMhuBkPh
DKOqv/iAUzgAwYI9h1QwkuuL9KFO0xF6ANGTiQtOBeJ/eg/17iBBNAPFHy8qR/Rm
+jklHbGWPp787yCcgtysikyuf9Fx7mTAdOd8akSYzzcN3pa2CEwachwIjxcGh/yu
ECHjpCPZ0r3uTBPvIUXbs+OsynzDUpX7Hnne44AVWpKu3opaTPdfkMj1pJrIRmQN
LzGDRs1MnV42gmpxlRDKlfpEm5akpG3vJKTm3xYNx6YNxZr+EXikRPa8e30guh32
oWUEJoo4zMc2Z4Y+FSrAFUmRpuaCCTV5ZYofablAsCLxXicm8pkCQehlGj+zKYAl
5FC5ovKphI9QNmMAVsLIP58ZxQ8/TYAhMKlnLHBGKS+7kimoU7+Ek64i0CszGGnY
Pz49LlW0rHODhE/riMXUwGcoTl++UJndB5dsgTYWEx5RsElzToYzuTmw8ND835PU
ZqtXJ4VMC0WAmW3lIw+x3lqbR83KdHu4HfzqskTG1srtDastUyAgF0OIcfNJ+TMl
Lu5FO3MSMoKwmDRA06KF
=kqrd
-----END PGP SIGNATURE-----

--=-FgkcwtRmCkcOoHjTPfLT--
