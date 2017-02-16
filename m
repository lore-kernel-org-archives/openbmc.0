Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNynF3X1VzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 12:12:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XSbt/TfH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MtlkmLrl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B4F8206EB;
 Wed, 15 Feb 2017 20:12:27 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 15 Feb 2017 20:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=EYVrTEHX5SL/5jbAHc2oH5T07WA=; b=XSbt/T
 fHpNspNsaS2aPVz8VCoI/oIRup6a6MyXK0b7a5hhxf8/N+B8H82bWWb1PWMSJAh4
 SG542yUm8wNue4KVT4eSNn/4v0CELzPZ4iyEWA4kDmRmfEISBM82oKyjBAJ1Akk4
 4++lOJjMGg4qcOMWf7QLz/0vIk6vqxMSixKwA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=EYVrTEHX5SL/5j
 bAHc2oH5T07WA=; b=MtlkmLrlhkhdBTKmGmXMkEx/n0cb7UuREuVirnl77+bNOp
 aiJS96qiMlvgvrduuengmRFxw76lPMvldgzR65y2c2df1ZgYQwkyK3vd4UxQf+Ui
 HMhDJh3H2PJF+JIuigG0+cuBrrxIskQgfdTPupmzIJHneg0uGQzeUU9ZjJKTE=
X-ME-Sender: <xms:e_ykWMgtZDUUfVSOgACFUs1sq70xAjsSLHOI7npqq-O2fmcMVlTuBA>
X-Sasl-enc: FWdomeFtnoTmjM6kb0t+1Bexm4EPjrDbqnFlSfJGaJpe 1487207546
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB3DE7E033;
 Wed, 15 Feb 2017 20:12:25 -0500 (EST)
Message-ID: <1487207539.3661.30.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-bmc-opp-romulus:
 Enable mailbox and LPC control nodes
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 16 Feb 2017 11:42:19 +1030
In-Reply-To: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
References: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-NoD24HNFgDZh4+L1ejTO"
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
X-List-Received-Date: Thu, 16 Feb 2017 01:12:34 -0000


--=-NoD24HNFgDZh4+L1ejTO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lei,

On Tue, 2017-02-14 at 15:25 +0800, Lei YU wrote:
> Also add the reserved-memory node needed by the LPC
> control driver.
>=20
> > Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 22 +++++++++++++++++=
+++++
> =C2=A01 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index c23627e..f47eb63 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -19,6 +19,18 @@
> > =C2=A0	memory {
> > =C2=A0		reg =3D <0x80000000 0x40000000>;
> > =C2=A0	};
> +
> > +	reserved-memory {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> +
> > > +		flash_memory: region@94000000 {
> > +			no-map;
> +			reg =3D <0x94000000 0x04000000>; /* 64M */

So these values are also used in the zaius dts. Why are we reserving
64M 128M down from the top of the RAM address space? Is the top 64M
meant to be reserved for anything as well? Why not reserve the top 64M?

> +		};
> > +	};
> +
> =C2=A0};
> =C2=A0
> =C2=A0&fmc {
> @@ -44,6 +56,16 @@
> > =C2=A0	};
> =C2=A0};
> =C2=A0
> +&lpc_ctrl {
> > +	status =3D "okay";
> > +	memory-region =3D <&flash_memory>;
> > +	flash =3D <&spi1>;
> +};
> +
> +&mbox {
> > +	status =3D "okay";
> +};

This looks fine.

Andrew
> +
> =C2=A0&uart5 {
> > =C2=A0	status =3D "okay";
> =C2=A0};
--=-NoD24HNFgDZh4+L1ejTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpPxzAAoJEJ0dnzgO5LT5QUYP/2LmXtwbAtcGSdv3Bi+Of4i7
CL0HrJPlZZmQR5Tqyl7iVJpD40vi8mZrU/CDJ/ma8+MbHz6or24zQCzY5pteIQPG
cUKc3DzKhmcB7LGQGKOksUNcotfg4f7BALeVUlap7T3+48TOOW0acxZUCb103whz
sg4XhxcMCjPxoGUFMI23wX7i980rLuvpYen6f3i+NFI3C1o8M3Y0YISLfVEduVDg
uTeYSLEKw0Pr/UxnXlgO1wD2cQwJzdon8Itg1IyWvSQTBQ8Pf9Jgm5vuMZS7ndM9
rSPv0eAqUK8jWZ4ssRGXRmVm58Uc+QFdYVxLpmeqJ8x7OXPGDLnhQ41nzHPfOiJN
Zf5wNxVXj7lh78IPuJSkQTPix6AVPFezlSkaaY8QPMwH4+jk8oVNX2IMP594uXyl
k+Gv7xzI5TAtgKtIfyMT2PnBQP7z4l7R6+8z50FBqLUJs4jgsXvxgnoG8M7tBwrH
Ahhi5aS2X3BI36HJrvsn4Q7Cvo56+NZnZBpie8wxWbOLDQDE/dnssNB73QT5+MpJ
TqDqPksIv7KJr/GSYdjHCIAADXFO8ZbCwThfQ+Nrz6wELcL1V1I9tG5rTH2uC9Ra
prUjGaL2U9hbA0guJbWGY/fOr1xAEi2MlRazf394lV16DRm/SJw9oi7yhSyDxdu5
1VqLIFIEu5tKsWc5ZVPR
=z3gF
-----END PGP SIGNATURE-----

--=-NoD24HNFgDZh4+L1ejTO--
