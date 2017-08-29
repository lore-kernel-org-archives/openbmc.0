Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhLzd2JtbzDqYV
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 18:15:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qtPiwxQe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mkhZO+Or"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 078F22139A;
 Tue, 29 Aug 2017 04:15:23 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 29 Aug 2017 04:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Q2d9SoeDRyHAX9gVEh2Gkc/+VuX/9Xo2hfgWTNfE9
 Ag=; b=qtPiwxQeOkEUedwsw+nPhO/IwHQ84pqbZqFBgsDRRHHhjeDb7jzw4Lz6F
 RTnyE/Of2Cxd4N4Zfsl2hTLnFfsk4pB0Dxets6rhTBASSXQq9ZwUyJK/sVsnnC9L
 IGq7Gr+p3TvfY3F0bmBHRWUdqoButRf3UpuSgbavEXFd8+cfxGA3kYy8VeqnYSZp
 Z38Px4y7Mnz4TjF2DOwzi+EbaAjLv4F2/PXKKVtwbAtxBn3OyZmR/3zAxTg92eMC
 V0j1FgvRHCnRkFOyCH6ymme4cWgZOQVtSdLLUATUklaX7F0LwgI3i5RpdNoOl1ZL
 uT+6kODqWo+8wADSP9DvaR1BLSndQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Q2d9SoeDRyHAX9gVEh
 2Gkc/+VuX/9Xo2hfgWTNfE9Ag=; b=mkhZO+OroIBp4GSNx/SWX0xy9VP9I3YKf6
 x7ce8Q58zl60zAIpoa8IWa6qVHOw1IrI7q+7wljz8/fLGu+ptAmUH65ER0BdaHO7
 32l5uttXxwj5c23shbINf/yod15oHzojldk1V8tvMtSJR0CmqHeNoguNkpodb8l1
 zL65FBN+qeyRQ/66ri8C2d5wcLTIMpK6/cu2uZTEvIEQcusjsu766mRoCdJ7bbH0
 idoEBsEq2Et3iwQK0RBPrsl3JfPdUfE8HFrYZfUww8ut+8Q6vHMNrqTXd5VR/gYC
 B0H0B4uQ6T/RNNDuaeDBp83K4vSh8Y8LETf6/K5tXFq0cDizohbg==
X-ME-Sender: <xms:miKlWbSp14N_BCMgjXZvz8KZxgSaxT-EtgIez1P_DRFGDCp1e_g-ew>
X-Sasl-enc: ZVzUHXk9MFa23yFCnKqywy4n9+B7y+3DHGa7RQ5nI459 1503994522
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id A40707F9D2;
 Tue, 29 Aug 2017 04:15:20 -0400 (EDT)
Message-ID: <1503994514.5933.8.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 resend] dts: add aspeed-pwm-tacho to msn
 dts.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Cc: Ohad Oz <ohado@mellanox.com>, Vadim Pasternak <vadimp@mellanox.com>
Date: Tue, 29 Aug 2017 17:45:14 +0930
In-Reply-To: <20170823073313.1294-1-c_mykolak@mellanox.com>
References: <20170823073313.1294-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-K8CoYt56yyOw6t8y5ME9"
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
X-List-Received-Date: Tue, 29 Aug 2017 08:15:26 -0000


--=-K8CoYt56yyOw6t8y5ME9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykola,

Sorry for taking so long to review this, thanks for the prompt with the res=
end.

Unfortunately the patch doesn't apply cleanly to dev-4.10 - can you please
rebase it and send a v2?

I have some additional queries below.

