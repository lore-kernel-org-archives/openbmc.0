Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="l13GFRNQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CKgCRJfC"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xywMK1RpkzDr4N
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 11:07:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 68370213C5;
 Thu, 21 Sep 2017 21:07:54 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 21 Sep 2017 21:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=w/P7fv+m7tCwh3vM6htISMF05PVqwgUiaWr1RbcIu
 LY=; b=l13GFRNQrLCt1AAYIkT5oO2mMHf2OYG179WZpp3YxBdjWSB4+mNZEnAor
 +ZU/J/oTcB53BO2EyM1/sZskVbgGj52fpyztNuLQpZ3EhmPPZTZH23tQOogCDwAj
 lbn0xpiqu/p5wE9gkjyz5cRYZ198u50QZ6QOyQ86wBAqimRr2wMaz0yJ370XEBR4
 8yXe+qsiE/RTKnsnyvT5H9aTyVyi9QyWuC55xbJDU5P5iGd8I0By7FGWeTmLezQ6
 ZUNWZzqXFtLJ/N0wgOCNd3NvyPf2/WbZ9neRLgweKObOed63nfIn+Ekvd4DOI0O5
 5vS1IaBFksnJQy5yajlBQJbsQUR8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=w/P7fv+m7tCwh3vM6h
 tISMF05PVqwgUiaWr1RbcIuLY=; b=CKgCRJfCeP63BlhS30M6eIJdQzdUqEfXzU
 rI0AXjJP2P3jQa6Cqz27fdOPNrYQliC83qMefRpw9o0wlY4e4dk3HYhMYUo9Mrb/
 BdSumBJd2v7Jsxqk/cV6F5YHYky+WJy0FN0ukr3imFKWD2mhBN70AGeWCuSx7MfO
 cTxmFELczSC+Ridyjn50xG+8KRLB9h7gIDfsTjdnJYjWNdcVKZV+5R8R+q/g5Z1p
 iuPkaQz/SYXIPROy9jXd0OJ06+PXlBxMAXX63phUepb0UJ3snnWrr/HLPQz7dRp4
 bWt0m6DQyUVLzZ9lnk+Yn1W6NZGh1gRs7XKgWfeQXwgvrEbWvAhA==
X-ME-Sender: <xms:amLEWeoMozO8aZbYszOBzZaQzyq2W90DN2wHCt3RUIdxhMFmcicvnQ>
X-Sasl-enc: /GYo2RtrdxZNPVLPW1wLny3YBqDtaRiEN/MGSaV9rdCk 1506042473
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F1537E1D2;
 Thu, 21 Sep 2017 21:07:52 -0400 (EDT)
Message-ID: <1506042465.30138.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ranges to SCU node
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 22 Sep 2017 10:37:45 +0930
In-Reply-To: <20170921074521.22796-1-joel@jms.id.au>
References: <20170921074521.22796-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fICnPAen4W46OjNl6nVp"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Sep 2017 01:07:59 -0000


--=-fICnPAen4W46OjNl6nVp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-21 at 17:15 +0930, Joel Stanley wrote:
> The SCU contains a number of devices. To date we have the pinctrl node,
> which doesn't have a reg property, the out of tree clock drivers which
> do have a single address in their reg properties, and the timeriomem
> node which has an address and length.
>=20
> From now on we will use a ranges property, allowing all of the devices
> under the SCU to specify an address and size starting from the SCU base.
>=20
> This allows the timeriomem node to live under the SCU syscon node. This c=
hange
> is required to get the timeriomem driver to probe on the ast2400.

We also need to update the bindings documentation[1], which will need
to get past Lee and Rob.

[1] Documentation/devicetree/bindings/mfd/aspeed-scu.txt=C2=A0

I expect there to be some complaints about adding new required
properties, and it seems the #address-cells and #size-cells properties
weren't specified there either (though that's probably a good thing, as
the #size-cells value would have changed with this patch).

