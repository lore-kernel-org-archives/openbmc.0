Return-Path: <openbmc+bounces-1493-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC3F105F7A6
	for <openbmc@archiver.kernel.org>; Fri, 13 Mar 2026 12:56:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXPcK4rg2z3cJy;
	Fri, 13 Mar 2026 23:56:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773406561;
	cv=none; b=IOlbmJnQ/TAmGKs8Lm+jQlSoTh3r1qiMNSJzUGL2G+p3VvZADsNRkGBSjTw8KP+Yfxgp6bVb3raMVW9/jj4eShYYXwqR2ef3C45SQdS1HrHLLMZrP8MC5xlf0yySadVrTKEXQ7kahRHsUJ4d7Ln1cAZngYseeYEpIXQRkC+zdif576Ktc1qxHNrugRTUjJfhqGm54CNym4NQMchgFRVnXsGWE4c6WLULtwbRsdLr9NENVs2sUKnaLZ81rNTXWApTnD9OgYWsF6zBDDpH729dPdN4iaPPd6s//uNhHZDTL54kfa3BHJcAhSxsV32qmSHTKtB5dxzErbZCiC3fsG8u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773406561; c=relaxed/relaxed;
	bh=GN4mbAtPPqI7eb/w8hWseJ9vXifrvUMqwbIm6ZtN9p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEXUPw2pQE1gmRG2x9T4mkfi6sdcC01YgUuYUWQKbR89WnyybmZc8YCWQzyDVJgqpQRlWzrE/HCEKBAHhQSaGxLHH+9qC7u+04cGFNILO9QZZqmxQ95Fv9dYoxOkUY0bau6SHN9qy54sHdhLatObyaLZVlj2rhE2Eb2d3WrNaulE3gvQfB6OHsbn+cx95NDsJb9mdXLbCYUAJIjC/gykB8fLeTSqC8kjAdJrST4PrwuY11oEg0JFG7euV2Q78VVs5rzYLyE5lnnzndarTpMk+m962D2Dw3ieroEzWvVN21AooJXRp4Tiun3G8q71TNH1avGDtJnSYfv9q6gPFDo1Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LKDNhWqZ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LKDNhWqZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXPcH5lT1z3cGf
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 23:55:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F07486012B;
	Fri, 13 Mar 2026 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8865AC19421;
	Fri, 13 Mar 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773406556;
	bh=Zjx0eOHVxG9gyRtEPqgdCcdKSmIhSdKw+KfUYhGrs8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKDNhWqZ9gcLlJdoxr0XynPiyUoe0daj5KnfLIG4JofOAQVLnpfys+tsWuBfR2BP+
	 6BJj6yZqfdm3hP9/V+3GjcABC4QPZaLJh+UehwPfjEiiPgBRLJ6mgswvf9usqZ5HyW
	 B35LWJTwY7IrxQ1ooNqsQWH1kQI+VgfVN7nqixPusURihdngD8rUG+kVXzeu3RPREe
	 HL0ID1LecKPKPy/Ia8QeXmRWoF6BA05QvmnIjDA4KKqSsmWbqzdha1+mMcteN7bbhf
	 Hzm7r3p3USkrdmFn6vaEWdLOJOjaqX2Y8UmAlpDxnlihm5RiCIr2WOGSb3NBQJJndm
	 MHJylAxBihjJQ==
Date: Fri, 13 Mar 2026 12:55:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
Message-ID: <d54214f4-b57a-455e-991e-8700d03eea95@sirena.org.uk>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
 <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="1oJhbZS/zdMQ8Obt"
Content-Disposition: inline
In-Reply-To: <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
X-Cookie: Monitor not included.


--1oJhbZS/zdMQ8Obt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 02:08:17PM +0800, Pei Xiao wrote:
> devm_clk_get() and clk_prepare_enable() can now be replaced by
> devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
> longer necessary to unprepare and disable the clocks explicitly.
> Simplify code.

> -	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
> +	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(xspi->pclk)) {

This doesn't update the remove function which while it doesn't free the
clock does disable it.  Please check all the other patches for similar
issues too.

--1oJhbZS/zdMQ8Obt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0CVcACgkQJNaLcl1U
h9AmBQf+NZmcjADEavTXUkEkwog1B2fWsPoumOErBPGPp/uNMBzFPkj7gtNd5btL
ucVKvAua02jhgHneB/r1FG0shTauJc9wVpal3XmgRnMdqN8XRjML+ZWlF1SI+tpc
v45g2somStcn0QaQOUiGzrwcZddKdUwXCKwidznhryq4fm4Qm0d0jSLg5ayUdLhN
iavAAr+18xMj0UyCJQttiVZ5oR4PdExtioX/4xm4pJhL+H9TPdBC1fouESmEEOG4
krxSjVZLRrIxK8ZTjQ4RCV9ykypPyOl3bheFPN7rtI234NlAhUQu6ujoUgoC4aXU
IoIqyGMXFEt63B8KRgz9kIl/lz6DCw==
=oV3/
-----END PGP SIGNATURE-----

--1oJhbZS/zdMQ8Obt--

