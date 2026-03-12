Return-Path: <openbmc+bounces-1456-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860DC105A596
	for <openbmc@archiver.kernel.org>; Thu, 12 Mar 2026 13:02:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fWnpF29Xnz3cG5;
	Fri, 13 Mar 2026 00:02:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773320549;
	cv=none; b=e+dwOAGxZqDOlj+s9Lro8kWdfBOgV6gqvn4T+J6uVccvgF6T4Fx9klN9XelthPvC2R7ttGqOH+si8kYDhkskMrPL1wX03N6Lv/q67H4tCgl6xzGXi4f/IMSGPWESj8CAjZv/fnPSZGOam6KlUWckZviF5j3oIN+EW8wfzBI9FjQXVjGgqEFg5cCiyh5KGspVgSZMLAPQcmty8Ns09oUqkw4eVKt7F1gQHx5sXLH2g8DfT/FZ1Gw5jIoCN6BHZl/x9XZndJ0Qsr5+hdUFqBU0UUZlmeDMrn2KB8pWh1YXhOcp+KH8hPOfd9jkAeVOVnJ8p0qEZ/GnrYf0EaAcHB7+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773320549; c=relaxed/relaxed;
	bh=0LStWSPNrAVu2+taudNy9vX/kBtznm/umzUbJyEYkdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRxApC0RoS2ZouXwXLGkWhDTOZ8EeBKujMx4MJycBnuuankvITrDKuxm9cs/EXwvrdsPcTpaT2VWaX5Zhvu1UPTyOLvB9Te6rUTdKDacFFtrMMGfCJEl3Q/8a5ePbsVGKhR9Bl6qJ/o+aaScdvT5Go68kKhaiUu/EvAcrFQnoYj3hJZSRDgOnCeWJvtptj+K1JG36PbmQgx3sOzQ5a0iZeqyMfGVQJ90GyVH/tj61aGvimg6AHGyh1F8Msm+IIEXeCCzKEWxvkktr2ga4Z9UVWOJPF9bD8UNtUv9CEZaE3CqFnO2ssnTyP5nLdNYmMZ4e3JGxc1aUvMd/tR7eoCuYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ijzuRMZa; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ijzuRMZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fWnpD265Cz3cCJ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 00:02:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB13160131;
	Thu, 12 Mar 2026 13:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75297C19424;
	Thu, 12 Mar 2026 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320545;
	bh=6JGSpqVxm5Xk2m9ccSi9/f5mq6saFDm1oVr7MCpFyr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijzuRMZaAG0cxBMl7gDHrSzew3fvUz+nBqTiXPU+NIp69zqt1wfJfesyFC/fVZS3+
	 fpJQfT7RAlMy6CdCes95jyDBXqJ9b0oy2+/mIhMf1FRNGI13AM1NqmAm86j3/A/552
	 5kQ9+UXYzpoZsbEKqCumRSSwg+UQG2vj14Bds3PbgErv5h43Bs/xRG8wi00G2nRngr
	 EIIwDGkg6bJW4vTpgIQrRiJEabuw4Tb1FNbFO22KU/UjrislDHxxzWqcPdnp2DTFq5
	 sey6Gzv43mUHHEgvpwlNQvy8QnAR90ilRc2oUbTs2Xh0giY+jhiCjSVqkQ2SFWQMPl
	 im56x+2su4L1w==
Date: Thu, 12 Mar 2026 13:02:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 13/17] spi: stm32: Use helper function
 devm_clk_get_enabled()
Message-ID: <8fe16029-2830-44c3-bf32-5aea31f72c62@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="9knHiRnV8mpI+WJ7"
Content-Disposition: inline
In-Reply-To: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!


--9knHiRnV8mpI+WJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:29:05PM +0800, Pei Xiao wrote:

> +	if (!cfg->has_device_mode && device_mode)
> +		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not
> +				     supported\n");

Similar thing in this driver here.

--9knHiRnV8mpI+WJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuVsACgkQJNaLcl1U
h9CkwggAg24YBsU71i5Djghu/lHhxeErxA+7HBjAV3TstCzfospFBacxZTrIypgS
mWtgo+SwmXbDn6WiyjDlwpIMTI6PFDzzMn6x6sxwj5/OD1osR2cJ2SYzYSbwFxbQ
uoJphNgSht3FEaDioOtHfdrgiLIkMm+/TYlf1u7+ZzrgI4ueyhtCfs0dN8EfdB+q
pAJUva6gft4S6N3uS4kagfQP8e+IwxXr5fekxL3p7Y9XYpa30rHE56Oc7sbGWGma
+WP0OfGjImbuvKtGxAPKoGBte/kLIrsSHoAFhTLSytjUxs4uuftK3Y5g3d7zq1fh
+TRESnlE15ixsifgA+1umZAfcpBjfA==
=ouCy
-----END PGP SIGNATURE-----

--9knHiRnV8mpI+WJ7--

