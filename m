Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGlHs3hbTzDqry
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 14:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="U8aik0kQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BbGZXfnl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7767820A99;
 Tue, 25 Jul 2017 00:14:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 25 Jul 2017 00:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=8UTq9QBx1Uy2O9O3YXNfBilsJLQahWjS2eufOElNg
 bI=; b=U8aik0kQLlkE/0VQgCP48ViehNckPpuufo704tp+BJN+BfsWOqW5GaqY6
 laL/iXiQLCGlOhyW4wcQUnHfD8wjiMg/RTHjmtZ8VJio2ZFn0g5k5YPLgsE/qyh+
 kx6ugTClD8OXQEV9/tAkkXAcwjESMFI7Dq2OXwkMC6R39gOdZ8p7bnnH3iEIfndS
 Vz2iZq0VCvaP6O+qpjrf3+a8lmC9VoY45XCPxF72lCKAE3z/g17dmAcg3V24cV5c
 JfCRTIZaxV/b3rGV47wSzHr245rnuAqDrf5o5awSXgPsZYfACg3CP1Cui+FaZB8i
 r+ekHYifxhuMeVmZ/ad4nRobJLpcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=8UTq9QBx1Uy2O9O3YX
 NfBilsJLQahWjS2eufOElNgbI=; b=BbGZXfnlGPzOdK9l0r56lp7qgyCt3qZHjp
 kIVmvmzDssKJfn2DkiZ1MA8etHuXBIzqJ3M2IehVcp/utYMcBFlLQ8JbsGjCAQRt
 wGMeN9hMu5snInikHbjC7Tl4MuEZe2P5UAFwTNWC7dCnRB+DEP6CmrK3cOGHuLDr
 cNt7/mKtHzEUdOA8e+6sS6Anpe/uV3hhVLX9RKdbX0+EgsYpDhZWv0I4CB9+KcGZ
 4tfhR8K1p8dW6lpltjdlOZ2ySxHgshLaPRIbVeB69ArPGHKwi3+3N/R/I2O6h03U
 Ud4QawKvN9RSUJP0vXfd2yFmx1nHtTAPtejWruonVrzcXdA4EAdQ==
X-ME-Sender: <xms:p8V2WYOdt7gZkSI9yFuVCx9ELMJnzKO1vyQV0RXYOwNqoJXG8H11_A>
X-Sasl-enc: NaBg08FxZJe81RoVedH6W6tISLGwkB10PRRJQEZX7Zdf 1500956070
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B3507E16E;
 Tue, 25 Jul 2017 00:14:29 -0400 (EDT)
Message-ID: <1500956066.5179.10.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: firestone: Request
 UART pins
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 25 Jul 2017 13:44:26 +0930
In-Reply-To: <1500955926.5179.8.camel@aj.id.au>
References: <20170724120935.1862-1-joel@jms.id.au>
 <20170724120935.1862-2-joel@jms.id.au> <1500955926.5179.8.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-f6Qud2xSZwSbqiwos2a6"
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
X-List-Received-Date: Tue, 25 Jul 2017 04:14:34 -0000


--=-f6Qud2xSZwSbqiwos2a6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-25 at 13:42 +0930, Andrew Jeffery wrote:
> On Mon, 2017-07-24 at 21:39 +0930, Joel Stanley wrote:
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

On the condition that you add 'pinctrl-names =3D "default";' to both
nodes.

Thought popped into my head literally moments after I hit send.

>=20
> > ---
> > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 18 +++++++++++++=
+++++
> > =C2=A01 file changed, 18 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-firestone.dts
> > index cc479efd1763..39a836cbdfa5 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> > @@ -75,10 +75,28 @@
> > =C2=A0
> > =C2=A0&uart1 {
> > > =C2=A0	status =3D "okay";
> >=20
> > +
> > > > > > +	pinctrl-0 =3D <&pinctrl_txd1_default
> > > > > > +			&pinctrl_rxd1_default
> > > > > > +			&pinctrl_nrts1_default
> > > > > > +			&pinctrl_ndtr1_default
> > > > > > +			&pinctrl_ndsr1_default
> > > > > > +			&pinctrl_ncts1_default
> > > > > > +			&pinctrl_ndcd1_default
> > > +			&pinctrl_nri1_default>;
> >=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0&uart2 {
> > > =C2=A0	status =3D "okay";
> >=20
> > +
> > > > > > +	pinctrl-0 =3D <&pinctrl_txd2_default
> > > > > > +			&pinctrl_rxd2_default
> > > > > > +			&pinctrl_nrts2_default
> > > > > > +			&pinctrl_ndtr2_default
> > > > > > +			&pinctrl_ndsr2_default
> > > > > > +			&pinctrl_ncts2_default
> > > > > > +			&pinctrl_ndcd2_default
> > > +			&pinctrl_nri2_default>;
> >=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0&uart5 {
--=-f6Qud2xSZwSbqiwos2a6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZdsWiAAoJEJ0dnzgO5LT55HEP/1CAvOKOJjw6SNfkKZLAv4Hi
otZvznkQeDy0AxLWUM9UV7jLtgA7czmtCKO9BFAy7NTFhfSc3IBeI58uSk5C0mk2
mw0VgWa2WYagXqD4momCRKdjm5lvm+2IUvFxKlQ1LfMam0QKOAU3yphsy+MCmJEd
PROJ+kg260dJ0I6Mf/hpqcATOfYlGedcXqZ1yvbX/38gKBmHgsXElv2Csyqb0waU
YYHfubCyWawPc2fvjYQFr92fasc9wM9MpXPzi7Fz7ieXrbdjcUEaJAu7feD6PLx8
ZnlA/i/cjeo3uZnMpQ7xFBDgejblRn0JXDExmsp2UkFfnALNZs0mtewupa8ubGUA
S9nCRbAtTdRKps6lNnPpu2ZsFThjgEd7xVk7XZuptjem0x/fG+ImHYKeKSocLECa
cCxxGznFWCsp6EqSt/K4Gb2GU2ikmjreIvHGjnHIsqSEBQN77Ll63W/5c5eqInKI
JW5XUGCl+9EOoRfqmEx3LnbZMw8QaJiC6O4mwujqnXizyHGtTFSdEWw3hmDCmH9c
aUOhPL/NL6bK+VTUD0+zvork3ytM5YDFIqv9Di7Hb8ES8tmFSLb5W5pxS9GT3Trg
Ev0oMlB4KcCNDrCHyKZ9oza6khRQX7MF1w6/Pqnt+B0ZoU7HbHaEerJoI2KvIYik
fgvzVw+FDRAZVXqoit3/
=gjJy
-----END PGP SIGNATURE-----

--=-f6Qud2xSZwSbqiwos2a6--
