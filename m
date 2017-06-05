Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh7426NgdzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:18:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ad6axY+F"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FKkN3+eM"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EBD42099F;
 Mon,  5 Jun 2017 04:18:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 05 Jun 2017 04:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rwTvHmI0L/lUUkVn2gPlvnEoPjG+tvcS3bo378aD6
 9I=; b=ad6axY+FM8urBXs1Uit/5/Nyh6dTirLhEozuB21sundzTBe/oL4w3kaLd
 VUAraznQgeDx3Y05fEt1nchHr5i4mQcu+SPSpb46DKF8iyOaf3PJHFTDeQT/84+k
 G8gl+SbG2vYrBD66ZTw6/mcM0dQ8ufPz7Ylp3UDam8KZeUP6HsFP3gupEPWbq07H
 TM28Nqu54g8P66NHkawiamlIZ2UFZz7wY5ZshB8c0nOXULCZWRYEuyUdKI2AmLbr
 YPUrOQPVHYjG/8s/1yXLMxy0yU4GDd9+dZwXizyY09bKMFkFKo4xYO8k4ywkM4Af
 zrlt8gX89IRO5f+aSKN50zT4SMb5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rwTvHmI0L/lUUkVn2g
 PlvnEoPjG+tvcS3bo378aD69I=; b=FKkN3+eM9oBMCqDHNLa3m02/bd/RCBCeZN
 j6OOgOx0UdpDPeKHWg0QnItsybvSxUhjfjcbqwYLC+d5LJn+pzvWis2KuCempFM6
 +9cI3h+akTzvKQtASnUdhIz5oAnhy0DC4BSaoNwQAEf4HFofw2YpeiUYU/4Npmq8
 9NG0Vu96XfCI0HARDIYQMCBw3N4ntHnEYODCbwlymKhVn8Yyyc32xWem8k5twzGX
 GongdtQGyE06gPlWvzkLmWxtXB74b6mQVPav0VlVQOkJ4msk1/xGK34c969p2zB/
 arHdZRYarsATmdsHdvvveq/a9wY8UrT8FFgDyKbPhZFMaoqE+1qw==
X-ME-Sender: <xms:wBM1WTf0eCuK5VktwXNRZ_-n2oTu2TjGIhpvjFID-b6PtKRbScjq8g>
X-Sasl-enc: k+HEcmyW8/C9nPXgaFTVdRme/2emOMjBuJBJBoSOLJnD 1496650687
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1B677E7AA;
 Mon,  5 Jun 2017 04:18:05 -0400 (EDT)
Message-ID: <1496650682.8159.26.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 0/3] Clean up mach-aspeed/aspeed.c
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com, 
 ken.th.liu@foxconn.com, john.hc.wang@foxconn.com
Date: Mon, 05 Jun 2017 17:48:02 +0930
In-Reply-To: <20170505024227.30962-1-andrew@aj.id.au>
References: <20170505024227.30962-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-cotRkPcGRjyv2BGPxf3V"
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
X-List-Received-Date: Mon, 05 Jun 2017 08:18:11 -0000


--=-cotRkPcGRjyv2BGPxf3V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-05-05 at 12:12 +0930, Andrew Jeffery wrote:
> Hi all,
>=20
> Here's v3 of the series cleaning up the board file given functionality we=
 now
> have in the tree. Between patches acked and applied from v1 and v2, there=
's
> only Barreleye left. I've dug into the archives and Cc'ed Ken and John so=
 they
> can provide feedback if they have availability.
>=20
> A slip of the fingers meant that v2 didn't actually get Cc'ed to the list=
, so
> apologies for that. Xo kindly Cc'ed his replies so the acks at least saw =
the
> light of day.
>=20
> Again, the controversial patch is the debounce patch for BMC_PWBTN_IN_N, =
which
> changes how the GPIO is exposed to userspace (and so needs a correspondin=
g
> userspace update). I'm hoping Brad can give feedback or start the discuss=
ion to
> coordinate the userspace change.
>=20
> Cheers,
>=20
> Andrew
>=20

Joel, I'd like to see at least the first two patches taken. Hopefully
some of the GPIO work that Brad was involved in can be applied to the
Barreleye userspace so we can also take the third patch.

> Andrew Jeffery (3):
> =C2=A0 aspeed: barreleye: Remove unnecessary GPIO configuration
> =C2=A0 aspeed: barreleye: Passthrough debounce isn't required

Take the above two with some testing.

> =C2=A0 aspeed: barreleye: Debounce BMC_PWBTN_IN_N through devicetree

Take this one once we we're ready in userspace.

Cheers,

Andrew

>=20
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 11 +++++++++++
> =C2=A0arch/arm/mach-aspeed/aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1=
8 ------------------
> =C2=A02 files changed, 11 insertions(+), 18 deletions(-)
>=20
--=-cotRkPcGRjyv2BGPxf3V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZNRO6AAoJEJ0dnzgO5LT5G1cQALcJWds9u1EKDNKOtOy/7jUU
D/Wr+3+N1PU5gkSJsUIYgukzyciGapZ1i/EE8D9TmfXDD/iTrsN6gTJ8Irn63pUC
n/Pkm9/Jj1/nm7yw2B3LS1ad7+Pr6/AqxJnbVmuIJsZLb9cI1gHF8EYT3r5WRJRI
rzVttBNDXXCOTuBzl2llg+aqqOZkx27W9/7+pYYtOTKTpPOEwegEhjrgDyTGHyQy
FbGb7fSElQDNBEMbnRO9UnjTD/awlgInXWhi2wRVrlErjUPHSix5wnP08+lzWv6d
wFvkbenrQ6zAr0dlgWwMK6n1Fkd7mY4Wfrn5zHyisLzLDP8TO6jzERn0rxmaLuNB
C5WJblnkQPF2k0FUDpAgdBkHSVADmDUZVkH6/biwdxgDgOPDksVTSc6Jt3UtlVZR
41rxqK3rJmbW3yDxKLec1bajkuSMuyNPlaxo7EJjwx0KmLa+g/xo7oB7YQ9h+TQ7
W7mZWqomrqgLL4xCqe/zpyW2dxACxmNkyH6SnH1A9y7Gx7zjLo0xDGiS3D68yTwW
iQpia40rKjKCWtYkShrFvDf9jHVx3bnRIUsGKC928e2/uFmfdt2ceRHo26+6J6D1
N//t6+ujruguga2iZ1gxP0rW5lAW9TmeJ5P6wiJqouskVVQ4chniVAapTsGygvuw
E2HBnK3BlNFlYF7ypGp8
=10Kn
-----END PGP SIGNATURE-----

--=-cotRkPcGRjyv2BGPxf3V--
