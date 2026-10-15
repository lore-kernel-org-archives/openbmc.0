Return-Path: <openbmc+bounces-2779-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D28CC6B2D
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:32:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X6T4NJ2z30Vb;
	Fri, 16 Oct 2026 15:30:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792066794;
	cv=none; b=j7qoFB+uKlLX78sC2tpb8uAR7CG9katoKATD7gkNExoFU4g5pnO1GvkmyJzjG8t9aC0GSMib0QHLObGV8AHeIzimbD1xZlHAmW07zEHqGs7lIZXU3mk3O6mG2xm2SgV9no96OSxn5Pno9IltPkACMp5qeWKA/3iA5EVYLmR3BDCN/nijU3Dm47pnsvmtJZ9Zp8uFYVnbkkZTryMRXB2EFWeJc1uNoWQV4pqexoBHz5Fyf6Ynsc0FEUWRtdrLpLkE5GQ+zTuX/TDvR+s34VYNv+B23bbZKfoxwamOkSp/4WPrdDkt3yVDGeO9VHFOgNrHYQHcDuWQoDLr1Mis6eTNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792066794; c=relaxed/relaxed;
	bh=CMFy2QOZK7zANSOk5PDCpb3dFWclqXWbQfTgV5KP3e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ji+8GpFwCNnVyFDUf/uOwu1ARqjxrTvQ9Cq5HgG8ZNmemxp4GJO+BVUKOlaRhPzkUkEt4IwcvVqxEW2GCzEWfeIk7SEyy2eREq3hsCZ4CVdYltrTTTWbXnt4lKcXnsYiwSXEYiob+KGiliU4pLewoHwRXwv6zTFrWLDu9LDFLjaJ9JsS3/QLEv4ftTFdsfRgi9CZtlA04iqYqd90ZWyCWgIp8JvKuRDs6cSSkQvuuwmSI+wIn3pLLcDFeO6lRmnPS+3bcG/liCHMDuAnqERE+0S1Eu5dt25Bh+nR6lhhbw0+2LFKpMa+lxW/WYQYpB+GN0q0lnwAZTvrm8Vw2ok1/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blUPwAob; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blUPwAob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j56Zx59HLz2xLg
	for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 23:19:53 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C1BAE1A1238;
	Thu, 15 Oct 2026 12:19:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E25D60360;
	Thu, 15 Oct 2026 12:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D4B510328189;
	Thu, 15 Oct 2026 14:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792066788; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CMFy2QOZK7zANSOk5PDCpb3dFWclqXWbQfTgV5KP3e4=;
	b=blUPwAobQRK/Drqoo1A1JwsPNS1zBMWRc0CklqwauB4Fd2TjEpPhCsCy2fgUQOPpY0iqv6
	qjqqU92IevRVMJGKvP+B5TZx16FeAc5Mg7PS44YlwrT776Gf82DEAU6sfmQEWc5aGsbVC2
	YFAakl7lMxi4f1DHXZx05p8VfhutIIVTg3wpE2BE6I3VlL0HMExjZyob2ZvmZUy0tcwxGt
	gl6ycfsPxh4YEasXhgVK+NpBgR7blCVKigFFamNIm/fIySFbtZwBulTTbQH6DNAmKVJt3y
	SV1NV6ZR/bTwblwM27IhVOpIrSvpp6NRErb20dy2jECP+ZibuXGTCogjYg2Z1g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 14:19:02 +0200
Subject: [PATCH v9 06/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
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
Message-Id: <20261015-perso-ma35d1-upstream-clk-v9-6-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
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

clk-provider.h exposes many different helpers to help registering
clocks. Most of them expose both a 'basic' variant and their 'devm_'
extension (with just the last parameter of the inner function call
becoming true instead of false). Do the same with:

     clk_hw_register_fixed_rate_parent_hw() by creating
devm_clk_hw_register_fixed_rate_parent_hw().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/clk-provider.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c2b80cb3ab0b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -458,6 +458,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags, \
+						  fixed_rate)		       \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),   \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework

-- 
2.55.0


