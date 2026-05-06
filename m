Return-Path: <openbmc+bounces-1897-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C0CD342C
	for <openbmc@archiver.kernel.org>; Wed,  6 May 2026 07:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g9RBW4WM8z2yZ6;
	Wed, 06 May 2026 17:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.41.115.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778050899;
	cv=none; b=ZxEc9N5z7GQZoWGlugB9DRLdKkwlW8neWalZBHuEeV4JWyohATl3qv2aewzlgPVd98c0/4jdH2xU7iqQaL+vpZA+VBPcpJli9qcpHwOoyfJDizS5oRWJiTIBVrsAqgwGQ8/3bsnc5JV6AVnF3glw1mC8KU0+tf26x+blvvqnWjNCUjvd8d3vv0gZptGJO9Ax8D98qIycD/7/YNIVwq6AmFKJ31eZ1VE7XDVPhJBIWQ60Jd5kjkM9qzDmNYwlOq70X+JIb70bYLGVQ/qpSeaBISo6sZF3OkehG08XT+XPuDZjell7Z+6zLtj8fIUxTbXfZIg0q1K0g1ORhIXZl394AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778050899; c=relaxed/relaxed;
	bh=aSwKaXxsc1FC78veVZkdqkidY5mM/jA+FZy7HhsNfe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9hFnFXnfaVMhemlZc6KBGKZWN+SkEIxPEZ7+QdI3mkVXqb1M9VfeuPYnVGFFxooC6WffVyljB88a7wXoRLYtsxetXe7VFO4fAPAlQrxplXP3cGvO22MInO7VBLTvaKu3x+ChMeBgtKxcg+USzPylI5GpXB4Yna0s04L9v/Kr7rmiymqb+dkJI6LTxDdwURXsnJlpRkGIrg0KIPI+WM4UYLA5X565l4zaQA7ge/2dgWxghdFEZepbEjkEl9iqzj9xdN8lHMCfxiCZV8iFZIsGgw4yNeZDnyxzbcQkBWb1MH2OMQBzSXePx6yVvSsIl/cvP8/pK1ecjX2TU/rXwT4mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info; dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=MbuwE0Pw; dkim-atps=neutral; spf=pass (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org) smtp.mailfrom=truschnigg.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=MbuwE0Pw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 514 seconds by postgrey-1.37 at boromir; Wed, 06 May 2026 17:01:37 AEST
Received: from truschnigg.info (truschnigg.info [78.41.115.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g9RBT4TS2z2xFl
	for <openbmc@lists.ozlabs.org>; Wed, 06 May 2026 17:01:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1778050380;
	bh=EX2J8tpkf7DWHrD1UmqJkeNS4Kyd8i7B9hk1pAGmbYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbuwE0PwYpA6JpvwmitF5+GjA7oLHY2qRrHIxsEFD2kJV0uq6MsyUfy/JLDVMI0jC
	 vJUHsVh6EUzgUBsgv2e9hmBCYYHmqeZi0m1OIi27HwuchqNcxV5/L7LG7W58yBxe8s
	 ofq8Qo6CgmTNNExYRZ/oSvmwJxWhZeivHupzgTkLA25QiWTV+m9AgSgvoDevAgEjpY
	 KqV20oANGARP0nkR74IHtlvFiub434qygRT7jWxMa518WjYgQWpnykLxLxpjIT8OWz
	 cB0ux3lRXKV9sj9iWvWajqj3GDJyXQQ3F07c+6CjClzn0rulSmXCUs5cm5ikF7rzRl
	 knHhGUltoco2w==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:a42d:36df:eb0e:f8ff])
	by truschnigg.info (Postfix) with ESMTPSA id 2C65540258;
	Wed,  6 May 2026 06:53:00 +0000 (UTC)
Date: Wed, 6 May 2026 08:52:57 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: Re: [PATCH linux dev-6.18] eeprom: ee1004: Fix build error
Message-ID: <afrlSbCqDeLYb-Ps@vault.lan>
References: <20260429070650.28931-1-aladyshev22@gmail.com>
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
	protocol="application/pgp-signature"; boundary="ddtBHFOP5wtVl0vQ"
Content-Disposition: inline
In-Reply-To: <20260429070650.28931-1-aladyshev22@gmail.com>


--ddtBHFOP5wtVl0vQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 10:06:47AM +0300, Konstantin Aladyshev wrote:
> Currently driver compilation fails because of the undeclared
> 'ee1004_groups' variable.
> [...]
> Fixes: 79d0df36b541 ("eeprom: ee1004: Add nvmem support")

Ftr, this patch on (top of 80ec78d (6.18.26)) fixes building linux-aspeed w=
ith
CONFIG_EEPROM_EE1004=3Dy configured for me, which has otherwise been broken
since around October 2025.

I recommend merging it :)

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--ddtBHFOP5wtVl0vQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmn65UUACgkQ95W3jMsY
fLWTDQ/9G3QhznyQfFQBU3+i34XnFFeeXQafQby0gbIQRZchUtD/k6YRFXXBvmMG
3luemeTGOdaBkUfjGLPehzbLowO2IPqklFQy9Kxg3R30Uug/3SdD/4BpuOP9K6p+
WFfzRDeUt0AgkSfc8gkNE/UuRC3DP3yq2aXIC5iEJ+/Nn4ke9NSTTWNOwU8f1KWD
qXxfnYOqb4q3vIEvun1giYenIxJNTByBZ2R2xYEaDYqS1piUvywusK8ntcehzdB3
cP3/mjuRH8bKolhHS7gtzUM54yBncyIxGumWJnA95KPTS+h/CcGG87+94RSZNBBj
1QIJIyDQbsmGcfGWygpnq9QrD3fweryvZaqva+hdNsYZPoqWtVzKKskhN+9WWzvT
aPUG69fZ42/0YETkP8w7IbdwKIwSoX5RhHL9mYe3/9jvOczBaqLKXdPRn2ElvJa2
UnQFOz5AN1PM+zmRg0jM9dB+OtrIWEBnA9Ppckvl0CWrBAJ8sMV8yq1vIfO7/br4
tPNzv+J8oNfefrPZqF5305f16pIER814Mf3CRx33PUICzkLWCe6rVIw/vYm0FlvI
1/WQWaIuy3uMoBNqPQ9moOqOTPqJ6QA5aToa29MXJAArY19KA7w6DI7B185CrwtL
6BpdMlH0GKlIFlt72itiwRlTKh2o5VNyXh0cIPyyyajGs8vP2Ws=
=gwci
-----END PGP SIGNATURE-----

--ddtBHFOP5wtVl0vQ--

