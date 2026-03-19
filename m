Return-Path: <openbmc+bounces-1639-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14318109190D
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 18:30:29 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcDlL5RwSz2ypk;
	Fri, 20 Mar 2026 05:30:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773945022;
	cv=none; b=fS2vY9KljHDaYZf+BiMsEX+JlyuyK0EVY3Y/GjMZipcMnJ355a4mU2G/FemNwzI0fd9yurxHUhHRrRqAJ7AVdle+ZHoZbIhoB9Z62/ahYREeLkvXtoB3k3a0sB6EG/vH8DOwxan/uHk0zBaIAWwjdxgUAazX2sNOLGJwxac9VgZlZQpGk4RCk+3PHgBOSn7ZDRR/EZCFfMg0LcUgIqIFDs8mEOJ+OGyDf6Mgn3cUvCAEO27jJrkJipcY8ej7HeZ1OZuo9PRc2gG2hKhD41v2sU9378G9d6v6VpLEaVFutKYE8Wnn3QqUqzPsB083UZA/vC8GAfthVLrXjj0LjLMnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773945022; c=relaxed/relaxed;
	bh=39Cu39toy/8GhZJ1SgNYS+5TuFP8tJKlZwmBlPRVTyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvWcYsVvmXmwjkqpjuGW3yDRTsT2hI9LCopEY6dXqAhrydaoaFcZ4SICWBY2dAgAXI+yax54jsDo7IBFn8N/zyFS6TOZb4qlrr/tkLGQxA1bNxoyJWQU+wF13qn4bJcCh5oNUgXAeEUAxcmJ7YdCbUDwCmoqTC2zQuXhrm4F1XnYAkqtkAARh19MCUdKJ4NtgwgJA0iyv4EkBC4aNZo4Db0QWndzgzh95r55zRX9lg0zhP3kNuAcHfMLcNPXw0bRROC7JXxHb9vbrPPNBq+tIaJKw98Fzw674AVvp8HDsZPqOaqqvmgnQaMQK/iwB8F1le75/QaO1vtcRe3cRzAP+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mH4ZE2RM; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mH4ZE2RM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcDlK5tXSz2xVT
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 05:30:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69C6660053;
	Thu, 19 Mar 2026 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F1BC19424;
	Thu, 19 Mar 2026 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773945019;
	bh=39Cu39toy/8GhZJ1SgNYS+5TuFP8tJKlZwmBlPRVTyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mH4ZE2RMd4lnRRky54nqLEeAMEN+ykwXu0nCF43Mkdsb6H7KxQTBoK9+gR7JwoL9v
	 1nw9Od46tXH5FqN8/+h+LCOnjzj+IQTvZXUGONvamwRvFflqds+TQ/9P47olGMl832
	 UR8YVXcNqB7Z//D3pEFc1UpZrfvx4zImqjtWp6EkBqD/LIYbnlcBSkRygZGFo0RnoQ
	 l5ETfGl44nPTnZsu/NqTiHKWDdYUyVmT3zRMDKfvQMY4ca4bG1bRRNlggmJn//2hJO
	 lz2SKFJPnDgD2JZvmRCDwLDgqjJSXM7rDmCL2Ts57rtqAVDyRS8a+BH5iJu+EEXeQt
	 iDbynoypmOuPQ==
Date: Thu, 19 Mar 2026 18:30:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 10/17] spi: slave-mt27xx: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <e9e26679-036f-4cfe-90b7-ec0ce57b5304@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="noPRvBXZlo6sTtNk"
Content-Disposition: inline
In-Reply-To: <d8a7d6cd3c33419db98027b9346cf078a6b8b4c8.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Given my druthers, I'd druther not.


--noPRvBXZlo6sTtNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:06AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "spi" clock. This reduces boilerplate
> code and error handling, as the managed API automatically disables the
> clock when the device is removed or if probe fails.

This driver is dynamically managing the clock so devm_clk_get_enabled()
isn't a good conversion here, there's probably some bugs around runtime
PM being disabled but this'll not help.

--noPRvBXZlo6sTtNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8QLUACgkQJNaLcl1U
h9AlXwf+O/j4y9RCkRUATb7XdaYqoh/vDEx4mftt8jW3vU1SX0BXTm7XYbi1yLLO
+EKgiIdTRsnLBX/qp3gOXWkQPLLXRuFjsE0bA3x2yXeTRhQcpAEDUB55LLzEGzmd
79I+MlMlDSNmDhqsOT6/nyFYyP1HDQonwyMDlXc1Ec+qf39VS1Jf0I0jyttCAV2Z
6tRuFSmQiY59a4QR8tXqIzpLB7yqhIqqIRonUA5zuOxdB6S1O9BTh5SCXTOVE6t/
C58WLO0KgipP/jucVZUz4iCb94XRvzrRt+r9nTwbGgLxGPwbPgB12NPH/BbDwGdx
if/9vikYeWfN8GP3BkZJSg6wWr/vHw==
=JXnH
-----END PGP SIGNATURE-----

--noPRvBXZlo6sTtNk--

