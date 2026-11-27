Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4920606A329
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj1i5W4Y
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbZwd1MHxz2yMl;
	Sat, 28 Nov 2026 01:06:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795788416;
	cv=none; b=f1SK7XnmaBuujq0ZqyFY7GY9wNlM5cYwTzv3JyQjCYUSTZ3qIA8tAKjnPuIXLmUnRl5C2solyIkOGeeky9uUAQNNdDQyGkTer6pPcTLeA9ODhqr2ESH397OSu8TeWZB557KIVYm4WJE6pF6vxj9P5w/NhPbiealamJ3FkylhpTc5S37Du+y8/HMmK4xug90kCl8J/H7ei7XfRTO0U3d9huTBXTuVB1q1M+4P2zwWr6BchnD2UaKUbGxkiDGLJTUI45hNk7b9IUnjpCOyqLO3K6Do+apJKvIJ1A6wo/dc9DplUBcWATR4iCtI1XnUKjMrHwrKkv+FNEIHTHlgj4sAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795788416; c=relaxed/relaxed;
	bh=b3QBz+aegQrt01l7VTRnuNY+RfHIeGxGfCG2oZRvtFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eS/De4idwn6LU5istUEZfChxAKdaWELzLzSujweYiJEJ2QwDXqmaZOtuDPS5HIQyamErXSfPR6cC2k56tVPnbHIns3Mq+QN+A8qyghfoivS3r3GYKlSF81v6YYZ9vr2gBOKCHIdjg4fQaeGL5a2Q+MJnl8CCBo/JQ4yYjNq7inrgWOsptCaIkcnvZojQko0jaDeYqWojL3iABzyXNr4zdSJN9AATPT80j7a42a37VNwSZk+yOjuEeEsd0oYUbYIY/+LZIxYgoDFDIHtIFf+XYJaJKaSAvojwReg3Vqsbad5oOUY32NNewwsRxDj537LFSEoJLeldufzKkeUtobVzww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj1i5W4Y; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj1i5W4Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbZwb6Vxxz2yLH
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:06:55 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 738EF43F87;
	Fri, 27 Nov 2026 14:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0EB1F0089A;
	Fri, 27 Nov 2026 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788413;
	bh=b3QBz+aegQrt01l7VTRnuNY+RfHIeGxGfCG2oZRvtFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zj1i5W4Y/dg12S8AQc2m82FMuai8HTzI5EM5YkF4iXK16Zed7Dc0FvFT3lVmr/kwy
	 rCIDVlSwYdkoqPgH9u7tE0kAVJKZ2ScgPd/my7c7cYNYTbE7Y2jxk98bb9k11SHOLq
	 5yJbwgnP4vbOtA/i50Ki77MwBYoY9spM0u/8qLrUt9qlGT1he8jtXFW9MIFQriXXBn
	 +b2i/3DbF06X+2KY5LrShfKF9EtO31AqHe7ejWABjT+tvzZ7gsJBh2hMZ2zrHic2iT
	 +FOFHrnG+KY1wFX+40x9dRLcweAJ3Bg8n6Ggh4hcy3tmtvaMOj0Nbk0Nda4e6KfDpx
	 zveEyY4/IebSA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linusw@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	jordan_hargrave@dell.com,
	tomer.maimon@nuvoton.com,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 06/12] pinctrl: nuvoton: Unmap GPIO bank registers on error in NPCM7xx and NPCM8xx
Date: Fri, 27 Nov 2026 14:04:54 +0000
Message-ID: <20261127140602.2790001-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

npcm7xx_gpio_of() and npcm8xx_gpio_fw() map each GPIO bank's registers
via unmanaged fwnode_iomap() without unmapping them if a subsequent step
in the loop, pinctrl registration, or GPIO registration fails.

Register a devres action after each fwnode_iomap() call so the bank
mappings are released automatically on probe failure or device teardown.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Closes: https://sashiko.dev/#/bug/linux-cf83b9c0-f3a2-4dc8-95a0-af6fafb6d092
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 2eb7782b90a6..08eb9aca36b8 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -7,6 +7,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -1821,6 +1822,13 @@ static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static void npcm7xx_gpio_iounmap(void *data)
+{
+	struct npcm7xx_gpio *bank = data;
+
+	iounmap(bank->base);
+}
+
 static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
 	struct gpio_generic_chip_config config;
@@ -1835,6 +1843,11 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
+		ret = devm_add_action_or_reset(dev, npcm7xx_gpio_iounmap,
+					       &pctrl->gpio_bank[id]);
+		if (ret)
+			return ret;
+
 		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index dc76ad9e58e6..40315e89b839 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -7,6 +7,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -2453,6 +2454,13 @@ static int npcmgpio_add_pin_ranges(struct gpio_chip *chip)
 				      bank->chip.gc.ngpio);
 }
 
+static void npcm8xx_gpio_iounmap(void *data)
+{
+	struct npcm8xx_gpio *bank = data;
+
+	iounmap(bank->base);
+}
+
 static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 {
 	struct gpio_generic_chip_config config;
@@ -2467,6 +2475,11 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (!pctrl->gpio_bank[id].base)
 			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
 
+		ret = devm_add_action_or_reset(dev, npcm8xx_gpio_iounmap,
+					       &pctrl->gpio_bank[id]);
+		if (ret)
+			return ret;
+
 		config = (struct gpio_generic_chip_config) {
 			.dev = dev,
 			.sz = 4,
-- 
2.56.1.839.g22a8290db9-goog


