Return-Path: <openbmc+bounces-1625-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC4C1088E4B
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:45:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkRN6626z2yr9;
	Thu, 19 Mar 2026 09:44:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773862610;
	cv=none; b=n3ODq2ioUgtIgX+hYb1/kIAI8uMKuY7xliZeHelffmNg7yhneFY/fqB2m1B0vADwctuqBSI5FNjCqzRDSuNuAHnuxfMP2e+LYIF11BkNyEatqfWFs/3z3rz03lNf6p6DTmQl3JyHAi/++Ml++l6l1dXwJtwimbYmZm1YtomGroiWyYL/zhiGC4/jQFj9aIdFV3q6mzHtvG5I4d5lTP+wAj09i8Kzakipba441RTMaWUl6cz94EXNUpzus6W9HOKwWPoUpfGtRT2ebPvYZIWUGEu4FqomuBluYpjw+E4djcmakAn9juT8viTB+3dDhX/VjbEMr5KEnhXHufwSiJ8Vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773862610; c=relaxed/relaxed;
	bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esMhhK82zsk6sWzHNf+f9pfSdKToyIfEAUReNkS2mKcQMyAFVUpLfrG8ay4UWzX+fqbACHHj0p6BeIdPl4PF8VSS2jL9CxdwJ7o6gi3eeC2entZQ2posqbZxTgLKf3teKWdpDA6AN6XufPdEZXl8JeBYfNiIwMz9Mvaqw/kgo+rdaecZOJFz9Pz7KnXfaEE+8hqQfLgDgVk6y9OuBhD9VWhSEW7gE4dmJYjCVj/Gbr4zIkYdb6PnIhtUS8+/gbncVFWRfvpNmiSHYPnBhQ9F93bvs98J6BHaNezI3HvUAe7lhMcvm5i9WToVoTofvmqLCYdQtwXAtj2LNq4gzOHtgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PnNv6p9H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PnNv6p9H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbfGT4t3Wz2ynH
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 06:36:49 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so221368a91.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 12:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862608; x=1774467408; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=;
        b=PnNv6p9H29MdMAv9D7warOG39caDiiWN2glZ0VhSTkv1iTKkurAeupZLRK6IkRNC6d
         XXXJNwgQuuOT8+JCGnQnnr7SfHpSAKy2NXoksGeX0IAybQvOIhbR6IwV7h6E+XDqwesz
         Ai/sFNqWXLsvXvL8s/+jOGN9dacug5R/YJ3ZCGjMC18w7NaihlmEvmsJuRAiZ/jpzrXl
         YbXxB5pq022vF9Chr8CEJcpBN3/UyzaKsgtAasbanuzW3C6Boh57NDVZhDuO00Z17uom
         pmgsi6pVvtBvHsUV7WpJQBgWDAV+Gzvdzz4mHjz71k25cbC4EEWiMEf+WucqSc9rifZt
         /qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862608; x=1774467408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2iY4og2qGh/roH7GFoTs23bu6QUHnKE8+1qN6pUKQh8=;
        b=hG4aDfRT+ZNIBGJL83+vQ02suUIXjv0sSSAaYDCpoE4qSRwBeAd5PGNfXsyqVyz4Jq
         kBV0qbnwPsx09llOIEwpQPoNlS+XXp4tiLDPLHc3j++3CyRneSmvL6tmxaxsjoVwnXhe
         p8VmvfM5ySNxDHzjY9fHZUXy8mpt55YXimqSJMFMaiNR3+r6XXRlPOuPwH1qIaQ/Ayzm
         rMUpQAVIJKIneDNV9MZDA4PzFwKpGdUDkrhR+S7hG7StSc95OOqS7rF/Y9gQIKuwbdGO
         Y0Z6TqDZvq7gjLR2te3bOhJKnpgkVmJkxlFb2xKp+2UE7GyOEuwrfiThDyhV9+cSGkGG
         YT3A==
