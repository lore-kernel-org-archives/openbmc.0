Return-Path: <openbmc+bounces-1687-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B50F483EA
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:43:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffkB44CHlz2ygL;
	Tue, 24 Mar 2026 06:43:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774295020;
	cv=none; b=Va41cwPowW7hdy3a5/RtJsiPj7FoVyxg1mtqB9W2qk9tzM8TR5bEJV6U5fdajyoeRpihP7RhDifdvRXF9WPsLl2MAj7chLTnme4gbAbGfEJvVRd2b1Nxc2elpR8tj5IBV6xuKo5ZESjtXiqKL6RN+aXOW2Qx0jPFgNkXdr9znyW8MoptsJ7DsBNi8KS9xAyUf0P3tnyNkkfmlUVl7SiozzU5v6V96neJ8lvfbLIAwi7IUTkJgQpgaSClA5KX3uXrA9csCcV7zLXgb2o2t51WhbaUEyoePRqYaFzgIufuEG4qX+3lCw/G2zzRHCwQlzVw8N8Guz+EU3f5LTMQXSnobw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774295020; c=relaxed/relaxed;
	bh=v5WODaG9Gq7F9JZNXjpS+WX7LEMWIQj7OgYxY6O8wm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5n5Vlc9mgK8uLVbWXfWHXkOEb0i6CH00yu11G2b952nxr2opJLi4VU0oFY80IyR1LR+7w05Z/CW6b6hJi/f5VZ9hpT28Q/JygNtYFg9dPsF1+wm7Cq1Vbmu3c4TjHwLUfRj83JjX+fIePcDrPkrcewFXQMdWRE7aOj3wc9kcfhM/R7RYiN0iVtmN8QzrbV/0qwPp08WluSssZNKkbW5WqT7u92xQ8JsaqKyRkiOOqH5QVqfkn0v22nXhJqYGXluTApIJmtLqqRWpewmvwn6HRtgrJEA0OG901wC5taC4z3l5mcMVzDqE7uCRftH0UUigGTCkUWFJuiwMwCKo8bo3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwxvSdbY; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwxvSdbY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffkB34KQBz2xKh
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:43:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D45437BB;
	Mon, 23 Mar 2026 19:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC5C4CEF7;
	Mon, 23 Mar 2026 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295017;
	bh=v5WODaG9Gq7F9JZNXjpS+WX7LEMWIQj7OgYxY6O8wm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwxvSdbYYgbtTaGBexrLs+CBdI6CQ35Ad/j92i3+aRR27slb6tT7mjmS18WnawZKS
	 qjPE5+FMQ7SmONBT3pbXlxEnWBTjIfNKVpfb/l301sTXf8mwulN4p+us/dq6jpk5i9
	 zmFUX6viu3udkvBFk/DaAGrGZMfx4FdD1FTlGFI4EV5VGNXViAD9gJKwkJagHO/n7n
	 bH5xw/iUaQ212ONZ8kV3zMeok1EQaGArnSybU57FB0e9IjaWExq9bg37mVyFciJqad
	 lAe3YrFq/pvXpgB4v/Zo3VE8zAVgc4zbd/kAbUmX5YFWXCvU1Ml/2o0MMhVnax+MnN
	 nUU9y+OpLYjbw==
Date: Mon, 23 Mar 2026 19:43:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 08/17] spi: rockchip-sfc: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <a4972031-e0e0-4c0d-90cf-c283010980b4@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="T+H6iatU6AC0B8Qc"
Content-Disposition: inline
In-Reply-To: <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--T+H6iatU6AC0B8Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:04AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both the interface clock "clk_sfc" and the
> AHB clock "hclk_sfc". This reduces boilerplate code and error handling,
> as the managed API automatically disables the clocks when the device is
> removed or if probe fails.

More runtime PM clocks.

--T+H6iatU6AC0B8Qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl+QACgkQJNaLcl1U
h9D4ZQf/acnRu0a4w6FJL3v12O42Uq6Atol8X/9TvvfEv8vy8qQx4u7LQH0wAamf
h5RLhWnd6nnJ0UEgty8mI544lxzYw4RRV37oEWa1YlNgWMLJk+5DOgR6Ez20DfdU
vVcwkiwN1T30Yx8oaZOvLVLtuKv3X31uzjSJLs4xVCFbvAJSqjhhnXrhBd+NqGgD
oLCC0q7KFUnaYaKyIBrZNm01jtXo6NntwK8dLHecJOuXmSAXpCnAM17uiYSQCuL9
d8SJVRLy9Dbwoz+RSHJJh97TvT0aW9by4xQABRV37vXmaj48N2TXJXgJj5xx+teB
Qqk5+3b+2LydR9XyiqHGRXrhmHGHQA==
=dt67
-----END PGP SIGNATURE-----

--T+H6iatU6AC0B8Qc--

