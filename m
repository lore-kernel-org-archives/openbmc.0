Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhtNC0sYmzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SaPwDKiW"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JSoUq0Ku"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4EA62139A;
 Wed, 30 Aug 2017 00:50:00 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 30 Aug 2017 00:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Z5eL22DLARtgDXB41EvikyVi9/1fSNyPiNNR2kP04
 VY=; b=SaPwDKiW1HOVUVe8KBt199Z4nPNGTSpJ5c/K5ej6SHsv4eEVSN9/mb9mY
 rJlgnoZnKOSPz9M6lh7RAYR8hF+ZdopnE8Ealr1CgzPaTcwEtiXHcbfqFGE6vNCn
 PDZzkTToKpWTMAwSsm0t0lZs5/GDMmZHKq5ZzFNBxPHKDXAQqU/hM32zW42fhvbg
 DkM9XhelmEH2BwEWOxZ4OL67yDMmallkfT5oawDFqxPliOzrbPeeUiLti9doFkoR
 HUM8stVrJDckSd+8iaFuh5g9sx0/2NVnsKHjfrGiiWZbd0Mn097eaqMBC7Dob8sN
 cHpbasiEdvUeXeeD5OcPHMm5ZFiGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Z5eL22DLARtgDXB41E
 vikyVi9/1fSNyPiNNR2kP04VY=; b=JSoUq0Ku9GUBal5lDAT9YW5RJM1iIOXiQP
 NTLFd6F1SsE/hRUkgON4wRYKsuHtqXgete8qJDze6RcBZ64qVWMIs3sOtwneRMkX
 aQIfsKNX9mF/MaTTpaaBaqC602TtSkCtYG+rsLEJRfXKvRGhZEtcFPO/1fc63Uqa
 Wjy46fVlR9NBWY8buvuIkdRBPmCjgUa7l4m/2veuURZzpbWYG44H0X+ZAoAghp4X
 BmdnSjmw9e/dowu8BcLE/2oPzCqsfl/a4cGdw1h7iSG1ZM7jxeUGngHoObeqKRP3
 PH9B1auDfm9SlnSEtREGSl68uQToas9Osn5hUBkgtAFTsRyk2drQ==
X-ME-Sender: <xms:-EOmWX0G_ToPSjrotlnlr7dHt-LYqn_Ipt7TGDBncQAEONGf-Xmchw>
X-Sasl-enc: gFv5NDMcm2oEfzZxPQywryWCcsy9G9GxeCI7MXp46SkW 1504068600
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7968B24810;
 Wed, 30 Aug 2017 00:49:58 -0400 (EDT)
Message-ID: <1504068592.5933.21.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 resend] dts: add aspeed-pwm-tacho to msn
 dts.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: Ohad Oz <ohado@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>
Date: Wed, 30 Aug 2017 14:19:52 +0930
In-Reply-To: <DB5PR05MB122434BAC10BF91338D87500EF9F0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170823073313.1294-1-c_mykolak@mellanox.com>
 <1503994514.5933.8.camel@aj.id.au>
 <DB5PR05MB122434BAC10BF91338D87500EF9F0@DB5PR05MB1224.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-OD+hO/Jt07/4La8G5L7G"
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
X-List-Received-Date: Wed, 30 Aug 2017 04:50:04 -0000


--=-OD+hO/Jt07/4La8G5L7G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

