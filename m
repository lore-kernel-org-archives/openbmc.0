Return-Path: <openbmc+bounces-1688-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234D4F483EA
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffkCH2Srrz2ygm;
	Tue, 24 Mar 2026 06:44:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774295083;
	cv=none; b=TE6gdNwLly/7nwKPkTdytzFmhrQMRO2U2YXmuOCIox3XueyAStn7eJAHWjGBKGIud68uZAgFuAsV1SDxsk0vDxLX9aPO4mo5NebYtkBns1fEf1iKcYb+y7hsCxuWYeR05mVxZctu+JepAwp+WVljLj+VZWhid/NowmwfZz6ecDsLagStK/oKfSk/YoVpv02kDdaJoIECgR65tRr9g8O479Vo40CmsdtkvPzIpSsjGJZ5JRHu7+Cg72Fsip8eRqb0ALvp3GBikfqauXSR2/ujtCw6VAyldlGC9BRydrfJONK5/Sd2UdJHihww5Dt0f0/bdpdE5V+NARMCpc30Cbi9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774295083; c=relaxed/relaxed;
	bh=EoWahn+aCaO4RgFt5H3ba598sk0yyiLlddVHssRrP6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ5aLSHVQ0+XrUGhwdXVLMsMpZg90+o01nXrxE2PZKpK21+ujx5zaQVMn0t7/QPPPlbb9rPq+Y3rAJ2TJisPm0KbxjAXCGw8p38F6zEp4YRDurcZToVMzWad+NAugyxEMAfWvnYP0TlTQ1cYgsc6bF7UHGiBJIOrXAG7hdonzMt28D/sJJoVw+2F+WGSrjjL77ENpIoSj8u4Su0hDiRdGyEfR/sew5lH6/h8e4ZhakMQAIHKCvCmYdAA51tWbnO0L6yMEq73R422RAjPbnpRIymToNZKRH+7tGiFnINgl45W02YSSbDBTANpBfdMr3afMUbee2QFVldKjVwTzF7RyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XJ462hZ/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XJ462hZ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffkCG3lYhz2xlh
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:44:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6529960103;
	Mon, 23 Mar 2026 19:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ECBC4CEF7;
	Mon, 23 Mar 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295080;
	bh=EoWahn+aCaO4RgFt5H3ba598sk0yyiLlddVHssRrP6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ462hZ/iAigMKTQaYu+CB8zaJMOH/HxYZY6tSMKEOAD0CCRZV7NuPFohwAiDzZV4
	 s+vmj+k1xRLbPyum0J2ICSL8Hd2vR7PMUwgkDJM8AbFo0eHypKBNtUlkCRRyvlWMVu
	 p1UDx+HPa17fcaQDH8vwLNRGZEybH9dTod7CGrUHOWl3UVlEuGzE5H+NvQUYcQu2cn
	 YRfx4iQm+qIJNXMX2EKBEuJqASEbWeadUAdI6GgNSH9t9gJaEl9ePpUCpmRvVKTwhN
	 /3lHI0T6oz2KT0VuPzkGojHnQymA4qvCIJIwePvzBgOjw5TUvFASATfXaaDZAw2f++
	 cMEWIodaZK5CQ==
Date: Mon, 23 Mar 2026 19:44:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 12/17] spi: stm32-qspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <834e2939-93a4-4088-b6d2-6b15ab00ab04@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <333b09950ee5c2fc0e560536281afb33f92288d1.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="4FaSwlMKbUzxP7VW"
Content-Disposition: inline
In-Reply-To: <333b09950ee5c2fc0e560536281afb33f92288d1.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--4FaSwlMKbUzxP7VW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:08AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

More runtime PM.

--4FaSwlMKbUzxP7VW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBmCIACgkQJNaLcl1U
h9BlVAf/SqX2lKFh0WlwoopEAQeKZhC6ZHRqtyKh2/RgbK5AFMr9p/zvDbHhnb4m
QUJdF7K+dWgmYwaqer9oU4T2iOQ7nwvkHcaqYCX4qbMnUAtUWcSkiRuntlcB3npQ
Lc9CtCDNgixwYNjeY3tb2+kRpOSJMW6UGRCk7vdoobQgqT2nBYLx48DyjBgLUpCf
DzWTPa0ECdN9GU+lHoSR86OTRgSVe+DwuA0gOg104a0cJxs0gz8WiLnIXpmVvxj5
56XU5Dsc4MkWeuovuBtlEj/UXalFuNl0QK96f2BOn1EjIdBN8dFAt4Z6vxr6vdJk
sEKFbLoc9OFb65c2iz6ILeZ87zPRtw==
=SHbm
-----END PGP SIGNATURE-----

--4FaSwlMKbUzxP7VW--

