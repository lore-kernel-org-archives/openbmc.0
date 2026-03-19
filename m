Return-Path: <openbmc+bounces-1652-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E62109192C
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:43:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLLj4jW5z2ySC;
	Fri, 20 Mar 2026 09:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773905843;
	cv=none; b=jixbAicfCy5lCgUX1JUhh83yAbCN5yCWiJ4fFmVqAyt2Upoxq+94yBwes4U5ZQ0HpTrgxJU1ZOPeJeKdM2EMT6Bt11dpUNhaGvyBFvRyjt1Vl3zogzTt7N7BRyohdY9UNGxfifk+24M4MBRyTz4ImcA3Hd01AdpOVLcFTKiBPCxYiU/z1tJfg9lPI6dODlIburOqw0C/F4RNBdUtkJ1x80rFjwRQMLWAhr8ALVooUuIL52dePKLwCLy+/lcLLAM+rVDrkAQklDiRuH16QjkxICU5XaHOKoAlhQWKBOnrUmNnZwNy/vDMv2AXTJ3veNv5VzMS9rzXLEXAhC99r32niA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773905843; c=relaxed/relaxed;
	bh=wZPW6MvRh6eh3TexeAe9y0l2Hw1NgoXFCr0oQMMfkbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGXcTKqdTgxJYvJSh7mYc21jvulOeX8ndGUkOHyVfXVegT2v9lNfQnAJaMdrXgGb/ZrFjX/bpJ0u0d96LSIP+P/emdFgDIuMm0wv53/3LpmPPG82FGv12Dy/XuAa6QvB6TPB9aoT+F3rnOSHFfFG3Hg587vqDpK23xY3ZFDGsT2t/V5nuK0alnpGKyIWhoXIMgJ2LQX09tbDbTgM/lqLr7lD7vGb3XWLn3BVCrIxdizPgHJ2Y4RTGoXnUC0eM8RqARFYYdA0VakCrXGckQ+MIAIXR5f1AzFuNneyx2s1gD7CSOXAV8thoxbzT2Ew6n7TjUY6NY961T5Wmx0gZY0mYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jh7aK2QZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jh7aK2QZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=jackson870728@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbyFt0Df5z2ykV
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 18:37:21 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70c112cb61so472866a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773905840; x=1774510640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZPW6MvRh6eh3TexeAe9y0l2Hw1NgoXFCr0oQMMfkbU=;
        b=jh7aK2QZmjVjNUXJmUiQQukWFk7VcvwW98/aK/Zh3kpp5YEbLg7ztotBgi1yuYWO7x
         n8l0xAkZfndrHSXtqoV0egJIKMzkG5o85AVpxpewnISPSFPph6RHcw0WviCUbp1eIt3S
         iEPdZ8nd9imKjvPXNFibdYqNlSyniz+Z1all8r55eK4GfgBAcGI2k3zDMIAhHDMLvsvt
         8hQIu7rBfhzBz/0ZX5n6v6GFMogIAg8j40R5wsW5o02Tj6cdZI8RdWMDRr9XJWGD1vuG
         Zlq0i/NEaU5xngRZS9qTYGJJNvp9Hh+Elnr/EuvTbu/QEnCKWkL5wGRXKoC6B6MZnGjz
         TeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905840; x=1774510640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZPW6MvRh6eh3TexeAe9y0l2Hw1NgoXFCr0oQMMfkbU=;
        b=g/Eqo75iVgKpZEYDdEhgNGsvhkR9QBThZ47i5yUtDkSWOFLF39VUkH5jOdtWmSeoZh
         FIGLVMT7WGk518p1sNudddq0eaG7FHWqc9Ze+hrg9oMY/LFyoElDiLKIPrzth5llrK7M
         Th3yfd6EfR0N+qTf9+e6M00HFGWNFbzaxamTGBxY/DXXojKHvpA0dKYjs8Ds7QGIaC86
         K9jiybzd2K5/qZXzUUAis6tLeX3s9aRT42l5N+hisI05vdo6XautTVFqTnQmzMXeLeGk
         y8o9J+wHUTTCFBmVIlhFxcj+yIaJ/bV+twOMjVeIYK+L68FLEWcG3s7UuftTtAzFe60Y
         /SOA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6o0jRGQsogxIU8F8yDveXM8/BpSn31MrJFbZpH8UuxXHiQQoqNnJN9GgUOyKOUnC6PRAafzQ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEMYMyP8xr2G0A8ituZP/mJx9HMLgP6vEA2oj3EePDaVLvUwhA
	heEQ34AWWCIVUo2c4tRkC/PFsrDJMrJuE78fTVpN0p+XHUbaFQnwqbS5