On Tue, 2017-08-29 at 15:05 +0000, Mykola Kostenok wrote:
> > -----Original Message-----
> > > > From: Andrew Jeffery [mailto:andrew@aj.id.au]
> > Sent: Tuesday, August 29, 2017 11:15 AM
> > > > To: Mykola Kostenok <c_mykolak@mellanox.com>; Joel Stanley
> > > > <joel@jms.id.au>; openbmc@lists.ozlabs.org
> > > > Cc: Ohad Oz <ohado@mellanox.com>; Vadim Pasternak
> > > > <vadimp@mellanox.com>
> > Subject: Re: [PATCH linux dev-4.10 resend] dts: add aspeed-pwm-tacho to
> > msn dts.
> >=C2=A0
> > Hi Mykola,
> >=C2=A0
> > Sorry for taking so long to review this, thanks for the prompt with the
> > resend.
> >=C2=A0
> > Unfortunately the patch doesn't apply cleanly to dev-4.10 - can you ple=
ase
> > rebase it and send a v2?
>=C2=A0
> Hi, Andrew.
> Yes, sure.
>=C2=A0
> >=C2=A0
> > I have some additional queries below.
> >=C2=A0
> > On Wed, 2017-08-23 at 10:33 +0300, Mykola Kostenok wrote:
> > > Add basic pwm-tacho-controller node to ast-g5 dtsi.
> > >=C2=A0
> > > Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.
> > >=C2=A0
> > > > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > >=C2=A0
> > > ---
> > > =C2=A0arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 49
> > > +++++++++++++++++++++++++++
> > > =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 ++++++++++
> > > =C2=A02 files changed, 66 insertions(+)
> > >=C2=A0
> > > diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> > > b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> > > index 0774959..d790927 100644
> > > --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> > > +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> > > @@ -139,3 +139,52 @@
> > > > =C2=A0	status =3D "okay";
> > >=C2=A0
> > > =C2=A0};
> > >=C2=A0
> > > +&pwm_tacho {
> > > > > > > > +	status =3D "okay";
> > > > > > > > +	pinctrl-names =3D "default";
> > > > +	pinctrl-0 =3D <&pinctrl_pwm0_default>;
> >=C2=A0
> > Just to confirm: One PWM pin is driving 8 fans?
> >=C2=A0
>=C2=A0
> Yes, in Mellanox msn system open PWM driving 8 fans.
>=C2=A0
> > > > > > > > +	#address-cells =3D <1>;
> > > > +	#size-cells =3D <0>;
> >=C2=A0
> > We shouldn't need to re-specify either of these as they're done in the =
dtsi.
> > However I have a question on #size-cells in the dtsi (see below).
> >=C2=A0
>=C2=A0
> Acked.
>=C2=A0
> > > > +	#cooling-cells =3D <2>;
> > >=C2=A0
> > > +
> > > > > > > > +	fan@0 {
> > > > > > > > +		reg =3D <0x00>;
> > > > +		cooling-levels =3D /bits/ 8 <125 151 177 203 229 255>;
> >=C2=A0
> > The bindings documentation says cooling-levels is a required property f=
or
> > > > each subnode, yet only fan@0 is defining it.
> >=C2=A0
> > Is this somehow related to only muxing PWM0 above?
> >=C2=A0
> > Regardless I think you should meet the expectation of the bindings, eve=
n if
> > the information is redundant.
>=C2=A0
> Oh, it's a mistake in docs. cooling-levels is not required - it's optiona=
l.=C2=A0
> We tried to make separated node for pwm cooling-levels, but it was not ac=
ked by Rob Herring.
> Now it can be set only once for each PWM. As we use only PWM0 we set it o=
nce.
> And nothing bad happens with another systems without cooling-levels.
>=C2=A0
> >=C2=A0
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@1 {
> > > > +		reg =3D <0x00>;
> >=C2=A0
> > Reg should match the unit address in the node name, so what you've done
> > here expectations of the dts. However, it doesn't appear to give a comp=
iler
> > warning.
> >=C2=A0
> > Overall I think it's worth a comment.
> >=C2=A0
> > In fact, I'm going to go out on a limb and claim the bindings are compl=
etely
> > backwards. You may use the one PWM to drive multiple fans, but you're
> > never going to have multiple fans feed one tacho input. As such I'd hav=
e reg
> > represent the tacho value, and aspeed,pwm-ch map the associated PWM
> > channel.
> > This way we'd have:
> >=C2=A0
> >=C2=A0	...
> > > >=C2=A0	fan@1 {
> > > >=C2=A0		reg =3D <1>;
> > > >=C2=A0		aspeed,pwm-ch =3D /bits/ 8 <0>;
> >=C2=A0	};
> >=C2=A0
> > > >=C2=A0	fan@2 {
> > > >=C2=A0		reg =3D <2>;
> > > >=C2=A0		aspeed,pwm-ch =3D /bits/ 8 <0>;
> >=C2=A0	};
> >=C2=A0	...
> >=C2=A0
> > Looking at the datasheet we find that the hardware defines "Tach Source
> > Registers". Putting aside that the behaviour of the registers is pretty=
 much
> > insane, this aligns exactly with the alternative bindings I suggested a=
bove:
> > PWM inputs are configured for tach channels (tach channels dominate).
> > Effectively my reg value would be an index into the fields of those reg=
isters.
> >=C2=A0
> > It's annoying that the ship has probably sailed. We should start a
> > conversation with upstream, as your devicetree exposes the failure of t=
he
> > bindings.
> >=C2=A0
>=C2=A0
> We just take it as it was.=C2=A0

I understand. I'm discussing fans with upstream anyway, so I'll bring this
issue up.

>=C2=A0
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@2 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@3 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@4 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@5 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@6 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
> > > > +	};
> > >=C2=A0
> > > +
> > > > > > > > +	fan@7 {
> > > > > > > > +		reg =3D <0x00>;
> > > > > > > > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
> > > > +	};
> > >=C2=A0
> > > +};
> > > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > index 72b6638..4c012af 100644
> > > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > > @@ -40,6 +40,14 @@
> > > > > > > > =C2=A0		serial4 =3D &uart5;
> > > > > > > > =C2=A0	};
> > > > > > > > +	clocks {
> > > > > > > > +		pwm_tacho_fixed_clk: fixedclk {
> > > > > > > > +			compatible =3D "fixed-clock";
> > > > > > > > +			#clock-cells =3D <0>;
> > > > > > > > +			clock-frequency =3D <24000000>;
> > > > > > > > +		};
> > > > +	};
> >=C2=A0
> > Happy to take this as it is what was done for the ast2400. Joel is gett=
ing the
> > clock driver sorted out so hopefully we can remove it in the near futur=
e.
> >=C2=A0
>=C2=A0
> Ok.
>=C2=A0
> > > +
> > > > > > > > =C2=A0	ahb {
> > > > > > > > =C2=A0		compatible =3D "simple-bus";
> > > > =C2=A0		#address-cells =3D <1>;
> > >=C2=A0
> > > @@ -372,6 +380,15 @@
> > > > > > > > =C2=A0				#size-cells =3D <1>;
> > > > > > > > =C2=A0				ranges =3D <0 0x1e78a000 0x1000>;
> > > > =C2=A0			};
> > >=C2=A0
> > > +
> > > > > +			pwm_tacho: pwm-tacho-controller@1e786000 {
> > > >=C2=A0
> > > > > > > > +				compatible =3D "aspeed,ast2500-pwm-tacho";
> > > > > > > > +				#address-cells =3D <1>;
> > > > +				#size-cells =3D <0>;
> >=C2=A0
> > The bindings documentation claims #size-cells should be 1, however both=
 the
> > qanta dts and your patch set this to zero. The child nodes corroborate =
the
> > value of 0 - we're specifying the PWM channel which has no need for a
> > length.
>=C2=A0
> I think it=E2=80=99s a mistake in documentation.

Right; something we should fix. I'll include this with my upstream discussi=
on
on fans.

Cheers,

Andrew
--=-OD+hO/Jt07/4La8G5L7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpkPwAAoJEJ0dnzgO5LT5NqUQALZTCfEjuhVO//OAdViEEsI+
9mXH8LCyZZbfwBI0lvcBs7xHQUeASCiqBgNYBCCWpiEUxmVCAdj3bSnHVjBpgKxq
Pi/hZA4hWo+OrQEtsyFBQRDAmIkCoGgpcD2bJcjKFvNxkJjiTWn7o4JwEK/wdPSO
UJOygzIJ0DKrYa2I3bXKs4uv4ClhnyH49juhgjW1ai2rw8EXJQMk9kYcEeLhg9qs
wwsWQWKjAHKITWkG+09eq4nrqM84nkk0hXjdUsLG6fCSjDPcsIBnK2OZH3h+A+zm
MNuEcENm5hruPFTaAWdpS7LRXT38U9PhH+6OEL2faRlPiAzWXZljLGL+6H3y3jyB
eLa53YNU78Inn9mTzUF+sPqs7xpil8gLrdlYzGliIJkmcky0GgSVJHJD/ZcptpXV
gr5+z8Zf4EFJI6x2JQNJsD0xtNZks7aLQx1bqhfpdTKz7RFHMVU90ntwOYSdyMNz
vqDyHjV0TA0lY5msvaRi6Svj42sS68CDlPNw6vlahCVsN6ctJGwyxckJQxEF5cs8
BTlTbSgBrczlrGZBiwJU90qgsHceKuuXnieMDBtW9EcAogE5YMPP34ke659+qZb4
KEcCQ4/BzbB4ZrGFjcKFixfSCBBRWAq5lhm62iDyr2Mw2NtM4QwGifhku1teubkI
lkHWmePG8m1vEoWlyiWK
=8OeU
-----END PGP SIGNATURE-----

--=-OD+hO/Jt07/4La8G5L7G--
