Return-Path: <openbmc+bounces-2543-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE080C624D4
	for <openbmc@archiver.kernel.org>; Thu,  3 Sep 2026 17:43:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hbRlR6k55z2yqf;
	Fri, 04 Sep 2026 03:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788457395;
	cv=none; b=CFG6ppfWQkorKlNOlMXMKUbHvVG+FzMX5AKpuauhdbnM9GdSFOCkoA2e89nlGeBVOC6JCoXR8CGU6HoCWGmcfPDPASX+kxbh/vg5W7wLGRO/Q3NmunJn9+o9YdSLTuIfKwWm/6UAahuDkDBAy7XACwKrjXav5xQfZ1kPkWiL9WDCWwJg9CKIThNvZjd1gJ38ZxufgBczwoj7xxWpcyq7q1XlU/J/SQn8nNcm14r/PAof410Yb9/ULEhiuyFC9yl4qFYYjJJ3y2W52L3m4tEiUlxCcCxKmm9jDCv1B/DuTLRKnT0lLn2RR62+WEqmBRSt8qPdEW/fQ2A51c6V0YoJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788457395; c=relaxed/relaxed;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6rGnZ6diAa3Ar4LpTXXB/lnfIbWJhFkmLeP/EWErYEqWt4OQ04jaPe2SaKYkAc7Df+vqtJ+KLPP40g6uDFxQ0+5GbTWVmswuQ+gnzatquIcNlBIn3J0lbVWewYV68bNI/kHy3e++/5z1vYmJ+nZIUjU+WVM7vE05gLyXzCd3Pxa1PKbARK8Gw+2SbXQJso39TXHLB6NquXtNPZkpt8uS8r7X8suS3pSFlqKVM/T8ZqC2wQHxDg3RCWZfm97wAm5YQ4vJjIh8O+WRuQ1zPErZTaqFX8n/6MVKmSN3uTujt1UCKit2mX2nTErg6jQ6jbzFdwDlLU6vZ3MJtjaURUXog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iG3I0jS6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iG3I0jS6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbRlR0zxfz2y2R
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 03:43:15 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC84431CA;
	Thu,  3 Sep 2026 17:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162F81F000E9;
	Thu,  3 Sep 2026 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457392;
	bh=0yKUp8+OjNQuiGydyuc88xNu/ZV5JJj7ABNvGpvioNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iG3I0jS6ZHTha1IW2rCS0eScKYZtyUujA70ocylueLet1hFh+DjLNFd956URbpOE8
	 JRSx/+luzRm0armEHasBKTtiLbokj/goAb3J9bHseVU+SwUZsUg4cxDVK+FLXM6ysh
	 m9V5qce9cvT1NR+8eKrEJipUz/L9xOG+7C6UHFGRbND3mzF+HQg7+CN8/QLPnzt+9r
	 qnjwDhQmNbXpE8M/sHGbhh2k/3uut+449wzf940H7uq0yPzsjHzzSeKWPRcINcO4rJ
	 nk0tzCVgPhYhCLx66uKLWbmdey9qzsw7fM+0WHJ4kkthz9w4S44lazpYgO3QFbh0l8
	 AmbqcadSMzJTg==
Date: Thu, 3 Sep 2026 18:43:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <20260903-magical-stopwatch-05e1a8be6fd8@spud>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
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
	protocol="application/pgp-signature"; boundary="SpJjSe/VbDY80SOp"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>

--SpJjSe/VbDY80SOp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--SpJjSe/VbDY80SOp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmxqgAKCRB4tDGHoIJi
0j+jAQD8wrE09OV3X86Bngo1gmedxzYJrUI0492AHQUpCyME4wD/b483lktimFdV
N+9+LIBwWe0Ngow1TyKs9btPQpBogAQ=
=fY2z
-----END PGP SIGNATURE-----

--SpJjSe/VbDY80SOp--

