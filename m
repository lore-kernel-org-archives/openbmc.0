Return-Path: <openbmc+bounces-2719-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709FCA5FF0
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 22:50:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyd4X14QVz30W9;
	Mon, 05 Oct 2026 09:49:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791146775;
	cv=none; b=V59Nn/UTTWqb0rzPG1LExMapf88P4YlRfADZXvTnIc6t6JIz2b0ZPkTPl1ZZORPFkaZ2C1S81cTpvWoQL+4LA+hKc9xZLxhc5p3DqxHksuZz9nzzqLjRV4rCJeazPcxHandM5xfZQETv+nCUc4Sj5hZQl/5ZoS+aVuj9Es4/oDUCEIw5kBnqky8vuabNCCkFdPr7TzkR9WAI2Ybe8hcI37vwmXLryQbrYl6xK+wielElAXs9xQQljkOlIK3EhTrUDu+ADqWmZ5l+vNvW5DWzMXh/qCtgRDpihui0Tpz/DhqkpI88Wj08ev+vcbBTBUv882LGmQVgGnKIew70kwsS+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791146775; c=relaxed/relaxed;
	bh=lBIhAf1zrMsSuoUnlVj3Mn8SpEqQ7vAdxnvxFNwqdm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ze6h/i/PIIheK83c2ByvQfGk6lpwTCao7R5FI4flMaa82ABO1B0zfbeyQWnPz/ij0UNuQaIoBy9A/1zxsHzxAhveTOm+F+T32iz9sJyjxCvPTjiRl6vQT2P6rIB1PgQRHyjylrgz5svq9wHK3NxvKA3LEv5wljiE572ll8RoITTbRa+jCRg4nq4dqybWmmqd8nXSy//wECQ4/f8oeeReMYo5iETLzv6RKx+kWkeT7ng+Dr6YoZrAuP+9P8nbjK+xUcMz3DNnqLV20sSEUCBbXTPCt33QaSavZT8uuZoyNwzwo9VmYMxOy/+DHzFCbVzNuw38bhTNlq3J2mUtHkq6gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P5D2nS/N; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P5D2nS/N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyZLH0T1rz2xlw
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 07:46:15 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E6394E41168;
	Sun,  4 Oct 2026 20:46:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3E43604FE;
	Sun,  4 Oct 2026 20:46:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37FCA103283ED;
	Sun,  4 Oct 2026 22:46:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lBIhAf1zrMsSuoUnlVj3Mn8SpEqQ7vAdxnvxFNwqdm8=;
	b=P5D2nS/NSxde2LVNpovf/Hq1gJCKoPdA6C4pWnqMv5a5FTUTzpj1p8JZLu1hP1nW/YQ9ha
	WpJ9pKfRwMbL/ZxCZUMs683MDQ/ZDhSXdPy/dzMRs+9jW3NPiRmp9mgJljNFC9JjxMjsVJ
	Xolazagow54d18f2GZFH8Lgtv0U/XYguvk1MlL8etOa/WCzGV/LTZmBghAmGl6VNZqbori
	98+8k6udyz2UrJ73rDJzVXm+kFxzycz6sHrm6oZk5ONKddpn46EjT/JgEoxRR7oN72ARvQ
	6rvcm/12sXO0f6lhXEafcxM81TMKa/NQrAq4PDZLOQMTg5sfzAhVnqJS7Y3CRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:26 +0200
Subject: [PATCH v8 2/7] clk: nuvoton: ma35d1: Avoid possible error pointer
 dereferencing
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
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-2-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
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

MA35D1 registration helpers store their parent_hw argument straight into
the parent data, without checking it first. In case of registration
failure an error pointer will be stored in the table, which is then
forwarded to the clk core, which treats any non-NULL parent as valid
handles.

Bail out early when the parent is an error pointer, instead of building
the parent data.

This issue is mostly theoretical in practice, since reaching such an
error would involve a very early -ENOMEM.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c |  3 +++
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |  3 +++
 drivers/clk/nuvoton/clk-ma35d1.c         | 13 +++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..57a7b4ed3b5e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -90,6 +90,9 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	int ret;
 	int i;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index c7c0dc91a012..92424e9c669d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -336,6 +336,9 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 	struct clk_hw *hw;
 	int ret;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 1a857f28310f..ceebcbd8c18b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -130,10 +130,19 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const int *parent_idx, int num_parents)
 {
 	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};
+	struct clk_hw *parent;
 	int i;
 
-	for (i = 0; i < num_parents; i++)
-		parent_hws[i] = (parent_idx[i] >= 0) ? hws[parent_idx[i]] : NULL;
+	for (i = 0; i < num_parents; i++) {
+		if (parent_idx[i] < 0)
+			continue;
+
+		parent = hws[parent_idx[i]];
+		if (IS_ERR(parent))
+			return parent;
+
+		parent_hws[i] = parent;
+	}
 
 	return clk_hw_register_mux_hws(dev, name, parent_hws, num_parents,
 				       CLK_SET_RATE_NO_REPARENT, reg, shift,

-- 
2.55.0


