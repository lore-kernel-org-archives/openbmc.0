Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBNPP74BtzDrFQ
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 11:49:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="d6ZNH3cQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WtoWAVmA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC1AF207E0;
 Mon, 17 Jul 2017 21:49:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 17 Jul 2017 21:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=4Bt7hcsEu87ii9cIFfHsBymLwCAWzezsTRjanbGpa
 dU=; b=d6ZNH3cQyvw8001/pJh75w3686yiVP3Qc3D3X9TUlP9yo83oBy1Hm4+dL
 roiYqo2wz+CcC6wA0E7KcpHcXGPW9p/1tuDpMNMDOnJry6wPIug32HxDuT9KJ9Tm
 4JuaJJZ0Bvk+RIvok0C4wGnF5ukcmxuSEc62LnNFZjfEqc/xyOPupmfOqbo8i4aI
 5TjNLNpjsvJ9HXQGtxfb1DdhZVXFgnXlrY48TLAC3Ug+t/pMB69kvgnel4DElmPG
 iI0OSbBV20mA3aM5dYyJk9xjhbUhxnDeumQkAlm6wBfnpcpFvF4PV1j9x8RsepdJ
 l+bA24wnJtSBuaupEKu5ns4StO4RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=4Bt7hcsEu87ii9cIFf
 HsBymLwCAWzezsTRjanbGpadU=; b=WtoWAVmAAWjWsRbK1B9k0YdOhcMjBiq/b1
 q7nEnwGPAaXRmpT59j/X+/v336sDwEKw8aSUf7aHuY5yAJDOVsTqb0nGqiYNP5ep
 qCZLaNd5dFcLlbqmidyj929kDSFT1y8jp1G57jYL1QuCymW1iS/9uWgORTRjg9rW
 +XEE5JaBrS7auEibmTao46sxXzuld7GemE2tQunGt2o/AxkmM31JnTg6F7Cvp1Ci
 PkZuX7XTMobgfYIyoFz2QKVVmU/SOnj8O/BnT7HVV6zLY4j3fjnPflyaI6xMyGlY
 KkY46SO8GS1TzILmu4qFjzui6WLx+uZS3NBd4VOXdac/PqdECCSQ==
X-ME-Sender: <xms:F2ltWVLrYEBKIyCF5IJz7KwYhw0huB7bGwadtxOQWjrx9CTEBLVo0g>
X-Sasl-enc: 0jCqnfpOyJx7Xy7fOWipFsQIPFfJ2bmIekhcyofePwGr 1500342551
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30DDB7E070;
 Mon, 17 Jul 2017 21:49:09 -0400 (EDT)
Message-ID: <1500342546.500.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: Add
 gpio-keys-polled for fan presence
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Tue, 18 Jul 2017 11:19:06 +0930
In-Reply-To: <20170717212732.8629-2-cbostic@linux.vnet.ibm.com>
References: <20170717212732.8629-1-cbostic@linux.vnet.ibm.com>
 <20170717212732.8629-2-cbostic@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Y3CyKn2QoNBSlqGWxekX"
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
X-List-Received-Date: Tue, 18 Jul 2017 01:49:14 -0000


--=-Y3CyKn2QoNBSlqGWxekX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-07-17 at 16:27 -0500, Christopher Bostic wrote:
> Define gpio-keys-polled.=C2=A0=C2=A0Add pca-955x chip IO as GPIO source.
>=20
> > Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 34 +++++++++++++=
+++++++++++
> =C2=A01 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 34c5dfc..d60a1db 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -62,6 +62,38 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	gpio-keys-polled {
> > +		compatible =3D "gpio-keys-polled";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#poll-interval =3D <100>;
> > +		autorepeat;
> +
> > +		fan0-presence {
> > +			label =3D "fan0-presence";
> > +			gpios =3D <&pca0 4 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <232>;

I think I replied about your choice of codes in the previous series.
The thought that I eventually came to (after replying IIRC) was what
has sort-of happened naturally here by way of the PCA card being unable
to provide interrupts, forcing you to define a separate node using
gpio-keys-polled.

Anyway, the thought was to have one gpio-keys{,-polled} node per
gpiochip device. That gives us the namespacing that the gpiochip
phandle provides - i.e. all keys in a node must use the same gpiochip
phandle. This isolates the keys behind separate input devices, and thus
their codes don't need to be globally unique.

So in this case I'm suggesting:

    fan0-presence {
        label =3D "fan0-presence";
        gpios =3D <&pca0 4 GPIO_ACTIVE_LOW>;
        linux,code =3D <4>;
    }

And likewise for the nodes below.

Cheers,

Andrew

> +		};
> +
> > +		fan1-presence {
> > +			label =3D "fan1-presence";
> > +			gpios =3D <&pca0 5 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <233>;
> > +		};
> +
> > +		fan2-presence {
> > +			label =3D "fan2-presence";
> > +			gpios =3D <&pca0 6 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <234>;
> > +		};
> +
> > +		fan3-presence {
> > +			label =3D "fan3-presence";
> > +			gpios =3D <&pca0 7 GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <235>;
> > +		};
> > +	};
> +
> > =C2=A0	leds {
> > =C2=A0		compatible =3D "gpio-leds";
> =C2=A0
> @@ -224,6 +256,8 @@
> > =C2=A0		reg =3D <0x60>;
> > =C2=A0		#address-cells =3D <1>;
> > =C2=A0		#size-cells =3D <0>;
> > +		gpio-controller;
> > +		#gpio-cells =3D <2>;
> =C2=A0
> > > =C2=A0		fan0: led@0 {
> > =C2=A0			label =3D "fan0";
--=-Y3CyKn2QoNBSlqGWxekX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZbWkSAAoJEJ0dnzgO5LT5pVoP/0BIFhx6ahunGzAPz/MNg7fF
QsTc6AeOexs1SL2fowvl9FdZ84Pm4UZM4aUQR19+CINAscdTD1r9XUUBasBokbnH
3GAPtPEwRacDUJ2d5KX97yjTEE0EOBAVz89iNRgVfSIbvYgx5BjdMHJhx+K6li4F
8XYvWF2nRcNPZKZSpjK8KeJ6Ygp0/TIdTzmXhs73ZIn3aNsx05MO+YHbYBfmzaqE
jnoBf0U4PGL2PKSt0zCRSF+Ys1KViFaEGJORnmjyHv6f7vl4lGdpSl/F91klmvJn
4rHqL1rBlP3UVarfOaMZ9EYP7zHUGoytlIv8+/CgcA3GnuXWCi3cyUXsPqc6XJrN
Hq4mmpKL1KRizakF0o6Nb/LqQXxNKr+0RA6iuXBtpfROE3R/0Zesb4vI3pbGBl7E
nnHu6Uutq+NLizg/8fDJ5zYy0PlJqMAF0Bj7KwLPY8bc+M87Er8XyufdPo8TDm/p
Z+G7WG8iov6D6HtdRcm8zTJhJNy4K/iPCdRkkp4300JMj6Lwz0LEGQQTaKyEEw9t
/L6ipEEZVaCUIw+7Kmwztx/Dep+w5tjOfQ89PLUcOp6ebQQrS3zvaXzaIQu3Eyux
/BXUiHPZvrn1wymnMEl3cqsz91TqcsaX9FbVO2aGwWzVqI05fU56ZJVE1sQ8E2uS
pizjslqY2OFyT2sHa00a
=LxPX
-----END PGP SIGNATURE-----

--=-Y3CyKn2QoNBSlqGWxekX--