On Wed, 2017-08-23 at 10:33 +0300, Mykola Kostenok wrote:
> Add basic pwm-tacho-controller node to ast-g5 dtsi.
>=C2=A0
> Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.
>=C2=A0
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 49 ++++++++++++++++=
+++++++++++
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 ++++++++++
> =C2=A02 files changed, 66 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boo=
t/dts/aspeed-bmc-mellanox-msn.dts
> index 0774959..d790927 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -139,3 +139,52 @@
> > =C2=A0	status =3D "okay";
> =C2=A0};
> =C2=A0
> +&pwm_tacho {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_pwm0_default>;

Just to confirm: One PWM pin is driving 8 fans?

> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;

We shouldn't need to re-specify either of these as they're done in the dtsi=
.
However I have a question on #size-cells in the dtsi (see below).

> > +	#cooling-cells =3D <2>;
> +
> > +	fan@0 {
> > +		reg =3D <0x00>;
> > +		cooling-levels =3D /bits/ 8 <125 151 177 203 229 255>;

The bindings documentation says cooling-levels is a required property for e=
ach
subnode, yet only fan@0 is defining it.

Is this somehow related to only muxing PWM0 above?

Regardless I think you should meet the expectation of the bindings, even if=
 the
information is redundant.

> > +		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +	};
> +
> > +	fan@1 {
> > +		reg =3D <0x00>;

Reg should match the unit address in the node name, so what you've done her=
e
expectations of the dts. However, it doesn't appear to give a compiler warn=
ing.

Overall I think it's worth a comment.

In fact, I'm going to go out on a limb and claim the bindings are completel=
y
backwards. You may use the one PWM to drive multiple fans, but you're never
going to have multiple fans feed one tacho input. As such I'd have reg
represent the tacho value, and aspeed,pwm-ch map the associated PWM channel=
.
This way we'd have:

	...
	fan@1 {
		reg =3D <1>;
		aspeed,pwm-ch =3D /bits/ 8 <0>;
	};

	fan@2 {
		reg =3D <2>;
		aspeed,pwm-ch =3D /bits/ 8 <0>;
	};
	...

Looking at the datasheet we find that the hardware defines "Tach Source
Registers". Putting aside that the behaviour of the registers is pretty muc=
h
insane, this aligns exactly with the alternative bindings I suggested above=
:
PWM inputs are configured for tach channels (tach channels dominate).
Effectively my reg value would be an index into the fields of those registe=
rs.

It's annoying that the ship has probably sailed. We should start a conversa=
tion
with upstream, as your devicetree exposes the failure of the bindings.

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
> index 72b6638..4c012af 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -40,6 +40,14 @@
> > =C2=A0		serial4 =3D &uart5;
> > =C2=A0	};
> =C2=A0
> > +	clocks {
> > +		pwm_tacho_fixed_clk: fixedclk {
> > +			compatible =3D "fixed-clock";
> > +			#clock-cells =3D <0>;
> > +			clock-frequency =3D <24000000>;
> > +		};
> > +	};

Happy to take this as it is what was done for the ast2400. Joel is getting =
the
clock driver sorted out so hopefully we can remove it in the near future.

> +
> > =C2=A0	ahb {
> > =C2=A0		compatible =3D "simple-bus";
> > =C2=A0		#address-cells =3D <1>;
> @@ -372,6 +380,15 @@
> > =C2=A0				#size-cells =3D <1>;
> > =C2=A0				ranges =3D <0 0x1e78a000 0x1000>;
> > =C2=A0			};
> +
> > > +			pwm_tacho: pwm-tacho-controller@1e786000 {
> > +				compatible =3D "aspeed,ast2500-pwm-tacho";
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;

The bindings documentation claims #size-cells should be 1, however both the
qanta dts and your patch set this to zero. The child nodes corroborate the
value of 0 - we're specifying the PWM channel which has no need for a lengt=
h.
We should update the bindings, though I'm not sure how happy upstream will =
be
about that. If I recall correctly Rob already quizzed you about why the
bindings were being changed not long after they were applied. Still, better=
 to
be right. Maybe we can rev the bindings and fix the PWM/tach mapping above?

Cheers for an interesting patch.

Andrew

> > +				reg =3D <0x1e786000 0x1000>;
> > +				clocks =3D <&pwm_tacho_fixed_clk>;
> > +				status =3D "disabled";
> > +			};
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0};
--=-K8CoYt56yyOw6t8y5ME9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZpSKSAAoJEJ0dnzgO5LT5XbUP/0kiXCRNO46MfcF49jA/2y2o
MikeH9R2RznrnKBBhIw8RtiYTK/rSmLUozrrUb44bn34FO9chxgJtKlJqp6gCQNo
JsdVPkJDf7Bgprl2Mrx2IZ1Wg9625Uv83H9TxkXbySxW+/6b5+Et1M4cqAhRE+EV
qYZekcN1F8RqvaV9DWuGRIwzhyEMDC+paCKTSh6Po/pp9X5e4RprMH4g7qDt5vLs
Ri2sov+pp3nPOdyueADCnLtWrzBhQ0Deat1VFRtbsyXX2AZfxIpfKHjQZDy3tQQA
ZXo1DvBe+4rMd/z0g1L1wKM6fCzhx+CXZDjy85R58l6+pZfwMKOltR833ofHd8f9
4UHVJkbJbXQeJP3Q8ln5ErPGsUZJy1/YCmMei5jTBiXi1LUksu6abYCs7iZPt/wz
DZ41uBITSsPfOTG52YLlt4i8gcuaCH7EMkLCapFPJB+56GjFgW1nxSuHD2rkIkEL
c95OMzuAWVthaFacCNpUv7vvVQshTM+BOuPuZFFT75HDh5WhGwKLq6dr02oEyR+P
8Z9vSMaSrsGA4PhGYtUgFCso4kzaU768WpGk9XOsLnvCtIKD2q2Q1ftMPdDtLVqn
ZBL788f4X//cqP5PHZIbn52bBdD+IcSZhm74Uh8j6ydZmW0p1u7zcBnt/Xjg6Wvi
cnUlNwlIoY0b3t4+SyWW
=B960
-----END PGP SIGNATURE-----

--=-K8CoYt56yyOw6t8y5ME9--
