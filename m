Return-Path: <openbmc+bounces-2763-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A4FCC6B38
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:29:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X4w0d9Dz2yQl;
	Fri, 16 Oct 2026 15:28:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792080165;
	cv=none; b=EdSRJcuNTqF8Lo0s7a4QWXhHnZuwz76sIASO/wEVp9FNcVWE8MRC4w1CLALcc3cBQDvY1yG1YdVxqQkIdD6Cyj5pJ9uLN0yrdPfzB6GxeoDmORCuy8bIc2ENnpbq9JcAw1iejBPpx50nL5js89Qm0RjXem0v8zRsmaL1JIUHEKa4BE0zRHiUo6G8tQQ9T2b6VcNHUQt20WjkeI3+8YebTznB2/KMHUO225cu+oQF1q0RBvgPK6wPX+A1xgLr4o5y1siXbgRfkp6nEf62UJZQ3BBSoB4hELvuep8IJXDVF4VXA6HQReimf2BwXFInIyCuBJHKrQZv6NJwkr7OMTa8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792080165; c=relaxed/relaxed;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nc7/xqBuJBFz7a0ua5136mqWKstbiNRHUu0hUtWuIGjG1O9oe7bZl6cufutv1nk0rkatMRPdAz++u02UDHi0PJ8LO30OaMzeY/k6WXFIy22LvrWDOkkkqWoOgFueq8cEqFQFVnoe+ka+EnDUpf+ANQKPGccZspI9eMCLa1hs9JIm47RpJJiYgGAayiWxd1B8EIdVyjzYXjiz3zQzLwdm6bR/uE6zNv2f6Lyb18YFI+kq9snvQ/GVTQboOqeNbEbywxV+YYShE0NuDuxWjt+1MtNG6cbkzMGSYknYySRKrVvZzw8CdazqzzjlqFZYkMxGTkUwVLXzrYPDnno65vv0eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WX+PHVm+; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WX+PHVm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j5CX4500wz2xM9
	for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2026 03:02:44 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5B824E4124F;
	Thu, 15 Oct 2026 16:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 890F36075C;
	Thu, 15 Oct 2026 16:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 703BB10328B42;
	Thu, 15 Oct 2026 18:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792080155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	b=WX+PHVm+NUlQ1Ip641v/NskvAApUPXyftYa6uAZQMl+jqNOTkVd7dCLcuzpVkToOZnzBqK
	sEf8H5j9hJP1hu6AczeZxd6k+H4Y2LP2+zsGPyMK9OgK1zX/OVQPVW049W+jD09pL/zCzT
	vON8v+O1zGNKMeJqlSjtJluCO0vZ4XcNXtqwn+XePIictvYDgU9I3QvCb3yP9x37i2p6+r
	Ugz0YG0PPI7Ga39jBHMna5ydbCp3pRnxRo3z3GK6nSkktIbHbhXoylYnNpmgOTnC05cm1w
	WTryKVX7rKpyrDoUc0VU9XQ6zILZ311BH7TkdBS4oULZk2KQ6XR3+GkWokhyvg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 18:01:22 +0200
Subject: [PATCH v10 09/10] arm64: dts: nuvoton: ma35d1: Drop HXT clock
 output name
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
Message-Id: <20261015-perso-ma35d1-upstream-clk-v10-9-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
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

The clock-output-names property is not useful since there is only one
output clock, and the naming of that clock would already be clock-hxt
after the node name if we were not providing that property (so very
similar). Just drop it.

I want to clean this name before introducing another very similar fixed
clock in the DT: LXT

Another solution could have been to rename it "hxt", which would have
been more aligned with the other clock names. Sashiko complained that
this could break DT compatibility with an -EEXIST error because of
the colliding names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 1 -
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..d7670afb0a63 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..8f3cb18d39b6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 

-- 
2.55.0


