Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDPQ3G49zDvrl
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:22:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KTnrjZjz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DH18JFkP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F48B2049F;
 Tue, 22 Nov 2016 00:22:32 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=cZzMZ1YmnKjH2h89ysvoGrS+ELI=; b=KTnrjZ
 jzuolV+Zeuq1nVXWbL+8Iymr/honHa71KBq7rGe7G/KPqoyykQ9n3MGy+TAongnS
 GoLFzDoF3fH3dwaW0Vf7N6691/VekloYcyXSI/vxJDG276DxS2gQn1ZzyRD+ZHlX
 ZcCEwLXPrpXNdzJJw1kEsnGeAOd89bd+/3M54=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=cZzMZ1YmnKjH2h
 89ysvoGrS+ELI=; b=DH18JFkPEkpYoaP12tEuXSmVO8dRVoNQOEwx4ujYcnPORN
 vp+PSs/352xL64b1RSFY2H4NhWRZotTJcj8dqA5QoGebxQaPJQbqVs+piuaPpBlJ
 DcatVmEH/JIi/DIsj2JuqIo1LZMZyk4ipRgMadTbzjnggyHIM7MRl8Gyj4m4Y=
X-ME-Sender: <xms:GNYzWJAWiNx1jCyWXMFFfEGW0lwsty8pf9APZAUXh_BFmOI6IJj_ZA>
X-Sasl-enc: QwowyUcFxClwi4wo5o43uFLlQrYEB1rWKMUDK2TVWCrp 1479792151
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E5BE024420;
 Tue, 22 Nov 2016 00:22:30 -0500 (EST)
Message-ID: <1479792147.2503.30.camel@aj.id.au>
Subject: Re: [PATCH 4/7] arm: dts: aspeed: Remove unused pinmux from Palmetto
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 15:52:27 +1030
In-Reply-To: <20161122040849.31604-4-joel@jms.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-4-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-D65knQCoCwHRvNJTcRUo"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:22:35 -0000


--=-D65knQCoCwHRvNJTcRUo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
> These were set as the common code in the board file set them to these
> states. A close reading of the schmeatic suggests this is not required.
>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 9 +--------
> =C2=A01 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index 8fe248f4d531..d16c67935499 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -71,14 +71,7 @@
> > =C2=A0	pinctrl-0 =3D <&pinctrl_flbusy_default &pinctrl_flwp_default
> =C2=A0
> > =C2=A0			&pinctrl_vgahs_default &pinctrl_vgavs_default
> > -			&pinctrl_ddcclk_default &pinctrl_ddcdat_default
> -
> > -			&pinctrl_pwm1_default &pinctrl_pwm2_default
> > -			&pinctrl_pwm3_default &pinctrl_pwm4_default
> > -			&pinctrl_pwm5_default &pinctrl_pwm6_default
> > -			&pinctrl_pwm7_default
> -
> > -			&pinctrl_bmcint_default &pinctrl_flack_default>;
> +			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;

Do we need any of it?

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> =C2=A0};
> =C2=A0
> =C2=A0&mac0 {
--=-D65knQCoCwHRvNJTcRUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9YTAAoJEJ0dnzgO5LT5w8sP/j/Zy/QFICxo3DKDmw9Z2ijh
0wP2jT3W+y1yYhuVyigUhdz1MZTy7OWhBs9pv2ZRq1ARIYKPdhArr04RBkspoGX3
orcnaOtcpm1MfRitLx0Pm1CaiCqRBCXAmbgsBQmsYH//S8rOY49PCdQYlPkvpoE4
zmmdweUb1Von1lEO0HT9kaf937MHkG0REmDgbQu3QXOsShrOxOA0uy8rOPhUn6Wf
hAc6ERJ6ixz/jqmyccYuhMEkQAcYa3BZGHPntcWBMm6Ms/B92Wsi7Yw1yPCZdyGl
SCmmoI2cXXoWHzHaIdnzAXJvnjeWHimdET3NyYKi/EJ/SJT++mUZag+ZjUeecKik
w3E9Y7QfsZQQ/npzhtaFdZB5HM8q8S2KFr14OBDBE9uwcHg6oUJFz2PjxgttiDKm
STHrmLiW7Ky8feRTtgySYbMuNPkN3M6M7D+AuC8N8N3/A2dS3Rf3zlNGzVTKdqql
f6OIDZ3Zjqz0XY9woomgyTcOIk300My9V3SSMpodji3RjUN37o2i/hNwIpDJYFcy
U1thSMG9cm2fBltnKlcl3flnwi0zo23AIHWRZeN+EqxWPV2dwCaK661BbMjVlDqz
7K2Uw7VH1paInrGDNtuVxhcyg9o6QJF1AZ5fK1jUCo3/1ibg+ilwocFJuUY3wyU/
/d0k/UwsTUU6Ut4TYy6B
=ngZ9
-----END PGP SIGNATURE-----

--=-D65knQCoCwHRvNJTcRUo--
