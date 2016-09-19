Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scncG5vKXzDsTW
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 11:00:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=HbyRx8Pa; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=EyfnCwCN; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 090FC203D0;
 Sun, 18 Sep 2016 21:00:12 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 18 Sep 2016 21:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=MJWpi
 eJzPjF/HRek0vG0sywXgPI=; b=HbyRx8Pazi5DmqsXQj6dmxmgJZvOZRGPXdbp8
 gT+okkgZUvxWoeQpTvt3c9Eql6mI0zbf6p7YHn+EceHWeTUsaPRx8JqvauPei9P+
 ppeS+Vh8+l4lVxc/uVE3un2m/qAUx9GJz/K6l2/DPHiN7Z71Ohgc7mXYdOR4FivZ
 jrS58Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=MJWpieJzPjF/HRek0vG0sywXgPI=; b=EyfnC
 wCNB7iQ5H/iklxIfMHdmeb8H4qhGQradU2o2hILNOrf7oknj62OugYQOL6D1Nn21
 bWRr8KSIlfLV8e7iPG9M7NchtNeQw5Ov773m4M2PPLTsuE1KaufrmBmvSIcv/u5a
 4RcA29TogXxnDhsRCVLOI8RKw5dek00gyWNfWk=
X-Sasl-enc: K11mCZ08Pty48K1aY8w0oAjHUnij4JDZhuVErjNH+kqU 1474246811
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F163CCE9E;
 Sun, 18 Sep 2016 21:00:10 -0400 (EDT)
Message-ID: <1474246806.13249.48.camel@aj.id.au>
Subject: Re: [PATCH 14/17] Enable RGMII pin functions in Firestone DT
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Mon, 19 Sep 2016 10:30:06 +0930
In-Reply-To: <1474058133-27363-15-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-15-git-send-email-tpearson@raptorengineering.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kYnFFC3VlxpDLoR0+7BG"
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
X-List-Received-Date: Mon, 19 Sep 2016 01:00:15 -0000


--=-kYnFFC3VlxpDLoR0+7BG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
> This is required for BMC networking to function.
>=20
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |=C2=A0=C2=A0=C2=A0=
=C2=A03 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index 053fafe..36c95a0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -72,6 +72,9 @@
> =C2=A0&mac0 {
> =C2=A0	status =3D "okay";
> =C2=A0
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +
> =C2=A0	no-hw-checksum;
> =C2=A0};
> =C2=A0
--=-kYnFFC3VlxpDLoR0+7BG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX3ziWAAoJEJ0dnzgO5LT5lhEP/0Yy8mjbsQReIROKWO7ZD4AR
aZse+3K4/4TlA+Mv5k82AJhWN1CcjCwVpkiBUst9+3z7/T9i3gjtbwmhMLoiY2TH
d4/5P88lq7QD+7QPdJgp0tiEhNB5EPQYf6HYh3ucAV6nWq/R4/Ez5gYZ4OXcbV6z
5QqR+0RCSGArRe7bbjrZZtdjce3oGkxyaKDMSMZfY187ghkzYUKEOJlwxRyIDzb2
r1iyGfDz/fpSu9U6BAKznRNhZNQwDocld/6kJpOTLRcUKUHtQFYeJnSgvgfXE/dr
xm2GvXxSWeHPkqiz3pFc42gVWOePCAH/oQavFz5ylnEmiS2MQ5duEUtvevc2+afx
ZlsIePh0gcrhrag9b319BNXWq2Hsutq6qqjhP7gzI30mkI9GBCsWMl3U4YQjVX8N
AEx9CFv763YozzHPXjAoreVYGjPssbWwaFyL46KESkIS8HOfBf0nHm30iIKpzw5/
yUED99T22EUyXGu+QbejyJ/+Nkb+O9crp0m0myloX1wmfLLNfF8BsUJOkHvY3X2G
/XzWu9IU+dNp4cY8mPnVXFiMxRMTqF6fNqJZ/oQlB1qduTKRUSZckwW+MJqOkGoP
CvrrRyl/LQc17qdSBPljdT5eXfyqUJKRTk24kC5UqClsf213M3Ky8zpk2nMR9N3d
0TidKlLu9IIxgoN3v4n9
=KUpr
-----END PGP SIGNATURE-----

--=-kYnFFC3VlxpDLoR0+7BG--
