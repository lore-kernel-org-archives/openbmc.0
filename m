Return-Path: <openbmc+bounces-1558-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DF9FD8769
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 13:20:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fZsy52c4Mz2yjm;
	Wed, 18 Mar 2026 00:19:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773753597;
	cv=none; b=EEQdsisbv+HKK4etP7Q4OiOGjc1DrQ7AxM96aETSOnxE5pB8bjJ848Z/vlen4MVNQ5rM5YLCwvxTQBZTWflJTjD5U9gIlINpe7oom7BBiFhlo3mYeuKZQb89lfHqOQ3D3iZ5EST9w3De6Ho1TIigvMJfGQyxnB8MtLKhLCHyJWGRtxz6Qa/AuKBvnpgK8wlnywLpDQH9g8+DEyo/7Df3bt6KOUrbSVXibFqc5tgrUiZ/Sx5a7ltLv3QyZYRaoApT1GIzWW0luBt2kqxEYw98wesDjOJRF+tmFDvFmFowmrMWhREHCK+vkMXgdYMK8a9Cggy96SUhsi5CLWM7EZvqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773753597; c=relaxed/relaxed;
	bh=17QQxtRUtaf7KEtmNuQbCZyqj8LsLetQhwKYrcsm9Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxjXz+GuoIA+BmDGEkC+h7kecNQv9Tjp+PiCmt0iBYSa4Ri7i+tGMS4skUEF4LPV5+8ur5X8ppn1vBA1bbj0XAEczrSkq8sZ7OfeAhuNlCxaY942nCuDvskLCgupjCxgoqJ5MaULY6TmG4XBBksx3WrtfreWUhNSNHyra1OZ4L23hdmaQikmXyHT9jYpW93sP34ky1joBkDoYC7KPAE+bcafu0FyvbvicZwROutCkQuKSNE9Lw4tFwrqEUht/Mg/cl/PgVwRNPrmx5uo9T5XOufbPMLJFT/e7YhZCdFmskbAW1kfo3OlHQHdvNcwGirficdM4yprXG3A8wF1fbBxMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ryqgogP1; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ryqgogP1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZsy43PlGz2yfP
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 00:19:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E7BE660018;
	Tue, 17 Mar 2026 13:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61E9C4CEF7;
	Tue, 17 Mar 2026 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773753593;
	bh=17QQxtRUtaf7KEtmNuQbCZyqj8LsLetQhwKYrcsm9Tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryqgogP1Js25YVHvobHnOKBl5MYdxOSD2aOiI1tf6rJQER5WihsK9Uq3jfo6Qlf2b
	 BtONs2A6D54IA4DNEv1Sy0CY6z9gO4p20SThPPkHcwNdCWn5jr22BFpMDOYrAoLSbq
	 sgZTC8u9xZQu4B/IWVM/GrLwf4dd+exti7RlPqEl4f4czsv51D3od0djhhjvtRmmTC
	 WYdwB8SCN+QNUbefFUPZOXTmnR7msjPL2f9KXr88ikHvO9/N48Zi3PI1IevuuXxGuW
	 Jg7rPyI7R0lNjmB0khjEhzaAAgXytb9Tc7RPeU0j3kdsOWVHghNIyu8gn0Kf3R8YE6
	 65mGvnUDWFheQ==
Date: Tue, 17 Mar 2026 13:19:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
Message-ID: <00540689-fbc5-49cf-b185-5af372f7ef0d@sirena.org.uk>
References: <cover.1773733017.git.xiaopei01@kylinos.cn>
 <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="8+YRHFs8YF4SBCDe"
Content-Disposition: inline
In-Reply-To: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
X-Cookie: Must be over 18.


--8+YRHFs8YF4SBCDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 03:41:43PM +0800, Pei Xiao wrote:
> devm_clk_get() and clk_prepare_enable() can now be replaced by
> devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
> longer necessary to unprepare and disable the clocks explicitly.
> Simplify code.

This doens't apply against current code, please check and resend.

--8+YRHFs8YF4SBCDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5VPQACgkQJNaLcl1U
h9BDXgf9F2bMcNxWFiGlImGG2lAZ6+rhIz0gb1xd8L/zXFcj49GbT66gTFF+vs6Z
nJhYnwuUnf46hnhc583pZ39MeS/psE2kjIaTNiGva4NLDwWkiYkn79oJk9zepDF0
9HRb3mjyaDDPQtfCgnrkTb2VZObD/41CWBtZ8x5JxjFwHkIG776RlhYJUU2y2myN
oAvCWPJddLcAOZapamPyu/LZvMwFfhWgP4mAr81G/th9dO45ELAiKqMj33zN4VzV
yJ4r0AY9ZSXuW+NmdztaukKEKWwKGDeT5I3vRWqSJ2EvkvODgAw209d76768VQ+G
JJtidlXADpZe7vD4DCReLGZERU0QQw==
=AabK
-----END PGP SIGNATURE-----

--8+YRHFs8YF4SBCDe--

