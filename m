Return-Path: <openbmc+bounces-1686-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC1FF483EB
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffk8t2FCRz2ygL;
	Tue, 24 Mar 2026 06:42:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774294958;
	cv=none; b=L9Vz5QynbeHm67l3qXZoWcL+KcIamQaB7oCdPO8VO4ielYOpgXCUuDh5rQjw5hqxGfrftdFcIpVGz8GViHoxM9y4JJZC9o/u8HbhesyzGDqEZ1g59ewUBsW7fwOwoDsnyf+d0Z2VQ8DmS+iIhA/k8MYk049+Cbfgb0CpWjIxEmUGp/kzlPAcC/ZBvNaErlZMlcE/mn0CfKdgNQGdjmzjhs5zarYhttr4tvyw1YXnEH+ntmfutw6mXnEaDcqVjbRnPQmNic4/I63A75b48AZVRdFPVVaa6LMP44lg9RiQfgudOpJz6TYSCqTO3jiP06KVlzQ4XfV4CmQqOwiOt9QASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774294958; c=relaxed/relaxed;
	bh=11j9z/1fJKiQVdJE20P4e+j+9ToUEls87BE6rvgPEnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpGCziAqVe31njUYw4NdXwEK3/miSQOP7oDn/TyTg0uXDckjX7XWS1BFVtJhTks1RAUZQ+TutuF40I6hOpqHlKOUASapzO/vO5XxunVh+FfNNnKs7Vj19X225Jm7c0uxLRaehy2dMu0oi2pHU60fg0Za9kUMQhRzUqUwdON8nYJ39JeuMKqlnVOVUUJNQ/FLeM4S3AfB/Ds22+8pwTtnQp+g9/lCnWoTUktrxnMcRpXZ/i0k0jKw9x6Go3fYCCawyZz0ouBiWjL3x66Lx7XjBf8O2Ni3HxQs04dsh3ZPulFpke0wZOBoMijdJLPHnDMx6dZgEalS2G40THs+iDNXew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FgPX3A5w; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FgPX3A5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffk8s3G6Wz2xs4
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:42:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D2F7434D7;
	Mon, 23 Mar 2026 19:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167B4C4CEF7;
	Mon, 23 Mar 2026 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294955;
	bh=11j9z/1fJKiQVdJE20P4e+j+9ToUEls87BE6rvgPEnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgPX3A5wg1iUr/7tQS9xp5e6w0B25P8zSkCFksilaSdtWF0zDITP+MM+ylpxRhqqN
	 z1RrpGJ0rkK+G2tQr65a2/Xwv7EiFqD6PuLMWp6NIgNgWPZTiDGxPpc7mIWDXI+lVj
	 WazCdp1gkd01GY8XHb75ph0A9LOKxkfuKGbvWtCEABYmHzURaMEXJmTzb8e3FF9HZm
	 Yd94MYFdCPEkY0FJN62BvsxE7q/dbpPH7fE+CcgiWdhHVGeKHch8avzFVVHAHBzTai
	 26KyXPjH454gkbq++sACIjU4amKyHo63ZwM2pIugLnvvDU+/lf1hAcY1Y2JEWVzJnR
	 x0lY5DPsSmnIQ==
Date: Mon, 23 Mar 2026 19:42:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 07/17] spi: orion: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <7e9fc388-cdc3-4810-9136-9a1f33fed7f7@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="ETAL/F05848nVpj1"
Content-Disposition: inline
In-Reply-To: <387f2fa1b3e1a356c524bb36eab07e1b431b6382.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--ETAL/F05848nVpj1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:03AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the "axi" clock. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clock when the device is removed or if probe fails.

Another runtime PM clock managment one.

--ETAL/F05848nVpj1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl6UACgkQJNaLcl1U
h9BT8Qf/dtJjSArsGgU+y0yVED55+m8067SuMbN7WPDUHaKFWCm0BD0AB2I7w1wo
Q2eV7b7mCT9le7uw8d9NPBabofnVmISnVSpguFgRIG7YVtcz6uVBHSV78j6gcMvk
kruWd2xH7oETY56WXrEH08IbyT7W1URHbuWrZ8rHqszSMdKsqCx7ASMx8O92IOx4
JX2u0m/PftCpz/ebstkEkS86e37+yNik2jfo4cb+HhAkYYkgYUzeocNaWEixMslH
FcajN7OlPOnfeey4e2Fj7/C/S62tLwDD1HckZI9Ja3rE252BzECQ9E0U/4Ocf7ZD
kMKNWTPNhkr71ULS8mV6P4nVuyLAgA==
=fMon
-----END PGP SIGNATURE-----

--ETAL/F05848nVpj1--

