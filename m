Return-Path: <openbmc+bounces-1891-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B87CD3427
	for <openbmc@archiver.kernel.org>; Tue,  5 May 2026 16:25:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g93lT5XmLz2xqJ;
	Wed, 06 May 2026 02:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777998325;
	cv=none; b=l/XLq7cYYZ89lfpYVlQVjugEQhLpn0uy2RdCE4IZ6xUBpmeusM36Vz3nl8t37+w2Btxf0Zr523ilqLQnmP9ocBGLXEiW/Nqt8bDMFwjfXloFgcmbWedAUzR1ndNAe0YlGx+0yIaaJ2kyDgeeH0pwWFAuy0AmJpMwZy7bor6yhcdB0kGq2n/xDvf+xjboa+OzQ0PEj/E609sQvbXHjLbt2woLiZqbZ2dsg0h/Latz9BIHzDrJGI6W1RMM5Spylxb9MEtXByfHeI8o1tc/c8tsA1m0v+ONNq5vsmL2YPsAdrXGk0/eZ/KiDBu+CLptuklw5g3fUhocK94qae28xVrKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777998325; c=relaxed/relaxed;
	bh=P3PUsEhxiyv0MVCPjH1f+nJYAM60mYlApLVeqBXtLlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rua2YkKeXyCj0j1gAY9WsZ9pm6tYhURGeH50uTjb0npFK1lyhd0RMCm5joi4/OJc3UzK5oJTpewDCul4QXHQO4UNz+ru/aWh0Ym/Z2RTYKONapwf9dgVkt7QnlMXW43WGG8C522GorhlfdSSBdxAeUvkT00zJG+dciRAGCMPh4LY3x7Ny3DzInvgdPmBxGyqD9FQ96FjrGw/kPlcbB8Oaej0uIAQZ2ZtaSB/hJJOeBLSYh5rofnBKBR6q5MgSqC3dqQA8NKJKCfUWA8EXiQtorMeNggMC3YKJJUpEm1NVyTg/fMRpCulIofxm/FFCfhqqhAObB4W1iJzmIJC5O+WxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsdVYyQY; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsdVYyQY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g93lS5Nnzz2xMV
	for <openbmc@lists.ozlabs.org>; Wed, 06 May 2026 02:25:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE26860252;
	Tue,  5 May 2026 16:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80061C2BCF5;
	Tue,  5 May 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998321;
	bh=P3PUsEhxiyv0MVCPjH1f+nJYAM60mYlApLVeqBXtLlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsdVYyQYtQM6np3dFH11uwV6G7629W81Acc5Aa/jC1laJ6HtyxornDPLKpkz9n3tn
	 l6cbWBKdb+G3t3/1e+z1tQe14bofctaiuYfofAoDjqGwiM9HypyyqJaz42CHpnTBa+
	 0eHDpDylvC69XTPGQFs4YpI+VXvbZGs1nzqan7bNuWMJ3aivvv67msnJiNqU+rh/Uj
	 a5Tf91KZwbqx1NAcjiGCohb96ITlBifSdW9PXAqjy81Eg7k8bQzRSEFHWCVcfRMY6s
	 WjxVWSZFZkpmhynV2imqu3dGE39tRL4ECs13/wwfSML9WDM16wP62i6k3FHGQzZig3
	 RJI22RucIcCSA==
Date: Tue, 5 May 2026 17:25:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: cadence: Add Axiado AX3000
Message-ID: <20260505-eggplant-little-87b6134a95ba@spud>
References: <20260504-axiado-ax3000-cadence-i2c-support-v1-0-97ed2fdc0b7b@axiado.com>
 <20260504-axiado-ax3000-cadence-i2c-support-v1-1-97ed2fdc0b7b@axiado.com>
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
	protocol="application/pgp-signature"; boundary="SnZyNtcB4rZeJFCl"
Content-Disposition: inline
In-Reply-To: <20260504-axiado-ax3000-cadence-i2c-support-v1-1-97ed2fdc0b7b@axiado.com>


--SnZyNtcB4rZeJFCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 11:26:43PM -0700, Swark Yang wrote:
> The Axiado AX3000 SoC integrates the Cadence I2C controller.
> Add a specific compatible string "axiado,ax3000-i2c" to support
> its hardware features, including SMBus Quick command capability.
>=20
> Signed-off-by: Swark Yang <syang@axiado.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SnZyNtcB4rZeJFCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafoZ7QAKCRB4tDGHoIJi
0rlUAQD+nb4X/sN7660Y9aXpeiu8qfjC2cP3Djl/gh68JLcFswD9G966+as4y2ZW
WY7GCArjHENU9Xu82cwWyEnS+8g6WQA=
=eHFt
-----END PGP SIGNATURE-----

--SnZyNtcB4rZeJFCl--

