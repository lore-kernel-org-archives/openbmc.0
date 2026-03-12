Return-Path: <openbmc+bounces-1455-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CF5105A595
	for <openbmc@archiver.kernel.org>; Thu, 12 Mar 2026 12:57:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fWngw6Psdz3cG3;
	Thu, 12 Mar 2026 23:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773320220;
	cv=none; b=R3TWe80FzxKnxNc5IFEC9tKtN86rzS37EflGDqP1dFR2e6IZULo7xB5wri4DjAJUwJ2l2u8alCeXJHbXfxQ+C6mpvguJ1UR/D/5helwBRa045KAT1MwsGkkZWG67/73H/ABuO9AM/47+sRiUPhkt1RwzC6RT8IToZyNCD+/yKjqcejUtmiXZaQIc167Bxm3nSJT66i6RAsqy693QktwHLS5Zyuy+KDhfY8tO/woMJlJusvzQbZLa8PRqH+rDE4k//5lObJKV73MAXQEOnjnvYtBRBNqGr/oxy1vNLUQN4KB0kBmoFA79oIDxrsfw03UZrCokm6+NfObcdQ9i9ekE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773320220; c=relaxed/relaxed;
	bh=xbnF5lkbBArzVgVvIi6AYJhVxWwoxgan4o6zGC619u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyDzbGiXbpb9ZdSqGJEOiH/Ey+irm1QsRSNoWblhQxOLKcjXivOtlD8mAxTB6CG3FvGFZs9l7FQ0E9GLwkkHYkvP8Qts0UyQCvHzxZZiDLTwmFWd1oHaIX/oFzyGgolXZbla+RLdnNIofV3Tvt9xYVS7/MXpaaZNfZz5Yr5U4HD5to5/uMduseXkEz7hOY3BVQB+TPwZFDCwQjC/rrbZryGyz7ai6imHsnVRML1ygpPSQuUj6sUj3yBgP6H9t9LHjes0JVuPOQW0gXK8ehXJB721DenwZ+A6Fi0ASEAG3tK6UBFoOj8ImqSasI4ZxiUrCqYqInij2ezVcjWs9vMEDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hcs9nRxf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hcs9nRxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fWngw0v7Mz3cCJ
	for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2026 23:57:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FE4E400CD;
	Thu, 12 Mar 2026 12:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA1C2BC86;
	Thu, 12 Mar 2026 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320218;
	bh=cJK3mpyT79e9qtgSDmo9xoFCS+6kGW9BW2Ply5mwOwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hcs9nRxfcpQv9i4VUoc9iF/DJrAf6Id276T6HxF/Ib7iBm1MqhkwzZ4IfPqId91sf
	 ZqTwIP18zfG/TDbMGdttgXRsihfieBSg6vZsmvZlImvkzzxOM0cbpwIWcjHdiCXdPv
	 Mnl7ZTawiavyFdyTgK0aGIm/S1C8HO1unx7GoIKoxbDPOCjCfAnvIJuHbvOV4y+If3
	 c/x8YlSrdrUims11yxA5JjlEFzCFR/MJugKWJ+UGBCgaTYfuLSBJJ9FYMWZ9LXsf4k
	 RmzAIPbd77QF9MTrRJ0zFetOCQiNctC2pXXkacBo0ec7YFR0rxvC9WEyHJpYYooXGy
	 eB/ColMjmpvyw==
Date: Thu, 12 Mar 2026 12:56:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 02/17] spi: bcm63xx-hsspi: Use helper function
 devm_clk_get_enabled()
Message-ID: <62a5a878-f88c-4ecf-a0e6-fe5430de16e1@sirena.org.uk>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
 <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="yl7jQAg1ktMo1H3W"
Content-Disposition: inline
In-Reply-To: <9391f0c3a62e698e66a4b6630ae10b329faf3c11.1773306858.git.xiaopei01@kylinos.cn>
X-Cookie: I feel better about world problems now!


--yl7jQAg1ktMo1H3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 05:28:54PM +0800, Pei Xiao wrote:

> -		ret = clk_prepare_enable(pll_clk);
> -		if (ret)
> -			goto out_disable_clk;
> +		pll_clk = devm_clk_get_enabled(dev, "pll");
> +		if (IS_ERR(pll_clk))
> +			return dev_err_probe(dev, PTR_ERR(pll_clk), "failed
> +					     enable pll clk\n");

It's nice to print an error message but having a line break in the
middle of a string not so much, put the "failed bit on the same line as
the rest of the error.

--yl7jQAg1ktMo1H3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyuBQACgkQJNaLcl1U
h9CEzAf/ecvpiU7/HU5Fp3TOFVTXTv8suK734EdILMdPMYzg2XQ5APg0FjZnaDWK
n27vFo4zq7eUDrvGme1Dzv10k/4Cjpw2DrQx/Ahqa3jpKOCHGmSxpijsGaAXLiJx
+LsKIWIOva86JU+2aUnnG2N/OYF8veII4MzVSaJohLty0G5K0iDpFd0LfzMJe3Me
unarWsC/fxwcVKrf6PagZGMg1lH37wpcAC2In9I7FrtGsoZCLS1JOZrLonKf1P7w
l3S+1h6hvY2cZtV5YrpK99SnkNKC6NSRw80K3GIUzkqT6P7RiaCbldAabB4newkT
u2aU/H0zcagXZXr0ZHcpjfYPMZXG6A==
=BmZA
-----END PGP SIGNATURE-----

--yl7jQAg1ktMo1H3W--