X-Gm-Gg: ATEYQzyTZElkSNN0PHAAVWB2mtxF0xiY58y7pWc63o8cq/rS9foUsdVtWVA1AZ0w4GL
	iYLFSSq57rAYZPM59HGIAVUksM7MFv6DsyU6gzVg3ah4Sba02xCxdx/13sHmLwjdMGoroP1735g
	hIRNLsY76EzOecBXxdcAMpo/G3IcDbdaRixrewujzi2IlY/jTqtOWReiy0myTYFH40nUDV0E8lj
	67ZIJbSkba5Su+UIUSBpbbibotj4TeMJ1xJtL019ovoqfk7Rl8IPNZ4H6SxelLW203xzNQgsc/h
	D1G59vNUO9Pf4sYfPQdaE4ul5UH+CB7OHu/nSLpqLiIOT5QLjNVvBUXbeBvH4vKQsbWHFOWPSAx
	7cN6Jim2M5SWO+JkJnJSCOc0QW2m2900rAjSvN6HaS8BuW4LD2dkkz6BRUsUN56yWfXyNGf8unA
	YA9piyeFgDioYNgZyHv402tkxM1k0kzTgKeEqJHn5oOreGCBLN1GSUWkOYNX0iNdMaK10TCvKVA
	tVIm4+JiVxQi1c4MjGdoi0jdnQLJOLv
X-Received: by 2002:a05:6a21:329b:b0:398:9a90:659e with SMTP id adf61e73a8af0-39b99fc2b0emr5989967637.32.1773905839665;
        Thu, 19 Mar 2026 00:37:19 -0700 (PDT)
Received: from jackson-ubuntu24.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e568e36sm4633192a12.23.2026.03.19.00.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 00:37:19 -0700 (PDT)
From: Jackson Liu <jackson870728@gmail.com>
X-Google-Original-From: Jackson Liu <Jackson.Liu@quantatw.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: jackson.liu@quantatw.com
Subject: [PATCH linux dev-6.18 2/3] hwmon: Add MP2925 and MP2929 driver
Date: Thu, 19 Mar 2026 15:35:11 +0800
Message-ID: <20260319073515.1577998-2-Jackson.Liu@quantatw.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319073515.1577998-1-Jackson.Liu@quantatw.com>
References: <20260319073515.1577998-1-Jackson.Liu@quantatw.com>
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
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Wensheng Wang <wenswang@yeah.net>

Add support for MPS VR mp2925 and mp2929 controller. This driver exposes
telemetry and limit value readings and writtings.

Signed-off-by: Wensheng Wang <wenswang@yeah.net>
Link: https://lore.kernel.org/r/20250928092845.1394718-2-wenswang@yeah.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit a79472e30be48e6693f83d298836880b56afc5a7)
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp2925.rst | 151 ++++++++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 +
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp2925.c   | 316 +++++++++++++++++++++++++++++++++
 6 files changed, 485 insertions(+)
 create mode 100644 Documentation/hwmon/mp2925.rst
 create mode 100644 drivers/hwmon/pmbus/mp2925.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 2be07966fed6..960f9166ae8e 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -177,6 +177,7 @@ Hardware Monitoring Kernel Drivers
    mp2869
    mp2888
    mp2891
+   mp2925
    mp29502
    mp2975
    mp2993
diff --git a/Documentation/hwmon/mp2925.rst b/Documentation/hwmon/mp2925.rst
new file mode 100644
index 000000000000..63eda215b6cb
--- /dev/null
+++ b/Documentation/hwmon/mp2925.rst
@@ -0,0 +1,151 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp2925
+====================
+
+Supported chips:
+
+  * MPS mp2925
+
+    Prefix: 'mp2925'
+
+  * MPS mp2929
+
+    Prefix: 'mp2929'
+
+Author:
+
+	Wensheng Wang <wenswang@yeah.net>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP2925 Dual Loop Digital Multi-phase Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+**in1_lcrit**
+
+**in1_lcrit_alarm**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_crit**
+
+**in2_crit_alarm**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in3_input**
+
+**in3_label**
+
+**in3_crit**
+
+**in3_crit_alarm**
+
+**in3_lcrit**
+
+**in3_lcrit_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+**curr2_crit**
+
+**curr2_crit_alarm**
+
+**curr2_max**
+
+**curr2_max_alarm**
+
+**curr3_input**
+
+**curr3_label**
+
+**curr3_crit**
+
+**curr3_crit_alarm**
+
+**curr3_max**
+
+**curr3_max_alarm**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for output power:
+
+**power3_input**
+
+**power3_label**
+
+**power4_input**
+
+**power4_label**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp2_input**
+
+**temp2_crit**
+
+**temp2_crit_alarm**
+
+**temp2_max**
+
+**temp2_max_alarm**
diff --git a/MAINTAINERS b/MAINTAINERS
index 10b1f6f61afc..a697e450301d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17501,6 +17501,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp2891.rst
 F:	drivers/hwmon/pmbus/mp2891.c
 
