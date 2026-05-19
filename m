Return-Path: <openbmc+bounces-1961-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C77CD343F
	for <openbmc@archiver.kernel.org>; Tue, 19 May 2026 01:41:03 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKHSS6Hkrz2y7Y;
	Tue, 19 May 2026 11:40:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779154856;
	cv=none; b=floBwrG34DtTwUA9tr6pCITGiQDLV7Xpt9hrs/v7Fa5G1K69nSbNws5pTh46MukFqQLwvaBUJv7k0YlCciv5z54sf/aDZGJDVktAUMc8G5wKHLreEWDeHg//vkBdTYPY23q45Vq1PT2eP8FIDwcO6G6KVB3B2YF5pD7JbMCXFPmj1ZnwceenNmU6dMqBjfsLm6Ri6Cu27hncOlkA5w/0MFSd4eKwpcgxAzPvBCF6teSjdwpYsDKn4ViKqyBRQoymjMa1HoHQooXBNUT5A7xvSxJw8EtTc1VZ34H6a3BbE1iFxCCP+quRiRRHAnO9s+F5qcXkuGVKJRQV2iMTCdGZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779154856; c=relaxed/relaxed;
	bh=dYy3XzTrJ/sfu9jptJ8Ra++Q4BPMzlGcmfT0FPzArtI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GE4mZeIfomwpvkxYaldk1H7fo3Z1q+4jFLg17ccmgPuDXYjGlwBIAJPBxdE0OjDYe+JCXuZOY25lh537gNDREXArML+P2FYDwEH8B3UjdfnUYxqVLbb8dEkGt0ScWHHF1lprlOtCyJc+VEVSP4CMXB5bDLirCoWW/9z0KBfhjFoT/g5kwKMb5JI00S+f2EPsda2oBFre8Kil+1gz+EUn3VJETM1fLV6zP0Tl3Mo2sRrSln5RwPta2BIRCLBJosRCxkmki5cCzvkcVOGQ746e/tqh1QXgjr4sPTF1bO8LFscDG6RW3osm0+fHLJLXVbqfBNxrw/UJRJlc0XOL/Sl9iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yl+x0/l/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Yl+x0/l/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKHSQ1Nvwz2xqv
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 11:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779154852;
	bh=dYy3XzTrJ/sfu9jptJ8Ra++Q4BPMzlGcmfT0FPzArtI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Yl+x0/l/+9ZML6afJZAITDZQycx+zSSWrQknu7stZtBZIjJPYDwrDhuD3cKwMrRBM
	 IcvcU5CdfhSsUEQKE8DNw3PsMHy43jJbzX1ZNXFIfsyk65C9jlW+UwH9pnzRyF+dpg
	 hlmJAKois1A8cT9UnQ+Jdz9BcBj/WrQhxwg71HwHdMxyeAb+6DOUCiA3q3YuGBMpdN
	 SoTAlSwzrujpi7TFt57/L46xQNz+p+/3v3z9JTNHsqCbbtc/HmkQNFlq0lsjpPCdRk
	 Bwbyqs2xHyJqSDOrAGvJRvs26Ve0/b5cnqvG3Aw62uCdVMmTxu6svPt9rbrsyPEi/o
	 MPdsVK/ZdwKKA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 53C536025D;
	Tue, 19 May 2026 09:40:51 +0800 (AWST)
Message-ID: <a7d364d72bbfa4ed3d41e9f7282f8e87a783cf48.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, Ender Hsieh	
 <andhsieh@nvidia.com>, Marc Olberding <molberding@nvidia.com>, Chia-Wei
 Wang	 <chiawei_wang@aspeedtech.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Tue, 19 May 2026 11:10:50 +0930
In-Reply-To: <CAJ13v3QJ-sDBp_sUJ8ywk0QD7eADSq55SyGposb1_F=dmQQHOQ@mail.gmail.com>
References: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com>
	 <943cfc3799373dffe67d5624af5fe10432150857.camel@codeconstruct.com.au>
	 <CAJ13v3QJ-sDBp_sUJ8ywk0QD7eADSq55SyGposb1_F=dmQQHOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-05-18 at 08:50 -0500, Anirudh Srinivasan wrote:
> Hi Andrew,
>=20
> On Mon, May 18, 2026 at 7:59=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Anirudh,
> >=20
> > Sorry for the delay :(
> >=20
> > On Sat, 2026-03-28 at 14:14 -0500, Anirudh Srinivasan wrote:
> > > Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.
> > >=20
> > > This version of the DTS doesn't support networking due to u-boot inse=
rting
> > > mac delays (when it isn't really needed) and needing to misconfigure =
the
> > > phy-mode in linux due to it. See discussion here [1] for more details=
.
> > >=20
> > > Networking can be enabled in this manner currently.
> > >=20
> > > aliases {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eth0 =3D &mac2;
> > > };
> > >=20
> > > &mac2 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-mode =3D "rgmii-id";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phy-handle =3D <&ethphy2>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_rgmii3_default=
>;
> > > };
> > >=20
> > > &mdio {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_mdio3_de=
fault>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy2: ethernet-phy@2 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reg =3D <0>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > };
> > >=20
> > > &scu {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mac2-clk-delay =3D <0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0 0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0 0>;
> > > };
> >=20
> > So something I didn't appreciate in our previous discussion was that
> > this was a property on the SCU node (I should have looked then).
> > Checking the implementation, it seems to me like this is the same as
> > not specifying the property. That corroborates Ender's efforts here:
> >=20
> > https://lore.kernel.org/all/20260505050541.3031447-2-andhsieh@nvidia.co=
m/
> >=20
> > I think we just drop the property and add in the mac nodes, and remove
> > this note from the commit message?
> >=20
> > Possibly some confusion comes from the EVB DTS specifying the property,
> > and everyone just copied it, then wondered why it was all broken.
>=20
> I think that the u-boot implementation [1] uses a default value for
> the clk delay if it doesn't find a clk-delay node in the DT. My
> testing also seemed to suggest this, i.e if I dropped the clk-delay
> node node, networking wasn't working. We need a zero clk delay, and
> the default isn't zero.
>=20
> Am I correct? I can try testing again when I get some time later on in th=
e week.

Heh, so I did look, but must've glazed over the defaults set at the top
there. I checked the default register value in the datasheet which
claims it is zero, but clearly that was not enough.

So I think what I was hoping to avoid was adding to the devicetrees
properties that are not defined in bindings, but that ship has sailed
for the u-boot fork. I'll drop that line of thought for now.

Looking at the upstream kernel devicetrees, only aspeed-ast2600-evb.dts
specifies `phy-mode =3D "rgmii-rxid";` (thanks to Andrew Lunn's review
efforts). All MAC nodes set phy-mode where they don't otherwise specify
use-ncsi (which is RMII and not RGMII, and so we can ignore them for
the purpose of this problem).

Inspecting the output of the following in openbmc/u-boot
openbmc/v2019.04-aspeed-openbmc:

   git grep -A 10 -e '^[&]mac.' -e 'mac.-clk-delay' arch/arm/dts/ast2600*

the boards below enable MACs for RGMII but do not set the `mac.-clk-
delay` properties in the SCU node:

- ast2600-fpga.dts
- ast2600-msx4-bmc-nvidia.dts
- ast2600-slt.dts

As such, they rely on the default values you pointed out in the driver.

Perhaps we could add the mac.-clk-delay properties with the default
values currently used by the driver to the SCU devicetree node for
those boards. From there, we can rework clk_ast2600 so that the default
value is no delay from the SCU, and we rely on the devicetrees to
specify what delay, if any, is required, where necessary.

From there, no new u-boot ast2600 devicetrees should require the mac.-
clk-delay properties, and on the MAC nodes we can set `phy-mode =3D
"rgmii-id";` as appropriate.

I've added Marc to the thread for the MSX4 side of things.

>=20
> I looked through Ender's efforts and it seems surprising that it works
> for their board. Maybe the board design is different in some manner
> there?

Yes, that is surprising. I've added Ender to this thread.

Andrew