X-Forwarded-Encrypted: i=1; AJvYcCUdY26r5b7u9XTLLmEw7ZbueSHtUecNs+LAfuge+mTUiw3oKdymLzVkT0T8xujGP+dy1uSVJYMe@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziL/W8PXnQ4FxbN4iUn5afSfq5r7ErgO3ctgcwPd1BySUqyUhu
	trQOR4So8WeYW0Gm3bWrv2SJDF6nenCiNJWQC+Vc+zOHcpA3odNdF/Ag
X-Gm-Gg: ATEYQzygTejcV1SDT0/ijgk8hlUY4Yb/xqrVN59dc3J36UiepMrzfrvWwSNAWEX5iiD
	mWPw7YmbI85MAEjZ1BQWtJU7Iskhw46GjFQg5I3CrUUOM2EfKv8f+fpEvOOdxkoJk78wXrpDpP2
	eTSaARfg5707Xxm7aiUzQvvNE5yCQjJ6saDAe5AbL7YpepMQMSmBdfxSdvTBFKdyR7uGzxrh+la
	rB7aZv1kWwysIUXXR090Gtd/c0YHZN9Vk9sBtzgJyGLTruJjRamyLLFtyBibJf/+ZQ9Oj0Rtr9K
	SjLG1PnIpDhaMUQW+1LndAklhqRLwVRiwtJkGNoTC7uiCkE/i2A/1fHRpb1h2gzeuixO8OL35NY
	6UbXmLrAM/SnnxqYaGEWLBDhE932dH+f2Z4JEi2fbR5GeH99pzoEagszv5qG7zVvkA/fQliKyAz
	I98KR+ey61M/IgPBADXioZzEr45C5nwFR6vjDbeztnRKGZQ8FxOiPSpU5+bqgW1mJSp+8DqUpzm
	SGtf4kfoMpKzXJUb/5lyuDimCb+kK0Le/4CkF8=
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35bb9e3b705mr4266431a91.4.1773862607823;
        Wed, 18 Mar 2026 12:36:47 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:47 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/3] nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
Date: Wed, 18 Mar 2026 19:35:37 +0000
Message-ID: <20260318193538.246853-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
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

Add a new NVMEM driver for the OTP memory controllers found on Nuvoton
NPCM SoCs.

This OTP is read-only and manages two independent arrays: Key Storage
and Fuse Array, which contain cryptographic keys, hardware strapping,
and calibration data.

Each array provides 1024 bytes of storage.

It can be accessed by writing the target address and a read command
to the control registers, and then polling a status register until
the data is ready. Concurrent accesses are protected by a mutex.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS              |   7 +++
 drivers/nvmem/Kconfig    |  10 +++
 drivers/nvmem/Makefile   |   2 +
 drivers/nvmem/npcm-otp.c | 129 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)
 create mode 100644 drivers/nvmem/npcm-otp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c..e391e2bcb5f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18894,6 +18894,13 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NPCM OTP NVMEM DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
+F:	drivers/nvmem/npcm-otp.c
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..5d065b7448ff 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -483,4 +483,14 @@ config NVMEM_QORIQ_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem_qoriq_efuse.
 
+config NVMEM_NPCM_OTP
+	tristate "Nuvoton NPCM7xx OTP Controller"
+	depends on ARCH_NPCM || COMPILE_TEST
+	help
+	  This option enables support for the OTP (One-Time Programmable)
+	  controller found on Nuvoton NPCM7xx BMCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called npcm-otp.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..63c23b304d64 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -95,3 +95,5 @@ obj-$(CONFIG_NVMEM_ZYNQMP)		+= nvmem_zynqmp_nvmem.o
 nvmem_zynqmp_nvmem-y			:= zynqmp_nvmem.o
 obj-$(CONFIG_NVMEM_QORIQ_EFUSE)		+= nvmem-qoriq-efuse.o
 nvmem-qoriq-efuse-y			:= qoriq-efuse.o
