Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3spglb45VczDrKS
 for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2016 14:10:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=H3ZWnumM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=hcVm2ns3; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 23CED2013E;
 Tue,  4 Oct 2016 23:10:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Tue, 04 Oct 2016 23:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=uiCiM
 eB+5FZs+lM9rfyvRZSJoSo=; b=H3ZWnumMFksaOpxqAkmHw0syYIQiKr4p4Ke/e
 yjqvBZpcXZssjZm3LiV1LvDNa/HE0ECGfcwbSi04bWqZG1SMyUEE32mrNuC7h32l
 t2QGhPZDdm5i4gHHoQJlYsivslFWRCAaNJMb78x8EETiUa0WiiTVUAla+xQ2kGwM
 Y0KUsA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=uiCiMeB+5FZs+lM9rfyvRZSJoSo=; b=hcVm2
 ns3Nu7W2AkrU1cl132BqOL2goIC2zg0oG3e81REIK9l9bSV0CaRDry27rmLpcNlc
 keN0mL+hBZPFJ4TW/YyPLHx/F+C4j2LwEmHvIvmePJgm6dzFDUgTq6+ewJgcEJUR
 +FhijD1gcdjhIV7Ig8j/SxjlmUBaug8iGs4z5Q=
X-Sasl-enc: VESXSfHx3Mn8N8cQMRXeH4x7Lj6jaZxw0dUKpAEFoqNT 1475637047
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4202CCC089;
 Tue,  4 Oct 2016 23:10:45 -0400 (EDT)
Message-ID: <1475637038.5030.20.camel@aj.id.au>
Subject: Re: [PATCH] aspeed/g5,g4: I2C driver.
From: Andrew Jeffery <andrew@aj.id.au>
To: Maxim Sloyko <maxims@google.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 05 Oct 2016 13:40:38 +1030
In-Reply-To: <CAFR_W8rhiDOkP9RmhgybTMy7X6TUytYqWhU_MUeh3nmj=an0Lg@mail.gmail.com>
References: <1474998214-12720-3-git-send-email-maxims@google.com>
 <1475527322-95220-1-git-send-email-maxims@google.com>
 <915d2b6a-6275-0053-836b-713de89200f2@kaod.org>
 <CAFR_W8rhiDOkP9RmhgybTMy7X6TUytYqWhU_MUeh3nmj=an0Lg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DaD+TzQgZZNQltYPX2v7"
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
X-List-Received-Date: Wed, 05 Oct 2016 03:10:52 -0000


--=-DaD+TzQgZZNQltYPX2v7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxim,

On Tue, 2016-10-04 at 17:15 -0700, Maxim Sloyko wrote:
> Hi Cedric,
>=20
>=20
> On Tue, Oct 4, 2016 at 1:59 PM, C=C3=A9dric Le Goater <clg@kaod.org>
> wrote:
> > Hello Maxim,
> >=20
> > On 10/03/2016 10:42 PM, maxims@google.com wrote:
> > > From: Maxim Sloyko <maxims@google.com>
> > >
> > > The driver is very limited: only single master mode is supported
> > > and only byte-by-byte synchronous reads and writes are supported,
> > > no Pool Buffers or DMA.
> >=20
> > I don't think this is a problem for the moment.
> >=20
> > You should add your SoB here :
> What is SoB?

I expect C=C3=A9dric means "Signed-off-by" in this case. U-boot requires it
per:

http://www.denx.de/wiki/U-Boot/Patches#Attributing_Code_Copyrights_Sign

Also see the kernel's documentation on the tag for an explanation of
what it's about:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docume=
ntation/SubmittingPatches#n420

A number of projects (e.g. u-boot) have adopted the same idea.

Cheers,

Andrew
--=-DaD+TzQgZZNQltYPX2v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9G8uAAoJEJ0dnzgO5LT5iS0P/1pj1B/I9Atprcba5F4WuDQ+
SCzAfa5QtnsViAvitbshMJ1PagRruW0ep+llpbk2b4Zy40POBuwRZX+kqZ1uTvVG
T6CgmwcaSvueBr1teGyUpUNz8OZFiyeIKbg9tCkZr70I5vxWPXoiUv7xkxE5TLJl
+5XVQLlgqaPIumPayYdvrHq+Z9mqR5OxVda9gJCupcjoPT8vmZsPLl9Hcd6B0ejT
rAQBTAnjrUCqaw54twiiXJvOirjYVnZNxFtfOPQb5ed+diVjEjluatX2VMauXCMA
+0opJHuum2RATgkoaFx9eZ3HDbziUOXbnid5VgMRAFKhGBGxjiijo994rJh/+BTP
8ezYHsA/4t+384eh6DDbk+cLvsjdLfKzM3vlFfCOqUhcKtiuY/bl2KEwbsd6iI7a
91xT3vRCx03sim+1+8oF3I/tORRGbgX1aBOJI9ZIhjkJaFEXrCNMIakBPf7kIcEe
KWj0AngSDEvzN2wAEbUJQdVcQLJZIu2mNV4RexB1hbgOMmZizaW3QlZ3tdLFNrBR
mgmh0fCuXU/D0ivPikVKyTNhFunBJTDaTYFiFvMZxGMkXpAL+Mv/M5CYzcjRQ/O+
I5vGJwurmop1dU1lUu/DDRdMG7Tp2p9tuhgFmDr5DLcArNCnsSNrmeFxlA2OOm98
oAg95K8uBGR/W6zIav3u
=p6Y5
-----END PGP SIGNATURE-----

--=-DaD+TzQgZZNQltYPX2v7--
