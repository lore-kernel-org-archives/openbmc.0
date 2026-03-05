Return-Path: <openbmc+bounces-1436-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0396FEDEC07
	for <openbmc@archiver.kernel.org>; Thu,  5 Mar 2026 05:22:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRHwr003Sz3c2k;
	Thu, 05 Mar 2026 16:22:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772688155;
	cv=none; b=BKF0E0JTR++QEOmuSpoXc3DOwEHR2LQP8YsZfykaBm96tRm/vUy5UY4Dqos6t3mevIzdFhzCBw0QEkZo285ZGIAued/l04p/+j1u3Ntit24cIr2bkVaNa8VaDinhBwxJBUgKatrTYyv1dQHlu6xasZorXzEVbfS2YTxLPAXWq6vZR4l0weje+ote7AuNeOoLHUROTjZ9rJFginA98jvGIX1WBIn6cJWdj8Eik8b86zft2Q96ln3+e3ZdPTCx1Vscsj/PXaqDqUWHcmUsDj4u2vSZod3RpqE3z3iCDQjqdt/snzXCJT6cquh+tHjSgo6P0vaXzmp7q8CGiDBIYh6yEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772688155; c=relaxed/relaxed;
	bh=1xqEuJIPBU6HBenB2oOvbqiXrz9G+UT+w95rj+3C2Nk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dIlMB+McCh67ZFW6HPN55GfAiMHlo52am8AigOle7hUmpO6txfZD+87LwN3Pn4JrjSuRnan5t06cf4QPxyTYGExZJzq2TgBYQIA3EbV8Dn6fajwkVG9LWI7h4vpIRikLq2uYDWp7DzsmYTWNMUdRYdQey7dAmnt8FModK5zHDJIvviAj4DmwmoDlT2D5ze+qtB+fOxAGeovHMA4lZQHsfSlOvHE8TO27zLf5hXzsyoCZt6LN8k+V1pLMcieXx1GzJV1l3J2ko1f7DtKVfWgLGJiSuA5ihC7Lpf+oRab6TIAjrvQuZ5MMLqx2y3n4sp9xnCGushMNZMfXOpwMhvGIPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V1XIV1PY; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V1XIV1PY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRHwp5SyWz3bhG
	for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2026 16:22:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772688153;
	bh=1xqEuJIPBU6HBenB2oOvbqiXrz9G+UT+w95rj+3C2Nk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V1XIV1PYgyQVfg+QLmmd7zTU0ztr3PiTynz8Vp8caOYtJPJPPT8DukJLHrSv1X+c8
	 BiFZIqLpfpiKGvHiJuue73/SJkcagZsIHqfsHiYyNmw8TmE6tc2hRLY9dPY8qCpxzE
	 pJ9rdhQ8IJXPpBMQ8+jExHvsIVIQRcSDBK7oqYogWXXW1DUSNcbOqB27904T4k0zyF
	 SCdAnNtUgCqnjFLXXgK/3ABB08Ynoq63jgsLyYOlIZgbvIfwwKwibbmNqMqDdzNJ96
	 l6BMT4DKCYSW5N9aStoONprJv/FFVUiE5sl4i+PDH8KTdS8QakqrFfC4V3QXXwacFQ
	 Ks13c+r3RzErw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 281486000D;
	Thu,  5 Mar 2026 13:22:33 +0800 (AWST)
Message-ID: <0f0a1a6862a8b94bf4f5c00da85bad4efce7c071.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Thu, 05 Mar 2026 15:52:32 +1030
In-Reply-To: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
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

On Sat, 2026-02-28 at 22:00 -0600, Anirudh Srinivasan wrote:
> Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card
>=20
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
> =C2=A0arch/arm/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 98
> ++++++++++++++++++++++++
> =C2=A02 files changed, 99 insertions(+)
>=20
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index
> 5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70..fa6837be747da4fbe102ac27e60
> ee3d81e230cb7 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -682,6 +682,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	ast2500-genesis3.dtb \
> =C2=A0	ast2500-romulus.dtb \
> =C2=A0	ast2600-ampere.dtb \
> +	ast2600-asus-kommando-ipmi-card.dtb \
> =C2=A0	ast2600-bletchley.dtb \
> =C2=A0	ast2600-dcscm.dtb \
> =C2=A0	ast2600-evb-ecc.dtb \
> diff --git a/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..11fee8d5403541f2453f6b8c6f1
> 23c5d1108137d
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model =3D "ASUS Kommando IPMI Card";
> +	compatible =3D "asus,kommando-ipmi-card", "aspeed,ast2600";
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +	};
> +
> +	aliases {
> +		spi0 =3D &fmc;
> +		ethernet0 =3D &mac2;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency =3D <800000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency =3D <800000000>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> +
> +	flash@0 {
> +		status =3D "okay";
> +		spi-max-frequency =3D <50000000>;
> +		spi-tx-bus-width =3D <4>;
> +		spi-rx-bus-width =3D <4>;
> +	};
> +};
> +
> +&hace {
> +	status =3D "okay";
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&mac2 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy2>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> +};
> +
> +&mdio {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mdio3_default>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	ethphy2: ethernet-phy@2 {
> +		reg =3D <0>;
> +	};
> +};
> +
> +&scu {
> +	mac2-clk-delay =3D <0x08 0x04
> +			=C2=A0 0x08 0x04
> +			=C2=A0 0x08 0x04>;

Before we go too far down this path, are you aware of the discussions
on the kernel side?

https://lore.kernel.org/all/20260302-rgmii_delay_2600-v6-0-68319a4c4110@asp=
eedtech.com/

Essentially, can we defer configuring the delays via the SCU here so we
can isolate that problem in the kernel?

I recognise that you might want networking in u-boot as well though :)

> +};
> +
> +&sdrammc {
> +	clock-frequency =3D <400000000>;
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +	u-boot,dm-pre-reloc;
> +};
> +
> +&wdt1 {
> +	status =3D "okay";
> +};
> +
> +&wdt2 {
> +	status =3D "okay";
> +};
> +
> +&wdt3 {
> +	status =3D "okay";
> +};
>=20
> ---
> base-commit: d40130c7056b84dc5213f3ff6764d0e45bb84035
> change-id: 20260228-asus-kommando-9de4d6b779a8
>=20
> Best regards,

