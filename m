Return-Path: <openbmc+bounces-1689-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC92CF483D7
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:46:44 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffkFX0Z2wz2yhG;
	Tue, 24 Mar 2026 06:46:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774295199;
	cv=none; b=C2ZDjfH0XrJmrDnKOeG0M5WvpeWyf+qeFfz1TsC5YGYwrSjVfmFoQtI25yiQ59FOThHe8KAbdbP1rhIJmMUFnBy3VyZt3RAGhixCGaxCFpDFa0tBi4qsVTUCpimmSCpblHimp29Q/+ASB5kuhX7K2DZ0pwHs4EHuL6uyggKpcD7BvWiCL+GyOG/+NjZMMtoF0uJKZMsYjxl8f1GSjYTNt0SByXaakiE/DpLVZzjjtZG/ipN3JyQ7KgwlRC0hgZTotJpTQGGknvm6Uz28+cDQOQmLZ5sI7ebHaTdkNfbxm9mDGv2XYprl3tt0cChAHibFdg01i9g8L6PV7qAmxx2LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774295199; c=relaxed/relaxed;
	bh=/dmtorY8LlAopvLU37QPmGzNGM+3mvzFRJJMdAu2qDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+qEZ+UlN0Jm3hL9JPK8SZ0MhvgQKDK5bE6JcpIolfqHZk1MifWVedstos9lYT9SJ2wYHybDKU9Mjwn9ISh9AOZ12ZO6/zi3c7wOq5CSK4CjOl7BVnKJAPcuXv24bXyvdxJj2eBW8dvl8eIBprotXU+O4/ou+7zWHuo/lMUSWTNui+nqHJpaCauDpRwHjRmzp6xMdIrWkLt2CuHvh/CN+bTp5Isi9cwH0V6r9G1AWfUOFZrk9QVXARHJED2T+iyhah1dhPd1/9Wgu9L2OSn56ZSmJeRFA8fHWUwIz9KgUnM+k83vIkCLBDtwCrdk+RcXjAkird6MhBVJXdDWgIrYIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rShQHzbr; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rShQHzbr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffkFW1NSrz2ygL
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:46:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F35A406E5;
	Mon, 23 Mar 2026 19:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D6CC4CEF7;
	Mon, 23 Mar 2026 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295197;
	bh=/dmtorY8LlAopvLU37QPmGzNGM+3mvzFRJJMdAu2qDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rShQHzbr+/e0vr8yznZXZLi0IadcEXyXmTC90VkLLCkDaKMyZV6XVtlDucYuLRq74
	 cw8in6D0nwJYmsWUzDM5DUNt7b7dv5ZP9BgpIbj55v3YyI9+xYELCUmp3kPYHs7x0C
	 00JUcr6l+IiGJ2xPxQM/T0R+R/AxSBcBKqUj20bwgr7zgL1F4QraMYx7OEzbxPleal
	 UhrfMUKHBGqXIXHQZtqkMmt/ioegcjIoDyE/8AluJ3QflhBk8vVAiE0QoMZKdFT6Y0
	 mUyw1ezBl/MjVbtx5ejQ3Exaog+afTr36miFzTZGTx45Rg10COYbaTuthczwezddX0
	 8h16B0dBoRPdQ==
Date: Mon, 23 Mar 2026 19:46:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 17/17] spi: zynqmp-gqspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <cc7f3fec-e314-4f46-8c62-75feb919b778@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <611b4c4b67aaa8d86a7aeba9707ada47e6fd5dc3.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="yXZTZfMj8/cYjg5u"
Content-Disposition: inline
In-Reply-To: <611b4c4b67aaa8d86a7aeba9707ada47e6fd5dc3.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--yXZTZfMj8/cYjg5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:13AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
> the need for explicit clock enable and disable calls, as the managed
> API automatically disables the clocks on device removal or probe
> failure.

Another runtime PM.

--yXZTZfMj8/cYjg5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBmJcACgkQJNaLcl1U
h9Azogf/QlfWQKZIDTkEDnV1hRWkQlKZGgabUOpCAe5hOywhIwsKTsN0RsdWj4pu
gZ5CUwol9/peWzpl3LUtT438fl+Tj1jWbjNJWSBHy4o6uSnLSIedjHJuFrA5nBb7
Nw2JPIwe1Sxk3ooG6qCf1RLFclZHxcvjbAeTDIUbRmnA2ZeOMuDQ030AbISPi50p
TwkulHE1Mfd6zQ/Dtfv6azyFxBMfirgdLPblRWmXkYp9zgnDKfOxgy29A30V/0zb
NBeZSB5HZVYUCjuCMpe3hbq8MYLGL+d/khvAy8r/tnghN49BcXv9/LG798apXkXC
FKZxce5d98Cm2HnL8Suce3/z9c3sKA==
=quxv
-----END PGP SIGNATURE-----

--yXZTZfMj8/cYjg5u--

