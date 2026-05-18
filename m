Return-Path: <openbmc+bounces-1949-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE72CD4F52
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 12:59:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJyYg6wyLz2y7Y;
	Mon, 18 May 2026 22:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779109159;
	cv=none; b=QpEl6vdeFGkBXY7URXgrG4CrBX+qz41M8Wx2xgJ7uHXh6yRk6B8tjsdbqpWcZR06BbHPQuAK1ZAXeb8RZZfipVEphZygEQrsYxmL+jbEWGCBIQMSnxrLrLjGlPSArg9ZGwlbWsZHESEagtTM5PfPLiLAEu7LBC5qcYCGkaiAAVpFXPJ4u8mabrkghYJ7u1F7jM49LeZuNxSq+2hPlcKrnAgXsi0DrBeJY72Wmm1cpdTlOz/UMxqVMnibsxptlikmUoQcNfajXlGRuU16YUKIunV9hlgO+vh01X8dUniMklmyz4U3E+Q6eP6hDPjqJcFcSrRePn1ijOV1Ta9eFfx+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779109159; c=relaxed/relaxed;
	bh=Brt2gDXDo6VA44MNRofJ1PRj38mxNLYqB2ctZxVIurQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fe23GMH7r2Vb2sAflJBQLhSaICFABwi33El4ewXj4YGu/KhtbGJ10I/QSYR7O3LoU0bgVnqJv+qEf96dApW3tAe/5V4ZCbMtxoCdu2LdcM7ietTq6vjety/B/peKMipSbImhFvI6nWsRAZ84GWa8eSBefS4icmkWDALvlCOukeINrCX+2qYeDKGUjujfG+uBDeUh+o+jrGuIp+7B61XrnpZNo96n9uYAnM8lA+VRa7vsyHu+V5bNw5y4QghfuMGTn9x8AjW5cjFpUbXOBu+5Hp/XipPOUwBInNnWzssjiAwr3r2oA/suolsRgPyKYkT8Nm72vlHGumD79w6GPxy79g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BvvicHMA; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BvvicHMA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJyYf4TtYz2xRw
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 22:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109157;
	bh=Brt2gDXDo6VA44MNRofJ1PRj38mxNLYqB2ctZxVIurQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BvvicHMAHbdzqSeSkX+RjjNnk5FbEFl78mjap4s+cE+EvFj6BKBjOihUlKzIqpMyv
	 jI11iBFB32ULr+NrVs2jw1A7275Xqsq355nvAC+Jf8/rDwKLRqxDnHY4G6UMUB2Qdc
	 E5MWG5gWqoE7wje1PfI55gIArRNBGlHcSPnE7plIE5Kip8GwZbuxaWzGxKP+cHj7hm
	 /kZB2wVEJ4ih6b4N6Pf9ku95a/nzpS7mcO2S05oZqmiZbtyyHT+5dvwKXtbbUmElXU
	 4Z76jsY4WpcmYtI7nPioz9KkMHwwW+zUulEmZwhNuvvi8p88r8PgdUP24Lf15jW2nF
	 olzF/Mfnh0+bQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C2C9F6025D;
	Mon, 18 May 2026 20:59:17 +0800 (AWST)
Message-ID: <943cfc3799373dffe67d5624af5fe10432150857.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Mon, 18 May 2026 22:29:17 +0930
In-Reply-To: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com>
References: <20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com>
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

Hi Anirudh,

Sorry for the delay :(

On Sat, 2026-03-28 at 14:14 -0500, Anirudh Srinivasan wrote:
> Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card.
>=20
> This version of the DTS doesn't support networking due to u-boot insertin=
g
> mac delays (when it isn't really needed) and needing to misconfigure the
> phy-mode in linux due to it. See discussion here [1] for more details.
>=20
> Networking can be enabled in this manner currently.
>=20
> aliases {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eth0 =3D &mac2;
> };
>=20
> &mac2 {
> 	status =3D "okay";
> 	phy-mode =3D "rgmii-id";
> 	phy-handle =3D <&ethphy2>;
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> };
>=20
> &mdio {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&pinctrl_mdio3_defaul=
t>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <1>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <0>;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ethphy2: ethernet-phy@2 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reg =3D <0>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> };
>=20
> &scu {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mac2-clk-delay =3D <0 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 =
0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 =
0>;
> };

So something I didn't appreciate in our previous discussion was that
this was a property on the SCU node (I should have looked then).
Checking the implementation, it seems to me like this is the same as
not specifying the property. That corroborates Ender's efforts here:

https://lore.kernel.org/all/20260505050541.3031447-2-andhsieh@nvidia.com/

I think we just drop the property and add in the mac nodes, and remove
this note from the commit message?

Possibly some confusion comes from the EVB DTS specifying the property,
and everyone just copied it, then wondered why it was all broken.

Andrew

