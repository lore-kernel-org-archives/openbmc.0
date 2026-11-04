Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D60606A328
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKhfD74HBz2xjN;
	Thu, 05 Nov 2026 10:36:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793799235;
	cv=none; b=kZmaWGBDdhn45xOJYuoi9BC7cOq3dcv20X0kkv37JKSlngNXEVdl3da+TmhfLMkRcHGXwAalFLBi3Yb4Wqqkt7PNeJ5dDvJkcG7aU8IBoJ0fas/7W49Tdz2EWSrcLCAObTUP4l4tVCVSzH6jv54EYX/qt2kkERzrRYwwDcolTCZzRr/s7z25aoik+CtqGKJlSuNmeJoqI1j9Rxx03U8tbIIiryEN2VYtl1JV9q5cj5XehfrC4AyB7OryZBZcwsk8+0hHBdtisALVjW0kSD4/ZgkV6f/bshHURRdujji0APTPq9GxAMJhXV07r/y67SOSLbjzGrgre+ZxUmUehGb6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793799235; c=relaxed/relaxed;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BF1a1SGSIsCF7W4aaIj35hxAFt4qt0playaYtZeyai5XNFDghSBBKJTWraIBZ/cLLPUbkHNaoHlm9Tdt4tn/3nkWd6Upo8sYorn4VtOuf3b8DlzFHhfOYCzTBZgjFoIbISylDhjaPJOoV15x6LJZCzRxy1vMaZa0Yv+JVaRzw+e/1RY8e2oCo7H3f3YbBkp7MD9Nv8SdtkJox1XodYgHAAR3XgLiY5t73pFVqP5zG8EjP1PuCt7Sk1QsQLBhTFJLqKGQmFW8eIJlUM7jYFHC83CVLa6vg0pOVpIo07CSWCCIdk/IRM0heyAQd2ixBNUsHJiLc0vQFF/uwYauo+BxHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGTSKrQJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKRH70Sztz2xSF
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 00:33:55 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45C0360EFC
	for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2026 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F252D1F00919
	for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2026 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799232;
	bh=PVt8UCw+TfAqWXt7c7OPgRoChv9ewjCNpbQoQTiOBig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QGTSKrQJZwvpkv6xFfz0xFpKlNVtP4IK1BfiXeQlkBVQ6YpCZb+4w+AIpjnfEf1tH
	 VW7jpzxPeJR+cz/0mhnC08zU0vb+858lpSZcXddoeFFmXxUh6w5fcTMeC+OFrg3rwa
	 rLWF8zSLHdoHy1ZMl8Mhm1Z+bUHsQ+qku+EP7tcsa8ZsfX2fGyHma3QOt9YCNDlRUY
	 D0KmuY1V1sL/d81SulJ0our/LUyNUT1SMhVbuWXBTQ6tR1hZsJyBEYV+w7pzgn6v8K
	 bdTsAvciKTRf+2QE1Bxgt9XIYIoiEkgeVE0j96kbjgpfpiZ3FDhAxYXKxxtyTMqPDS
	 EdDuOZd9oFwJw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso8483741fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 05:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwHSWxphbWgdgCVUv7S3BmTMv27qZ3gpG6KhcbJivK+sFbfonq1B1+/bp4i4v++lcREkDb3NZhB@lists.ozlabs.org
X-Gm-Message-State: APuU4Z8b/z16+2N2cSM/8tZ+2dyJSCa0aM83/VCNSRqMpxF58NBjoWTo
	MJkEqpNBuf9X2AQNEzCVM5QuSpIDG7i5kTpsXTC62dM+Hfpn2lcC7tT/jbRdJLO3CDWNZe/CrlZ
	AcFa3xWLcUMaF0RRgyKHjNV9czEYSJgU=
X-Received: by 2002:ac2:4c52:0:b0:5bc:e472:12fb with SMTP id
 2adb3069b0e04-5bfd957d05dmr5285778e87.63.1793799230807; Wed, 04 Nov 2026
 05:33:50 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025184335.447963-1-mashikiselby@gmail.com>
In-Reply-To: <20261025184335.447963-1-mashikiselby@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:33:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
X-Gm-Features: AclHuK_037ZYLwttHJYLlMk8ibW1pzsmDenfg-_6QVl2MfQ5g6KsS7LCgDFaJ_M
Message-ID: <CAD++jLmTOFRxSrnq3eXYR0QhDRGeRuPYNh141pByURXYv2CdHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in
 npcm7xx_gpio_of() and npcm8xx_gpio_fw()
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 7:43=E2=80=AFPM Selby Mashiki <mashikiselby@gmail.c=
om> wrote:

> Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
> child nodes using for_each_gpiochip_node(dev, child), which holds a
> reference on child during each iteration. Returning early on any of the
> error paths inside the loop leaks the child fwnode_handle reference.
>
> Additionally, both functions call fwnode_property_get_reference_args()
> to parse the "gpio-ranges" property into args, which acquires a
> reference on args.fwnode that is never released.
>
> Use the __free(fwnode_handle) cleanup attribute for child so early
> returns automatically drop the reference, and call
> fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
> succeeds.
>
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driv=
er")
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Patch applied as nonurgent fix.

Yours,
Linus Walleij

