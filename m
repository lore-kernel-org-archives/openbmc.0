Return-Path: <openbmc+bounces-2631-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4DAC982ED
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 23:25:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpfTr48KZz2yft;
	Tue, 22 Sep 2026 09:25:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790033120;
	cv=none; b=i54qSbvo65RYKJeBeBabvragsUOQ4ku7UnP+qYuAw0td31P0m5llvzyOhPB4Opw5w7KVRiRUys1p8oklwO0A77dGIEX0g7JjZUPAZvEw8QMhtcoqJi1ihJ8Wqxm6cNsGT7I5r+gdXdELTjC3xcmvueWfZxnVHFpeUuBsv9WadpHI5IQIyHi1gtZbwYVsLtwdwKItJhxHY5KBY6tUUBGzAPO58M2nVJLsagc9SSB0+I2txvNdlSpHNdFZaoe0ppT99Tn9AeG2bkq6PW7W27GBqVOopP2ytQRnw90IEMtKrf7kLG6xPoYHSuqd79hubM5US316Jp9Rdc6FUwzEzxl58w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790033120; c=relaxed/relaxed;
	bh=/mwvJJ48KJ79alahAyG/O70Ja8d6mr3ftuTV3beVAvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bEgI5O6iX9CvPhmm2lCrLT4X3ELacRjVt2hhNVnIw3gX0BogaeVDWuRG/bet6m5nb4Jy4kP3ZhHWcn/55WOLBoAxJvypKYmZ4g/+hWnZeWSCCn7+1ZddA4oge8bJefUsDTXX/7rQIaDyROPd1vtDg1KClJMf/+FVRljJBL+LEARuqCIDKhklDs/DLAL6NR3JxUq+nG2zTKcXqLXJOdDAtP6GnDIUN7jtPeHHcY0+OKViXQBWVOOo/X7E36zJJuJy8YrQljfm8VAtp8VHPbZnEqyhDq8LyIpR+H1o2g6RrUNkXb7aoHdiTObbghoplc32h6XVPHRXT282BoaoDqWgTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtCBmMFr; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtCBmMFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpfTq4ytWz2xlw
	for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 09:25:19 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13A42439A6;
	Mon, 21 Sep 2026 23:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FB51F000FF;
	Mon, 21 Sep 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033116;
	bh=/mwvJJ48KJ79alahAyG/O70Ja8d6mr3ftuTV3beVAvg=;
	h=From:To:Cc:Subject:Date;
	b=AtCBmMFrclopjlXd0UPY2nOEpxHmRGnJR36GDDl+ziKLOZ/3SY0l7XgjHtQL7gAMZ
	 azfDL78kA17Ac0n0KzD0HEh6INoVOpZcTDHlD//EWJguSZJeA1JDHwysMahvqsm6Sh
	 UtK62ODTCynYPDD6ROtdK9aFI0vc9bf36bgFpMebrUPOxEWXT44GOJkxHZMpC8xQA1
	 fNyEnhhV48M1XL+fi0LBLBdYzGeMiRWs9Xf/QUJfKUvQovBLY7HKN3NY/zRbqMH5av
	 LcknVuv7tEEMZhtbFR8vDkrKWWp9NEQtPtm4Sydz0FdIc4uwRHYo3IMg4w5uiplT4T
	 yBMtDiHuLXp8g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: nuvoton: Fix NPCM845 GCR compatibles
Date: Mon, 21 Sep 2026 18:25:08 -0500
Message-ID: <20260921232509.3126844-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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
Content-Transfer-Encoding: 8bit

The Nuvoton NPCM845 GCR doesn't have any child nodes and therefore isn't
a simple-mfd device, so drop the compatible for it. This matches the DTS
files.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
index 23e7e4ea01ff..9f6f009ec991 100644
--- a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
+++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml
@@ -17,13 +17,17 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - nuvoton,wpcm450-gcr
-          - nuvoton,npcm750-gcr
-          - nuvoton,npcm845-gcr
-      - const: syscon
-      - const: simple-mfd
+    oneOf:
+      - items:
+          - enum:
+              - nuvoton,npcm845-gcr
+          - const: syscon
+      - items:
+          - enum:
+              - nuvoton,wpcm450-gcr
+              - nuvoton,npcm750-gcr
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
-- 
2.53.0


