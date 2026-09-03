Return-Path: <openbmc+bounces-2542-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C15C624A4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 17:37:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbRc93N5sz2yqd;
	Fri, 04 Sep 2026 03:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788457017;
	cv=none; b=kgALZoELY8f2YEghO07u27K38Eglm3ektbVlWD2XkByqvehb9k/yMQJz255v3Uc34Kw6emC14l48NRKLZyAWNpdxRdbCBxvH8If6g50bnOdejubplPSeReydM9e8z2TY0cbjRP58Zast09WracrCK1gCJMUX1d6VXsNbIyNIk3eXhYXOta9wzB1JynHpwcA0ipEBclW1R9IgSrr2gQ5S+k4QKP1Sc++Z6za3tsKSQhH+FtzBSkWETqIujv1JcdmuiXyTWdZIsKLtOy1FVHQDMsXYd1O9oGQlWYeSIT4+UG+ch2fjk9D8j7h7343Lnu8axDOqViTWbHepDYwaFJYcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788457017; c=relaxed/relaxed;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqDhkK3zpSE4G43ygEGZ83t7SKQlIq5Nc1F8fM7CwvbGi3y22jEsawv017xEOPU4iZv4Ralcg1Z8RORs4FqrMHy3PTcXJG+imxzgUBSyuSeAKwG7Gy0iolP9IZ81ZVFk5rv0TUpgBcWTCTNOZlrsBn5B7ov5tkkIxK9E5a/Bg/DsZ5tbPVJ/ahlg6m0PsTudA6YXW6OV3BN1qkZ3H0Vyh4lB8aCiilLaEVgi5J4+BmWFqWdiqEj2NrHDmmQpr1DDS5aWVbquT1hcZfXltu/Xgt3tyKNPC2ecCUkXxerJngDbzNvBPKvM2K/YxQ3vJcANz3e8A3n21rOxv06YeKZYyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkbwZNy8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JkbwZNy8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbRc838jfz2xyl
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 03:36:56 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4648D60120;
	Thu,  3 Sep 2026 17:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FEA1F000E9;
	Thu,  3 Sep 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457013;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkbwZNy8ok4L4oriC8g3PM+zQszbreb7sedqMSeb0lCmL8KNRQdk5SRx/ZaTNcXtz
	 ufHDYwCIbZ7UMLbp4fN1OVUw9rOJElPyHPWGavsomJfga362CvrOIYJJ2HtE6uvyiH
	 MJ1XEY6Fa7d+alzegb6GoFGsazjoCdrbMD/CRCS1/3vrx1Mw0iKXcJPodIBTcVKIrS
	 mj1VNF5d6+5Kt5RsriKPeAWNX82Uu4wjnDBbrN1PhaQaJYv0NVfN1uIpnQtwe1UrOA
	 ELWhCzT2guKZ968riHybpQ8mTazR2glo8JDvfyR8QvgBCV0QGc47urTPD3dNokOlFS
	 WA/oBUDc6u7mw==
Date: Thu, 3 Sep 2026 18:36:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO
 controller
Message-ID: <20260903-duckbill-cartoon-d1877e4c0e3c@spud>
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
 <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OrWhVXbbco6P8u3i"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>

--OrWhVXbbco6P8u3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 12:11:32AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the SGPIO controller found on the
> Axiado AX3005 SoC.
>=20
> Each SGPIO position provides one fixed-direction input GPIO and one
> fixed-direction output GPIO. Input GPIOs support edge-triggered
> interrupts.
>=20
> The controller serializes output values and samples input values over
> dedicated data, clock, and latch signals.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OrWhVXbbco6P8u3i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmwLwAKCRB4tDGHoIJi
0nUSAP0dyjCLkvgRkuJeO5EQJWdRF9RerX1spQo+2jyKk4+HfwD/bcZvsxMEDDd3
auDb1zeyszZb4i9nsXRYElsNRzHgAAk=
=lVaB
-----END PGP SIGNATURE-----

--OrWhVXbbco6P8u3i--

