Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXdTP1tNnzDqHH
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 23:40:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Hiot77x0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pRGwrboh"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4BA920B3A;
 Tue, 28 Feb 2017 07:40:22 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 28 Feb 2017 07:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=OqblmYEknqRNY8MShBXargANpg4=; b=Hiot77
 x0l3r+7UtTA2rDtuk7nZFleO87N9gbPpJAG1dLgHLnKYa5LTQh48pjFjvMGH5i7o
 FaSX/5XnkbXFzuzfAXxXaSKUHRtgZb+b8if9wSr7vvIlRnLXzaeFxJ8FYdqpZsVd
 bXDrvJUyoegNA/iyGRPjs1nRMvbDtCidQS34E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=OqblmYEknqRNY8
 MShBXargANpg4=; b=pRGwrboh4RAWsi8qyDTdwmmoeiZ13ns4L3bKpQ/+jqQZQF
 lX6ei/gXf9K9ytGxr5J8SP6H9ta2Po1F/oApGuzNol63CZlcBOb09+NinyNqwy7q
 miK5Ak0txsl18ovknHFu2lhkEjJbij7QW97TtgmWCKaXhwJ3YJYd1/L7hnZXs=
X-ME-Sender: <xms:tm-1WJuKGMR9eoVv66f6Px6NlTNwSB6kM_JjetdHnRW2ABDm34NZWQ>
X-Sasl-enc: MaJAf1brtzpzT+4KGlHgyM4uRfCWutlJS8JcMKr6Ad61 1488285621
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E575C2400E;
 Tue, 28 Feb 2017 07:40:19 -0500 (EST)
Message-ID: <1488285610.4258.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI
 address mapping
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur
 <cyrilbur@gmail.com>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Date: Tue, 28 Feb 2017 23:10:10 +1030
In-Reply-To: <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4GwVGri08Fgsro/XnfdZ"
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
X-List-Received-Date: Tue, 28 Feb 2017 12:40:26 -0000


--=-4GwVGri08Fgsro/XnfdZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-28 at 20:27 +0800, Lei YU wrote:
> Hi Andrew, Joel,
>=20
> This patch is for issue https://github.com/openbmc/openbmc/issues/1214
>=20
> Here's what I have tested:
> 1. rom1-19 with updated OpenBMC (c85f23e1), which has mboxd enabled;
> 2. Do a power cycle;
> 3. Once BMC is ready, check the registers by devmem:
> =C2=A0=C2=A0=C2=A0```
> > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630034
> =C2=A0=C2=A0=C2=A00x70640000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<=3D=3D Wrong, expect 0x70680000
> > =C2=A0=C2=A0=C2=A0root@romulus:/tmp# devmem 0x1e630030
> =C2=A0=C2=A0=C2=A00x64600000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0<=3D=3D Wrong, expect 0x68600000
> =C2=A0=C2=A0=C2=A0```
> I can see the two registers have the unexpected value.
>=20
> Without manually setting the two registers, `obmcutil poweron` results in
> no output at all in host console.

Okay, can you please open an issue on github? I'd like to have a play
with a Romulus system tomorrow to better understand what's going on
here. We shouldn't need this kernel patch.

This makes me wonder if something's wrong with Zaius and Witherspoon as
well, and whether the problem is masked by these register writes in the
boardfile.

Thanks for the detailed reply.

Andrew

>=20
> That's why I send this patch to initialize the registers.
>=20
> Note: I think the lines
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x30000C00, AST_IO(AST_=
BASE_LPC | 0x88));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0xFC0003FF, AST_IO(AST_=
BASE_LPC | 0x8C));
> are not necessary since they are having the expected value without this p=
atch.
>=20
> But below changes are necessary:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Set SPI1 CE1 decoding windo=
w to 0x34000000 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x70680000, AST_IO(AST_=
BASE_SPI | 0x34));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Set SPI1 CE0 decoding windo=
w to 0x30000000 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x68600000, AST_IO(AST_=
BASE_SPI | 0x30));
>=20
> --
> BRs,
> Lei YU
>=20
> > On Tue, Feb 28, 2017 at 7:16 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Tue, Feb 28, 2017, at 20:10, Joel Stanley wrote:
> >=20
> >=20
> >=20
> > > > On 28 Feb 2017 17:49, "Lei YU" <mine260309@gmail.com> wrote:
> >=20
> > The PNOR SPI address mapping is the same as Witherspoon.
> >=20
> >=20
> > This should be handled by the device drivers we now have.
> >=20
> > Mbox brains trust, any idea why we would still need this?
> >=20
> >=20
> > I was going to say NAK for the same reason.
> >=20
> > Lei: are you absolutely positive you need this? If you do something has=
 gone
