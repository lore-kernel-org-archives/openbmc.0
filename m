Return-Path: <openbmc+bounces-1690-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161FF4613C
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 21:49:45 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffmzQ3wtQz2xS3;
	Tue, 24 Mar 2026 08:49:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774302578;
	cv=none; b=QYWKH91POrQJaZrPXsp46zjKg7Chk/4IAp/TtI55vTAh1pcBc+8VhADzQh0jdlZo7SRSMJY8woExXldrhGivuyptVjl/ZxhkZhCCjiss28RdIqI1208ftH2Iabciu/p57CcQA72OBKM1GQYWfnB+uJC8EsAj8ubvJofJ5JLvrgC/8PJE1cqfZUlWtR6r0TPzO4rramFmAyV8skBgN74khKEwc4gUeKKSKaY12Tkj8cWWCkKcjZL+xEbZ5yxAsc2XtwclRSzIGsu2fS126rv9/TTJLsbjWG1HaVC98F3OU3XeFs/BcN9UNsv2GnEa3myo+HJ7OIOETDMviDsRrqPXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774302578; c=relaxed/relaxed;
	bh=Gv7ISimnhseEM70YcQxBz1x71zZDUe8CYuIh4tJLlnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TinuDsYwbqWOPBIr6MHxBFyyI+Mianb9x4LqrXi55T47nIOqkz6H4jxeL4Y1eFdYKDCuUxLf7/6rsVjK1Rz03fL1ev/rW85KVe86PPPi16e/nUetK0EKQJ7DiBQR4sT8qxTC7nolWU2kY2FagY0Bg/EcqEg2dQVKj8c7Z49Ba5mhs/vLdP6z1U6i7DfI7XGGkLiVctsAyIjtLBP+RiAzWdh0iFB/WBydgdokJiQU0zFgYAJKt3fLcyvnB6KYyb1qM41HaQO3UiO38oPvywrO8G1wc/SXtD0gk/LyZxdAqHoU1luVXwkHW2UJNPDdqc1TW49i3vHtjzJJtqlA7pLtCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXR3s6Ii; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MXR3s6Ii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffmzP3lQtz2xLt
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 08:49:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06FEF44186;
	Mon, 23 Mar 2026 21:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E23DC4CEF7;
	Mon, 23 Mar 2026 21:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774302574;
	bh=e2ZhSCx0wJsAx1emJeyO4FU08Tb6VMlBPPL5XXi0V+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXR3s6Iie7Hp0vfWKYIxZqEwcifDLvFfeZtG7iRbEA0DhAy6OrFcIRNASgmDu1wES
	 zn4IB9ubKrtOy0wXus4wPsc0eBevTbJva1lSU9ESfklLjSd5pBNB1nV24Q36di4wYW
	 0lXP0/FiXiQNTgJjuefwj+TrVnsIet/iqOzKs3Iq+mE+Od+sUt35pv7eHj4n55e+gz
	 13fLIGiGQyk69OH0znKnUMNM0rDD9dbru0bdVoDvY3E2gfDe4vCze6n6yxC9kUGOMb
	 kSLEBVcMkyjMZKjC+Q98InaQDpdQcVNO4WZCXfb7pbVZYBqGq7rQw4g31sEWJnyczt
	 1LJaq/W2VhUWw==
Date: Mon, 23 Mar 2026 21:49:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 15/17] spi: uniphier: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <2f623083-5846-48d4-8c36-e55d663047c0@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="Y/Y2tr05pHZcxD/m"
Content-Disposition: inline
In-Reply-To: <bcfc4a5191976b2ada9cd4094b61ac67a0ea9da7.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: Advancement in position.


--Y/Y2tr05pHZcxD/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:04:11AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

This breaks an allmodconfig build:

/build/stage/linux/drivers/spi/spi-uniphier.c: In function =E2=80=98uniphie=
r_spi_remove=E2=80=99
:
/build/stage/linux/drivers/spi/spi-uniphier.c:773:35: error: unused variabl=
e =E2=80=98pr
iv=E2=80=99 [-Werror=3Dunused-variable]
  773 |         struct uniphier_spi_priv *priv =3D spi_controller_get_devda=
ta(host
);
      |                                   ^~~~

--Y/Y2tr05pHZcxD/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBtWkACgkQJNaLcl1U
h9BGOQf+P4qqM5W2u6LtXeZ+RqwAf5bIlruWN7Zu6y+s0RsmbnL8SLo7ezN1P5XA
CaagW1s3A1znQ+f+UOmPpt7CUIM1lfu4JMWMQEq/cZthfywlxT0GzJCFxfwmIfXc
CIg28KtEajxKDNgRhc5AUvY+uPwX0bN3q2rUJ/kMcSeopHH61rIVinefkvqchzj3
FcC4NVtnG1cKpbV/hwswiKs7/f4NPM3PJs/PUgGtrqtvcaylsOcjEkL/tUQN5bHY
TupvhVwEX8LSCuTL2A0ihBwbZj1FWzwTqmb2nkc+zwDd0wOWosktdz/D4qYx04Ox
knJf2rx/baCD+1NxJPUJXi0GgY9dkg==
=IvRp
-----END PGP SIGNATURE-----

--Y/Y2tr05pHZcxD/m--

