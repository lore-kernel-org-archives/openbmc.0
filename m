Return-Path: <openbmc+bounces-2576-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9794C79F99
	for <openbmc@archiver.kernel.org>; Tue,  8 Sep 2026 17:57:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hfWpz3g21z2yb9;
	Wed, 09 Sep 2026 03:56:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788890219;
	cv=none; b=h4ZE55VGMAPxbKQTAMmOdQVFdIZRhE6MDZfnDoe2kS87/9CsPOI3tCPaHBgQW8GSoWFxpy+nnzVrc68oQ2xRAmewdugaQxEXkPTAY7Zwp1UaXs9YdO8zQpSOkJ3S5pGPcm4BMkaNdeGB31phmMncnxK4+QDvg0ZXjvSCcZ+zLO2Fp4PN4gUfzZIiX/2xJcnjnExbR7HnbjLGlqg2UWLfEw6mehZm4ba6VHWZnLfF9+wiK/m2zNSGDLHNw1nuIKh9q6vn+Ekt2PejbI9pJSKh06ucQnRlchBhaU136IXLK8qoBWgqug3cZIUBaYJqsp9bMfeadmCDGmGkIDTgzhN9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788890219; c=relaxed/relaxed;
	bh=k3jSdgnbL5LvBC8GXl/H4R9qhk5svWd3V6MyFuObhUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqivGwiit4RRTJu4nPGbb+tr+jiKr3RGXPvbe7APgBx9ugwqp7TwdJjc1u7bZqd8StQoX4K+kl43vRwGaWWwxj6nrKIphsKqGRub3onsqRXjEnI5PGsJf+JhvZx0exwHIbayy/a9+v4UDBC7lk38aGK7LhxaRwPKuSeYWE7zXKiQOQGfqm0zfZTcKpuvdK9z0R2T+lOafLTQ4fSRdM3yT+fDQ4mLWTQ03s7esqw+aHUC8qjGJti8eSZlob9ghvHFqANvOZwh/Y1pqSo5aEV8+zXePKSEKtOfn2ycn+lOrNbnRTDuXMhBtwCavd1oM3TSusGdHf/gVfQhfoLb7m/fpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCR5T3ug; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCR5T3ug;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hfWpy2vFXz2y1F
	for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2026 03:56:58 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFB4B4161F;
	Tue,  8 Sep 2026 17:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D961F00A3A;
	Tue,  8 Sep 2026 17:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890215;
	bh=k3jSdgnbL5LvBC8GXl/H4R9qhk5svWd3V6MyFuObhUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MCR5T3ug3ogPL0IrNrVo72MWGWIY1CA9c5kINyRxx0jaUzvEgFt/fv7Z9i5VJzOa0
	 j4aGiYDceRUzHWPvg/QxXjOHvU10uyJRc1AYOUlU6X61WgVrSBhv68zt6yi5yo5GY8
	 owJ1C5NmpGfZr8awAGK/5TJYXcfBcsGLQFdBGEJ18paDYS43f9oQVQoRQAjzTYh4BC
	 y0pNJGoN2yYjSZ5VbvN+xdqmPCIyV1XAkxj2QGQRtOUWZT5SFhiy8hVY2jOShketuP
	 Xye8BM6H3XWky726vCFJSqIt1/68eFsj+0cl3RazMPIlfJwZLr7ldm8TQHCdeLeNeG
	 /kto8pO0QYXeQ==
Date: Tue, 8 Sep 2026 18:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <20260908-pesticide-creative-6185ca4971e9@spud>
References: <20260908-axiado-ax3000-pwm-v4-0-19a03671cd5b@axiado.com>
 <20260908-axiado-ax3000-pwm-v4-1-19a03671cd5b@axiado.com>
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
	protocol="application/pgp-signature"; boundary="kFlJqgktNAXA6FxP"
Content-Disposition: inline
In-Reply-To: <20260908-axiado-ax3000-pwm-v4-1-19a03671cd5b@axiado.com>

--kFlJqgktNAXA6FxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kFlJqgktNAXA6FxP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBMYwAKCRB4tDGHoIJi
0mf7AP9iW5keEM1nmOylKZgW02slNGlrttLScQ5pyEVZQL9NxwEA7+4S6lfDL6fB
sJf9uC3qpk4vYAvdb0oCNDo4HdaxOg4=
=VFZT
-----END PGP SIGNATURE-----

--kFlJqgktNAXA6FxP--

