Return-Path: <openbmc+bounces-2674-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD6DCA5FA7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:27:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXpw6sSFz2yfy;
	Wed, 30 Sep 2026 08:27:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693163;
	cv=none; b=bp9wiKFYoEuJ7j+RXsNynBZLKPNs5fFQ2ouCASbskPy6E8FUQ/SEitwt18iUOt/deH09TJrGuPSyOeHEDWY217LkbDq5HE4oA1sc/9Z677H6E4VniXWmPqSpx/CvRDIvbS5+Ex8U5JzvlqA0vJoFgN+urBxsNNzgI5Qy1fqbbnYL+qWFpeKUdkzsEWUp6a8gAM9XDlMUunMJN2ZdpFdN9slaiFtaonlkXZGRxXkmum4oYtDMojgELy6u5udVUM5aA0yedxqBBXzl+PyDpVFid7Nq0t8JrE/z/wYG/AOr979bJHY7uA1QqpwRtcCO24FzWBkEWy59nrzLNpg9VGhGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693163; c=relaxed/relaxed;
	bh=g/MvsTZBQVv82eCENlE54GLFRNRWl+Z3gRhZz1fyUG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jST0wCxCm8bbgIpWspp0RV+wEKzSbgxEwSrqo9DBGgkTgM7NyDI5m6pyF7WuR/vZBuPFEsdMAyzJwHYeN10bmmKnR6zSGLkInbwC2WfQDCAStk14JdZgZU2E3ntX4vrRPIUKHOdLVhF9Nb+Kqmk/Uip1Bog1Ze9m4dkFCP+J4qC0fp9v4Uu+lFgn5GB8EmXIsC/DolPJfCZr/x0WxUNJDs9hgph5xoamAJeAeZPImzP9vNe9kIYreUtXV32uW6UXG2BwTnWulKv9PUOe3+Z0pBDB7ngDZ0Q0hsEP8PMnpYt1FGd7juKHGtAsyBS3I3de4ui8Whp+nF+6keaKjZl6GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QvKie7nf; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QvKie7nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLZz1MCfz30Vv
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:46:03 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 462DE1A1066;
	Tue, 29 Sep 2026 14:46:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18BA4601BD;
	Tue, 29 Sep 2026 14:46:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA9DC103282F2;
	Tue, 29 Sep 2026 16:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g/MvsTZBQVv82eCENlE54GLFRNRWl+Z3gRhZz1fyUG8=;
	b=QvKie7nfVAzjaDRHyzr4WFhvS2O7e2j8VPpNC4TMQYd9gkTABiLjOSjOYs67p6QbsVSRPK
	Kf5UohPLxwALG4uhro/dO8Lo9ZYO/AMxtIStAGh1VOzRLwOzVyChQIwRqn2FZhkm99JOd+
	2jo/US6/KdWkOUfB9uLytM8+goCm67oaPq0pKxsJPXpZoor66TjaZP5TY3ajiKlP6EXV1P
	FcrcxbFjxU/RfM/eBVdOGUOuO0x4M56uf36HggWtFpkFdLAjAWMp/D3l/5dRwIv0zQR6Td
	4OfB+aKBPybYldN7X9l7hkU07S30LUcvfLlqfAyhYKLwU6BaFd3d20Gn7VF5qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:51 +0200
Subject: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
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
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
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

HXT and LXT are crystal oscillator inputs of the clock controller, they
are described in the DT. Get them with devm_clk_get_optional() and point
the internal clock table at the clk_hw's found this way, instead of
registering fixed rate clocks in their place.

Old DTs reference the HXT fixed-clock without naming it and do not
describe LXT at all. In this case, fall back to the fixed rate clocks
that were used so far, to keep booting.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ceebcbd8c18b..81a412b1706e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -124,6 +125,21 @@ static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
 	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
 
+static struct clk_hw *ma35d1_clk_xtal(struct device *dev, const char *name,
+				      unsigned long rate)
+{
+	struct clk *clk = devm_clk_get_optional(dev, name);
+
+	if (IS_ERR(clk))
+		return ERR_CAST(clk);
+
+	if (!clk)
+		/* Old DTs do not describe the crystal inputs. */
+		return ma35d1_clk_fixed(name, rate);
+
+	return __clk_get_hw(clk);
+}
+
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     void __iomem *reg, u8 shift, u8 width,
 				     struct clk_hw **hws,
@@ -240,10 +256,10 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
+	hws[HXT] = ma35d1_clk_xtal(dev, "hxt", 24000000);
 	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
 					clk_base + REG_CLK_PWRCTL, 0);
-	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+	hws[LXT] = ma35d1_clk_xtal(dev, "lxt", 32768);
 	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
 					clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);

-- 
2.55.0


