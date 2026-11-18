Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2A606A6DB
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGfP5gPdz30Cj;
	Thu, 19 Nov 2026 09:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795015523;
	cv=none; b=iQLAg+oPeEx1xQAuqm7PhN0nzkZKwsYe6kLpPmrX8+8/BFVyKL5wA4+dNJ37J4W/400QjLbnmm9MBw9rDgTT4fIrol0dFPemNt3wWE9U6D7yWIyUdgBVdgjcAVrg3j21akZZVIa3Dj0gxjphqvyYhHOFFD/q8hV5+vT9wo/IsI11Viz4LE6voxjjNwjIrdV2gkUEUjIYBEjVjJuGFYf3BhGBzEDV8UjOWqc1zw4UuJE9GqcEel5ODChIS7c5gZh/ZHJ+98Q3q/6WDzox8gpipt5A6TYr4ee1Q8qF09oX9Uub2jtSVOiZS1U8OP7bXBfyzSaSNronWb7oqTsUdmTvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795015523; c=relaxed/relaxed;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GLQRDd0otqZU/EMkmwV9dJfJr5MsrFNDX2fsDhnUfe5QISyA3GoEichIUtmPmi92e4Nxa1knQGnMCn9r7CkV0VJHy2IZRXTrX4YKBN8mV/cmPhO3bADt0+Jtm2WPFByr3Qm1RFKZrKBLOW0XC5bWgu0QqWPrmdxhJSR6J6ZhVSw4GnZuSVc6NHENUy/gOk9bLSxP+9BI7ycO82kDQndaMeGkgLRBuVOiQQfrtzfdUe1TWugFpqt1ksh48+IStqu7hayROyjoGRY+uEfhOv3owPWCau3bSqg8ErpYvKBSskzLq6bZV0qBVU8LmrOY4yX/Javz72abj5//6TZaY5eJvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ez0Qk31S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV55G43Hmz2xL4
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 02:25:20 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7FC39C4F77E;
	Wed, 18 Nov 2026 15:25:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CF7A5FFAF;
	Wed, 18 Nov 2026 15:25:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD84511BC24A1;
	Wed, 18 Nov 2026 16:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795015507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CEm9dGLjcVwIMaOu+kqX5t+aM+qvinbpRnz4RyrHHjY=;
	b=ez0Qk31S9QtS5y2slTb9afsub9oCe6bae5MiTUqJxpin2qhPa/86oOfDJEL36e+gl/hq0N
	kEnC3vQ/205ru9vEC10gYcjPTsRmnX//2rgC5Wx2FKON3+9NT/nmkCxBY3JiKRzDAdVXDe
	X1QqcVc9mq8Tj81LItHKUr3ofwCvWX+JtRYzEAhcWSCgkhrhTRrfxydmvXQ95204cpIt6K
	wPa5K1JZo6iSY2/i9QSdi1nO5hAo9BZ0jMf4fM1/dGszaXdZohsemd7ReSwIaLpNxZ2kPx
	XVhMHVqEHsmm/OVrCmCKoxpzsAw/VuzxbkvgKNQKcjKbhZzL1VqNr1rtLkFGhw==
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
Subject: Re: [PATCH v11 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
In-Reply-To: <179501501070.639563.9357303541273366380.b4-review@b4> (Jerome
	Brunet's message of "Wed, 18 Nov 2026 16:16:50 +0100")
References: <20261118-perso-ma35d1-upstream-clk-v11-0-bd1d1e060926@bootlin.com>
	<179501501070.639563.9357303541273366380.b4-review@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 16:24:56 +0100
Message-ID: <87o6bmgo1j.fsf@bootlin.com>
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

> We've had to base clk-next on v7.4-rc2 because it carries a treewide chan=
ge
> around devm_kzalloc. This was triggering a lot of conflict in linux-next.
>
> I did not look at your series yet but it does not apply cleanly on patch 3
> (maybe others too) because of the same change. Would you mind rebasing on=
 -rc2
> or clk-next please ?
>
> https://sashingci-clk.liltaz.com/builds/555/steps/3

Yeah, it broke my MTD branches as well... Mark Brown is having a fun
time noticing all the subsystem maintainers one after the other.

Yes of course, I'll rebase on -rc2.

Thanks,
Miqu=C3=A8l

