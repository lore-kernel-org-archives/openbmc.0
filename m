Return-Path: <openbmc+bounces-972-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E99CD3ABF5
	for <openbmc@archiver.kernel.org>; Sat,  6 Dec 2025 06:51:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNf6B0k1Wz2xqf;
	Sat, 06 Dec 2025 17:51:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764948634;
	cv=none; b=XsLkL9NfhgXJCw0PVVdM+WgF8rxUwizwrCzTKsXzNooVWjfr7j6obBz90W+VRY+wuWDMO29lxHeOmrKN2DPn321+l2SZ/4EMgN9MDN5Tx9brTIb5QsQ59krC7cbciEbzoAEcnCD0n/PE1y71Y0qK7tjcWflo+/uDF7D3pfODrQF/1p9LLtFatGlzMEw64ihsYmh4QnbbsSfZDOVKd3LOG7hDab2m27UBZjHrT54l5AwHIopvAAOdTW290W857rrfr8vpPFJi7jccuLJfUFNQYjMaqrH99pzEOU45uyrzHUuA/W3dUFuDeE+EkYe7yoffct/OFgDaS0rrkiGSvCNhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764948634; c=relaxed/relaxed;
	bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQkIJuhDrw0YsBqeoi+DZ75IyGLf8M0jsPs0ybDTu83ZysxJbKQx0rmLPkzduvljpqKeLuHeGbUoSQq/SzYYmZorAOUieCC9YnDGg0LMNb/GZWge+j7mgGsWc/RXFcaTKssqI/YprMf3mkA5wlvuiD24O2pxg4rXy6YN1gRyXFIrGcbDqwHbUdLQYOKC56eF4nimGsLOaPXXwV9cq27pwGckuotfqtrPF47apdAr9VH2GcAlbOq2Jhfzg97qbKkreNYrtC+WapBWX8OY1Hxm0tr/nDeVfHYq/6vYP0d8V/qKS2l6jNjI/ZR9i4AGbZxSUgPp3NWW4IH4mR4a6qq3cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jPj+r+Xq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jPj+r+Xq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNFgq5q4wz2xPT
	for <openbmc@lists.ozlabs.org>; Sat, 06 Dec 2025 02:30:29 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477aa218f20so16435065e9.0
        for <openbmc@lists.ozlabs.org>; Fri, 05 Dec 2025 07:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764948621; x=1765553421; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
        b=jPj+r+XqADmA6zY66dIBZqZUvNJEmtSb4vpsBUJdgE2HoDmAMSm9Xl4F9ZLxLDoonJ
         /jyaW8ktjBZkJ980LPaG1d1HIJGyM8A6YkHbw5op6qUZFT4ALGF3lA5Guu81EoGtpAdg
         NbmgFuG7+w6xjpGOPw+VVjcfgB3lId37UTnYqyOz+LBJ0Ej29un6ZtsZ6TWz8YbcDq98
         WlD75tCj0wvGaR/NZl3XbrBWn7SMGDfxNQ2PUCWuGl9Ryf+KZtPyjzNXdA3/zlxSjRTV
         3KeoFG+/WI6RZZrDK77V4XXdQJWpfGBNbl7cZOKSl5NDtpxDwK6H5Uf4rsTe+y6IXn2K
         rlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948621; x=1765553421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnF87if676vlxacDwch5pHFPRT0g1yDIFuiGnidHF4s=;
        b=L8CNyQPB4yqn2J5C1mGuQ4h8Vs39tHu30+PPbKWVP2ItXWxfPlOQhhkjZzB7iPIF2M
         Rfje8kGcpBcDqpf8Gxbqcl1BMMiXLgnfQbO7ktIz8VtALtSXmlo+mO4Acl7EY2GeNlEt
         miokXIR4S+YgHf+lztQvOJmX7oiiTyllCiGQGvOjQu7Gu286wyYHWY1Z3EYls8p0O2qa
         wf8ecID9HSzs5tq3iPbsOqMhCrbgw3Zskpm95tTr6YASzH/cmSJcwM9+198CoRfPZdwi
         WXo/IywJhXVjUh8MRBNOpPRz1cwUC6TGh3aUI0pNS0Y66+NAEvTX0MN1oPU15kdoyW6i
         5zkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrpV8mMatjWQuwAB5qcApjOeC0coWF0pj/OACmc2E/mrS3tSfY5ZYPT2P1FLXy2LIq60j26abm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCtyPTSbqjUHaaGzyScd/L+68plMtGp101nwaBnr/o4PkWFToC
	ffVBiow5cyUIoBgHfHaSTSnIPcJUVPPaCLd4HPM/dslhx5tbwH6MEZ6/EOyI3osyF/A=