+obj-$(CONFIG_NVMEM_NPCM_OTP)		+= nvmem-npcm-otp.o
+nvmem-npcm-otp-y			:= npcm-otp.o
diff --git a/drivers/nvmem/npcm-otp.c b/drivers/nvmem/npcm-otp.c
new file mode 100644
index 000000000000..abe4bab66c06
--- /dev/null
+++ b/drivers/nvmem/npcm-otp.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton NPCM7xx OTP (One-Time Programmable) NVMEM driver
+ *
+ * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+/* Register offsets and bitmasks */
+#define NPCM_OTP_FST		0x00
+#define NPCM_OTP_FADDR		0x04
+#define NPCM_OTP_FDATA		0x08
+#define NPCM_OTP_FCTL		0x14
+
+#define FST_RDY			BIT(0)
+#define FST_RDST		BIT(1)
+#define FCTL_READ_CMD		0x02
+
+/* OTP total capacity is 8192 bits (1024 Bytes) */
+#define NPCM_OTP_SIZE		1024
+
+struct npcm_otp {
+	void __iomem *base;
+	struct mutex lock; /* protects concurrent OTP accesses */
+};
+
+static int npcm_otp_read_byte(struct npcm_otp *otp, unsigned int offset, u8 *val)
+{
+	u32 fst;
+	int ret;
+
+	writel(offset, otp->base + NPCM_OTP_FADDR);
+	writel(FCTL_READ_CMD, otp->base + NPCM_OTP_FCTL);
+
+	ret = readl_poll_timeout(otp->base + NPCM_OTP_FST, fst,
+				 (fst & FST_RDY), 10, 10000);
+	if (ret)
+		return ret;
+
+	*val = (u8)(readl(otp->base + NPCM_OTP_FDATA) & 0xFF);
+
+	/* Clear the status bit to prepare for the next read */
+	writel(FST_RDST, otp->base + NPCM_OTP_FST);
+
+	return 0;
+}
+
+static int npcm_otp_read(void *context, unsigned int offset,
+			 void *val, size_t bytes)
+{
+	struct npcm_otp *otp = context;
+	u8 *buf = val;
+	int ret = 0;
+	size_t i;
+
+	mutex_lock(&otp->lock);
+
+	for (i = 0; i < bytes; i++) {
+		ret = npcm_otp_read_byte(otp, offset + i, &buf[i]);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&otp->lock);
+
+	return ret;
+}
+
+static int npcm_otp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct npcm_otp *otp;
+	struct nvmem_config config = { 0 };
+	struct nvmem_device *nvmem;
+
+	otp = devm_kzalloc(dev, sizeof(*otp), GFP_KERNEL);
+	if (!otp)
+		return -ENOMEM;
+
+	otp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(otp->base))
+		return PTR_ERR(otp->base);
+
+	mutex_init(&otp->lock);
+
+	config.dev = dev;
+	config.name = dev_name(dev);
+	config.read_only = true;
+	config.word_size = 1;
+	config.stride = 1;
+	config.reg_read = npcm_otp_read;
+	config.priv = otp;
+	config.size = NPCM_OTP_SIZE;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register nvmem\n");
+
+	return 0;
+}
+
+static const struct of_device_id npcm_otp_dt_ids[] = {
+	{ .compatible = "nuvoton,npcm750-key-storage" },
+	{ .compatible = "nuvoton,npcm750-fuse-array" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_otp_dt_ids);
+
+static struct platform_driver npcm_otp_driver = {
+	.probe		= npcm_otp_probe,
+	.driver		= {
+		.name	= "npcm-otp",
+		.of_match_table = npcm_otp_dt_ids,
+	},
+};
+module_platform_driver(npcm_otp_driver);
+
+MODULE_AUTHOR("Kuan-Wei Chiu <visitorckw@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM7xx OTP NVMEM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0.851.ga537e3e6e9-goog