The poor state of the SCU bindings is due to historical factors, mainly
the narrow scope when I defined the bindings (driven by pinctrl) and
inexperience with devicetree, topped off by the complexity of the SCU.

However I think the ranges approach is the right way to go, so=C2=A0

Acked-by: Andrew Jeffery <andrew@aj.id.au>

for the implementation, with the expectation that bindings
documentation is to come.

>=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> > This supersedes http://patchwork.ozlabs.org/patch/816677/ following dis=
cussion
> with Jeremy and Andrew.
>=20
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 21 +++++++++++----------
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 31 ++++++++++++++++-------------=
--
> =C2=A02 files changed, 27 insertions(+), 25 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index a83b6a8d73d4..6151704aa87e 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -158,9 +158,14 @@
> > > =C2=A0			syscon: syscon@1e6e2000 {
> > =C2=A0				compatible =3D "aspeed,g4-scu", "syscon", "simple-mfd";
> > =C2=A0				reg =3D <0x1e6e2000 0x1a8>;
> > +				ranges =3D <0x0 0x1e6e2000 0x1a8>;
> =C2=A0
> > =C2=A0				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > +				#size-cells =3D <1>;
> +
> > > +				pinctrl: pinctrl@1e6e2000 {
> > +					compatible =3D "aspeed,g4-pinctrl";
> > +				};
> =C2=A0
> > =C2=A0				clk_clkin: clk_clkin {
> > =C2=A0					#clock-cells =3D <0>;
> @@ -171,40 +176,36 @@
> > > =C2=A0				clk_hpll: clk_hpll@70 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g4-hpll-clock";
> > -					reg =3D <0x70>;
> > +					reg =3D <0x70 0x0>;
> > =C2=A0					clocks =3D <&clk_clkin>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_ahb: clk_ahb@70 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g4-ahb-clock";
> > -					reg =3D <0x70>;
> > +					reg =3D <0x70 0x0>;
> > =C2=A0					clocks =3D <&clk_hpll>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_apb: clk_apb@08 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g4-apb-clock";
> > -					reg =3D <0x08>;
> > +					reg =3D <0x08 0x0>;
> > =C2=A0					clocks =3D <&clk_hpll>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_uart: clk_uart@2c{
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g4-uart-clock";
> > -					reg =3D <0x2c>;
> > +					reg =3D <0x2c 0x0>;
> > =C2=A0				};
> =C2=A0
> > =C2=A0				hwrng@1e6e2078 {
> > =C2=A0					compatible =3D "timeriomem_rng";
> > -					reg =3D <0x1e6e2078 0x4>;
> > +					reg =3D <0x78 0x4>;
> > =C2=A0					period =3D <1>;
> > =C2=A0					quality =3D <100>;
> > =C2=A0				};
> -
> > > -				pinctrl: pinctrl@1e6e2000 {
> > -					compatible =3D "aspeed,g4-pinctrl";
> > -				};
> > =C2=A0			};
> =C2=A0
> > > =C2=A0			adc: adc@1e6e9000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 9a988f69e610..ba3607c788e8 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -207,55 +207,56 @@
> > > =C2=A0			syscon: syscon@1e6e2000 {
> > =C2=A0				compatible =3D "aspeed,g5-scu", "syscon", "simple-mfd";
> > =C2=A0				reg =3D <0x1e6e2000 0x1a8>;
> > +				ranges =3D <0x0 0x1e6e2000 0x1a8>;
> =C2=A0
> > =C2=A0				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > +				#size-cells =3D <1>;
> +
> > > +				pinctrl: pinctrl@1e6e2000 {
> > +					compatible =3D "aspeed,g5-pinctrl";
> > +				};
> =C2=A0
> > > =C2=A0				clk_clkin: clk_clkin@70 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g5-clkin-clock";
> > -					reg =3D <0x70>;
> > +					reg =3D <0x70 0x0>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_hpll: clk_hpll@24 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g5-hpll-clock";
> > -					reg =3D <0x24>;
> > +					reg =3D <0x24 0x0>;
> > =C2=A0					clocks =3D <&clk_clkin>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_ahb: clk_ahb@70 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g5-ahb-clock";
> > -					reg =3D <0x70>;
> > +					reg =3D <0x70 0x0>;
> > =C2=A0					clocks =3D <&clk_hpll>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_apb: clk_apb@08 {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g5-apb-clock";
> > -					reg =3D <0x08>;
> > +					reg =3D <0x08 0x0>;
> > =C2=A0					clocks =3D <&clk_hpll>;
> > =C2=A0				};
> =C2=A0
> > > =C2=A0				clk_uart: clk_uart@2c {
> > =C2=A0					#clock-cells =3D <0>;
> > =C2=A0					compatible =3D "aspeed,g5-uart-clock";
> > -					reg =3D <0x2c>;
> > +					reg =3D <0x2c 0x0>;
> > =C2=A0				};
> =C2=A0
> > > -				pinctrl: pinctrl@1e6e2000 {
> > -					compatible =3D "aspeed,g5-pinctrl";
> > +				hwrng@1e6e2078 {
> > +					compatible =3D "timeriomem_rng";
> > +					reg =3D <0x78 0x4>;
> > +					period =3D <1>;
> > +					quality =3D <100>;
> > =C2=A0				};
> > =C2=A0			};
> =C2=A0
> > -			hwrng@1e6e2078 {
> > -				compatible =3D "timeriomem_rng";
> > -				reg =3D <0x1e6e2078 0x4>;
> > -				period =3D <1>;
> > -				quality =3D <100>;
> > -			};
> -
> > > =C2=A0			gfx: display@1e6e6000 {
> > =C2=A0				compatible =3D "aspeed,ast2500-gfx", "syscon";
> > =C2=A0				reg =3D <0x1e6e6000 0x1000>;
--=-fICnPAen4W46OjNl6nVp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZxGJhAAoJEJ0dnzgO5LT5Sf4QAILkYZlI0MwMXIBDTPEtKtDk
FoxR5sIrjl1yOl+MPNXJeRwaJq3g8FEBAgu26djWejG3s+I9XGaJII9hDa0L/U1x
PeC+srw+kKC3AJjwoaI2dhQLlLsyas4ogLOCloSMgECv9j2ok4jx95p7vwIw/Gpg
RtP72NF+NdCcjsj45cEEs10+0JRxlX67Gl3RR1qIrD0GZlhnRbMfFXf1CxuTHaYH
WxqwQxgpJGzLCampT3FzS7EX+IyjFlflJzm+S7rc1/+mB2QyWVhIggKtXid45TEf
sO+9H0zopMNKZ38luEEBwDHgXFdkRaqYcIrKHpm+UH+YzLLZB+kSvtZs66KTyZiG
4deI7UFLz+fC8angwElc8F6mqKq9y0k4dotMvETBVN8N1mKh3UC44E290mIGBPhg
tsAyaiBxFRhgth7I8su9frzUz5UtMc60Rl7xUh5f6le8a54k9fiHz4NhZaHpO0W0
5IwJjUHaUUN6ueAa5S5iqLG/Y0ZxyU8H24AKk+fLRHlEa/0vHB8ONmZCvsUznVz8
ivs+SZxgKoJ12dAhd7RRX+jD3+xv74dcjd6IUMLPGlkOhWLIqzESFS5zpm80Bq5G
gg/kxfi8FdeNvobwsPfHY58zNPQ9Si3le9YbYXFexXfCZNNRgrfxJjGelfRKwsO3
Byz5doPUgz4QLMqH/fsL
=BmSE
-----END PGP SIGNATURE-----

--=-fICnPAen4W46OjNl6nVp--
