Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5693606A90C
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WAkjDaQP
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVrGg25RRz2xWt;
	Fri, 20 Nov 2026 07:51:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795121467;
	cv=none; b=PnR9iLgi/bF+L6drF0mEDi3Kkt5zp2hJiJURNiJdh2iR6HG2kRTAVcaslPv6Hw3+z2p8tHPy+9luSXIXqz4zCY1uRrqB+cA0HDdqtbd888+e1fIj2Qf0z8ZzPHOMIXA8Iwkz1BHSzDYRE9A5xNmG2XdSmbC+esbbWHU5Pc0HGLtMjMp8/aRK/vzeWgEBFmaAitB6BR89liOUW24dt3hRdmggAl9HV3GwQshzRupzDQgNmHsZGMQ/0ZCgWF/+jHq0b2SLRqPU+7rjxWcDaWJr0dGyBhFwAZJvm2SMyGy8977ygWBl1GCJP/bNZ4wbXYL88fx1tp7YqXJTUPzIgg/1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795121467; c=relaxed/relaxed;
	bh=QbWtql6O9dsdj+f3UeXCGE3TcRnLIlq5aJ6I7jKlL3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDe29uMQQV4pBP6G4UI1f7ZfbMljCGAmnsS7R2DcNgArMXETwe9hM5abWhVNmyuexPV8QTCtHDbNJUsDoB0HrpNBuk2Bkfr8e8wfbRF8Kpei3kVONjI24f8m2vutlRNEz9KZ73REfdTsghEMLhIifcygK8lsySgmdJgmpN1dkE0FvN09xK0lcv4N29NFwz1lXqIwlT/+HQOONDSGjwJIom/3LH/gpxDUi2GamE9dR46jVm4dgRp4SpNPLdF3h/ConA6WyZFJbTE2CXOaYcguvrxZ0foevbNeWZM3QmnJbHU4MDaOF2Mgl71WGMIkAP2YJCIregKmSVJoxi4bEW9zmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WAkjDaQP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WAkjDaQP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVrGd5f2Zz2x9N
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 07:51:05 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8569660D80;
	Thu, 19 Nov 2026 20:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18AF1F000C0;
	Thu, 19 Nov 2026 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121463;
	bh=QbWtql6O9dsdj+f3UeXCGE3TcRnLIlq5aJ6I7jKlL3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WAkjDaQPOTsnED1UchGELVgVCOIDqr3ZIDidC9ZmEG8ZTE1E4V48d8iY5EdvfrdRB
	 AjERRbuPXYlrz4H94aRB5M63DaFajOFdkSW127wW4bTp7qmwSot7rn75SA6/Q38aVd
	 4kNCJ7owL7nXo65IUSpFR/MmNWQRDu+f6f3h65vpIpfh75MHWYVo8+Xq4ePiSKv5la
	 rs/BPd+23qE6ZQzLJMy06PfDNpP3hsPoXL7dwOKNrnFUMs9gjX1HD1kRhUm4rI4N6C
	 16u5uVAxE4p8HzmzQBMBs39haJCfZvQiyUEUY3CmwejK6CyQe3yzKp7Qv/hfgTYkDE
	 ywwSUWVhF2KCQ==
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
	jordan_hargrave@dell.com,
	tomer.maimon@nuvoton.com,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 06/12] pinctrl: nuvoton: Unmap GPIO bank registers on error in NPCM7xx and NPCM8xx
Date: Thu, 19 Nov 2026 20:49:02 +0000
Message-ID: <20261119205013.2563811-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

v1 => v2:
 - New patch, releasing fwnode_iomap() mappings via devres (Sashiko)

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 13 +++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 3a80948ac70f..3e763a097b91 100644
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
index 690ba8473bcc..f300c3cd924a 100644
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
2.56.1.750.gf70dc682cf-goog


