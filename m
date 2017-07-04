Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x20G12kCtzDr56
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 20:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iBtbXuJA"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="A78ea2HL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E4C320B79;
 Tue,  4 Jul 2017 06:13:43 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 04 Jul 2017 06:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=l7FCKC6lJLYCSOqLZhyfrz6mmbALhkWcBKiluKVv+
 BQ=; b=iBtbXuJAnZX3YXiqV7QQXyyJ56NhRS4oXnMtEoMK92iWc4wxdtalfEmvT
 LbPduldyuwfMSaOWJJkgxDHzOttbvb5sPwzN5utQxNYM1CNVkytNU9kjDlGpw6Mh
 fWl0uCLZecbNqQP8ykUF1/skp9eupq19ndvpobTGppjO09ZEA6TbPMisHA1yUP9F
 Og8pH5mPz57tBTO0Af8S25jWkXXky/uXPfWSNpXy/au9cXJ10CKbtmPDn5NU+mml
 pxiUkUHuZ1PcnWcoHa0Strd6mrPTm8nap1WOb4JvVI5KvZI5IOXuh200QvygeU1X
 fyX+zPIvR9r1JFr4Fki//kez2W/aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=l7FCKC6lJLYCSOqLZh
 yfrz6mmbALhkWcBKiluKVv+BQ=; b=A78ea2HLKqfApMdntqWzBwlxN4f3NpW4FF
 1OoWsxZB7nVtfOGPIKYUwZOUbIpH6cEj4EVhLrVN0PyaWsegWmkBA6MpUZd6CL0N
 Ym38DEjZWFXRC/+GJkBUZ9txMo8+LFDPRQ2BUDaEd37geMRU91TscRw4DujQlFHs
 K4aSSrF3iF/dosvykuNxx7JZ7aMrzC2pNJTr2Hq6ludy22LKI7e59qRAQLm/2rtw
 udz1TdTqinb9rHIOTjo/H+CuFfQzkHvDIeBUZVzJwoAoEaq10EEn+v8WvbbMf3QA
 bzs7K26AYDK1EPqSrLNgxju23MvPI+B8pqvdBr2uZTYXdSKEKGZg==
X-ME-Sender: <xms:V2pbWbwnS_dDXi5LVDdxctDxmrfViYsnRsLNsGrk3DIuEnX9SIJtWg>
X-Sasl-enc: EhG88EkcsoOQsu2qqqPjmwO+AYBvwREcKLfToU8w3Qq0 1499163222
Received: from keelia (ppp118-210-130-225.bras1.adl6.internode.on.net
 [118.210.130.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EE2024253;
 Tue,  4 Jul 2017 06:13:41 -0400 (EDT)
Message-ID: <1499163214.4990.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Set quality factor
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Rick Altherr
 <raltherr@google.com>
Date: Tue, 04 Jul 2017 19:43:34 +0930
In-Reply-To: <20170704060528.17290-1-joel@jms.id.au>
References: <20170704060528.17290-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oP176u8yGhLdmOtjK/Zq"
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
X-List-Received-Date: Tue, 04 Jul 2017 10:13:48 -0000


--=-oP176u8yGhLdmOtjK/Zq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-04 at 15:35 +0930, Joel Stanley wrote:
> From the timeriomem_rng bindings:
>=20
> =C2=A0quality: estimated number of bits of true entropy per 1024 bits rea=
d
> =C2=A0from the rng.=C2=A0=C2=A0Defaults to zero which causes the kernel's=
 default
> =C2=A0quality to be used instead.=C2=A0=C2=A0Note that the default qualit=
y is usually
> =C2=A0zero which disables using this rng to automatically fill the kernel=
's
> =C2=A0entropy pool.

This does not appear in the 4.12 kernel's bindings at
Documentation/devicetree/bindings/rng/timeriomem_rng.txt, and doesn't
appear in Ted T'so's dev branch[1].

Where did you find this binding description?

Andrew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/tree/D=
ocumentation/devicetree/bindings/rng/timeriomem_rng.txt?h=3Ddev

>=20
> As to the recommended value for us to use:
>=20
> > Rick Altherr <raltherr@google.com> wrote:
> > Quality is #bit of entropy per 1000 bits read.=C2=A0=C2=A0100 is a
> > conservative value that was suggested by those in the know.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 9cc959fccfa0..470a6335399a 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -193,6 +193,7 @@
> > =C2=A0					compatible =3D "timeriomem_rng";
> > =C2=A0					reg =3D <0x1e6e2078 0x4>;
> > =C2=A0					period =3D <1>;
> > +					quality =3D <100>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				pinctrl: pinctrl@1e6e2000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 992242d3b22e..466b322951e1 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -232,6 +232,7 @@
> > =C2=A0				compatible =3D "timeriomem_rng";
> > =C2=A0				reg =3D <0x1e6e2078 0x4>;
> > =C2=A0				period =3D <1>;
> > +				quality =3D <100>;
> > =C2=A0			};
> =C2=A0
> > > =C2=A0			gfx: display@1e6e6000 {
--=-oP176u8yGhLdmOtjK/Zq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZW2pPAAoJEJ0dnzgO5LT5uf0P/0IQuC/DWsY8WNW7LxMdCLfh
Po38Y4kre32BxD7a/g1KzMKqde7/BearNbEfiSfrJODHYhy+sOQNXIj3bBjyUL5I
M+n5fzSp11kMyLsLsnAC5s+A3wdgRenWrKp84TEcClKnqvpb1GYAPBHFL0WGLCXf
+8DcYW2rqZOg3bcnJMxBdEeon6D9wtRYDz3ury4rJ1uxlvkN/AhagwT9GcS2tnSi
tyH98Z6x6a11tqwhAlZk2K/1oJwLo6dtE4+Gvezp4PqbyYdQvf085H3HGKeL8VYs
Zj9GC0giy+IHbWbtx9USWiuD2ZyZsRFfkoK0UJuDwF49P0ZEguCK3YjBaQDQW2Mn
jNRBTs/IbKl8jgBuLHLeG//xO/Yy140zLCrwG2WuDWQIENYVOLow+cAGwUtgNEPF
46xU1ndMTli9ZfZyjDsNiJaMbKvUE5Pgw+Czquw7P1VlRKJoxUUAdXqx2FPJtoJ+
E1HIMjPZcDWuKr3QPSdd7mA2f4K7capADFPzvPx7kEc7waGoGFCV2kUv+uzkY3iu
NFKaygpMmiegTdwpTbaw6SlmCR9V/S4RcCGxJaMiYSUDa0YdxBwLXgMFBGnEYfvW
cs1QT335YbnAOfoJ/Up7x0enUnNWKMc+h9iKjnbXr/ePctfVLhalhEFsryqQWd2V
XUF1d/kUp9jzpO4Sr14z
=V2L9
-----END PGP SIGNATURE-----

--=-oP176u8yGhLdmOtjK/Zq--
