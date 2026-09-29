Return-Path: <openbmc+bounces-2678-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3C2CA5FA7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:28:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXqL2wc0z3bQq;
	Wed, 30 Sep 2026 08:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693146;
	cv=none; b=gw16qGgYR0od9lCyyPxUoAwJ/nlRgBdQBq8ZyWz3lIjptux86qQcv5++FxZaxSOTtWGpdAdz1ncrnunUQHCR5y0LGm6a+vYh0TS27f3WcuNndUHGIUEO8y1TYibZhKuHPAoic+r8snX3C7vTi25XfGj/8b+/K+ouTNlObXFaVCo8vK9mdw67Qm4CVJl0JUAQnbH+yaq4mj5DFJKzsXmIGGbUpAFqIT67+e9zXexqn2IUDXQGK2aO7TWrdc4HpLptyDx5A+9Jbb+nmvhnJE55y/z+CQ69rG9F1cbanupGua0PH2T6SYZNeHDQEcWD6RvEsJqS3sEZY3UhSuustn+UNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693146; c=relaxed/relaxed;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyMZQkY3ZeVVrW5z970VNlE7goejLWQk4P3ldLl4Apa1kMhEynKCFdBB4EsoSR2iQsnK5Pid+UE4WO3HbId5qvjWHMucp+85cU+K/LycmJAeTdCFE+W2wyN4hUy8M16cNRvspTAp0ns3L0/kkT9CWdfy1/x/rklf/fktqPMC//S2RDWcAHwUm3dPOanZVuOAV/1p6a7+WPEYjJrqrT6VE/kvOCwdk/Kc7rwmQJ5pgOF68rkkv2IIYynxmzdz/qAUcb8Ztsk+7DIQUclX9+KxCvutNCGDn9egNfk4/2G8L3r9OoN+xh1iCH9BGmTgaeSIgtQ32mpRNPf/7OyGxziwOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ysFMK36c; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ysFMK36c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLZf0THKz30Vy
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:45:46 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 15D824E410B4;
	Tue, 29 Sep 2026 14:45:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDEC1601BD;
	Tue, 29 Sep 2026 14:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B544F1032976C;
	Tue, 29 Sep 2026 16:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=;
	b=ysFMK36cYyETRwxEEke0ihj8vgiPYUoo5OyPUo8TMAQhGLdxNSHFGicXhJT/Jo4KxybUuS
	y/KzNBXhbn2oQrLYA4Gp4e7cV9s4eoYIk6GhhSoyGf2lO2RdaeLbWfkUuVdLVFYqigxlPJ
	/mbrhcDj/e3jIT5EoDYK7PqG3SY2U6iXof1V9lbsIUQGE61x7hJYAYeWtaFprxL1mYpSz8
	3WG9Ffa7Kklkz2Mj1PXO+8AQJAJblHM5RZbFIL9s62WRtQU9ysa+gaztMZm4hSg0CBEM71
	Ihhk6IBCVR/DG1sDAEd4StphpJahWcnECGd1ouXk1OMV4GIzYXN4rZXjQWlNtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:47 +0200
Subject: [PATCH v5 4/9] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
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
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-4-68533e935ee4@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The WDT and WWDT muxes have PCLK3/4096 and PCLK4/4096 among their
possible parents, but these fixed factor clocks are currently not
defined, even though they are needed to properly describe the clock
tree. Add them to the bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 2d6a44a7e55c..764d837d6162 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,5 +248,7 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
+#define PCLK3_DIV4096	236
+#define PCLK4_DIV4096	237
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0