> > wrong. Is mboxd integrated into the romulus image? If not we need a yoc=
to
> > patch rather than a kernel patch.
> >=20
> > Andrew
> >=20
> > Cheers,
> >=20
> > Joel
> >=20
> >=20
> > > > Signed-off-by: Lei YU <mine260309@gmail.com>
> > ---
> > =C2=A0arch/arm/mach-aspeed/aspeed.c | 18 ++++++++++++++++++
> > =C2=A01 file changed, 18 insertions(+)
> >=20
> > diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspee=
d.c
> > index 726b8fa..ec9eecf 100644
> > --- a/arch/arm/mach-aspeed/aspeed.c
> > +++ b/arch/arm/mach-aspeed/aspeed.c
> > @@ -221,6 +221,24 @@ static void __init do_witherspoon_setup(void)
> > =C2=A0static void __init do_romulus_setup(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do_common_setup();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Setup PNOR address mappin=
g for 64M flash
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0ADR=
BASE: 0x3000 (0x30000000)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0HWM=
BASE: 0x0C00 (0x0C000000)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0ADDRMASK:=
 0xFC00 (0xFC000000)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*=C2=A0=C2=A0=C2=A0HWN=
CARE: 0x03FF (0x03FF0000)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Mapping appears at 0=
x60300fc000000 on the host
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x30000C00, AST_IO(AS=
T_BASE_LPC | 0x88));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0xFC0003FF, AST_IO(AS=
T_BASE_LPC | 0x8C));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Set SPI1 CE1 decoding win=
dow to 0x34000000 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x70680000, AST_IO(AS=
T_BASE_SPI | 0x34));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Set SPI1 CE0 decoding win=
dow to 0x30000000 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(0x68600000, AST_IO(AS=
T_BASE_SPI | 0x30));
> > =C2=A0}
> >=20
> > =C2=A0#define SCU_PASSWORD=C2=A0=C2=A0=C2=A00x1688A8A8
> > --
> > 1.9.1
--=-4GwVGri08Fgsro/XnfdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYtW+rAAoJEJ0dnzgO5LT5ThgQAIH8c+BZsSfA4otgnYbTa2AL
h+XHNNlH1+qfXTvgUD3CpY4+JsF2I0hoVwkN5X3+TiZyEQGVU8jTfmcATyqjjIRy
EPBVhGkpGyIffn8mCedsS5v6EBS/+ggDuEW7asPGJiOaOC5U9fRroWWqEm8KTauH
ca5YLpmmLm5wAwyf/5irQvAe0YFWCKghD2BriYyWi94FUN9nRGI6g8rshdrZ00YT
hU2Is4kx9Y/ZaRugoJxj2pUjYyLmZ4GJ///EoqeVo970dHEfAq8JMC6INUUN5BBP
fGjVkiP2aX29qJfn3QRE0ksUd8u3wogdKARVfYty1EiSC83VAm2aaqSK9Dfw0pN9
vBNMozb2KPi9EPrrF49pVvqyoIEK8k4G16KzvAXVM6QBtkL4GlBQspHOON7zYIqq
JtcGH7D4h6M4jtES/bAcaMKSI5Y7tDZ+0B4bz98RZPnYhg5FDn8g2Tkjw8Nr0XfI
ExVlx5Is9QYZF5lkyZNTT7X4qULK/LG7NKTsuwptBFTp23tKw+0/D/P0kpWH76uD
yQovv4A20Xd5p9dwNlR+PSrpi9GwxBiDZlY6RjpwrsBCVc/0xbLNU3gmEbh7bqyD
sqjacbF8mITiLvHo1vCeY/f4VgABiZFguCKd+k2z23IgXQt4Kzyj/rhJ6oMnYTI7
rci7FLC7yabJosXzrBDn
=Mzpq
-----END PGP SIGNATURE-----

--=-4GwVGri08Fgsro/XnfdZ--
