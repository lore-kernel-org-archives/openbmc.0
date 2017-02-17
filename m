Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPjKp57cNzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 17:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SJw/qoa3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NFx5C80W"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 05FDD20998;
 Fri, 17 Feb 2017 01:09:47 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 17 Feb 2017 01:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=IwDVEY2Q9AJ17Kn8pAMevQdw/yU=; b=SJw/qo
 a3Y2bKbcx8sAOFnN2aieBcqbujNxK+0SPqOjpS684PFu593BmGAxiAK7DpkOy11t
 eoN820Lmz7wY/RjTr9tRP1VIPEZai8bpslNd7exGJ798KuTads/RuQs5hfDLuq6u
 vciDwtXtPaNgt6mW+5k9BBVwAiMoogfyIAWMk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=IwDVEY2Q9AJ17K
 n8pAMevQdw/yU=; b=NFx5C80WJDCFy8En1fJQtb+KSNqviLmhzQuz3zq/HB6cbk
 G7ndoE7j73CehfDt7irKHd00rQBXNvD+gRkfZaIrAEgDDPbIFvba/jzYlt5Cb89e
 LcuHFT0+DqIXk5vIRp2W7l82Lz/x0D97Oe80eyajq9aYBf6632TnE/EF8SMbQ=
X-ME-Sender: <xms:qpOmWGvd3uN9asYo70WJcifGlwIUfEBceLgnvkdy1qUooLW7_tcFqQ>
X-Sasl-enc: qJbVoTIv9YwFxjpP0AP9sCXPQVB5awmjBqSJv+hT1Lrm 1487311786
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA22B7E0F1;
 Fri, 17 Feb 2017 01:09:44 -0500 (EST)
Message-ID: <1487311780.3661.43.camel@aj.id.au>
Subject: Re: [PATCH linux] dts: aspeed: Enable MAC1 on Quanta Q71L BMC
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, joel@jms.id.au, 
 openbmc@lists.ozlabs.org
Date: Fri, 17 Feb 2017 16:39:40 +1030
In-Reply-To: <20170217042603.25864-1-raltherr@google.com>
References: <20170217042603.25864-1-raltherr@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-rKvWpOlb0MuAMhKuP8B8"
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
X-List-Received-Date: Fri, 17 Feb 2017 06:09:51 -0000


--=-rKvWpOlb0MuAMhKuP8B8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-02-16 at 20:26 -0800, Rick Altherr wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot=
/dts/aspeed-bmc-quanta-q71l.dts
> index 229764c091dd..713246090906 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -75,6 +75,13 @@
> > =C2=A0	no-hw-checksum;
> =C2=A0};
> =C2=A0
> +&mac1 {
> > +	status =3D "okay";
> +
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> =C2=A0&uart5 {
> > =C2=A0	status =3D "okay";
> =C2=A0};
--=-rKvWpOlb0MuAMhKuP8B8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYppOlAAoJEJ0dnzgO5LT5TMwQAK0oYQUCSTu2W2ufr7WlLCTn
lNuVnH2+zhDp0DaVjh+VKHpRyWK2m9dFobY9swI1xTWLenReOsubqh+ANUrst8Ql
1DmAHAidn6QVtINq/jTCxWKeSSB9u7dbAEUGBIHmzJJb80VcCPnmOR6XiAw6KPfS
VXXaFjgr74hna3aulZoK/u8qfpEdAFDH+f2ENNJpxlF0Vpl+5ri/8rrGP3l5JvPW
j/KIN3WPaHcrcwYx/QmjazhXZi/wiSkf7dmOEOrum9IIg1Sld3UDFadCeUCUPJRm
KqFDns9DU3ef5xOHVfbL9Cbm7ofCaL1jf5zroRLThJo3mFXOOxMvS65iv3/UCUtT
zzS7oyO5uiSsJeHjHJkzRCRnE3lNiEzPP20yus8M9WmD2RmP61q930/Tf1/QgI/8
g8/PQi3vH+Wt20+2kmGnXFTNQNhkNupozaWUcyHpPD1uIOOX5fQHbsNY+onwfTSw
rCqFsbbtzNxt7xB7yGWnWyQJSaGWdLgnF1jv9XhAnJ5o41W6RdBgH/4B4NyqaQY5
EEawgOCjn4ofirgxTVlnh87lWvt0+eFj8Kyfewmte2mZQbrGZoqWTBe7noFNGh29
GL7CXvi33AP3OSj6xAJEphl6JffEyUAdV45Xqla1Idq4C+QhlYt2tq3cuUpyip9q
g6rVpSRx33W6zBstzfeZ
=dhqm
-----END PGP SIGNATURE-----

--=-rKvWpOlb0MuAMhKuP8B8--
