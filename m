Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F1606A319
	for <openbmc@archiver.kernel.org>; Mon, 19 Oct 2026 23:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FvItgfkB
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j7sRq72rPz2yD3;
	Tue, 20 Oct 2026 10:38:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792397613;
	cv=none; b=CQD9PSWUTqqSFUY1Z0fDrjDm8gcfoT5xh+7LHrmkVZPGwQhaQPyQ41Vd8TqQ5gky8lCZcuy95GMUowq9rRnBNheMwJhcnlDr97WiEvDFWiViQoRXgz8SFavgAGbFPp+da1onhi0iqNXfchllGYkIOpt3JPS5BCRfcAH7qyzWhifas1uuHgo3tCopMbpaeWAsAP3O1D61wRHwh6CU9ezhsP3uuisLyEVLgXxisb8mqbH5s0owjpIY/W4H7k3/C1IjDHMXPKdGHK5Yt9ZgaZ8ySe4NZrWq2IqsKfyDyuPrk7D7q6tiaPAuVH9F9am5PJfRmXDsYwnMP/4WtyY01yoIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792397613; c=relaxed/relaxed;
	bh=trNQO0U9XQLBOWcQGLIc+ci4GywnkatJEUe8E9u6r4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RSjy63ThG6YLGRJzGUcph+wfASreBYRF7+SjufXKU3771YFGnO1KYnERCjsFIPalIrYvsQQLVZ43doECZ+h4wDy/eoC0AvCz/JwLXJhByqaaADTABX0AO/QN/fgS+kXX9r5M2YV1sZv64dOl4F8XLB790KAKOh4QIDDc1dNMfQA03NIdMX3ANesklIxzDPBdsKzxFjIIQ8n6bLKkFJcYxCygLcmxS44NruepRjwLoWEncO2OYHjNPUZwqwdztG100mHvSFP0OADzT6A/DSTT2ky4j4UNu9xQ6fTPwiQjw3n9rTrtV95Xm+jnjC/THDE7ZGQ87EIp+fN8lSE1H/TOyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FvItgfkB; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FvItgfkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j7Swq42gVz2xPW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2026 19:13:28 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C341E1A1208;
	Mon, 19 Oct 2026 08:13:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9304F60582;
	Mon, 19 Oct 2026 08:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C06F010328429;
	Mon, 19 Oct 2026 10:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792397601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=trNQO0U9XQLBOWcQGLIc+ci4GywnkatJEUe8E9u6r4I=;
	b=FvItgfkBI0uIwemxLOQyXNqDxWTC/p0cGmtkocphPeGleMMne9ZPgFH0wpCiMNJtFVpPKV
	+g1u7KYl2AJaktUp0fVPQLS+bEuvTbJB9e7RfonI4dpFbM29cq7QBf6xt9KPPehchHuHXd
	yL9QIyg4JYh8gCnBNPJ6z9OjGOcL6rHMvJ4pldB6QC7y0LtoBGTPEfyj1ez4iVYMO+ng/q
	JMi6xmyW+h7DjjhbvAai1Swrfgsi80X7i9etz4cbWXjgsNa1VDPhuykMnp5o6ABI+955Z9
	ZvqH8FrEy2lodwuX4g7n4uCq6sSiR9PjTSTaoKfSY+jmZdAOcgF6y18MWSRAig==
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
Subject: Re: [PATCH v10 03/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from
 DT when possible
In-Reply-To: <179224882241.859276.15035084302735586039.b4-review@b4> (Jerome
	Brunet's message of "Sat, 17 Oct 2026 16:53:42 +0200")
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
	<20261015-perso-ma35d1-upstream-clk-v10-3-47c97b54a809@bootlin.com>
	<179224882241.859276.15035084302735586039.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 19 Oct 2026 10:13:08 +0200
Message-ID: <87zewayup7.fsf@bootlin.com>
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


>> +	/*
>> +	 * Old DTs do not describe the low-speed crystal. They may also expect
>> +	 * an HXT output from this driver. In practice, nobody should use these
>> +	 * clocks directly, but they must be kept for backward compatility
>> +	 * purposes.
>> +	 */
>> +	if (num_clks =3D=3D 1) {
>> +		hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>> +		hws[LXT] =3D ma35d1_clk_fixed("lxt", 32768);
>> +	}
>
> The above is fine but the problem is those IDs still exist and something =
like
> <&clk HXT> is still valid in DT but now does not provide a clock
> anymore.

Yeah, it's hard to prevent, but people would immediately face errors
when developing anyway.

> This is why I asked if you about removing the ID. At the very least a com=
ment is
> needed next to the IDs saying those are obsolete and should not be used.

Ok, 'next to the IDs' may be relevant indeed, I'll add that.

Thanks,
Miqu=C3=A8l

