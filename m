Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMlJh4wqrzDvxq
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:31:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fGDmqz4V"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HrgM6YZR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 38FF820274;
 Mon, 21 Nov 2016 05:31:46 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 05:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=KuCDhu7kmatA0Yz87/G4Ek93ec8=; b=fGDmqz
 4VlAfiFE69gi4ssfo/FloXZpgWlWnrQrvLoem2aDOUDhrcc3yULAeel7LbCjqCJo
 lyjgxL/AKuSt9O5XaDVAFy7dIaNL/+YI9FkqmoVt1A7QeGu0mpF93Z4VNy6vYig5
 NP5BR1xoWhHberM9gzCA2iAmQRnf4at+OKqMw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=KuCDhu7kmatA0Y
 z87/G4Ek93ec8=; b=HrgM6YZRJhL3MaJI8ohmVlK59kJYNrEmoyXO+1svf0jE1z
 tH/5HaVMQYt+XhpDjmmkKWQ7jzBTLcjnTCxDWon2ELk2EkA75m5ODLIA3OCCVNs7
 n3oPP00j/CZ4nQFTyAyrY66y1f/FShDFVHZ6ak9ujrKZcQcpeqMQT36QammHQ=
X-ME-Sender: <xms:Es0yWHLGCKVqCbfwCg7nsJWTGsHg-1nYgArWyc669OanhWX0vvaNJA>
X-Sasl-enc: pWTHMubCOH3syPGnOkJtjVr+d+xD+qOop7n76bSJAMFo 1479724305
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 124DF7E42D;
 Mon, 21 Nov 2016 05:31:43 -0500 (EST)
Message-ID: <1479724296.5215.21.camel@aj.id.au>
Subject: Re: [PATCH qemu 01/38] m25p80: add support for the mx66l1g45g
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 21:01:36 +1030
In-Reply-To: <1479478938-13267-2-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-2-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZlHtZb8frGMMm/CHngmN"
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
X-List-Received-Date: Mon, 21 Nov 2016 10:31:49 -0000


--=-ZlHtZb8frGMMm/CHngmN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/block/m25p80.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index d29ff4cb4f4b..e3c1166ea6e3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -203,6 +203,7 @@ static const FlashPartInfo known_devices[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ INFO("mx25l25655e", 0xc22619,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A00,=C2=A0=C2=A064 << 10, 512, 0) },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ INFO("mx66u51235f", 0xc2253a,=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A00,=C2=A0=C2=A064 << 10, 1024, ER_4K | ER_32K) },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ INFO("mx66u1g45g",=C2=A0=C2=A00xc2253b,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00,=C2=A0=C2=A064 << 10, 2048, ER_4K | E=
R_32K) },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ INFO("mx66l1g45g",=C2=A0=C2=A00xc2201b,=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00,=C2=A0=C2=A064 << 10, 2048, ER_4K | ER_32K)=
 },

Looks like there's no flag bit for 64K erase blocks in qemu?

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Micron */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ INFO("n25q032a11",=C2=A0=C2=A00x20bb16,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00,=C2=A0=C2=A064 << 10,=C2=A0=C2=A064, =
ER_4K) },
--=-ZlHtZb8frGMMm/CHngmN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMs0IAAoJEJ0dnzgO5LT5F9cP/2137FpGgWgi1/C2YODfdeRf
IoRqYL48odrEY9+G1f0qmJWP5u28CMBTPK5DlEtwVWgs7sRBN4nxu3SDnTl6oAAq
k1GfQGAaRr7RJl5sN0AFRdR40+z/BfxW5lecOnXnSThYYg/4yD36+XQhpw3sglhh
Whs80dezdDuwZ8mxc+DH5vYJRyb2+faGibj9wbJVNRE3kz27jUXjeWhoosixG0zD
4DCpcclbawWw1sW9tM0H/AQy8LeaWBtHb/i5xpQjooO1ttiUD4rquGtHHD2wYLDz
Tkby4fzKiZnZAKUilW7UQVMtRF3Q208AZ7elVaySE+icFKdAwKwnYok5CNEoB23k
tmpMT9fdttz7d83nzAEtn59vcU2dPAC0969cI6Rm/3dHtcb/qTwM2Eu5/Bw7Mclr
C5moXEdfPhqiseauCxU3igiE2qn+6y56t/v3Dl8TwGRPp1hhS6KKbvWshOaRU/SN
1OlzY4N72l/bckEtfpM3TytIfvZa1a4RNdWL8Kt+4cpzydvRFPeTuq6zDfVyHt3G
4AcsnGE2DKv84ifAbIulc2ehH72ugT8U731h1zneK88BARXIwyJPLw8LxvDhIPJx
uT0stOQ93iElMS2zZx0aSoiF1MO2nGI1HPjPNhzYXcupsgZWdfYNzjAH8Yvle5ZW
/RR9Sd2yh4YM5pgerLnB
=oMxH
-----END PGP SIGNATURE-----

--=-ZlHtZb8frGMMm/CHngmN--
