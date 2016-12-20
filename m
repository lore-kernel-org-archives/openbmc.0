Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tjK8w1hckzDwRt
 for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2016 11:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BeEdi7Xm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="K8Yckz0r"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 23D3F2083E;
 Mon, 19 Dec 2016 19:55:58 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Dec 2016 19:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=dryJzgioYMbR/5q4yI+ES6V0NAg=; b=BeEdi7
 Xm7MkoRhX0urbU45lZlrouPwXGuvhStkpq+zkDm15OcvzKGG6rMCZ3KLFJc8ojSE
 d6Xas05pDCJtrHadyMSb5CcccvSYkPcjea9svBEbH3KO26VWhx9WjROXZoC/MefX
 SGnh5scx0CQkNVSEbWDBNUrGV4VkwKDk2B9qM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=dryJzgioYMbR/5
 q4yI+ES6V0NAg=; b=K8Yckz0rPlxwDGMguCfDJR5u4Jw43X+zv/h8UP+Pl3cgN1
 wKOT/nCO3vYTg1Fgq2fIWNWYiemC2zPrxLF085mV7PWvmpvIQOsJg6cuzM/Ni239
 23LNbERpdSKnpkVWK5al/Bl7286W7NaQPJfujd41iM4oMlgZhPXpiYX02u44A=
X-ME-Sender: <xms:noFYWNA4-7hssR7j8GyheHKp23r5bExIwSs27HiwsiKe8u4N93dP0g>
X-Sasl-enc: jBUJgOXNjSqJzY3YUGCLjxKC2fcyUJX9ohkjqXhUyCJ5 1482195357
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 052F37E808;
 Mon, 19 Dec 2016 19:55:55 -0500 (EST)
Message-ID: <1482195351.3419.16.camel@aj.id.au>
Subject: Re: [PATCH linux 6/7] arm: aspeed: dts: Add I2C POWER8 OCC
 compatible string
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 20 Dec 2016 11:25:51 +1030
In-Reply-To: <1481920568-7080-1-git-send-email-eajames.ibm@gmail.com>
References: <1481920568-7080-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9zwdVFU3pinlLEDqd36G"
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
X-List-Received-Date: Tue, 20 Dec 2016 00:56:00 -0000


--=-9zwdVFU3pinlLEDqd36G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-16 at 14:36 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> Add devicetree entry to probe up the POWER8 OCC driver on I2C bus.
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index cc5fcf2..1a775f5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -20,6 +20,15 @@
> > =C2=A0	};
> =C2=A0};
> =C2=A0
> +&i2c3 {
> > +	status =3D "okay";
> +
> > +	occ@50 {
> > +		compatible =3D "ibm,p8-occ-i2c";
> > +		reg =3D <0x50>;
> > +	};
> +};
> +
> =C2=A0&uart5 {
> > =C2=A0	status =3D "okay";
> =C2=A0};

This patch should be split out into a separate series that gets sent to
the Aspeed maintainer (Joel).

However, it looks good. Given it's been completely re-written I'd drop
my signed-off-by. Instead you can add:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Andrew
--=-9zwdVFU3pinlLEDqd36G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYWIGXAAoJEJ0dnzgO5LT52xIP/1bDvLCnPBRdac1oBAw014hA
6UE3dH2NZKSEggdT3YDn43FIaYE2ukDi2iD6+CWEYQWuE6U/BwukYsITv4mz7y58
eVWKDrDICrGO7xP/WVg3c60ZbMHlQO6Am4C027oN3wzwio1+TdvzjQUUhVAnr8bv
7MIzqQTFJ6DtQeqy74jaVk5DqTdK8Zv58LHfzgzgC61CyFqi2ZlZuCoLEvWuiwOX
1seo8at4LDlg7kIR81fCFHDbXUIDuykBJRgtLZMNL+4ZwOenQsnNPoLYsaOmsdUo
cI4JA406DPJIXZ+BQKasomoWqHk5/HIu/CRMdRFfHdGRBBazA0CRK9LiNKXQ0HuK
m/9xJl0jOte7EtbGKZv/rKTdJS+EWg0ZMGTE3llgoznh69SbJdf3gnzLqmYq3BcY
cNBmgRFGZzmV73X/eoHEnJo5jTKSFHk263UAst/dn/tDcFxcFifPHNP7uW6222sI
Xq9n50G+A+wPrLvdlHixqEugrfmtWv0zBNWSIqoM+crfZ2CibB246Po2JwCgGszj
xj3rcSMHIwgaapKLLux+0sCbMCYFVUMe9g8G3twXYHnQ7Mz9aHyiWxlSzUXQT1x8
0WwkMy5dWqZKn4HW/BlNvPzPQV8MwonfVaHn67ahl97ZL0mAUwrrauOy75YQJFD5
GvxEOs5ld3JNcS1QDuVC
=qDmU
-----END PGP SIGNATURE-----

--=-9zwdVFU3pinlLEDqd36G--
