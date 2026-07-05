Return-Path: <openbmc+bounces-2194-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B68FC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 14:36:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtVRy62ZMz2yd7;
	Mon, 06 Jul 2026 00:36:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783262206;
	cv=none; b=XMsqgEF2cMMz09wVrkuWAyuM2oYXtncfgmgsdaGB5YsCpd+WJE0i5pcYKvW1QmZwjA/J5O0g0CLuNG4Ju1dilHW5A2jDaStNHgqoqFkr1h9HqxCgRnXXoELvAE9my9dB3sIx894kCjrrYI4EfpYCfknIy2DCLKAt5TKizlTy0kToRrvzRNxQ5KU7tSxwTrlVegC6yiE0zAVI7JyKg4Yih2ed/YarGSuqGQov8OsnZ/oOKyLftBQvsrxfNFVZnsjvBITJRMWaYUw2bO+zfjfDGL5OGjFYDUpZhZ9HOyCahh5Nwix10Wjye6vOjOWYwiUpuIMMDFeUhqAnLBODkIizlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783262206; c=relaxed/relaxed;
	bh=+IDjOgvMZgIQmetcLrnnpwM1F1TovTt/ay9+vlVBx9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCiGwNsUh0ZJTUdA2l6YHsQW/81GlNZFI/pJf3QFTgIuDUZ5zJ8Xe1g7BAbvOmUEO9FJKpo7SoCM2XgSx8IGaAzWbpoN0YgH14ubhGlxH4ekYaDty57u4Lz3q14lyZvzAQiFDYLxLoZjhgUcfMRRwXIwLrJfcBYliUYzMEyRhs//WpV3PIJtt3K5af89PadYHXJ4XTPhAJ3Dw/axnObwimH1EjdpjwGmTaX5Udhg1aqU63yM378r92g1u9y9VUO8kcN0A1uDl2DoMltXq2oquf462s/Yudb5e7vw+rj0hqUDCWkyAyyBEXDZC6oziAXnRyrS3AK8OyoeUWSaEYswFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEr2sd3z; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEr2sd3z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtVRw2xbBz2xYg
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 00:36:44 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A92A1416CB;
	Sun,  5 Jul 2026 14:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF6C1F00A3F;
	Sun,  5 Jul 2026 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262201;
	bh=+IDjOgvMZgIQmetcLrnnpwM1F1TovTt/ay9+vlVBx9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEr2sd3zLoF5/BTzOLBehR/gZ+XtkN9iD2D+uHFYFKG+UJ8K2j71ODrygr5sKy1lt
	 z6ypXkTjFi7ksiVdP8bZ+BVjdG6v4esdT+yxndNyuobZod8lFBSztQNdTY3UNrIU8Y
	 pV2yvpW5IqOTPNbBpROMAO1tbomLeCMkWZFzQHBsoHV9f2diuB9dQsTDe6sP44OIBw
	 yItLWDbAmkotsklsKX23AZU+vJi2NTkcLqLFC/NjlmMRXuyFLnvxXn4Rcfixk/ni7k
	 78jEKGPmD/E5Unr6XRU8NKGnuC1pqIbvSe5aEcAwIR76cm8/2r1NifxZTg4zTYDiA4
	 RqzPoE8N5RUtA==
Date: Sun, 5 Jul 2026 15:36:35 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260705-gruffly-curing-ae3ab1044a94@spud>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
 <20260705140100.1543486-2-tmaimon77@gmail.com>
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
	protocol="application/pgp-signature"; boundary="UuJ/2UbYFy531ONn"
Content-Disposition: inline
In-Reply-To: <20260705140100.1543486-2-tmaimon77@gmail.com>

--UuJ/2UbYFy531ONn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2026 at 05:00:58PM +0300, Tomer Maimon wrote:
> NPCM750 and NPCM845 latch watchdog reset indications in the SoC
> GCR block rather than in the watchdog block itself.
>=20
> Add the optional nuvoton,sysgcr phandle so watchdog nodes can
> reference the shared GCR reset-status registers that hold those
> latched watchdog reset indications.
>=20
> This is needed by the following reset-status support, which reads
> those latches and reports watchdog-caused resets through bootstatus.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Since the 450 doesn't support this, please make it conditional.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-w=
dt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.ya=
ml
> index 7aa30f5b5c49..99c225f166db 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> @@ -40,6 +40,12 @@ properties:
>    clock-frequency:
>      description: Frequency in Hz of the clock that drives the NPCM timer.
> =20
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      a phandle to access the GCR reset-status registers that latch
> +      watchdog reset indications on NPCM750 and NPCM845.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--UuJ/2UbYFy531ONn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpr8AAKCRB4tDGHoIJi
0jzXAP9V+LH1kp6iYX1iEVWw/AAWNuNW+o54gflPkE8U5Q8X3AD+I57wifDzW5ES
KiTAcjkS45d13+QxSzYtdn2yBkuizg0=
=coSg
-----END PGP SIGNATURE-----

--UuJ/2UbYFy531ONn--

