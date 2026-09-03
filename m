Return-Path: <openbmc+bounces-2541-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AD1C624A4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 16:35:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbQFF0gXJz2yhD;
	Fri, 04 Sep 2026 02:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788453328;
	cv=none; b=E9fkQV6MvU1CZZSjtw+UxP2CuZF1JKvO8SVpcKjYkhk+6jQ9PXDw/a06wyvrWOtVB0RIxQDzzo4MUiBNstadQ3apOrDk9PQwyqLaJheNbhBbJuQgF8vQvjN2fKIuDg/O4z249lIZdVDQUzPYfp/Ze0qYjZCW/3YzacUGu9KGAhkBdU4zU5ZsCxQ+qupmPN321GpYzcoUxPV3CcweIisnhi6G27niNoj5/qTyz3XGcx+2xtPxEYEt0UhF/0FAlV8ip04XieiWyNvZEbQg6D0YFE9zkmsh4efaAW/aeQkBsVEWrUdLxEWgTwPFv6bZblVoy3owPB9vivIqt/Cpw8Njbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788453328; c=relaxed/relaxed;
	bh=4VgcqGwejHpXlI0fhcLml5Ty0iRHkq8/A0Kj2ugtbO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTSuSg9ET3Ekxx0h9mlEtyMRRlc0EByZntj2CT21NtSHFMZrY7Jr22h/FZa2ZqBldztCxnC1J5HU2QIdosVqAb8bxGAEbmmXJfqMucfZsknEjsyemKqXXNxtCYNZyYF41o4jXttnQq63+cTw/psAncxE1bdVuQrCclqMMRSXEzMGn6F7kPjDJbcxcxTqvg/1hFff5xTdLoVlFOF53IM7/cPy9mCqw925qnwZyGJDR9v0m5y655IHX8wymd9d3COioGIRU3GCDlPFk2ckkmS1YdB56TO3mHKFUc5zPU/E/kERE4jXn7F8Ot+ULAaN1UZdA4/oSb2ckk9PFI7aancO8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJn00D5L; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJn00D5L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbQFC6gZQz2xfB
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 02:35:27 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70B2F4175A;
	Thu,  3 Sep 2026 16:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0C51F000E9;
	Thu,  3 Sep 2026 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788453324;
	bh=4VgcqGwejHpXlI0fhcLml5Ty0iRHkq8/A0Kj2ugtbO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJn00D5LHCNxJKO8OB0oD4jqtmpIcvs0FKWYL07kd8xyziZ1PcVIVLGJqrrvOyO6X
	 BmEKRU8wNOCpJepqx4LQvKCaa0mVKE6PkerBqdK04v2t1qGy9cyq3kzmWkhcmBQw2t
	 sB6E9oujzXL9p3jHW3gPcowbvTnOaQVpB7JmsCOMOGR85OPYgVpk18plFAtGbZGCz1
	 97uzgbxyhmG+2jWU0YOBSUV7F3jzL2l3gpQ7GsUEPThXoKdF4MsG2yf3XnsnRoGVMz
	 O8kOFhFN7wAQvwZbu0+RMK2EGNJ+nAvrw0DE16a591UIriRc9/meKuQmdJGJfNzOhZ
	 /IftCisocxTMA==
Date: Thu, 3 Sep 2026 17:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Message-ID: <20260903-rotten-judgingly-5655b33067a3@spud>
References: <20260903133408.110847-1-changhuang.liang@starfivetech.com>
 <20260903133408.110847-2-changhuang.liang@starfivetech.com>
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
	protocol="application/pgp-signature"; boundary="6/hMdV/OsdyQFZVD"
Content-Disposition: inline
In-Reply-To: <20260903133408.110847-2-changhuang.liang@starfivetech.com>

--6/hMdV/OsdyQFZVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6/hMdV/OsdyQFZVD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmhyAAKCRB4tDGHoIJi
0ux/AP91kU+PdujjA6iPz887aHKutbwu6u6M2sBSS0IoEsSS/wD8D6L6UV278fvm
MgP0qQVpRpxWTJIbBhkO1zR9Kljykw4=
=K3hZ
-----END PGP SIGNATURE-----

--6/hMdV/OsdyQFZVD--