X-Gm-Gg: ASbGnct+xjiajjUJWRw00J1THBAFF/s2PR+l8QYGMTa75v1tf+CKSiN6/SjG0PN+6hC
	hWsLl4s8vuFmo3K6VSkR8zJAudHknyOWmuETzSpSxq+tM07A8oYHioXMEuzA5wSr7JK8h1PSrsg
	IVi6jO0vAGEW7wIpap80pbiArD+lnKn3zzSnyNI+DFue8uXJdcGWFJ3MR0gE4SX8d6fOjYp5RXG
	KBDXNYbI7ATJehPOzrKurQPOr6SdKMuRkDcb4vryvIvlm47uxqWN8+EdM1tqtuQgISOEWTLrZVN
	vmdd4EgjY8JftRkVXS0aJVJ3rklvlS/FIPpV1aLDG43ZsemSMSjwV/Z6lsISWsT74OaXKsmFJb+
	gmYrO2QgsSOCTPucm4l7j/Sm+bcFls8dPMGkv6gXpYlyHKcd6FIggNjzjq6Ectja8VRr9G+ifTg
	w6R1mjelBzJjqlrKK0UKxXbqysi2Rz23nykJQsYuBnq3cSakRtscdGmyZHzbs4izZeMzXxLialT
	Q==
X-Google-Smtp-Source: AGHT+IG9OTpWAaFioAhUqNYkEUIfjg2JVgLW6606fMapNPZXQsf9lwNr2Fe2wAiolNVCjjQfc9D6Gg==
X-Received: by 2002:a5d:5f45:0:b0:42b:39d0:6386 with SMTP id ffacd0b85a97d-42f731e98eemr10449236f8f.31.1764948621389;
        Fri, 05 Dec 2025 07:30:21 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe9065sm9319885f8f.8.2025.12.05.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:30:20 -0800 (PST)
Date: Fri, 5 Dec 2025 16:30:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/12] fsi: Convert to bus probe mechanism
Message-ID: <tkg3ut5prrbur6dqh7elxmu4djqj6dgsymmdzalg5gtqgnn6jn@6pi2fskmnbyb>
References: <cover.1764434226.git.ukleinek@kernel.org>
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
	protocol="application/pgp-signature"; boundary="yfs5kz5w2cta6clk"
Content-Disposition: inline
In-Reply-To: <cover.1764434226.git.ukleinek@kernel.org>


--yfs5kz5w2cta6clk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/12] fsi: Convert to bus probe mechanism
MIME-Version: 1.0

Hello,

On Sat, Nov 29, 2025 at 05:57:36PM +0100, Uwe Kleine-K=F6nig wrote:
> for the quest to drop .probe(), .remove() and .shutdown() from struct
> device_driver, convert the fsi subsystem to make use of the respective
> bus methods. Some cleanups are also included, I noticed those while
> working on the conversion.
>=20
> Regarding how to merge this series: There are two drivers touched that
> are not in drivers/fsi, namely drivers/i2c/busses/i2c-fsi.c and
> drivers/spi/spi-fsi.c. The easiest would be to merge this series through
> a single tree because the i2c and spi driver changes depend on some fsi
> core patches and fsi_bus_type can only made private when these are
> applied. I tried to quickly resort the series to only need three steps
> when merged separately, but this wasn't trivially possible, so I hope
> Andi and Mark give their acks to merge their driver changes together
> with the fsi core changes in one go.
>=20
> Note this series is only compile tested as I don't have a machine using
> the fsi subsystem.=20
>=20
> All the calls to get_device() I found in these drivers look a bit
> suspicious and I think there are some issues with lifetime tracking. But
> I didn't try to address these, so I'm just mentioning that here.

While working on more such patches (for other subsystems) I found a
problem in this patch set. Please don't apply it yet, I will prepare a
v2 (and then also explain the things that need to be done).

Thanks
Uwe

--yfs5kz5w2cta6clk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmky+oMACgkQj4D7WH0S
/k4phQf/TtGRlPwbVYnyLP0xN1AzA3+J1cbc7ZQfmjPBA8VMd4NuPfJYbMYA9S6k
v4ssPKpvMCGVgU9DVWY+HMAmtejMLoj322bJ0N/8YAt+eTlFTfctwKNRPZWU7Nbs
HHQhj9D4Z6/mCwYdULVTeLZRzTf7lJf8MPFdlhpnHcAZrlzEt5MM1fHsMKf1TRl7
whcDek39s9jy75CN3kR3Cb6LtmRG5eigVl6JOQ220UgKX5tZ4kKzuvDHZQAvCxzF
pzM5L7aPOU7xjDH/d2M2CB7ooQ/OslKGo+qZ4aJu0Y9zGMEwuti9fGQ5AV75tkgL
5Iaaxj8c2PLV0tWwemlo5uyUUYN+ng==
=e/VW
-----END PGP SIGNATURE-----

--yfs5kz5w2cta6clk--

