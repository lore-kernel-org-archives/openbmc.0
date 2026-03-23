Return-Path: <openbmc+bounces-1683-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A8FF483E7
	for <openbmc@archiver.kernel.org>; Mon, 23 Mar 2026 19:38:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffk433Q2dz2xs4;
	Tue, 24 Mar 2026 06:38:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774294707;
	cv=none; b=bHL3Vf5u3Jsm1TrtP0tGZIJ3cE5TlXKbvc8X58v+ffo+5jBWMnzLtInDY4sMPo2w/oj7V7/nr4u4D0LlwF2ZCGc8drYklnTvVs7R08bybCc5hBskvzjukG0k/lf0EyAc5A78w/aNi0xEfMqlJUaQ/9AUhYezmDxjJIx1YnQzvBg3txX5xh5adztjVEaaPck7xkDb/tMY3QLiJC6dPa9932jfj5WcszhuFYYgDbpFz9Zk978LulJCkfAmb31katR9FUcwrw5+ZWejrCcfUw1Ub7CW2CVMmUFk3b7O1nRaE3MpjiQIs3H+rhQIvK7hfAjb3o+QVgAvEG5K8xv1VKdDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774294707; c=relaxed/relaxed;
	bh=5k6RSNwFusFVmg2TpsnMUo8NPMVbTpvmOvUTn4lfv6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBSALw0PyWy1grDrjnx+JvjvTjqxG8PtfOAs+yxwQLustiSIZzt+7q4qONAn6UpLaO1CybAhUh7jxruC94Ai1NwdwzO9NSOSDEa5tkkeJZbvHeTc62XQNkCxMQmE5fSDFbqLVONZ6t/fgKYURJNUvNAEkhj0lUxIzqiRE+WngzaK+6Z/cr/5bKMSQG4laLbpfF+UteLu/ku6dj8re1mBE7QyKlUF7OaNnIBZz9WWhw9dhHErt6iOg4g+/byVTlflVEr147xRERpvvG49A6fd+llEessHxU+tTsII851nUTMJkRKLo8G0R4f9YNmiOwN5oihRscn0qngiOfMcN5JBJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LtJx5vZf; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LtJx5vZf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffk422WHmz2xBV
	for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2026 06:38:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03371600AC;
	Mon, 23 Mar 2026 19:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41690C4CEF7;
	Mon, 23 Mar 2026 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294703;
	bh=5k6RSNwFusFVmg2TpsnMUo8NPMVbTpvmOvUTn4lfv6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtJx5vZfItLXOoIv2kga5F9i7wz0o5NywLE0+aLhO1E55t5TMkI96NfBNZqc2jVMT
	 BtaNr0OoOktPplwFPUh+RCSqIaPfslO9L8IAwy7GDP0+QfvcRxfqLH/uIWcQuC6e6S
	 Z2A9rSl+fzdsa7anp1tkHBvZbZffUYam1mpGfkRocvxS0/M/7Qz7vzp5Jg1/2lVXmk
	 OwLm3fK2uBcTOBtVttDuk1m48jDAVgGwiS8CIB8XckUs7UTUrLFXLTraiH9RDyToIQ
	 az62ZiAVR5GvkqmLd91uCnhHazvUkL9SIxG/vfvGnJiEZSuSrZsU1r6ieaoTfJRda0
	 zzkw+HQMQjEng==
Date: Mon, 23 Mar 2026 19:38:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 01/17] spi: axiado: Simplify clock management with
 devm_clk_get_enabled()
Message-ID: <8f92f6e7-93aa-48ab-a183-fe8167dcc517@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <52f7e0ebd2f0ece71929384444e1ae87506e5e2d.1773885292.git.xiaopei01@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="+c7wJ7ToAUTqzySb"
Content-Disposition: inline
In-Reply-To: <52f7e0ebd2f0ece71929384444e1ae87506e5e2d.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.


--+c7wJ7ToAUTqzySb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:03:57AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both the "pclk" and "ref" clocks. This
> reduces boilerplate code and error handling, as the managed API
> automatically disables the clocks when the device is removed or if
> probe fails.

This driver is doing runtime management of the clocks via runtime
suspend/resume so this isn't appropriate.

--+c7wJ7ToAUTqzySb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBlqgACgkQJNaLcl1U
h9DQmgf/Rv6RyzoxQRCgDOKHviEvFcZSxzzhE8666qZ63KWQcYY+YwTNXJbCpu6F
x0bKK7lGdLtMfa+xckYnQ63Jyzkzal9euoPa283BzzUg4Jzn4vYiz/DevoIRnjgd
skGPBRrD6X/YBuQs7VWlEFxzPi+IyLX17BEviHKisdvJGLoghJxg7udRD4pucCJF
JStuti+iUJaDCcn+qINXcM+B2fmYF15OoRQyMgxOX+1QNqDRED/d5HEoEw+2kLJE
XUlbGguhFItn5fOcHck/JTNgrf5Q4RWHAZI2Zfb1TjQW3+tvCPYn1Z2pjhO6v/EQ
AwiQilSo5Bf7ZptfuMjShkHlrn+DFw==
=DDAD
-----END PGP SIGNATURE-----

--+c7wJ7ToAUTqzySb--

