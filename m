Return-Path: <openbmc+bounces-2680-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D604CA5FA7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:28:39 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXqW419Cz3bVW;
	Wed, 30 Sep 2026 08:27:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693139;
	cv=none; b=BooqF9rxnFwNNYx28ZOVcWJXM+CnY+OJZfWbMgWkWIvpqnuYSUP1rSylV6a9d4WQcuumcggoKlsRtu0boSeLyPwSn2RXV/1M80Xy9yUceq5P2SRNtg4K2Kl7YR7lPv4+TjdtA9EWkAel3nJ2omONUcKSLI4m/hP5Q3BGfEUDJ+4+G1S50GI9dzPFmVzjnYyResfBru/Hz6EvgDXSAKOJCMXv+Wch/R6NL4dXG8xCUy8zMDSY28OdoWn+5u4sDY+3harOtUbWaM2PcSKopk5eJcDkoZgn1yb9N3DUBtrjGhUa2ubcg1++2+CBhQkliWdLNofNoGD/DQp/Ie7F5ecq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693139; c=relaxed/relaxed;
	bh=FI8MM4zLwxVlmw7VDmYSwTBJd8VFU5MfFASzd6xayQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guPhfxisjEOXk1w+xNPPWmPqpC0Vi+c0i+LHQlxqpb/DEQM2/3lwjclVzvLkZQDPKB815pEKbhiAMBiILKqLL7laolXZT77+QbV3cNk8RXWo6MbeNnDyzVV7B+jFUG7P8yl4k3JqAdNWbyPpkPDosggk0V4Ufjxrjgne4fW4LSwAACBIoVUJ2IH/h9YYuqDWWEB+8Kn64soIz6p9HkA5Gi/td13PNqxmsdN2QI50jXEIAz3QV47h5TqZ1cr5Pa9QeUbfcN6ZlZS2VhkHEeTvqRnlDwBpk7GH3R8Flrwb65tKps4FS2c9z5lkVb89JNfhc+ZHWrnTb7j0yyPj+L3J4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bWoogI3C; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bWoogI3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLZV5L7vz30Vy
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:45:38 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5C271A1066;
	Tue, 29 Sep 2026 14:45:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 799E5601BD;
	Tue, 29 Sep 2026 14:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A585910329812;
	Tue, 29 Sep 2026 16:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FI8MM4zLwxVlmw7VDmYSwTBJd8VFU5MfFASzd6xayQ4=;
	b=bWoogI3CaFjR6U8nd0ppQkYmcXE6298N8V+dpnuvYsLhEfl0sx960SD3XS6nMkIZcZFn28
	vuwJzEs89FUiquQ3hu3YWwYn98B7ujYHmNdBraNx1iKDNiymU/xValPG04KoA1/+EIKtyA
	Y8Yy6AaBitGmdlxb0l9zgyh47nPW2TohAzTHgySCXrfo4FPeQTexxwg791ys2e7TAhErI/
	Se7fy67e64db8S0Kkg3u13CUYXga0WJwsURcurFC9QbUXaTYrjdJgyWDL5BEWkrW7ueBwT
	aQykMjvH1LHRqm10fUhjkgfH/fV03+bf7S4TfA74YYrnXRPT6OYe/1PXtdzC4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:45 +0200
Subject: [PATCH v5 2/9] dt-bindings: clock: ma35d1: Document the missing
 crystal inputs
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
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-2-68533e935ee4@bootlin.com>
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
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The MA35D1 clock controller takes two crystal oscillator inputs from
the board:
- HXT, a high-speed 24 MHz crystal for most of the system
- LXT, a low-speed 32.768 kHz crytal for the RTC and low power modes

So far the binding was expecting a single crystal. The example named it
HXT, but no real definition for it was given. LXT was not even
described. In order to remain backward compatible, we will continue to
allow either one (HXT) or two (HXT then LXT) input clocks. I propose to
give those phandles a name to clarify what these entries expect, but I'm
not listing the clock-names property in the required block, for backward
compatibility. The rates are fixed by the TRM, so even if the second
oscillator is not described, the OS can make an educated guess.

Fixes: 2f8b5eb589cb ("dt-bindings: clock: nuvoton: add binding for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
index 8f0c43683729..9649feda8d7a 100644
--- a/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
@@ -29,7 +29,18 @@ properties:
     const: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    description:
+      The controller takes 2 crystal oscillator inputs from the board.
+      HXT is a 24 MHz crystal feeding the internal PLLs. LXT is a 32.768
+      kHz crystal, for RTC and low power operations.
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: hxt
+      - const: lxt
 
   nuvoton,pll-mode:
     description:
@@ -58,6 +69,7 @@ examples:
         compatible = "nuvoton,ma35d1-clk";
         reg = <0x40460200 0x100>;
         #clock-cells = <1>;
-        clocks = <&clk_hxt>;
+        clocks = <&clk_hxt>, <&clk_lxt>;
+        clock-names = "hxt", "lxt";
     };
 ...

-- 
2.55.0


