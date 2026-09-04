Return-Path: <openbmc+bounces-2556-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF283C79F82
	for <openbmc@archiver.kernel.org>; Fri,  4 Sep 2026 15:11:57 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hc0LH3GCkz2yrT;
	Sat, 05 Sep 2026 01:11:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788534711;
	cv=none; b=RscYzXzsI/O5D9+BiaXsZxZEHqgpDlhNAoTFKzoc/g9BKlnndREFmCr+wHiqkJv1jwvD5JTPXqQJWpJZR6HGJSK267Mu9iXanDmx1IOHyG/Yxr1AHeUKI2AoIMuQuy83SQWjQ60pdCPCrOagRf2W1DBKRFvfSRrh+hP25XlGhGvbN+MEohbI6jJJS1pCf1hgsjgTGjXCwpA0vGIHo8uWx35eB4H00bqKeGUvhTVZVD3i8R4J/FBkKU+OfRBx5ExpoihS2RLEAIDpfPM2BhnjLpRFmRyhdjQD3vgbUuRWCWIxIEm3xJSxrwstpT+rPmTwyF3Dzh/G0hrkW3pT+qRgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788534711; c=relaxed/relaxed;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVMKzPkUaZ5qLZ+8TBiOdGKmHPQNlwIMJa2xVh8mEEpddttjk7MGVQxg/OhYLOb20p0B7NAdXkdzprjdsKWM2L6yublPTHgHvKNjVg7fC+Jiw2S0KCUIR5XR/4Nm3u4GgDOQmZ5QK67yHe0c9/s8o9JeVw2CW3Lz80xLMZ+XjyRWYqiDHJ152qD9jX/9nPT+QpD1AwlNFQmbf4SKO+tFgHzKXd46Dv7x8sFqrUnAbu1TQrqDWuhMmpw5svf4HF5ZEd5yh2paRTc1S/pqLfSwHOUgG8MiaHBAsrBzlvPDiZF8GDXM04rf+qWYcaNaH+/Agn11BUrJzuZeTl8u4J/tIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irx8WTn+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irx8WTn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hc0LG4XPVz2y22
	for <openbmc@lists.ozlabs.org>; Sat, 05 Sep 2026 01:11:50 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15135416ED;
	Fri,  4 Sep 2026 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ABF1F00A3D;
	Fri,  4 Sep 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788534707;
	bh=qPHCUu5a2yf5C1W6Uxw41KWNe1W+GCT2LpAs64i2nNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irx8WTn+Ue7miHSWHIbCAeyaw/+qn2fhNRrrjCGrDAnYRpp+prJQlQtEeDx2xVKgu
	 FzoHUnjezBp4YuNO4dDa/ESNYDPF/NyWsp9Dfqz4Y9EbgokqDMLGJ04oclD4vSUDYf
	 N6SryFQKbVhjWp3Oht9QF5+c+LuxZaBzVvUO1XSQl+qMl2wghpgGh5zYs7hE2udAJx
	 TVurgm1agAdsX0aFFFW9aD20qWreYybyXguvyLDxqPKoEICN6GOUVBpCrNlAKmDHFw
	 huJi5AoY7ooD8CfwmKOfFOAsnt2iv/mhlvfG6wl4sLpF0iK3yMTsJcGQtS3zhXMpm4
	 kebAe5WzCxwnA==
Date: Fri, 4 Sep 2026 16:11:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
Message-ID: <20260904-vastness-reformist-b28a326166ae@spud>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="IflJwt5/OHqS5Pxw"
Content-Disposition: inline
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>

--IflJwt5/OHqS5Pxw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--IflJwt5/OHqS5Pxw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaprfrQAKCRB4tDGHoIJi
0ohoAQDS5QLC2EVOH033EK0ak0gC8BMQhGIKYpXbYsEl2PqaBgD/cgJ7Zuhrzj8N
7+dkfbhhNuOQFiBiqtHyG7URJwwKxA0=
=XDBJ
-----END PGP SIGNATURE-----

--IflJwt5/OHqS5Pxw--

