Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E4606A31A
	for <openbmc@archiver.kernel.org>; Sun, 25 Oct 2026 22:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A6fwOip4
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jCX2R0mL8z2y2h;
	Mon, 26 Oct 2026 09:47:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792953827;
	cv=none; b=BthCpM0Ui137qYLRNNiTh/7f6d+tgSaBEd5stC0iYPjnOPau3+asPZ/rszCmZlNG1wdZqj9T4vJnquXIAeV3LTUlE63f2ZnOZUIJrvyAeQDV3gL+v6PYvLVwZEevrqDnvFLiQ2UU/d7y0T7lp2hiIKplpuCzb+wnVUKWOoQUyQgiemxWBIxGagx/1sm+EOwd0VyOgDuUrPAFjjSusy6JU8YskBkidxXJ+T0jRSpUz9l8AsEQ1O8t+k17alAJrux7lPpqIwOktjpa3us/atVnpmDiw0w7VBJS5kcd4AOQXF1gmOi1JNP+BqzsSW/1iAx4bibou5aMQQO+LYOZvztp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792953827; c=relaxed/relaxed;
	bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrVM4TiPh5qij0jUO4Gha6KvBxJuzuTI+4Ma4pp75VkHi6TInGHviGXV1j2zVs+8ExcGca505VpRrD00dldFebDaGBRuS8220550ZUD15brVRH6ACsYf+hOS5GIXX/AzAx19uzPy6zA5X+ayada8au1X3T1DQz2VtgUXCJXD/XG2FGKe5AvOZv5sjHcmKkRNH3NSbX4+8v/41EXoHdoPTOrxt7LXSJATXGz8lK5h+0H9OeY2wHEeNyMVRFgKARAH9JQcji37qJ9DdqDqs8bIRyA11kEP4HWS9+XKqH/PMj7s9FEDsRL3zzDn/sRQBrNEBw71rVJ2OVgS2jpH7itFPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A6fwOip4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=mashikiselby@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A6fwOip4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=mashikiselby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jCQdF4xLXz2xJT
	for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 05:43:44 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so4496274a12.1
        for <openbmc@lists.ozlabs.org>; Sun, 25 Oct 2026 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953819; x=1793558619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=A6fwOip4m6VCo2hgKSIUDZcbx04CTw97IcpLE48/hJ9FK9tgglsnDv2647FFz1jWVp
         mEC+3wnvHyw9mOC4PrEUeExREznrECcqWrUlnavT2PBo/r/iMT2KPurFU7IT6hHSwFNS
         MX2SDiQQ/EDUGPOIYAaE+ofc3iQz3cFqte0SAkrplddOqkIaYfDSnX3jmuPz2m+9Kmyp
         qv+EHVWzDWa7rF+18XOKE5tkAO5wQIPjTt/GGfghHKmTUilsMcVyAURKIWp4V/bFwBba
         lMiMLtuKcnGuQg70Is7B50o5+2JQqZ0vi2hlf1yLtFbDGwE6PEKzjHDA8baGkrKri8pf
         xRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953819; x=1793558619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=0sM13kWl2IXjiFYzVjC7966d1chRutu+b0SheutErsjFIEuqTpqwrGCWzuD4g0iOrC
         acO433hTtBXxLUCx4IPjEAqT/ogs69Z+oTcgodG/qYIRy27D3soxEN4ig2H8Ie4zoi8f
         S/XaYQNNcDLE24HcDCd0okCpFO+WMv2w0HLrVQU+QlahQSB0aXDBTiY+vIFPepSW77Em
         kxo7gljhkXQYs0OYtlRFJSy3FCSkpA0HcO/i40TenFciz50ixnL3gM2UFXIAPf2hRl8y
         c2VuVxizdliAheX+jGB43wk6KlNr9MOBNp3Yi+rrYesmU7tNiwMP9orE/nSKifLT6p/6
         G2KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbrxLJaLBRN6iEqHYi0O3UI9fNd29IyE1k2E0GtfBli0uPhjdyBn28hxs31FuExxlSPHFqRT+W@lists.ozlabs.org
