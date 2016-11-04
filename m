Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t97Xy4F65zDt3c
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 15:05:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="acHqIK17"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CUE96sHr"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EE5020779;
 Fri,  4 Nov 2016 00:05:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Fri, 04 Nov 2016 00:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=ucAu2wIpV0NX9Yqhzaz9bpYEcL8=; b=acHqIK
 17/yG92xjlCbcuSGln2YhxuO+Nk01L3o7Bb0vLmRW73LpTxr6brR0+Q36cMUO2nu
 tkKpWliUSgteROdjmL7J5tCdwzJzxH6rHm5jhQiyo7QRnanMf/A1fQztre5wZTF2
 ay11FKzrkSegMICVAsw14nskE0BaFANxUmKSc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=ucAu2wIpV0NX9Y
 qhzaz9bpYEcL8=; b=CUE96sHroeoxl+m1v6C7UtG4OmZX/Nxb+TKOoTXhSNmsGi
 OvMnNcC9PzHND8NKstKq4TjDSGl96jprGOtWQjjKWDpspzL7ArHhP6X9q8pZ0TlS
 zYs9HgOzYLpME/HvqO7dTRjj7MYu23RDds/XFejah0xwXVl6B+13/QXoWzmFQ=
X-ME-Sender: <xms:EAkcWLY0rVtdlomuF1ApqgHpyq1REqIVzp-GiPtDbUhItmA2Ho8_tg>
X-Sasl-enc: IoKla3+3WVnNEhStriyJA1kBibiKP7/HUSiYiHewklpZ 1478232335
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64FCCF29CB;
 Fri,  4 Nov 2016 00:05:33 -0400 (EDT)
Message-ID: <1478232328.27396.82.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH 4/4] arm: aspeed: Remove SPI controller hacks
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 04 Nov 2016 14:35:28 +1030
In-Reply-To: <CACPK8Xc99AyjVvuVat4L022eVszEPQFB1dEbdr6=hz0ki7mbpg@mail.gmail.com>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-5-joel@jms.id.au> <1478228924.27396.64.camel@aj.id.au>
 <CACPK8Xc99AyjVvuVat4L022eVszEPQFB1dEbdr6=hz0ki7mbpg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-sI1D8KftSMQar7kvLnx8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 04:05:39 -0000


--=-sI1D8KftSMQar7kvLnx8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 13:57 +1030, Joel Stanley wrote:
> On Fri, Nov 4, 2016 at 1:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > >=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* SCU setup
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0- GPIOC{4,5,6} are =
FUNC_MODE{0,1,2}. These nets are
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0connect=
ed to the Ethernet phy and to ensure the correct
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0operati=
on they all need to be in GPIO mode (SCU90[0] =3D 0)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0and the=
n pulled down
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > Did you intend to remove this? It's still relevant and useful.
> Yeah I did.
>=20
> It's still an accurate description of the hardware. But it's not
> describing the register writes below. It's in the device tree now.

Hah, fair point.

In that case:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> Cheers,
>=20
> Joel
--=-sI1D8KftSMQar7kvLnx8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYHAkIAAoJEJ0dnzgO5LT5LRsP+wRxoPrxntbWlF4HEl4v5Xv+
oPUHuGB86Lrg9/HcUntIJztdAPcnq+Ob3QUASOI8j/ovXjK9dsHwfAz6wIG5ST2r
yLG+lxvRwJq2n//5xcFb78ApXnTzIIQnVg8QQDXycZKvoaZKuyTVYBc+bnj4ojl2
Qp8a+JeH9QruSvrtLQToa/wIcnQzyl3ncESTWwBoB171NKRjxGidvZthVsrgz1KD
4+W3glzAMr7rsRjbEL8/AleG8qE4Fdua0IXEEZPMVj6Kl32BE0BT3HjPSOmUqabe
EX2wJkWp29jUd6wzj2QeMmBbYpHha+ArF11Ezuw+accEqtLPXRxZPnb2Iz+SA7ux
uxvOGYxicVkyFcHDOOYg/V8y/g4NMMhyq97a7hLW0MkxPO4qWZoJO4YQo+GRz9kZ
yjzPLzEF7W7bPSYu3jeksTY00F3YOoEV9ZRJSlcLJwGl/4rEfAqNQeNVmELytfJu
nRJKg9qyvnskVh/wolu+7LXpp3+Yy8b5IpqNh3qvNeEdPtJvEF48cfudV+KJ5asN
Ky9YOfq0zyhuEihikoWm2/BBywaCr/DIM0sshyMXeoXcHzASUQMT80eLLdACpBtb
yX/jSUd1KLaEgMKTO0+0dzuIJGvUofKTJBwn/DO0ehmKTYWoK+1tvtj/dU8073EE
ePjZhFBZ3XbrJ2//jXaa
=nbo+
-----END PGP SIGNATURE-----

--=-sI1D8KftSMQar7kvLnx8--
