Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F2606A331
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2026 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jYpYt1qHRz2y97;
	Wed, 25 Nov 2026 03:44:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795538673;
	cv=none; b=hT/3WJvg+VTBpgqEKJN1aVYfTJjHmHdGoOgm7NvzIPG6UwBQwjioQ64rO2PkzaloYKaqa98C5bdq13IZp5DErjElg0MeV4wY61RXmX1l3ACEYqY8IS45endlelzSJLFQ+pO9xqD4NVBmBxk/ECZUCpNHpj2NpSAYW+q4nIJ7huhwTnm0M3OpWFce4pbRv/m5xCk5rbm7NAscHnMAFrZJw6NkEwPnxjUtCLzC4hLSjXa8Sn73i0nej0/kyekGsOi927E+inAZ5GZgnJAFYpNRamWcdrwL4A4hSh2/I6aC8k0a9e38wPR9svGBb5ICU+pT9A7LEdE68iMS/sfZj6xC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795538673; c=relaxed/relaxed;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kl19s8WmalbR8dkXHDPCpAYyDPTXAcMEuG4SQY0k2SVQl7B2Gmr/52fCHKnQIqlU7KcyXWWZdGf3bq/KionqoL3SWnrl8h9/Q04IWXoAqbLLP4XZOJZzkiW35Lngzod9Y3cTwKdlmgAzD+CxI/3IvvmcH1c7RVYiCoM/QOrMlv36W+W8OTgJ0Ro6oz6/VFtBQ0OcLXDKVtf0kX3mIlUZPe8sqjE4+5P3Ysa76Le4FjpcsedkNvYx8A+OqaxTjlOufhsj1t08zQEPTj7EFQzUWkPQ72845ho78DxjQeLpIrxuQhoz0nVQpUrgFGNuh4Gj1pir/NjHvlO7eYkGPFahvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lLrpdG3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jYpYs0qywz2xLm
	for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2026 03:44:32 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49AACC2C65F;
	Tue, 24 Nov 2026 16:44:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA401601E1;
	Tue, 24 Nov 2026 16:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5BD011E69A74;
	Tue, 24 Nov 2026 17:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795538666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=53M/jNU7gvao9zbUz+MPtUuoMg3rbooohKcY2RF1rFE=;
	b=lLrpdG3YSYonKsqjZ0nA4v/luC/lUV71hkWM0DMSi1Ut0YO3tpa3cvoqynxNCaoMzUu59p
	XibZaxK6u94QFBrZOu94Dvi2gNXxAZ4gTtAVdvriNTG/55I7Pqy1NrDfxCX+WIkOSzmX6f
	ScdRBDRkFB7dYJU4SutHy0rRYSABMxX8JeyMNWwId/jrOufL/rdbuszoslllhDDBeFxah0
	ZbLayFiNzZNjTcJKomgKeB4uwH+D559Jt4Goj5tjp6oHx0Y3MClE/5WbPg02Q5FyuPpb0N
	lL8Q+pAeGEjfDpE3g7RH0OhB3qY+KGGoRzjTfr4Mv136UL3b1tigVv4EOix67Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Richard Cochran
 <richardcochran@gmail.com>,  Arnd Bergmann <arnd@arndb.de>,  Brian Masney
 <bmasney+clk@redhat.com>,  Jerome Brunet <jbrunet+clk@baylibre.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Andrew Jeffery
 <andrew@codeconstruct.com.au>,  Avi Fishman <avifishman70@gmail.com>,
  Tomer Maimon <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>,
  Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
  Benjamin Fair <benjaminfair@google.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Krzysztof Kozlowski <krzk@kernel.org>,
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v12 02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as
 mux parents
In-Reply-To: <179519171774.3795820.3637822831411003847.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-2-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3637822831411003847.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:44:16 +0100
Message-ID: <87y0aiqivz.fsf@bootlin.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

>>  static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *na=
me,
>>  				     void __iomem *reg, u8 shift, u8 width,
>> -				     const struct clk_parent_data *pdata,
>> -				     int num_pdata)
>> +				     struct clk_hw **hws,
>> +				     const int *parent_idx, int num_parents)
>>  {
>> -	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
>> -					       CLK_SET_RATE_NO_REPARENT, reg, shift,
>> -					       width, 0, &ma35d1_lock);
>> +	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] =3D {};
>
>
> It works but a little check to make sure we do not overflow the table here
> would be nice.

That's maybe a bit more future-proof so I'll add it, but at the moment
I believe this is almost dead code since every caller passes a static
ARRAY_SIZE(). But not a blocker for me, will be added to v13.

Thanks,
Miqu=C3=A8l

