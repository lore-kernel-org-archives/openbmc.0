Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89B7606A326
	for <openbmc@archiver.kernel.org>; Tue, 24 Nov 2026 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q89+Bx1d
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jYplT4mcQz30W5;
	Wed, 25 Nov 2026 03:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795539173;
	cv=none; b=MQYx0qXXKVomxGwR3GvNPZyZDMoNu31gLyadOb5avwRsl7hpN5W0zUn7fxaEN9uzcnZ3SKm2ynfoylM8rvDIdDnxlWtMCvaEZ645FzfI9gTh5ccZs5vQ4aF5X9izydarvkYsuF2H1vWVZ+t+pKFkDmRqBrCCOjLc3D9ilEogZVaiQBhUZjz2G7P3bOXaN5vThRJ0S5eizyyIuZtmDz1QJwHQ2oAkjJJGGDFWS3PvI4HJpM4WSCx1UYPeLQC8ZH9x20AGzR8s0wf2nDdEFh6v+FH+YY84ikteuYMexGSksjVxRAHFE35f6Hm9SHXE1HVNuSOiW5vK80opD6wJvTO1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795539173; c=relaxed/relaxed;
	bh=23A2BUHFe6VM/AwKx+Mlw+Ey/1Aj8HnIQKPlokLPThU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeu5rrO/1Fu+31SZHJJ4T01/zWSNHIcfK5AHI3+TDIIuj5Ojs32zs/HzpMxpF/eiFwg3xMVYElOK+VaBRSzuLuMoKY66mSyr6zJb8SmQrkeNIPxbLtMrBfoE3CXJS1Q27XXqlGPhHIVmFethw0cujy3VzqmoWgLaMxBS12XlGhP4stRte+Xjj3ye+lAClcDs+0WjvqPIxvVPzuZYi63TmojuZpyEsonKmxPT36S3CqN+P2GC719Uwfa0YSPV8H8yy7BfftF/lFaB69VIBr2he/MMixbTXLz6BFL67XAqSESZLtG+lhNv+jXXWYilwgf9HA5ZJyK4eeHg8Tyj7gx2xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q89+Bx1d; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Q89+Bx1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jYplS5VC4z2yMl
	for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2026 03:52:52 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8EFB0C2C65F;
	Tue, 24 Nov 2026 16:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 145B7601E1;
	Tue, 24 Nov 2026 16:52:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2773511E69A92;
	Tue, 24 Nov 2026 17:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=23A2BUHFe6VM/AwKx+Mlw+Ey/1Aj8HnIQKPlokLPThU=;
	b=Q89+Bx1dKfy6o0XbZ1DlKpum+JP7/pbKVmb9zHWssO0BWeE+AkB4iUYy5CeZor7+Nl2QXd
	Msj1dmVBTxWbhw5t4LlO/2+E1lu8hLFtDYOhDJxL9WmHa4efStWNuJ+6TP6Jq2NfygLK6k
	8+m8vElm2Ed9pvjtZ7DFzAszzjIYEioFdpRAlM8qUoDko0zb+PWr4jMWWOQ4VMTkZYQnP0
	UMgQRzh8nrL2PPTiQQrAtj0AbVhNikqKrsF6HekXdRMu1LGVBvYX83g1d43vtATUKJMcSq
	hKDgdQYFH4qFrF5nch39LPU+1rf3SsxF99GKFasUzXgD5vDFd2yp3zP9WJSbaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 17:51:34 +0100
Subject: [PATCH v13 09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
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
Message-Id: <20261124-perso-ma35d1-upstream-clk-v13-9-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both CCAP muxes are registered with a single bit bus width which is
obviously wrong since there are 4 possible parents. Fix the mux field
width.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 06bbd63f2ccf..82a4aadeff6b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -427,13 +427,13 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[EMAC1_GATE] = ma35d1_clk_gate(dev, "emac1_gate", "epll_div2",
 					  clk_base + REG_CLK_SYSCLK0, 28);
 
-	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 1, hws,
+	hws[CCAP0_MUX] = ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_CLKSEL0, 12, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP0_DIV] = ma35d1_clk_divider(dev, "ccap0_div", "ccap0_mux",
 					    clk_base + REG_CLK_CLKDIV1, 8, 4);
 	hws[CCAP0_GATE] = ma35d1_clk_gate(dev, "ccap0_gate", "ccap0_div",
 					  clk_base + REG_CLK_SYSCLK0, 29);
-	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 1, hws,
+	hws[CCAP1_MUX] = ma35d1_clk_mux(dev, "ccap1_mux", clk_base + REG_CLK_CLKSEL0, 14, 2, hws,
 					ccap_parent_idx, ARRAY_SIZE(ccap_parent_idx));
 	hws[CCAP1_DIV] = ma35d1_clk_divider(dev, "ccap1_div", "ccap1_mux",
 					    clk_base + REG_CLK_CLKDIV1,

-- 
2.56.0


