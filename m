Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CB4C433F5
	for <openbmc@archiver.kernel.org>; Wed,  4 May 2022 20:35:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtpWK2xlmz3bqs
	for <openbmc@archiver.kernel.org>; Thu,  5 May 2022 06:35:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EqVDqgAV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EqVDqgAV; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtpVc5M0Pz3brS
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:35:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 575F5616A3;
 Wed,  4 May 2022 20:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01837C385A4;
 Wed,  4 May 2022 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651696516;
 bh=bJRyH7ULrk10ZA3h6kGwKy07DPEceBSb2lm+GNXVszA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EqVDqgAVsZUswaGXGLhqGJIWvFMh2yJJ9EMg+Cd6PW2dCD/GtIMx61KB+kOCAsBCv
 s+CDZ4aIB+DJlVtY7pRjhueN8ghQ0OklQYyHo1ZSFpWwrmgNKhXkgbbxPu0zetO8dX
 etQBQunI7+k/PfJWsc69MJyZKgKjQeOZWSHzSgj8ODX3faMQ5+2BBewZbjoNUW4ZZe
 0oCAceloRzKC0xY55uzsc0QBg5qZxZ1NRBikcgXgm4ze3wi+nqqH5/lXKctxkfBKTD
 a6tycxfgTWYGu9d+DauGFsovbChOWX1+jgLF666XqjWlAuYj5bup4eUIvvG879+Fj5
 wDf3Uwo5Fl0KQ==
Date: Wed, 4 May 2022 21:35:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 0/6] regulator: core: Add support for external outputs
Message-ID: <YnLjf6H4xJBCPwe7@sirena.org.uk>
References: <20220504065041.6718-1-zev@bewilderbeest.net>
 <YnJ37QysSaa+gAps@sirena.org.uk>
 <YnLh23QbnO1MHoVL@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XYm94gjSzzGQjMIN"
Content-Disposition: inline
In-Reply-To: <YnLh23QbnO1MHoVL@hatter.bewilderbeest.net>
X-Cookie: Mother is the invention of necessity.
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--XYm94gjSzzGQjMIN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2022 at 01:28:11PM -0700, Zev Weiss wrote:

> To some extent that was an additional (maybe excessive) protective measure
> against regulators ending up userspace-controllable when they shouldn't be,
> since I had previously gotten the impression that there was some concern
> about that possibility.

The problem there is that userspace shouldn't be controlling the
regulator, it should be controlling the things using the regulator so
that whatever happens is coordinated with the rest of the management of
the device.

--XYm94gjSzzGQjMIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJy434ACgkQJNaLcl1U
h9B+0wf+MttKvXRTWyy3xdto1WZ8sMfsgppWpCGoAtjEOxvGLCL0xnKZr2SBfuCW
otMNp+5vMZHRUHpZ5QrA4BPc6JAulfRNzMbYZni1P4ZjXx+40BG4+JnfXlro/S13
kQFAjFNCj0MVg8/0LM7yH4j30LR3MjQsWWM8I8Y9rWzhGccQP8oMQA2wB3Qjaivl
BoLQaeWtp+QgPPnSXZAc8vE+15sDeIekEW+jBlOKGXsurcvt3kl6zP5iyBKQmClz
GmlHtASv08JdX31IvTIYhasfWUMFdUTn8EFoOOViJ5grd28F60JPrlk/pDIFClof
22AepX2debpd1tfqc9xn8Vajk87XRg==
=P2u8
-----END PGP SIGNATURE-----

--XYm94gjSzzGQjMIN--
