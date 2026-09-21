Return-Path: <openbmc+bounces-2636-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB81AC982E6
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 23:37:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpfkd3rTtz30T9;
	Tue, 22 Sep 2026 09:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790001345;
	cv=none; b=Y6tJOaGDuT1nE3tP6YrT39w6IalnnUmxWN8bgF8YN0Abw7HnTGD9IkW5r4AWWuu5Jem1Kq/+dH7nk9rvCDsRYHv5e8x5w0yU/parzwcB0NG4ipEL+mq1OtTRUyVJrItIvcU4+xIYZgr2f5cWImV8DOd2WBXLaRgvMS8L4noelOAEcKTZoGIz0zuLmW7cYZDQ9vTZQH/R9Evi5BNuFev1j/UyFogwzZRcHITl9NFumWoDmXjXZkTh9YTTo1ph5pMlUsB/zXMuEtXDMOXjF4KopFarnvoBeupJXiio1OpVq7pZONj5eAV8ODy4vIrnXxyGDdLoK1k+zKef8uFva4mn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790001345; c=relaxed/relaxed;
	bh=FfNFnkRxeRIfSVC8rvgsN9btpGP8I/3Z780moERFccM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvgTPWlmlU7mzJ+NJjTZ3ZRdauCRXQQrhRitZsqroZjEXWGh+fd1OKb0Ik7XseTzf+yjXmYoOyMDgPPr9cWOnD+aFxA41kwEUoE66exLdxZ/Nume0J4qykhFJkxOTvyGR6lxR7wyIoFRmDnHESkICkeIVFWD3weiRhXQDTiK9ScajuH6Dk+YdEriCukEKsHd1DtIbTKkL7fE90tDR3W+UGzmqI4HEXPn9ccssEYMvoPDFUjxdltwDxFqqQbb3H/uTmzvK22EIh72HF8VUwG/L2Ub9F6rLpkjkQQCGDjoI1qDnJf7Jej1ON8g4rCtAWMTISXT8czWtFrKhuhDxUE6CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odFG9EuL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ukleinek@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odFG9EuL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ukleinek@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4hpQkm6cNKz2yVd
	for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 00:35:44 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C1A8A436FD;
	Mon, 21 Sep 2026 14:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 17B901F000FF;
	Mon, 21 Sep 2026 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790001341;
	bh=FfNFnkRxeRIfSVC8rvgsN9btpGP8I/3Z780moERFccM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=odFG9EuLtyr9lu2Ecfa7snIZhoyKG7wH7smFOyUudLLIw6C+fzlUa1gH/uJe0Izxa
	 Z1jUzBBiPGYH7eBzTDep0wQ608CWB5qWs44NQFnzcz8GsXqvtGl++oByaaVbURR9hr
	 cpDZqhouYE2YfxpzAefXzuB+eXi3vySVgIDy4MNPv2WBNvkBEIdkUYNpOdHwj6UJuT
	 Q/ylaMJmxDFZD+gV8zvrR0osskSM++G7ju+7c0lsJkI/RCq6h4FZuJ+A4c0e5N3Bz7
	 XIxig9QZmqEf5aHKvZ36DLQL+XMiPNtWtddQpX6gMwY3sBcqUwAU85JEqmw1+Wxgim
	 U7WnRLZkt+SeA==
Date: Mon, 21 Sep 2026 16:35:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <arFAj7yU2x42-76G@monoceros>
References: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
 <20260921-axiado-ax3000-pwm-v5-1-202aad28e129@axiado.com>
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
	protocol="application/pgp-signature"; boundary="mkruqjy2cimrsduu"
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-v5-1-202aad28e129@axiado.com>


--mkruqjy2cimrsduu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
MIME-Version: 1.0

Hello Petar,

On Mon, Sep 21, 2026 at 12:21:30AM -0700, Petar Stepanovic wrote:
> +  "#pwm-cells":
> +    const: 2

Can you please make this 3?

Best regards
Uwe

--mkruqjy2cimrsduu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxQLcACgkQj4D7WH0S
/k5kdQf+OXV22WZQ9pfauGcLp09q+oshtLYpLawSeyzm/h7HCjYisBtBbLTVFvR1
5KDGUP2CYL2HDVgdj3NypW+GEGLFsF9IN+wAIedUWQY6hWItGfdGJt42Zy5kYYRp
LpOFredIHH0OVVkxnit1XyTYC3htW1Q+DwqcqlwFHrx4zuv/etW6vWiW5Dk9za4t
JOJRoUA3sUeCXRabkWUWAST++NqKBvvgrRNJA3ys85ocQ7eBL1GQkCcn6YfJ7Af2
IuGZXl+Ys9bcp7rgQIFJ1JYj8B6JXRFXVOgUMWiGG/kcbVdUgkZWAiuQ1io0yUo2
We7S9r/5xHDPkvsTxkp68luZYviu4g==
=od5S
-----END PGP SIGNATURE-----

--mkruqjy2cimrsduu--

