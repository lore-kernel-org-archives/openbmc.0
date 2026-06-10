Return-Path: <openbmc+bounces-2068-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D59CD8CB2
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 10:49:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb2bJ3PMrz2ykX;
	Wed, 10 Jun 2026 20:49:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781088572;
	cv=none; b=CfLWBDmZHWbxqt5zf6WWT9vZNgUVaxJOafACQyIFz84m2jYNQsMB8LaEjO1GA2A1x8z91JNYffFwqoLU4wyMpqq7lnVmKrTHZQCdA4Ss8tHIn8GFjrGAtuWSNl0IcjIbbfEIdwefPouoeX+W45rp/U3n5Uo44VvWjzgjPuaMgGXGfdAPE5bsWjIgVACKPrCyzkIY4yEtb1z26932DHUDxr7V5lFAKse6UoOQFZDHXxxzWOvG11Rqfacl+0yXKW2/Ltv1q1OZ4R736NKL+1E3tLAk1uqmvBYufAVTQiKycGCqSHQhdv0kNyHi9yVuEsipAO/1BUSvO1q+OvkgHnQfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781088572; c=relaxed/relaxed;
	bh=PqEFgoVcPTbXIJdGqrarSTorUnykUPeJIUIL/0osaWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyeXAat1wobX3AvxWXVTlexccvEdC7WKuS1JH7Vmz8d6WlH0was23zMXXmEpGXN/h3dvClSZUtx39Iq3QqwUN6w3c0reCpTbRMabg6QO3y9/OG9HqvQ7BK/DawUYS8lnBIerO2kPKS8L6lHikJZ5VLnALvdiaIZbxa1saIQHWMs5NWSSzZTNOcoo5IGarvwOl/pg70FRpuh9Xv29kCxMpCPpC5InVyY26AyIZpFvUf/sCn+ptcvy2NxJKaI8II6qveBSWGkSdNuAIxthKN6olxy+aDpVBwD+pndKqzcQBqXVpeonXu1xaLdEf+adKzN8Dh5QgbrZcSmW57LBwlIKwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i7RE3I/s; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i7RE3I/s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb2bF6rncz2xdb
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 20:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781088567;
	bh=PqEFgoVcPTbXIJdGqrarSTorUnykUPeJIUIL/0osaWo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i7RE3I/sTan/oSKn8Qc6B9mcLy8Wmu7Y/N//Gdf6xE0g0Or7mwR2cH4uPL0vl4FWz
	 71DL/2wn+wzrb/bPYh3seH/KmK+MnJpjkr7TRdfORrPbYnbm8ZAZ4q/HNzKxW9z1A7
	 225g0jFNg9ocENgzxXdrMy74VV6bFgoG5qCSzmrDpOi3Ld+zPVyfJkO6/vQlkJHXXf
	 f4sRcOsBn3V9otOhioMLpQHgq40picwOARmyDWq3VQqzKwgVWhxi3/DlUeA4a1QS0m
	 8upqiKFml/izYTH5j5u0DPRCdoQZbRgdIzvcH0379Jo3Bwp/7BJ2rgaA12TJRQg/bc
	 PfQpNdcK+Lp6Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E5EA460A19;
	Wed, 10 Jun 2026 18:49:26 +0800 (AWST)
Message-ID: <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU
 clock-names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, broonie@kernel.org, robh@kernel.org,
 	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 avifishman70@gmail.com, 	tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, 	benjaminfair@google.com
Date: Wed, 10 Jun 2026 20:19:26 +0930
In-Reply-To: <20260609163919.3321228-3-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
	 <20260609163919.3321228-3-tmaimon77@gmail.com>
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

On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> The NPCM7xx FIU controller driver gets its single clock with
> devm_clk_get_enabled(dev, NULL) and does not perform a named
> clock lookup. Drop the redundant clock-names properties from the
> FIU controller nodes so the DTS describes only the resources the
> driver actually uses.

The devicetree is a description of the hardware in the form documented
by the bindings. Generally it's not right to discuss Linux drivers
here: they're only relevant in the context of Linux, but the devicetree
binding governs devicetrees over multiple projects.

From a quick look it seems that these names are not described in the
corresponding binding, therefore no drivers should be using them and as
such they can (and should) be dropped. A driver would only be worth
mentioning if it did use the undocumented names (as that would be a
complication).

Can you please rework the description?

Andrew

>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch=
/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> index a16450abea0e..83cd10b47273 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> @@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
> =C2=A0			reg =3D <0xfb000000 0x1000>;
> =C2=A0			reg-names =3D "control";
> =C2=A0			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
> -			clock-names =3D "clk_spi0";
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0
> @@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
> =C2=A0			reg =3D <0xc0000000 0x1000>;
> =C2=A0			reg-names =3D "control";
> =C2=A0			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
> -			clock-names =3D "clk_spi3";
> =C2=A0			pinctrl-names =3D "default";
> =C2=A0			pinctrl-0 =3D <&spi3_pins>;
> =C2=A0			status =3D "disabled";
> @@ -217,7 +215,6 @@ fiux: spi@fb001000 {
> =C2=A0			reg =3D <0xfb001000 0x1000>;
> =C2=A0			reg-names =3D "control";
> =C2=A0			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
> -			clock-names =3D "clk_spix";
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> =C2=A0

