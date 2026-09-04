Return-Path: <openbmc+bounces-2557-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7261C624DB
	for <openbmc@archiver.kernel.org>; Sat,  5 Sep 2026 06:27:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hcNfb5Ltqz2y2M;
	Sat, 05 Sep 2026 16:27:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788526996;
	cv=none; b=KIlNPfqHypzIS4oLrtnBxsmqydwf/BfDLwtYFtVI0mjbzkFGc1u3h7b7qZ4BgttRDQIgzsSccVoxp3i2xARCSuZik50yp3ZLBB0Uow9X7RwP6I9/K/nAA3TmbDv9KZOqv0084iEapQoZPmPr0Z9p1oHzLi12McZDwIZXPnNzCr1EoAHLfIoA6B+ZNfPdYymadVJrsiYxcdGGRWTO0mYSL99HONO8hwdiARrgdiHA7UxvDWYbuRYfAqTK9gCwNajPfUjEefOILHm+haBTlmSGAfGcT99Gvmg8Mr4les8illSuIqSOsXFtttp1iTPW5/gKeGBH9rzxcWJKFVZATeezEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788526996; c=relaxed/relaxed;
	bh=/yGBXxJGrq9CpNREKuNgAMIWh4atD8OtcoEN+4Ih6cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mr72HQ/sXoeAa9U5yKj72LBNKSsD+N2aHjBfK6cNQOVVZ+KT6PxFAebS+PAEm+GuLejJEOsItHtYQoBtRmIXPcCjgvkeQtHbd5p0OsfGUvh1GRawgXxdw7r60+OduMpXfO1ZheYoxT55GWoHua33TpTFFfNNJfjbZsmklFkxLgIZ05k4wPAJkuKqGNLjdegUx1RnWvEDWfew8WOWl7k4e8/4Pst6lngxSGPsEmfNc2iddsZOeUqTht0l/Y3mI3thpDYnX4/kXZSVinwvq+BrLCuCLebiAKYS4fs6ZOhPun1sDFyCoQ3nO4Z5VK1Jjy4MEM0Uu1hEiJcKXwONIs7PEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uLSM5qOU; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uLSM5qOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbxTt2dq3z2y2b
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 23:03:12 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A68C71A19A8;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 796906057F;
	Fri,  4 Sep 2026 13:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B80511C7AF0B;
	Fri,  4 Sep 2026 15:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yGBXxJGrq9CpNREKuNgAMIWh4atD8OtcoEN+4Ih6cA=;
	b=uLSM5qOU/rSSfmjC4EZZrgeGTOKUf2TrMmwr89x8O/arV/ia7lxHbRzKi8bBVndXsyuXp+
	Qmf6gEiQ8YgYKZwf1rQ+KQXvw6+QmWg4N35Mv/6RwyrZ8e3MnKqAv4lLAktKmeLGrzz3pK
	Ho7fAjPuhehvTrgvfNMFEzSFjow/UdXAWqDq7jWGnVYXAKpDJzClUqMLfhNqvg2Dp7hHGd
	nftsnzCJWD+BgjhijTX6GHXVKKJvtQH9rg73H7nqxAzeBnvq5ZAEWfY1MK6vFF964+uAsZ
	x+uCnihHZZqVBnjyViFV58gXnvDWUlhZsmFEy7mbs1cT7ZjyltZ/grGg9Lp0CQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: nuvoton: Add NuMaker compatible
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
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-1-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The NuMaker board is a carrier board on which the MA35D1 SoM may be
connected. It has a lot of available peripherals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
index fb190db61525..972f71a7449c 100644
--- a/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
+++ b/Documentation/devicetree/bindings/arm/nuvoton/nuvoton,ma35d1.yaml
@@ -18,7 +18,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
-
+      - description: NuMaker carrier board with an MA35D1 SoM
+        items:
+          - const: nuvoton,ma35d1-numaker
+          - const: nuvoton,ma35d1-som
+          - const: nuvoton,ma35d1
       - description: MA35D1 based boards
         items:
           - enum:

-- 
2.54.0


