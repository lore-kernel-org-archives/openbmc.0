Return-Path: <openbmc+bounces-1685-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ACEF483E7
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:41:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffk7N3kKpz2ygd;
	Tue, 24 Mar 2026 06:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774294880;
	cv=none; b=butAMk6QHL1Xf5OejRehCgfR9ODThA4t7ro805OTxqMP7+Er2NtS+EOGgG+DNNEIIkinct/uvNMKDYB0uUw+Qv4IlzCAA/68ewJWFwCztuJShQA5vc40NXeWjeaJF1sYhEiLPnaw8eQTvJbmmc+pSAuibGhYeHM/KreSwKxmk9BKVeQO7srgNsAYTllumhdjtAZgXJ1SZ1znu810fiSmsu45kj10WQ+HQ4XPKS5qIZ9EVeuxK20BgrFMMRw3lBdI9o8Pz6OeDJ15Kh5ejApb2uOEDWFr813kRSHJpuWht5w1uZw3ndJDrAW3Up8kI5+zTIFuZCyRWrkJdxnnpJhOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774294880; c=relaxed/relaxed;
	bh=zr8+lYtKw72pHAPt5RM+e4aIZvvehLBMSQxMXfk5GvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iwi4ZTekB35V3I73G0SD3SHnw8hExMEy24afyPrFRbCDWGlmHghUTTACJAE509jN8tJv033T4p2aVt90s+mAEvTtIIdkjFqlDCKKrxxSp/RaOBJkP8ea8oHnsqXkVcbkvqTshPYBz9MeG1DPyL/q28MJy8pHK60fUfr45JrVgYdsnE1GW+g13e1Wds1PVBw7zImJdoEKqB/rxPIK6nOq+BvZbHoSYLPhRRFyQ5lkBGLrCbGZF7KxmxMHGXHH0qkVA/BZedWu3IzLRcI0s0590aZwiYSOGNR67e1Jr5JmJICZ3WlmbAsQWaK/PC24DpqROQPgm9eA7bPU8fIxgWgNVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tq+oxJt2; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tq+oxJt2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffk7M4r8jz2xs4
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:41:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82ECB600AC;
	Mon, 23 Mar 2026 19:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06B0C4CEF7;
	Mon, 23 Mar 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294877;
	bh=zr8+lYtKw72pHAPt5RM+e4aIZvvehLBMSQxMXfk5GvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tq+oxJt2YMht2bBZTFfKphF7mn6pccuIjaZ2WdoGqND03PSfnBcBQB1NIgNl3z61/
	 UYjZvaYvOqOLA7E7yYH/HWnze2466c1O7qr8kwURq3Awqez0yJLns68n/QUpifX44i
	 NGciV5iFQONI6v29a9Le0gLcVfC1bx1VYglGZLg2GWEDvGnLbMY3SkICaK5hKK5XkD
	 avgro6JAqTPWd/CiQqwSpmCTGS3nwGJk6qZqYH1oieE5MsIqFiCjJFlwAJAuUrVFLV
	 CmAIhZkRT5QaFJoHBEaM4h8+RF8SJRC4ha1+uWRl2AUhuZrju5id589FaWrhR+9y4I
	 k2MF7ywBcuyyg==
Date: Mon, 23 Mar 2026 19:41:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 05/17] spi: imx: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <3fcb0dd7-ff17-4d09-b8ad-15f0f1211f42@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="/sLNV2LkpKlEA+Pv"
Content-Disposition: inline
In-Reply-To: <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--/sLNV2LkpKlEA+Pv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:01AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "ipg" and "per" clocks. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clocks when the device is removed or if probe fails.

This one also uses runtime PM.

--/sLNV2LkpKlEA+Pv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl1YACgkQJNaLcl1U
h9ALkQf+MCWziHjA3VCeQ6Z0O3ebkwfUwmCcxHPAsV+PSLGPTi2YbR/I9ctOMekg
tXlv5rI17nBcZCGCxil1OEOnjgOC7jRGuVmWaApY5nSEx2X4GZRS3GDna8dUsAJN
xQVd9DSQEfJv1mEe/jXE+eCG6eoVIPoltsgeEEIhZVAtQ1tkszyzlURiBKoteOLU
O4khFyG2m6n7gfyTKD6aRl3n8L8fhLz8Kd+75V58qWN711xIsaoqhyXSfJbucEgX
/CR+2K4QdEZFmVfW5zRzRMlbi6QniSd9lc/ROJWYjvQovVpyckuvH31KgwID8IHx
qLpvFYg7YLU7kgQy/nI7ksShV4LZsg==
=Gpc2
-----END PGP SIGNATURE-----

--/sLNV2LkpKlEA+Pv--

