Return-Path: <openbmc+bounces-2682-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A8CA5FA5
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:29:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXqk17sgz3bYx;
	Wed, 30 Sep 2026 08:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693137;
	cv=none; b=Hfp9RJVRvt2OYFkpQTUuWL+TrMID7XbnFiiGOBSjvnRsI9PUtXbayCtSqSjn+0nNH5x/VfW+9odUftGHD1pD+HidT2xubSxZ9ocTsff22ej7br0eTQTQL6AgTghxEVOQQmZRFe1FVXxb2GglEQpprDMKTBMWwkmVt8JvRYYx8ii+lQqkv+QeyhWXsT1w7AXzsCQqb1uZIFbUvRnBX/ArY2xTBYeTTE+ck7c2yLHKsIBSoHVOUN5ADrP5zWgDUqlsTwHTkvOfIYeHVpXUzGZLO6xWqJLTfyty28xbO/6SuKgqOIxMomlxwgxy8jdc5h2zjYjBoOFDElXDjfFI5WpXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693137; c=relaxed/relaxed;
	bh=aZlwpIBPu1P89TNsqQjaQwwNOwTKaGY+iAnuCror2mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtq2Pm4+Rh3kPZg6kod+J3KdShJNc7MPkOJOPfanb6aq8bUIi4JdPJPO6RrwgRhrrn1ksI5WGQxApUB+GHEv9puEZ5J92TnC69IHPfoZ+EoZkfeJHL4Rm/qsqIJC4UlN/S1PYOZO5MeoEYv2Y19BYd1mjW5rDwtIFAIX402GsMnd0C/BhVP0Q9cPYLYWgs0hKMnHBiNJRlj1HyVTmt/5XDyet7LteVbN3cIUwu3rYqILhP7Ue3jJ2WKilQ0c21Au7wQY4hEyDfGz3wLakSQnln/Fh0Ib+t8xgAQWIj2U8vAlmOoPnBmK1okk5d0XwAyiVEOj2oSGwq74dmjyTenQUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jbMgpp3+; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jbMgpp3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLZR5GG9z30Vv
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:45:34 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 082781A1065;
	Tue, 29 Sep 2026 14:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0420601BD;
	Tue, 29 Sep 2026 14:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A43310329618;
	Tue, 29 Sep 2026 16:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aZlwpIBPu1P89TNsqQjaQwwNOwTKaGY+iAnuCror2mA=;
	b=jbMgpp3+CmCzAMWz4y3BTvnTpdaRff9OImQbCK5MhapufHLfJt4D61Ve2nQfXVWlSsAqaL
	UUTuIRfKWlMyeJTL2bQr+Nsioep0XvncnbAaC4UQgJO5ftMz2+sQRpKaXfI8/i+jicbv/g
	dZtlCLqNPzaHtCetQPZG+BFl8pawfmLwYN9KLh/jiXI692UNj9QKeHzhUtoH5cNJZ5veyn
	bKNR/U0vkgpjOdzh2C7PW34ZYn8RSqQiiXAd/CmdzwjCPx8yFp6KnuZT5kl8IRCiVelUfg
	7aaGsQtU7f3wbyFhF1wqQTwxXZB0TR4ExB+R5AVdNtTxanwW+mhE47lnVYtWxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:44 +0200
Subject: [PATCH v5 1/9] clk: nuvoton: ma35d1: Keep the clock count in the
 driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-1-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
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

The number of clocks is not a binding since this is a value that can
change. As such, in order to support the missing watchdog clocks and
allow the deprecation and removal of CLK_MAX_IDX from the bindings, we
need to switch to a local definition first.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517..6aa42a3e1be3 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -17,6 +17,7 @@
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
+#define	MA35D1_CLK_COUNT	236
 
 /* Clock Control Registers Offset */
 #define REG_CLK_PWRCTL		0x00
@@ -467,12 +468,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	int ret;
 
 	ma35d1_hw_data = devm_kzalloc(dev,
-				      struct_size(ma35d1_hw_data, hws, CLK_MAX_IDX),
+				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
 				      GFP_KERNEL);
 	if (!ma35d1_hw_data)
 		return -ENOMEM;
 
-	ma35d1_hw_data->num = CLK_MAX_IDX;
+	ma35d1_hw_data->num = MA35D1_CLK_COUNT;
 	hws = ma35d1_hw_data->hws;
 
 	clk_base = devm_platform_ioremap_resource(pdev, 0);

-- 
2.55.0


