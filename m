Return-Path: <openbmc+bounces-1934-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDABCD4F25
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:52:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGnDp2qw4z2yQn;
	Fri, 15 May 2026 09:52:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778755791;
	cv=none; b=YYatjxYcO/8DcN3i1n6DP6Z9FM8yTFYLJeoHzhVFSAFzWOMOXKvVNl0RWLNl8pKIH88d/Ls0c7Q8s8RUlwLH/LixDj6sWeSPHv4ADpmG3g6Kqg8TW6uFkZNAc75pUt3h7LMZGS3tbwcEVg0EMPO4XZB7XQ/jQzYVGrYzzKvv5DuEv5/6A0F9a5IJ3PA1RVXF4wAvy58sHAKKiYiHrClutcLy+srCnDbt5o7aUM7Uh4lCXpUTxwmvslYtbla785h3A4G+a5n8Y/IKDFpgPxLCOuB8B84Hpz1LvrbRuFaCm/fpxKXFuQr3r0ePN9vWlQ9+RmE+2GjJav7Vj+FVjfH2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778755791; c=relaxed/relaxed;
	bh=wqfSH+ay3fv/3RlfxRBewJa3JpOS/vBtw+G1teJi+/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXRZXBopROp8HxWi1Y+Uy2qiLXNfsUMgG4+b+6dp23F4Ac6QtCzOd7iMNY76psSd0Ktd2ifIV7A+S00+0txRKAPJXtRf2vnjVUxg91ej7BToJh+jySXiqDUMIjHbp3q+9anu6Ryurr92QM8QBSWr2fXb/jUijEAb8Tl5ohXQbUsJqI2+2rDaKEQza9JbC/L07FgQgeyEHQVV617AOOpLCwji+Pn2FmL6VJqElKENjTry4PAixnYVWsJbgNc+S+7oxiLVziiowpQzoMlCe9XRIquGEMiR6NtM0FPxz3vnen9nX559VovWkQYGu0V7Du1JWdsUzFZwWWwImjhry6zKGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R+C+k7Zr; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R+C+k7Zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGRt662Tsz2xnQ
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 20:49:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8754C43C71;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FD7C2BCC7;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755788;
	bh=2OCIpw46UIOg+ZoPCSiRRexVF+vsoKHmgY/B3U4IpWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R+C+k7Zrd29eKeUZiZSvjHVKxb4qaP4TbMAVe/62g8x2CoPPvwxc6nqT3HgghFraD
	 Ri0qQK4hQj9p+XsYA7WnK5O1c6hEB0zxDe/LmVwnNA8rHTNfjrftllB+ayzVhjda+O
	 /RTeu/wgYlP+KNYeY86kg2jsFbyFg8mJiclXpGvSjql9ftmLi5a0RSYjwyBeyVcQbc
	 DZ9mOPsnes0wdjn7QkVrgawmdR6Yok/67bGoJtI/s5w3i3TZhSD7HEsS6skizL6642
	 8r8XrTo1GILQLhWcT24OGo0vMUgFdC5mQoOq/s+Lf+oGTEfPYkSCNGZJhHhuuuOKJq
	 OU70fToM2ipdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F41CD4F25;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 14 May 2026 18:49:43 +0800
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
Message-Id: <20260514-backport-dev-6-6-e50sn12051-driver-v1-3-44d2ef6c18dd@gmail.com>
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
In-Reply-To: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778755785; l=3559;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2rz+C1dqYzxrgqZAGjitlJyEgxXTPBWZesnlebJDpVg=;
 b=aMtqpBsEa52a3ZJFX42vg9Uukt/D9qayQVhNuOguhdvhZQ/O/u68HGhj5hO39yBwgGizi9721
 pyeBPAVzQPuDpth1KEAYDzYEr3zzA+7JFPJh+4+4qLpOo7LheclcoP3
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



