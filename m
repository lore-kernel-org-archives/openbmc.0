Return-Path: <openbmc+bounces-1959-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC0FCD4F4A
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:53:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2R6Fxnz2ySD;
	Tue, 19 May 2026 09:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091833;
	cv=none; b=V9ZXTP8JydvTyqL11yKKQcVveH/kapfyS+NNV8Xxv7O+jYtZbVxjKeqFyzFflCIgCwEzYN0xo+sikfGGW9kBJEl003fW8Ugd5lLhgFs/AqZ6OHjXpBjpXkNLjDw2NxOfNG14FE8og56EIAQUjha4cSbkSsjnxkY8rkUictTJ/JRO9Cz0yQ5M2/p/KysQwnOCBLkRrDpLpXwbeKjuSHpcJbNPQ+WRsrdha1dKGhBC86ZEA3rdu5vR+JII/Fj3hd1OkpfuLVi4bYaZNgqOhsqU5X5P5cbRxfT088DvChTWFFXfYM/l08DphG22rx44nTlwSb0y7+Vb30SK/rdB80VcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091833; c=relaxed/relaxed;
	bh=wqfSH+ay3fv/3RlfxRBewJa3JpOS/vBtw+G1teJi+/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OA3LtxFK0IohX3ZjkkXJ9rnp1oNHPGRdWJT2eLyszwBU4QjChl+O2u1LzRDdLfZgIPhXkQJ4qa7fK+NMNokSYecmTH1ugs/ABBTZ/SQ1tNzqzyslntIknMSJwOebHoDT6Huty9AZHcbVyjXDYhlVBA2E7fX4vB0trQqxlgCfG2bUel6/snS5vtDWXS1U/EcoGOjntixRZ3+owp4p1wY4+mUv9lUlqzJaNwd+WHw2StbXcBBbGbAT9OL0lMo/xb7IG9a+qLTOIRzqBbgAydK9k9W0YHsJGXval8VLCzjhvt7FdbNnPSExoZZB1VLIK/QExLkBgb8M0E9kDzyDdagqtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s93eHZZP; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s93eHZZP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr8S59KCz3br5
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:10:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACCCE6001A;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 619AAC2BCF5;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091830;
	bh=2OCIpw46UIOg+ZoPCSiRRexVF+vsoKHmgY/B3U4IpWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s93eHZZPle7DvYGZnxEbJy44Qg9At4oL5Lu4Ok10LxRvH/HmKQoxX3fIh2F0TGt7O
	 vRQHa7s1jroJglb1lvjAooyS2FKt/OuCgQxACmvJYkGF3a2Z29OsO7czNCBhJer1cR
	 q304yzPYF5OSmwmfw5bOm9Hs0YyalbH6U4tuP7IuQ49gq6bikRlxTb9vRcIFnWfYME
	 5viIqNjINfKhjfz5zGb0bXoqbyzKzaeUWLWxRIJh5kJ7x5K2IVO4MbJjslZnVp2dC5
	 kWulxYTk4KSzSXJ1Y3LsK9bkL4qS2wVuysLEb3OkQjb1ptXKE/Yhe/97a9uxaA2Fmk
	 5LKLprS0WE79Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59147CD4F54;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 18 May 2026 16:10:19 +0800
Subject: [PATCH linux dev-6.6 3/3] hwmon: (pmbus) add support for Delta
 E50SN12051
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
Message-Id: <20260518-dev-6-6-e50sn12051-driver-v1-3-8025fb61706e@gmail.com>
References: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
In-Reply-To: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091827; l=3559;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2rz+C1dqYzxrgqZAGjitlJyEgxXTPBWZesnlebJDpVg=;
 b=JRZ2k8ytZw9k5mGkI5yGN33wK9lHf4/WCgCKCucRGAA1IZEMjNUBd6z8GNwaBJJrCDuPiElRS
 MZ/YNcQiwGXDNTvEf4GA9R66VaMTjZPqgMX/m/q4wjQmBuVIAr4iI10
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add the pmbus driver for Delta E50SN12051 600W Non-isolated
1/8th Brick DCDC Power Modules.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20260508-add-e50sn12051-v5-3-abebdcc29665@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/Kconfig      |  9 +++++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/e50sn12051.c | 52 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 60e74ced989a..a17050857da2 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -123,6 +123,15 @@ config SENSORS_DPS920AB
 	  This driver can also be built as a module. If so, the module will
 	  be called dps920ab.
 
+config SENSORS_E50SN12051
+	tristate "Delta E50SN12051 Power Modules"
+	help
+	  If you say yes here you get hardware monitoring support for Delta
+	  E50SN12051 Power Modules.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called e50sn12051.
+
 config SENSORS_INA233
 	tristate "Texas Instruments INA233 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 741eee9128b7..80e9d3a72906 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
+obj-$(CONFIG_SENSORS_E50SN12051) += e50sn12051.o
 obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn12051.c
new file mode 100644
index 000000000000..efb4d62b2603
--- /dev/null
+++ b/drivers/hwmon/pmbus/e50sn12051.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for E50SN12051
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info e50sn12051_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
+		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static const struct i2c_device_id e50sn12051_id[] = { { "e50sn12051", 0 }, {} };
+MODULE_DEVICE_TABLE(i2c, e50sn12051_id);
+
+static const struct of_device_id e50sn12051_of_match[] = {
+	{ .compatible = "delta,e50sn12051" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, e50sn12051_of_match);
+
+static int e50sn12051_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &e50sn12051_info);
+}
+
+static struct i2c_driver e50sn12051_driver = {
+	.driver = {
+		.name = "e50sn12051",
+		.of_match_table = e50sn12051_of_match,
+	},
+	.probe = e50sn12051_probe,
+
+	.id_table = e50sn12051_id,
+};
+
+module_i2c_driver(e50sn12051_driver);
+
+MODULE_AUTHOR("Kevin Chang <kevin.chang2@amd.com>");
+MODULE_DESCRIPTION("PMBus driver for E50SN12051");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");

-- 
2.34.1