+MPS MP2925 DRIVER
+M:	Noah Wang <wenswang@yeah.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp2925.rst
+F:	drivers/hwmon/pmbus/mp2925.c
+
 MPS MP29502 DRIVER
 M:	Wensheng Wang <wenswang@yeah.net>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 6860673bcecf..933dd3b71d21 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -401,6 +401,15 @@ config SENSORS_MP2891
       This driver can also be built as a module. If so, the module will
       be called mp2891.
 
+config SENSORS_MP2925
+    tristate "MPS MP2925"
+    help
+      If you say yes here you get hardware monitoring support for MPS
+      MP2925 Dual Loop Digital Multi-Phase Controller.
+
+      This driver can also be built as a module. If so, the module will
+      be called mp2925.
+
 config SENSORS_MP29502
 	tristate "MPS MP29502"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 57f23fb0ab86..be3884465641 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
 obj-$(CONFIG_SENSORS_MP2869)	+= mp2869.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
+obj-$(CONFIG_SENSORS_MP2925)	+= mp2925.o
 obj-$(CONFIG_SENSORS_MP29502)	+= mp29502.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
diff --git a/drivers/hwmon/pmbus/mp2925.c b/drivers/hwmon/pmbus/mp2925.c
new file mode 100644
index 000000000000..6bebd6023021
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp2925.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2925)
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+/*
+ * Vender specific register MFR_VR_MULTI_CONFIG(0x08).
+ * This register is used to obtain vid scale.
+ */
+#define MFR_VR_MULTI_CONFIG	0x08
+
+#define MP2925_VOUT_DIV	512
+#define MP2925_VOUT_OVUV_UINT	195
+#define MP2925_VOUT_OVUV_DIV	100
+
+#define MP2925_PAGE_NUM	2
+
+#define MP2925_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_PIN | \
+							 PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
+							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+#define MP2925_RAIL2_FUNC	(PMBUS_HAVE_PIN | PMBUS_HAVE_VOUT | \
+							 PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
+							 PMBUS_HAVE_TEMP | PMBUS_HAVE_IIN | \
+							 PMBUS_HAVE_STATUS_VOUT | \
+							 PMBUS_HAVE_STATUS_IOUT | \
+							 PMBUS_HAVE_STATUS_TEMP | \
+							 PMBUS_HAVE_STATUS_INPUT)
+
+struct mp2925_data {
+	struct pmbus_driver_info info;
+	int vout_scale[MP2925_PAGE_NUM];
+};
+
+#define to_mp2925_data(x) container_of(x, struct mp2925_data, info)
+
+static u16 mp2925_linear_exp_transfer(u16 word, u16 expect_exponent)
+{
+	s16 exponent, mantissa, target_exponent;
+
+	exponent = ((s16)word) >> 11;
+	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
+	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
+
+	if (exponent > target_exponent)
+		mantissa = mantissa << (exponent - target_exponent);
+	else
+		mantissa = mantissa >> (target_exponent - exponent);
+
+	return (mantissa & 0x7ff) | ((expect_exponent << 11) & 0xf800);
+}
+
+static int mp2925_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * The MP2925 does not follow standard PMBus protocol completely,
+		 * and the calculation of vout in this driver is based on direct
+		 * format. As a result, the format of vout is enforced to direct.
+		 */
+		ret = PB_VOUT_MODE_DIRECT;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2925_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp2925_data *data = to_mp2925_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * data->vout_scale[page],
+					MP2925_VOUT_DIV);
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * MP2925_VOUT_OVUV_UINT,
+					MP2925_VOUT_OVUV_DIV);
+		break;
+	case PMBUS_STATUS_WORD:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		ret = -ENODATA;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp2925_write_word_data(struct i2c_client *client, int page, int reg,
+				  u16 word)
+{
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VIN_OV_FAULT_LIMIT:
+	case PMBUS_VIN_OV_WARN_LIMIT:
+	case PMBUS_VIN_UV_WARN_LIMIT:
+	case PMBUS_VIN_UV_FAULT_LIMIT:
+		/*
+		 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
+		 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
+		 * of MP2925 is linear11 format, and the exponent is a
+		 * constant value(5'b11100)， so the exponent of word
+		 * parameter should be converted to 5'b11100(0x1C).
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2925_linear_exp_transfer(word, 0x1C));
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		/*
+		 * The bit0-bit11 is the limit value, and bit12-bit15
+		 * should not be changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    (ret & ~GENMASK(11, 0)) |
+				FIELD_PREP(GENMASK(11, 0),
+					   DIV_ROUND_CLOSEST(word * MP2925_VOUT_OVUV_DIV,
+							     MP2925_VOUT_OVUV_UINT)));
+		break;
+	case PMBUS_OT_FAULT_LIMIT:
+	case PMBUS_OT_WARN_LIMIT:
+		/*
+		 * The PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT of
+		 * MP2925 is linear11 format, and the exponent is a
+		 * constant value(5'b00000), so the exponent of word
+		 * parameter should be converted to 5'b00000.
+		 */
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2925_linear_exp_transfer(word, 0x00));
+		break;
+	case PMBUS_IOUT_OC_FAULT_LIMIT:
+	case PMBUS_IOUT_OC_WARN_LIMIT:
+		/*
+		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
+		 * of MP2925 is linear11 format, and the exponent can not be
+		 * changed.
+		 */
+		ret = pmbus_read_word_data(client, page, 0xff, reg);
+		if (ret < 0)
+			return ret;
+
+		ret = pmbus_write_word_data(client, page, reg,
+					    mp2925_linear_exp_transfer(word,
+								       FIELD_GET(GENMASK(15, 11),
+										 ret)));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int
+mp2925_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
+			   int page)
+{
+	struct mp2925_data *data = to_mp2925_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+	if (ret < 0)
+		return ret;
+
+	if (FIELD_GET(GENMASK(5, 5), ret)) {
+		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
+						page == 0 ? 3 : 4);
+		if (ret < 0)
+			return ret;
+
+		ret = i2c_smbus_read_word_data(client, MFR_VR_MULTI_CONFIG);
+		if (ret < 0)
+			return ret;
+
+		if (FIELD_GET(GENMASK(5, 5), ret))
+			data->vout_scale[page] = 2560;
+		else
+			data->vout_scale[page] = 5120;
+	} else if (FIELD_GET(GENMASK(4, 4), ret)) {
+		data->vout_scale[page] = 1;
+	} else {
+		data->vout_scale[page] = 512;
+	}
+
+	return 0;
+}
+
+static int mp2925_identify(struct i2c_client *client, struct pmbus_driver_info *info)
+{
+	int ret;
+
+	ret = mp2925_identify_vout_scale(client, info, 0);
+	if (ret < 0)
+		return ret;
+
+	return mp2925_identify_vout_scale(client, info, 1);
+}
+
+static const struct pmbus_driver_info mp2925_info = {
+	.pages = MP2925_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+
+	.func[0] = MP2925_RAIL1_FUNC,
+	.func[1] = MP2925_RAIL2_FUNC,
+	.read_word_data = mp2925_read_word_data,
+	.read_byte_data = mp2925_read_byte_data,
+	.write_word_data = mp2925_write_word_data,
+	.identify = mp2925_identify,
+};
+
+static int mp2925_probe(struct i2c_client *client)
+{
+	struct mp2925_data *data;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp2925_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp2925_info, sizeof(mp2925_info));
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id mp2925_id[] = {
+	{"mp2925"},
+	{"mp2929"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp2925_id);
+
+static const struct of_device_id __maybe_unused mp2925_of_match[] = {
+	{.compatible = "mps,mp2925"},
+	{.compatible = "mps,mp2929"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp2925_of_match);
+
+static struct i2c_driver mp2925_driver = {
+	.driver = {
+		.name = "mp2925",
+		.of_match_table = mp2925_of_match,
+	},
+	.probe = mp2925_probe,
+	.id_table = mp2925_id,
+};
+
+module_i2c_driver(mp2925_driver);
+
+MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP2925");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


