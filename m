Return-Path: <openbmc+bounces-2082-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E1ACD98C5
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 23:12:08 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gbM3z43J1z2yv2;
	Thu, 11 Jun 2026 09:11:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781111251;
	cv=none; b=DNEHsgjgBO/ItkDP4kZ8KGHOVx6lrj9leXtzGNWMiJ05G696q64HBykcbjmI0yhtoVQXGr1zvo9AlguTqeIIAuvOw0fB+n4UL4zH9U6aWj9Wj8MvtjghceCtAw2bRIx6eF4Lw/cwH+NEk4+x9kCLhDCprRZ9KRanCy4jbzE8tvD4Ru1AhUIFuN13L1/fkEbJVlyiD6NCWa86heK7F/PQWAiuG8ptDKTWRXpuvJtITRmDHDrcbDoZudR0Rw6F1DkLVWAlKP5DeJPnY46DLOxi1ON6waKAdNLNcPCIQQFxF7orUPLCWpkhZ3ULdwcmpmsN0RyQK6HgYp9IJbfZxN5V4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781111251; c=relaxed/relaxed;
	bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhSwWqPUPhiy0liIOP0DPpC5CRzTycFBgOVzmK7gV0mmNMj77qN+8vN9Gw64SqINXdF5LEWXH+14tn9lwLudiuXpdyCnkUdLXz+LBlsid9cP25ig7mGVaoWaWA3HtU8BqHtgWl35EsVA956Ld0B463jYbgpulNplbVUKn2CHJXiNm/SujWtRHlwxMvHsMdmGySd4u8vCdeDRpOPnwZvTeXOxrtC0taWG0KL1X4t343MnyILbEoeghBTMNY7UH4MCkeSCUVh59/vrCtfVRSdRdIUprm0/DQMkmjOXIETZEu5rBzZI1tl5TAGVU+mnLBzHXT4e/52H7u7wS1oHYTrW8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mZJzErHu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mZJzErHu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gbBzM2r3xz2ykX
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2026 03:07:24 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490af320e2aso77262555e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781111241; x=1781716041; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
        b=mZJzErHuZkdw5hc76BQQcGI/UgUK30xMqlFonAt4pbKiG7XtPJT9yk0DO0ABK6v/h9
         zEfZVhRFTfj9n8fePDdGmA8TsJ7Q/0MesB0sFVt5r6TajA6auljpN7bbZs/uNxS4eiYa
         gMLZDyRC9XrqOdSvRI+ffr0Yb8LRt2vCbcXE4//ihgSijM180fqPovKGl3d0ZdQi0boQ
         kxE6B+ulFvfqTscX0bTsJDRVfoo8i1TWOawE+7HXYAyqTbRoNqy9MPhMB9Y1i1gXEfpZ
         xP87VpXUX7cy/kgGvYpBttdibwB1SAK9yWUEG10mq0EZdM4c8vYKAxP7rOPBPqIImFha
         sIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111241; x=1781716041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNIoActVz0TXbcAcJhvF5OroIdcZfRfYtdC66CxO8Jw=;
        b=cNHXoF0PcRLxtRtWRqZGNBpZQZHbYB6yuI6UbXzSgsu2cTFf6nwMMjGm0psP3D05es
         zaHboMHSt4g2s6igcqyD5yWJQdL1XHfE5VWH+UbBkw2LJVIfu5MV0QE/XiJGEqHejETj
         fnmVQagBUpATi1WU74l/jFpUH6IrEvpgqYGuAtbC51dSfiWanLgATRow0zERW14insJ2
         lyJmJy2b5RUmEZ7gZ1Uzt8jEre/QjpTciZ8yAup7coAL0ZTdn+jUET2g50cTXZ6YfHP1
         TSavzxEXbXYWSWb8RC9o6zacLzqIF33CZovGWG9y2+Ugd7fOGVNjjCgOKBFOgHKEyKlY
         l1Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9s+RUCYJzd+8Pw9Hqo4EWSX2AAcfwtgkcHZAxEU2xjqINj34RgNCP212V5+boLui0OS3n8n5Q4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqQkynpnj6F7nuW9EX9LD+qSOpz2aX8u9u+Vg6spL2X1mYKG5W
	9YJ5q2YiZ2adFoQ5VK+f05dCkswGVu5lubC90j3jBNYtxe1LoMhmGn/9+xwf4KpLYKI=
X-Gm-Gg: Acq92OHKLde53vWg7q8/mq8rzbBOd8O7sOeeI9x0tfCBW60lENywJFknM3IlvJW/SBM
	F2HPiQF+jOZTHav+lsnkRFpvBFpLVjui+R7AMA+NlldDugqle6y7U2YTbMo0W+0yHHM4ynLOFHO
	N2Yk/NnmBP5uNCq8xQNTJRK30IJU5j8tpOruFa38mfz+bJkrwgQpMt/8uTDiM0+RWwPiV083C6Y
	xCR74GItxB/Pakr2hRXJU7wMgHPzO0V/88TvDJfambO/zvWGOxRtMIHlav272NI9LcjOf6GV0qU
	P8iJOesvXY1zqnZJhEPcvmgnJMsPaEfyJMrbuxLxk8NxXJx6m6RGS1sRke1Uf7HXWAXWJStEjem
	ZTiZQK3JjMKR8oR4JHd/z3NvhDwfqiuvn7dbYsV7phMPhjNwgy+q02vI5sRiQVeBWe0MzZ0ZzoJ
	xgX3uo3YqUzdDk2Bmxt1S4MrcmrFnIZuYntmefharp85M0bnAT3Y91Psbb49Av1gBGEwQknIbxV
	TBySkmE/moNSp9240njSXaqKw==
X-Received: by 2002:a05:600c:1907:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490c25a0800mr404729695e9.10.1781111241169;
        Wed, 10 Jun 2026 10:07:21 -0700 (PDT)
Received: from localhost (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490e2b2bbdbsm1071665e9.14.2026.06.10.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:07:19 -0700 (PDT)
Date: Wed, 10 Jun 2026 19:07:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aimZqlTywiFMrHr2@monoceros>
References: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="mjyhwxentwyot5rk"
Content-Disposition: inline
In-Reply-To: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>


--mjyhwxentwyot5rk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Alexandre,

On Fri, May 15, 2026 at 05:47:20PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> While touching all these arrays, unify usage of whitespace and commas.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Is there a chance to still get this into 7.2-rc1?

Best regards
Uwe

--mjyhwxentwyot5rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmopmcIACgkQj4D7WH0S
/k4epwf+L6a484mFk1OKMvi0C7fAM23h7XiwvviyyN84trnw8VwKAkEiJNf5JUFg
7R1WMrq4+2e15acW97hQlPEzzBDuW2ABijg0v0ZarwUfflD+5//84KhAd2wRB6go
Ce3ayzfswCIOXZmOHtUl5OqWrp3ZhZioj2uEcV1gwtUkvbP7OdoaGJriM1ftzIN0
an6XNu4Cqpx/8pmXDoUtOIIy/te4xlV0MZBYhxUbxN0PlbW3WGdLTjj0BT9XneW0
KphmEVuwqL/2D9C8wxbpwZwCTEVNUXr8kPz5S/JedPC7/+oSdrPid2ItFPj9UHwx
fhMw7IH4sbpgOZtT26IRcW/HrV2WRA==
=FSr9
-----END PGP SIGNATURE-----

--mjyhwxentwyot5rk--

