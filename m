Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhtny4FT3zDq5k
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 15:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RydFJ7+M"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OE3fw0rk"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C34020F5F;
 Wed, 30 Aug 2017 01:08:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 30 Aug 2017 01:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=n51n5GFNV341g+f4ud5S/jUvdT5dVmWnZV/yAkEnl
 t8=; b=RydFJ7+M7Zm6nxlySj17XsyVtfUNVfA6kj9owrCmeNgkjSsreKhRvR6qd
 i60nFBBtzdQFo4yiFVKGu/682cg/MS5aq850h1sWZw/pafrAlsXYda9icvC48WqV
 DqLLHy67JMIHqVSnasBIOUEvRfbttK6VLsBJRWvsXNy2F1WgDYrTm0uk10gFcbcv
 QoCOl+A/gwj6d0BfaS1l2oxfQh6tpoywlHVB93Hpo1X71+tT08sSM7E9SNsyZjx1
 iCQWrKGfFyUWnScLQdg3NdM9SRLb7VTqDgnd0vDU570lifqVxYWWSzub27FKan7O
 uERtRKDy2OCYL/oipgM0ihk1KxAVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=n51n5GFNV341g+f4ud
 5S/jUvdT5dVmWnZV/yAkEnlt8=; b=OE3fw0rkeZLmlqDWBDqpWEIxsGS5K08VBF
 gCLv9P6kwtEuXcCkRmW4wbVu7HM79gWHniUcWtUJX4ybr/4z0pkwe65gVV8GxAID
 rzSd2YcQdlrdhi42SFCBZtlEjB/sPAJSnfUOYu0iyoxFuDgpetc6jMuab4gEoD1W
 WGPC0r/uSwQzJtOX4ci1Ri9nb7V/kVCQFwPd717KwiHTjRElgU/EigeQPdokiNzt
 JNyPHW1ewSnQuH8nO1zrwa6j0aoSR2T/lcKuJov7CfL1n5l2SfOTd8DrJzrpuQfL
 0VQDRxr4nxZtL1yQyB7kYJ06aYzjoJuM08lJFgx2UYHC4KjBCafg==
X-ME-Sender: <xms:ZEimWT42gcsRnEMIKGlfEp3B6co_qKrV4sN9jhvy87hudRI3YJ1_kg>
X-Sasl-enc: AeVbo7Fhsm7AfBOZnjVpx3JS4zDHdXp9aocC0jWzrwoe 1504069731
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5B1724A82;
 Wed, 30 Aug 2017 01:08:49 -0400 (EDT)
Message-ID: <1504069726.5933.23.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v2] dts: add aspeed-pwm-tacho to msn dts.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Cc: Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Date: Wed, 30 Aug 2017 14:38:46 +0930
In-Reply-To: <20170829152202.122188-1-c_mykolak@mellanox.com>
References: <20170829152202.122188-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WYu+D83W3nNw1326QtFU"
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
X-List-Received-Date: Wed, 30 Aug 2017 05:08:55 -0000


--=-WYu+D83W3nNw1326QtFU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola

On Tue, 2017-08-29 at 18:22 +0300, Mykola Kostenok wrote:
> Add basic pwm-tacho-controller node to ast-g5 dtsi.
>=C2=A0
> Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.

A couple of points I should have addressed in my previous reply (but
didn't so I won't burden you with them now):

* This should be split into two patches, one adding the necessary nodes
to aspeed-g5.dtsi (a general capability), and the second adding the
nodes to aspeed-bmc-mellanox-msn.dts (machine-specific configuration).

* Describe the tricky bits of the patch in the commit message. For
instance, the non-obvious backwards nature of the bindings means weird
semantics for the reg property in the fan nodes. Also, a bit of
information on your fan topology (driving the 8 fans from one PWM)
would be good.

Generally in commit messages I look for descriptions of the motivation
for the patch (why), not the content of the change (how/what): The diff
itself describes how/what. Adding the answer to 'why' in the commit
message helps others to evaluate whether the implementation is the
right way to go. Otherwise we're stuck reverse-engineering your intent
from your implementation, which is a bit of a hindrance to identifying
bugs or better approaches.

Talking about implementations you tried and found not to work is also very
useful as it will put a stop to reviewers exploring and suggesting these
dead-ends themselves. This point is not applicable to your patch here as yo=
u
are modifying a devicetree (which is declarative, not imperative), but is
useful to keep in mind.

