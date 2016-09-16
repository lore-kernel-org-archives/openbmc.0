Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZzXw3mPczDsZ2
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 12:21:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=HLFMTc9h; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=S5GP3H/n; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B324207AC;
 Thu, 15 Sep 2016 22:21:02 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 22:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=HBDCb
 qGt3TfZad3HJ+TGV2VLSwY=; b=HLFMTc9hyH78OL9ETpoMt3e7hiRStMCDOX4To
 Vf+8k3+0iTJL+CESMiWToDENEbKatunAV0Nz1UfWb0QF+HbWsEft/3v6GJplZZxB
 el1UCn1pENkhvnGlw0Ed9kp2IHCLueeW59b7gUcFMQ0Zyzie+lEZIBoxP1Kj/Nm1
 rmy08g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=HBDCbqGt3TfZad3HJ+TGV2VLSwY=; b=S5GP3
 H/nUxHBXdh99UUPWvCNrrBf2B+aPwuLRuhdozolKo9U1raecrM3iGcDe2A0sncBD
 gYzKte/PUfsD/4CidGncZtHQHlV3rPuS+XdXyBSZj2pZtnWpV4LiwPdyx560dT4L
 Xz4rvn14IIsSIUnue3qNI8td4WtcxBB3kA80w8=
X-Sasl-enc: zcqgy8oiOXSOrl25FieVZ0gzZRmZ2KSrQZ66xacu/cSb 1473992461
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11D1EF29CC;
 Thu, 15 Sep 2016 22:21:00 -0400 (EDT)
Message-ID: <1473992456.13249.39.camel@aj.id.au>
Subject: Re: [PATCH 13/16] Enable RGMII pin functions in Firestone DT
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 11:50:56 +0930
In-Reply-To: <644340813.194637.1473971868909.JavaMail.zimbra@raptorengineeringinc.com>
References: <644340813.194637.1473971868909.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lDljh19GKIe/rl0BF5Mk"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 02:21:04 -0000


--=-lDljh19GKIe/rl0BF5Mk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject should probably say for which MAC. Also, you need to add a
Signed-off-by: line (for all of your patches it seems). With that,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

On Thu, 2016-09-15 at 15:37 -0500, Timothy Pearson wrote:
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |=C2=A0=C2=A0=C2=A0=
=C2=A03 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 053fafe..a2a2ef2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -72,6 +72,9 @@
> =C2=A0&mac0 {
> =C2=A0	status =3D "okay";
> =C2=A0
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> +
> =C2=A0	no-hw-checksum;
> =C2=A0};
> =C2=A0
--=-lDljh19GKIe/rl0BF5Mk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX21cIAAoJEJ0dnzgO5LT59mgP/RMkb3e3CjtLtIUIim5EN9Yw
UDYne73YzOX3/oqAwJc1SjISaHrIWTfjz4mhQnDwsnfwB3612m5bNVMGfHq6iVUP
v74TRjj6MiPs4qbTOVfnzzimFR5dNb/bb1hn00ub9JirXUOKpLUf7m72vekTKQTI
MKkpZoIaFQ52mMl5NweomcGbgHqwFLQLZyZzRwTUMMTvwWOt3twrzDvmGvrxahcA
q6XBXaX9WURvMEq7pvvitBj783WVsDEit7ToZa7zEB9+KUAjDS/U8UGLRFttcNsg
V55dRkH4GNDprSvxtKBEL9HuqPw/RijjlXgl3qBY4ZQ4xjDbbx+EUW1qiIpGXT7M
+Ds9l2E4X4jzz8S6qeK+jNLOjrbBB3XHehKjuMYaWo5KF30xlFZpyUTQQRWkhact
2JCW6JPKC20AYhUgb+WwN8FLzXiEROIqZ8NAgfEPefdN62XaVClqR2iVnzugtAdA
k4SIrozxHcCuHL6Tgc7wQAAJj3zF/QwnGOMttXIjrhRP247U8Qwxv4MSKj3jJ0JV
RagIvgFtXSYWKKItxXT8pDaJgMMkE0/Ih1M6gv/LVuzTiSnnKFob1gjBFiRvOdEx
/I7m14AsQ7+6pQ2so9wlGyEdfzW/tfo5NieZuZ4fojRgAM0HE7wWdzvGFO0ek84U
KqtVUnGd8fdiH2cM3EqZ
=QTJh
-----END PGP SIGNATURE-----

--=-lDljh19GKIe/rl0BF5Mk--
