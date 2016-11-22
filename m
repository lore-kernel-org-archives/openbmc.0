Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDJM1ClRzDvjw
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aIGeCt7L"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hJEMgf8t"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB430208E8;
 Tue, 22 Nov 2016 00:18:08 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=HJg1gqdWoNQLTve/NL7YSV+Nu44=; b=aIGeCt
 7L9XWr3G7r0QiB5V27rKtb0NPiCNIbb6FQJQbeyOj7GAG1o4ZKOEEK30HVe0mHfp
 Frv/QqqgN0lg0zm9v08zOqo2GoUduJjLL9b3OtWEh4NAOua7mLqBdyTLSUSCRdXm
 dmgP5zam1aBY8B9J6I9WIlLJTvVtQcDTJp4zQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=HJg1gqdWoNQLTv
 e/NL7YSV+Nu44=; b=hJEMgf8tIIdf2fMPDPTEXg5iBu2vgzi7shSqWH1t0Q/3Z3
 U2NpJ8w6XfTGeOZ23R404UBo1ghTsEl6OFWHgCRy9g0wbYWYJzYlBo7SufbdGLUq
 lw3tL4STQYV4Bim51lT0ov4szltV6vfNYhxzwgVMo2nUWNC26Wf17avOXzVFQ=
X-ME-Sender: <xms:ENUzWEa_KVsfGGIxUFkUPQ7Nb2sjwg56Sev1e_RRxRYgMXhV8_TNvw>
X-Sasl-enc: 07uH3dpDyk6BDWxutn/LFQAOGK7yZsMA0YaZh5avWu0Z 1479791888
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 999C92442C;
 Tue, 22 Nov 2016 00:18:07 -0500 (EST)
Message-ID: <1479791884.2503.27.camel@aj.id.au>
Subject: Re: [PATCH 2/7] arm: dts: aspeed: Add UARTs to Witherspoon
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:48:04 +1030
In-Reply-To: <20161122040849.31604-2-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-2-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hh8PP8ITif7eA1+Lj9+y"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:18:11 -0000


--=-hh8PP8ITif7eA1+Lj9+y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> In addition to the internal BMC debug UART Witherspoon has a RS-232
> connection on the back of the chassis, and an internal connection to the
> APSS.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 23 +++++++++++++=
++++++++++
> =C2=A01 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index c7458ae6efd7..5c463f4112f6 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -42,6 +42,29 @@
> > =C2=A0	};
> =C2=A0};
> =C2=A0
> +&uart1 {
> > +	/* Rear RS-232 connector */
> > +	status =3D "okay";
> +
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_txd1_default
> > +			&pinctrl_rxd1_default
> > +			&pinctrl_nrts1_default
> > +			&pinctrl_ndtr1_default
> > +			&pinctrl_ndsr1_default
> > +			&pinctrl_ncts1_default
> > +			&pinctrl_ndcd1_default
> > +			&pinctrl_nri1_default>;
> +};
> +
> +&uart2 {
> > +	/* APSS */
> > +	status =3D "okay";
> +
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_txd2_default &pinctrl_rxd2_default>;
> +};
> +
> =C2=A0&uart5 {
> > =C2=A0	status =3D "okay";
> =C2=A0};
--=-hh8PP8ITif7eA1+Lj9+y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9UMAAoJEJ0dnzgO5LT5nrAP/3loKOQ3tjOmpgD+Aq+mBC6D
i0UQpdBK3nfZ3v8PgYOYTKCwDExGp9F5bN4yL9pvBBpdZM9eF7XiFFja1jZtolYo
AZZkZVMa87YEQS9SFiJoplpoTDeN3e/+fRon3CARWmuTXmg0lL3Qp5G8AbCrfTBI
BRpdrT/T1O7lguLMl6F29h+8Lpjo/UczXxo/VDEAR2KI2jMbq6PsnNUib3XtxsWV
teUxdiTxlMKaHN7d91OSBLDO9HGuCmSXNz2IjaJyBc5k6NbiBJLHqlSqAxsguzmj
vftcrWMnvGgc9xBWAY15X1NecvpI1DWhw0zrEsEPKpfw/VP5e8l/ZVvicwPJZZUD
k3u9ba20MgdbwMT5S/o9BlVTcjoRhwUTyj6LUqJU1ijyUE+HfeKZG853dI7UbLW9
/oUOztBrGB7F+2YEGgvRLjlYy767xDzauV3c1crIA7eKLCEKbWQIGGATbDXKNqcf
rlkapCyYeA2/uhJwjtE0W4xeESPiKXj0Q4Fh5v9llTzSGRJ0d0ad5uYaqP4IrJUg
kKVY5AQ7lLCWyJlStvSNF6sv5dlhvV6x+KkFu25R1dPKBBfYd4EAfDkapLi87MOT
OTNebrgLpyMTbdCmZ4SSMrCtlZ0nYYpHCPCjFG/dR0XXWWea8ykCC+L6ZWPDIZYf
zrpmEfIWxlqDKbKPYEgG
=DVRU
-----END PGP SIGNATURE-----

--=-hh8PP8ITif7eA1+Lj9+y--
