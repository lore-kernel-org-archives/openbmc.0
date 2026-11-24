Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC5606A323
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2026 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jYpBx02bHz2yCP;
	Wed, 25 Nov 2026 03:28:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795537688;
	cv=none; b=ok165ztSJ5PIq072egBAvb/wKIwklSek7y9bA7TjfCiyzPTt9rcL5D0juTquPM3FKDFIpLD5hwKEaj3J0J46p8h4Q6ZgX8DzzJqW0ZIeQq8mBNI5xK5yazI2CUbXLOqwBeu6a6HHpbcuXVyqa4CGhAE5JY+SJPlQ31tAdn74R+QHCEJLPXXXCHq7qeus9Ln+RrUviNuYGJ+YZ/oEW90/2bsxmL/zXTK4xtNhFghTOlKpRVplwG3vP4TG9umPJ4YlL997jdqXl9012bTusDJJatRHxOd4w/PD90WX/QL2mGn4p2xWJ7niG//gOTINPYuPG/d7/S0QfdN9NyVIG2twxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795537688; c=relaxed/relaxed;
	bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fzbX8m0u1xIt0LHJJZJbdApkpogzo6ZTKHpAjrDOFHoN1bCGZhDZD4zDpDVx3ESEk0bQfLcHyLFpXbOqVRR28PM84IrUaAZcLA6aAfwrRD6ZIdDyRYfxdwO4EK+UbwybJXklJ+wbII34qVIoOHAtUJg9RogIIIF4lRxUeDeiDBS+RjfEqfdHsJ0+fY0oNhV1wyDSf4CsVSSgfuQPIOwtTIYO719r7vatHVlhxYWSrmIDe7n33tcfTnJ76FcUGTXKXVD8MaDnxCmRE9+ZmGokIPRh43UiTF80kYk64lWkvJ96LudvHbGds50Fd/ze2MPE/LrYyDZYLBQv7hIg/E3U1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VX3JpSiO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jYpBv18K8z2y2L
	for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2026 03:28:05 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8062F4E41746;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4031D601E1;
	Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E60F11E685A3;
	Tue, 24 Nov 2026 17:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DkZ1ABuSs0XqFw9KTioPWKhCAj31GhHamAleqCJ6xL4=;
	b=VX3JpSiO8UcsPsmc75P4wD4phG8vOx1B3MRJNmTyfC7zJb50+OJmlJSmktDpqTssYXTRYN
	WtnjgCsJtxVUkuwCv1935gtQllbTQllpi7dDfBel5QJxh598glIlMV3QxVubhw4K9jK5bc
	NH92hMlCnISr9WG1VAfTqLNbx541kJOPeLyrENcQq+zjNnKBpT1pFT/IFFncSSjkWJkhgV
	srDTCwPjFpYvNGTtZNFEOYJf4aDfR8Y6tnoocc+w02VBnzwCWplkU/2Y4d8ujgEavS3sOh
	4SnPKaLdxWZaKdFxLtcuSiWa7Bc65AmwjNLxFrlalOLO55EJvTad63tEZLqz7Q==
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
  devicetree@vger.kernel.org,  openbmc@lists.ozlabs.org
Subject: Re: [PATCH v12 10/10] MAINTAINERS: Add myself as Nuvoton MA35D1
 clock controller
In-Reply-To: <179519171774.3795820.3121589367853881174.b4-review@b4> (Jerome
	Brunet's message of "Fri, 20 Nov 2026 17:21:57 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
	<20261118-perso-ma35d1-upstream-clk-v12-10-bee2c8dad4e1@bootlin.com>
	<179519171774.3795820.3121589367853881174.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 17:27:43 +0100
Message-ID: <874id6ry80.fsf@bootlin.com>
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
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 at 17:21:57 +01, Jerome Brunet <jbrunet@baylibre.com> wrote:

>> I have the platform, I currently use it for my developpements and
>> therefore I care about the clock controller driver and the SPI
>> controller driver not being constantly broken. I would like to step up
>> to help the Nuvoton team (not visible in the diff since they created
>> an MA35D1 catch-all entry) in the maintaince of this driver.
>> 
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Commit log nits:
> - The subject is missing a word: "Add myself as Nuvoton MA35D1 clock
>   controller maintainer".

:-)

> - developpements -> developments
> - maintaince -> maintenance

Will fix!