X-Gm-Message-State: AFq9FYJV4UGPHXkx7M7d+ls0An1EIsjIpxrn8Tg96wk6bApfTWx4/Jtq
	pbBc4NXWCOOgwLkIlvlQJ6X9qavUbQLImaMnRc3uW21ehsisxj1xOprW
X-Gm-Gg: AYBFou3chJfVRvu1LAOOcgWXtEXQNJKGzs/KLYZRW/A+MYsNVqeqtOFZynTbmJsL0qM
	f3Avsr4x6w6j0uWq9kv2Uf2sRDHVADCCa3IcFI6YmDvTbmR70tYLa27ZcAMrdgPYnXHCbY4NXdS
	mZaptpFPmJJkQuoxQKlDcTHlIJF8Gj3vTTkR68uGkJlMDx+USJvTdkvph5P+VReksQKwHoZ74ei
	TIACKEGXgNoyi4kl1k4dRZ8t7L1/PghVu9M5aP34PgXF9G5wtgfNe+wgv6FL1xrmamA7XAs9zNY
	qQ5TmRrB6LW+5Y9qvXnJScCBCC4oq5DgG6mpT8qa3uXYXuXcyQaN41eYXckwB+NBSKJt8Nnwm80
	pX+ReBO7q63Hat3LY7C05OllgvSpMW77uJXTDLyNr3UNh54BJ0fC4p5fh1nVijfFv35pvBMdKPd
	YanLDhXyYkg3y31zo4aj1qXfLYoYw4K6ZhJQXEU5JUDgiDp6kNI+4vgsbl8mc1u59keFISol3GP
	FUCoGt//1bXwDuK9gv2U5WKm/kwh4o4WUD8yBCAUWRj4WVlDv7vCQju33VwDPcvGmCsNfnaCVPZ
	aP9A+VazjPlfOOO0tjlvYZlM8ELZzKKDiW+eSWYF369oi82ox/vEqmwFa4uW0KLt7l0lQq/gsVt
	qY6H/EATiHYetyPhtvKVDZ419PnHOx73Ufgd2+dnZZlM6PA==
X-Received: by 2002:a17:907:944e:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c46bddf8079mr627054166b.20.1792953818947;
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm225666866b.61.2026.10.25.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in npcm7xx_gpio_of() and npcm8xx_gpio_fw()
Date: Sun, 25 Oct 2026 20:43:35 +0200
Message-ID: <20261025184335.447963-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
child nodes using for_each_gpiochip_node(dev, child), which holds a
reference on child during each iteration. Returning early on any of the
error paths inside the loop leaks the child fwnode_handle reference.

Additionally, both functions call fwnode_property_get_reference_args()
to parse the "gpio-ranges" property into args, which acquires a
reference on args.fwnode that is never released.

Use the __free(fwnode_handle) cleanup attribute for child so early
returns automatically drop the reference, and call
fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
succeeds.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 +++-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbc..47bb642cf 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2016-2018 Nuvoton Technology corporation.
 // Copyright (c) 2016, Dell Inc
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -1827,7 +1828,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 	int ret = -ENXIO;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int id = 0;
 
 	for_each_gpiochip_node(dev, child) {
@@ -1855,6 +1856,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
 			return ret;
 		}
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index a68d55cae..83e4e1511 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020 Nuvoton Technology corporation.
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -2319,7 +2320,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 	struct gpio_generic_chip_config config;
 	struct fwnode_reference_args args;
 	struct device *dev = pctrl->dev;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int ret = -ENXIO;
 	int id = 0, i;
 
@@ -2345,6 +2346,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "gpio-ranges fail for GPIO bank %u\n", id);
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (ret < 0)
-- 
2.56.0