Anyway, thanks for the change, I've applied it to dev-4.10 with some
modifications to the commit message to address the points above. I'll take =
the
conversations about the bindings upstream.

Andrew

>=C2=A0
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> --
> v1 -> v2:
> =C2=A0Pointed out by Andrew Jeffery:
> =C2=A0- rebased.
> =C2=A0- remove exist #size-cells and #adress-cells in dtsi from dts.
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 47 ++++++++++++++++=
+++++++++++
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 ++++++++++
> =C2=A02 files changed, 64 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boo=
t/dts/aspeed-bmc-mellanox-msn.dts
> index 0774959b1222..b7854e36f052 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -139,3 +139,50 @@
> > =C2=A0	status =3D "okay";
> =C2=A0};
> =C2=A0
> +&pwm_tacho {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_pwm0_default>;
> > +	#cooling-cells =3D <2>;
> +
> > > +	cooling: fan@0 {
> > +		reg =3D <0x00>;
> > +		cooling-levels =3D /bits/ 8 <125 151 177 203 229 255>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +	};
> +
> > +	fan@1 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> > +	};
> +
> > +	fan@2 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> > +	};
> +
> > +	fan@3 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> > +	};
> +
> > +	fan@4 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> > +	};
> +
> > +	fan@5 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> > +	};
> +
> > +	fan@6 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
> > +	};
> +
> > +	fan@7 {
> > +		reg =3D <0x00>;
> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
> > +	};
> +};
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index cdea4f4eb77c..bb7652a61bec 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -41,6 +41,14 @@
> > =C2=A0		serial5 =3D &vuart;
> > =C2=A0	};
> =C2=A0
> > +	clocks {
> > +		pwm_tacho_fixed_clk: fixedclk {
> > +			compatible =3D "fixed-clock";
> > +			#clock-cells =3D <0>;
> > +			clock-frequency =3D <24000000>;
> > +		};
> > +	};
> +
> > =C2=A0	ahb {
> > =C2=A0		compatible =3D "simple-bus";
> > =C2=A0		#address-cells =3D <1>;
> @@ -373,6 +381,15 @@
> > =C2=A0				#size-cells =3D <1>;
> > =C2=A0				ranges =3D <0 0x1e78a000 0x1000>;
> > =C2=A0			};
> +
> > > +			pwm_tacho: pwm-tacho-controller@1e786000 {
> > +				compatible =3D "aspeed,ast2500-pwm-tacho";
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				reg =3D <0x1e786000 0x1000>;
> > +				clocks =3D <&pwm_tacho_fixed_clk>;
> > +				status =3D "disabled";
> > +			};
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};
--=-WYu+D83W3nNw1326QtFU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpkheAAoJEJ0dnzgO5LT503MP+wbh9D7pbO1tFJXJ+DJTVgG1
dLPxFHO5mOejnJRC+OUBVkGATJXJcaPHMDQGUfNfz9l753zYc9YcSpX+2rFRmsUz
vLaAQxK/ZW1lf8IARPCboHDA8P4F5qPelPSM59CrbBk+uwa1bRLhtab3O22EvwEj
SMWuC9EKvdmxbfgE/QeVtxpdWKviSt/CHOg2onZopJILBseHMUdC0gei4ik0xFBb
bbezSfWD1ahvXLG+NOgJ2dwhAn+yTE2SNGRw5PRC8H1cSQplqJMpAPNLVy35xAh1
foe+EYR/rK+dPD7BMVJ6boBW71WJbDfvVov17GTWugF6fDlpZwDOO0a8TwZHL143
MoFskxqCz5o8ODR51wjva76lyaiZJexlOA/WwGB3HbwHycv88jVws0EUCVSWG8ZH
HQC0+hJ0Il5bKo+3unE2rYeUKBpTTneRZabCwoQ0uKlX4MBlKCGjjMm9zzv+tOxQ
rf0yLZHqH4hoSuvOLFZJHKmfFsqY3/WD64ble6rKpX7s9eXis2y2io/G3ltOcUN2
xabDXeimPKrVcyjS6pbye1OWY3wbquB8lbC7J/NL6o4ZDjiZV29HVBGA8qfELAMa
ypp6jXz/IdFY97VvYy01HwWdxiJLb5GNOxtHNeX4F4fGi0RrOv61ClGdXZQi++UC
bwMRyAEHk/a3CuVLq76o
=TWKV
-----END PGP SIGNATURE-----

--=-WYu+D83W3nNw1326QtFU--
