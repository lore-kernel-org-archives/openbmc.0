Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F060A2602
	for <openbmc@archiver.kernel.org>; Wed, 18 Nov 2026 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVGfB5mzRz2yr0;
	Thu, 19 Nov 2026 09:36:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795021572;
	cv=none; b=RSUbbE5VhnA0EZtDd7ZpT3+k0N0GqRV/6Xeb1Bb6A1aBU4pojKzekJ7KSQnersgaUR7cJUAFbn1+7seRjJR3nZG6WlsCP3836sVSg2fopgmLvQnCRBS9+pD4dR6mTXHdpaGbIioqxvoBa6iopUDRZE+Lz1Agrw46VOG/aLNH8SLdLyYlKeCqiqdCtew6kx/ri8VIerhphUGIpEsSy6X59YMd3pOK7g9Tzjn1U6Ma9TlPEh0swjgyJEG/0ZLp22IIqxBBHfrsYA0/sWdCZXMQb9YbrSrRuC9pgUdcasX0HEhel4GtQUC5qtsN3CnUo3jLzBiTl0g7MF2aJUpng2nTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795021572; c=relaxed/relaxed;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViFVha01bR2lHjQbbHhSrURWDVlNCXTkY4hfP7DliZcSeDBF3w8msc184O1ug3z2kjl9VVPc9V2QDgP+T2MAY+zR2VjQOg7rHWvmhyIoJOwD/4kZRw94h/a1sEjKggYE9SJdnSalD65drN6HXzf+X/XSImydzQ2T40CLpOdsHGrNa6UMqSA6byELSoPAlA8O2qT2o9IZR1weUGheNArdY/BpfkMYD3QuesdgrXyXp7RCQA+YlcvU8BWCthQO6lZlYAlKc8GbYq3ZVJZ8DvKiWOgGpa48zkxdtvmfQfOs9WGjmdNvAEmOjesuceFoZBBI93UTYRllEKCIApKyBj19oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HjowiW6d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jV7Kb44DQz2xMt
	for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 04:06:11 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 907434E415F3;
	Wed, 18 Nov 2026 17:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 557295FE9B;
	Wed, 18 Nov 2026 17:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14BB911BC29F4;
	Wed, 18 Nov 2026 18:05:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0l59jLbipC2nuCODIXqu8qHn6K/XZMBe1rHBAYgKxIM=;
	b=HjowiW6d9cnuFS7xom0UpdyuXfkba5rHwRDOHDh9NqO4ULYxHW1hqPaXSewzQPfsci8KhT
	l8nLmYeZfZewI464Fh05UZBpnOEoZKC/Pvie6JUA6unQw3Zx20Ks1Ft42uQAwLqkKsp1oO
	nnYKQMuasEoDM/PHeA9P+iwbKLknSeLzcfYrz6sYrKzoxsAESdxvKMJ3oireTKUPo2Nm2a
	1fQ2j88ZmKycX4ORfCYpWt1AC1rVbjnZWESI5igQneLqtgNYV3WGAYLpgCyBLtK/Durfnf
	jhYIK7dD1F7CNxWfSvnCydSCfAw1XUMfm2tBAqNIHYvvuZ2zjcqi1csHRgL7pw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:10 +0100
Subject: [PATCH v12 01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT
 legacy
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-1-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The whole clock list is supposed to represent the clocks provided by the
main MA35D1 clock controller. Yet, the comment at the top is wrong by
definition: it lists both external and internal clocks, which does not
make sense. HXT and LXT are on-board oscillators which are now correctly
described as independent fixed clocks with their own DT node. The clock
controller is a consumer of these nodes and a provider of all the other
clocks listed in this file.

A look-up towards the HXT or LXT index through the clock controller is
always wrong, yet possible (even if totally useless) with legacy DT, but
should not be made with a recent DT describing HXT and LXT oscillators
as individual nodes, hence mark them both legacy.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 764d837d6162..ad0b281da45a 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -7,8 +7,10 @@
 #define __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H
 
 /* external and internal oscillator clocks */
+/* Legacy: HXT is not provided by the clock controller, do not look it up */
 #define HXT		0
 #define HXT_GATE	1
+/* Legacy: LXT is not provided by the clock controller, do not look it up */
 #define LXT		2
 #define LXT_GATE	3
 #define HIRC		4

-- 
2.56.0


