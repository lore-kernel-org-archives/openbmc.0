Return-Path: <openbmc+bounces-2222-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA58C43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv9Wc3gL6z3bqh;
	Tue, 07 Jul 2026 02:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783357036;
	cv=none; b=iTrTYA6ZDh3DrfrlbFxKdT5+9UEQp48VR7rEMM/po1V7bwSfCmqAy9KLOIsZjwwLiAax/ra1er9tsQdDjBYSphw+Cr9Bcmusawe+s8Tk/o5FIqGlDaZMf4K0GZ/Ekz5SD8a1PF/5IqG5aPtyY7QCUxecs7ug2lroQKLd+5rHGFLYIxv+KQtSni1dYEnQn4zc6inSt415pS3ig/k0hxRlQncREk2Q5zccJNdjpM87Qh99NVICzKdQwa3XyrdNTV7B6iyZCGosYdnP8sighWXCsDYGYQmIYdk6b59LMNrwX6ohsZL8AFTTBoWIg2nVIEyp/9XMTEOtzew63oXfyB/srw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783357036; c=relaxed/relaxed;
	bh=CV9D6fJM5vfq9UhvyjVV+ncTZTIz/gR5q15lfevzvkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDYpZm8MIs11brZ3cDbOVDu45ig4Fs7MJzspXvJlOzgVGxN0thhcvunkC6m+L6Jh5PSDdvPNw5EhZjVIdZXMQW9NJgPpA27GUe6EBPSIObpG/dPfidUhVczPBYndtQ109SQyUfRdjrHQCPwfocKzo8XmzJWrm/K4BeXyZe2ZFxyf1PnFpPH6UBuwb6SfqN3KO08xXuqE+ucXykuvFE0yuLNBS1Qx3mjbaY8lTSqYd5i250WOsxTmB1EJZ+2Dq62wonMpQb+94Fz4+jFcDkdVUzPsRj3tOHP8P6Eq6B5nacS9th828bIk6sqxaZYy1M/sV3l3ua2+TsWfQZNeeh0tYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtQ6dmxq; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NtQ6dmxq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gv9Wb3D59z3bby
	for <openbmc@lists.ozlabs.org>; Tue, 07 Jul 2026 02:57:15 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12DDB40568;
	Mon,  6 Jul 2026 16:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3AE1F00AC4;
	Mon,  6 Jul 2026 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357032;
	bh=CV9D6fJM5vfq9UhvyjVV+ncTZTIz/gR5q15lfevzvkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NtQ6dmxq8WhA0sy36y+sGDdk9I9AEeOuqedIPC/gWAu0i9lNTY46g5VDDP7gQpw1e
	 FmLSJSJcoYCWd/Fy0Lu3RAM5Rvw5Mfl7urBdBIzwgEP5rflOkIA8l1TMbGmuXYCM6i
	 ux8LZ5vQ0Itf2dT3kaS8726/BYkDd11DUEp7nEEDleZC3arz+hZtuVlaKLKKW1vvIx
	 +geNUP3mW6Mb8nBlx4ffSOsGftSphyj5WPO1OiQ3Ksa7w5RO63ft7tU6hC/0d4nbdL
	 miPrwYTp+d+ytcdo/+2YzXCMNcgIqj0ZzaK4Ah6mpfF+EBcPII2pcFH92xa/o9BAYL
	 X+Hq3h7R6+bAQ==
Date: Mon, 6 Jul 2026 17:57:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, linux@roeck-us.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, avifishman70@gmail.com,
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, corbet@lwn.net, skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: Re: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260706-conjure-reptilian-616a34467c90@spud>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-2-tmaimon77@gmail.com>
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
	protocol="application/pgp-signature"; boundary="m6LAigrkJlf45dSi"
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-2-tmaimon77@gmail.com>

--m6LAigrkJlf45dSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--m6LAigrkJlf45dSi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakveYgAKCRB4tDGHoIJi
0nw2AQCCSIgI/DvjYrlSHivtEkbwp491JIgduD4sSQx+rkYfJAEA0JOpdp1n27CZ
DSb+D92qQ0NSkgIqyW8oQcGHySK4yQY=
=bWTG
-----END PGP SIGNATURE-----

--m6LAigrkJlf45dSi--

