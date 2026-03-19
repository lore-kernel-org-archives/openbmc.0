Return-Path: <openbmc+bounces-1635-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B6A103E19B
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 06:13:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbwPH0HKgz2ynZ;
	Thu, 19 Mar 2026 17:13:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773900818;
	cv=none; b=ieojetOo7ZzNZvNTDmk+AmKm8YhAm+8wX+GRE/b+4f6ORPpyg6zrNWKqD8rGTpvZvSS1qEFCK9omckac1Z+QRJS1vGxz5l2XwTQ2A3XR3DLP70sfFzoekHJsjNq5f4/cSO0MxIUH8K3VT0QZGm0yKj5opt/VsI80nwThqWlOog6GN5KHvk5S0cng7Qk2yZdAYopbeGvfmC3PvQBHOBA0DZHt3hVxptjt0tAGlUN03JQ7pwbLr+Q1WustvdiTSS3UwJjqF7LJn3SgUhzpZykglhofHs4BNN3h14VHpMlChL1AuaUoUU5zgabw1h3Ux+c+wG8p9F8M7TGRBPW17eeugg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773900818; c=relaxed/relaxed;
	bh=EYGrzXm0fDZivoSbCGW7+DgThYwdMreSgiggjAyapLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmXW8mbpr7PFDUmQsl1hRNF0GHRGkkZDDJr4t/mfD3zhWbnm36OHjxfMMCaec1cxxUpbNlBU1+R7EDKsfouQ2aHMrG1qZ/hryYNN8BoqWMJbpP5xbsdbZ96LE5KOJqPWwxjdQHP89UjU/LmBQEFFWjhF2skCo9IfvvIGWtUY33v3h2jhvd8I+zuaEChOH0hOaphVKxjUQwUtqtYCGJk3oWqJ3KjXF+Rg85RxJixcU6E9r2+5cZ1Qv0X9c36WBlHoF8F/tIOVt8C6RSVgFdRUfpRrXwSv24xDPVYVX+Ejlru4uXqpNJofPW5MwFaXWpY9gxHU+k0Ba3iW29JBg61a/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lx3ZzseH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lx3ZzseH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbwPD5sCYz2xZK
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 17:13:35 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c742723c863so275987a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 23:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773900813; x=1774505613; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYGrzXm0fDZivoSbCGW7+DgThYwdMreSgiggjAyapLw=;
        b=lx3ZzseHhr+IjVkef20+ASzE0wRvvkU3MCzn2XedEVfR5wPb72JHRjcMUaMHWDmy36
         5RJn+XXSkff5fo0+VxS14zzPYbDvm0wOPz3v/G+OkqTX2nG/wi0W6XRsq+gRul+x4cHi
         RpnyVAsKXsHm4pTNWQRr78/5yLaLY1fAqaSCA2P25WEyM9B3aoip2RkCONzqorewv9pk
         /8VJ+UWNuJLhti5kKWpyXJ9CPStnOIHO7q0CALb3qqtJ/fq3l6CZlsFTs1tFCQVFdb2G
         zpoGcfjcfrRX6xqUg+ush3aKsBS4WArBp2OGQ2kOj8kHUx3/PQf8RhNfjfTHFoSEpjaB
         Hi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900813; x=1774505613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EYGrzXm0fDZivoSbCGW7+DgThYwdMreSgiggjAyapLw=;
        b=dRNVqUigz/IhiRax9KdSnCYM4U+lKe516TDLGYwg0WqP3JqytI+Hna7aG5v9Tn+3p7
         VjTeNe3KzsOIGkeAjT88JdbcxJ/7PquIb3jMbC1ZJsi8QkzCKeunhaePrVyAtQatiumw
         HAb7Bb+CVECb2UcphPazDFJidEG09+9loVIy4R0oclKg7fKtBUtffRdOpmvpgHIZiXYU
         GkQOMjLH85ctVMYtPlfKbkBnmkioFh3LpVpp0TSY/BF/0tDj8XJQ/rHMefstEJkuaqUB
         DxsbqBYO352fQB1jpaBO+7Q939sYy3gotJSG8iZc/7DJGDxSptdQ4VLZCsnxgACIUG+Z
         2c7w==
X-Forwarded-Encrypted: i=1; AJvYcCVmgzbyVSHOagGNtRZ82m43PDIZh5CiYiodioHeK7jyQDUEsi+NH8D2ZN4y/7Cgqyq/Bd4K70jH@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp2svVSxT7v2OMgdidYDftaVz+rjzZIeVgzKE8+k11eHJO/sE5
	5gISwE07Xn2Aanc1wnpAEmOYPFRsnIR8nf2jhUfT/dkDHb2iRlENpvW/
X-Gm-Gg: ATEYQzxuv4AEHeUjZKFnKm9iWmQaGLIMjuAgmm8epwipE44yqCe7VoUFqQrI/ei/Ttm
	xJ2UztXH8nDNbH5m/LlhHF+k8Vci75RkotiOuiHjICdjd1sZ5196Qb7+MkbIi0oJkYRF6J1jSvq
	VGBZ38Z3GKMKD+l3nNRGPa+osX1QgN83Ae+NMw440fQBWyPGYjPEciPJurSxEt8kBxuxpOT4BIy
	1RCdmXngL0d87MxpB5YPvtiJ6Q5erZ3C2MhqshG/wGyFIo+5UKCvhl02o49SZ50UzVmAEKPBlyF
	P+XmzuSmG28ZAtWOPXy/eYsQDO6bZVf6R9ZiHSiCrIHpxfWBQ6nBjH8WgvrVNljnouosYTZfEND
	cIWEgTM+fJk4GELSnGAaXXVk7CRPQ5C73A/et+uir1XqUl9UgcLwxvMD6wyNUIPKQM+Xd5/z1ZL
	l6cK01QqgrIdC6rn7PxYI6nzVIOYGyqMZVrxUzkwCVnb45vbDXrCaKvl9A2KHLFq51pISFnw==
X-Received: by 2002:a05:6300:6702:b0:342:e2ef:332d with SMTP id adf61e73a8af0-39b99f5934dmr5899965637.40.1773900812788;
        Wed, 18 Mar 2026 23:13:32 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e583626sm4090578a12.30.2026.03.18.23.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:13:32 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.18 2/2] hwmon: (pmbus) add driver for MPS MP9945
Date: Thu, 19 Mar 2026 14:13:19 +0800
Message-ID: <20260319061319.43920-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319061319.43920-1-chou.cosmo@gmail.com>
References: <20260319061319.43920-1-chou.cosmo@gmail.com>
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

Add support for mp9945 device from Monolithic Power Systems, Inc.
(MPS) vendor. This is a single phase digital step down converter.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Link: https://lore.kernel.org/r/20251009205458.396368-2-chou.cosmo@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp9945.rst | 117 ++++++++++++++++
 MAINTAINERS                    |   7 +
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp9945.c   | 243 +++++++++++++++++++++++++++++++++
 6 files changed, 378 insertions(+)
 create mode 100644 Documentation/hwmon/mp9945.rst
 create mode 100644 drivers/hwmon/pmbus/mp9945.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 2be07966fed6..549017d3689d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -185,6 +185,7 @@ Hardware Monitoring Kernel Drivers
    mp5926
    mp5990
    mp9941
+   mp9945
    mpq8785
    nct6683
    nct6775
diff --git a/Documentation/hwmon/mp9945.rst b/Documentation/hwmon/mp9945.rst
new file mode 100644
index 000000000000..f406f96efcf9
--- /dev/null
+++ b/Documentation/hwmon/mp9945.rst
@@ -0,0 +1,117 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp9945
+=====================
+
+Supported chips:
+
+  * MPS mp9945
+
+    Prefix: 'mp9945'
+
+Author:
+
+	Cosmo Chou <chou.cosmo@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP9945 Digital Single-phase Controller.
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
+**in2_min**
+
+**in2_min_alarm**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
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
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+**power2_max**
+
+**power2_max_alarm**
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 10b1f6f61afc..ecfe0799256d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17529,6 +17529,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp9941.rst
 F:	drivers/hwmon/pmbus/mp9941.c
 
+MPS MP9945 DRIVER
+M:	Cosmo Chou <chou.cosmo@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp9945.rst
+F:	drivers/hwmon/pmbus/mp9945.c
+
 MR800 AVERMEDIA USB FM RADIO DRIVER
 M:	Alexey Klimov <alexey.klimov@linaro.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 6860673bcecf..cae994fb21ab 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -480,6 +480,15 @@ config SENSORS_MP9941
 	  This driver can also be built as a module. If so, the module will
 	  be called mp9941.
 
+config SENSORS_MP9945
+	tristate "MPS MP9945"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP9945.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp9945.
+
 config SENSORS_MPQ7932_REGULATOR
 	bool "Regulator support for MPQ7932"
 	depends on SENSORS_MPQ7932 && REGULATOR
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 57f23fb0ab86..bd37eddf16a7 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
 obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
+obj-$(CONFIG_SENSORS_MP9945)	+= mp9945.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
 obj-$(CONFIG_SENSORS_MPQ8785)	+= mpq8785.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
diff --git a/drivers/hwmon/pmbus/mp9945.c b/drivers/hwmon/pmbus/mp9945.c
new file mode 100644
index 000000000000..34822e0de812
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp9945.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for MPS Single-phase Digital VR Controllers(MP9945)
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define MFR_VR_MULTI_CONFIG_R1	0x08
+#define MFR_SVID_CFG_R1		0xBD
+
+/* VOUT_MODE register values */
+#define VOUT_MODE_LINEAR16	0x17
+#define VOUT_MODE_VID		0x21
+#define VOUT_MODE_DIRECT	0x40
+
+#define MP9945_PAGE_NUM		1
+
+#define MP9945_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+				PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | \
+				PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | \
+				PMBUS_HAVE_TEMP | \
+				PMBUS_HAVE_STATUS_VOUT | \
+				PMBUS_HAVE_STATUS_IOUT | \
+				PMBUS_HAVE_STATUS_TEMP | \
+				PMBUS_HAVE_STATUS_INPUT)
+
+enum mp9945_vout_mode {
+	MP9945_VOUT_MODE_VID,
+	MP9945_VOUT_MODE_DIRECT,
+	MP9945_VOUT_MODE_LINEAR16,
+};
+
+struct mp9945_data {
+	struct pmbus_driver_info info;
+	enum mp9945_vout_mode vout_mode;
+	int vid_resolution;
+	int vid_offset;
+};
+
+#define to_mp9945_data(x) container_of(x, struct mp9945_data, info)
+
+static int mp9945_read_vout(struct i2c_client *client, struct mp9945_data *data)
+{
+	int ret;
+
+	ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+	if (ret < 0)
+		return ret;
+
+	ret &= GENMASK(11, 0);
+
+	switch (data->vout_mode) {
+	case MP9945_VOUT_MODE_VID:
+		if (ret > 0)
+			ret = (ret + data->vid_offset) * data->vid_resolution;
+		break;
+	case MP9945_VOUT_MODE_DIRECT:
+		break;
+	case MP9945_VOUT_MODE_LINEAR16:
+		/* LSB: 1000 * 2^-9 (mV) */
+		ret = DIV_ROUND_CLOSEST(ret * 125, 64);
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return ret;
+}
+
+static int mp9945_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		/*
+		 * Override VOUT_MODE to DIRECT as the driver handles custom
+		 * VOUT format conversions internally.
+		 */
+		return PB_VOUT_MODE_DIRECT;
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mp9945_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp9945_data *data = to_mp9945_data(info);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = mp9945_read_vout(client, data);
+		break;
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = i2c_smbus_read_word_data(client, reg);
+		if (ret < 0)
+			return ret;
+
+		/* LSB: 1.95 (mV) */
+		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * 39, 20);
+		break;
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+		ret = i2c_smbus_read_word_data(client, reg);
+		if (ret < 0)
+			return ret;
+
+		ret &= GENMASK(9, 0);
+		if (ret > 0)
+			ret = (ret + data->vid_offset) * data->vid_resolution;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+
+	return ret;
+}
+
+static int mp9945_identify(struct i2c_client *client,
+			   struct pmbus_driver_info *info)
+{
+	struct mp9945_data *data = to_mp9945_data(info);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
+	case VOUT_MODE_LINEAR16:
+		data->vout_mode = MP9945_VOUT_MODE_LINEAR16;
+		break;
+	case VOUT_MODE_VID:
+		data->vout_mode = MP9945_VOUT_MODE_VID;
+		break;
+	case VOUT_MODE_DIRECT:
+		data->vout_mode = MP9945_VOUT_MODE_DIRECT;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 3);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_read_word_data(client, MFR_VR_MULTI_CONFIG_R1);
+	if (ret < 0)
+		return ret;
+
+	data->vid_resolution = (FIELD_GET(BIT(2), ret)) ? 5 : 10;
+
+	ret = i2c_smbus_read_word_data(client, MFR_SVID_CFG_R1);
+	if (ret < 0)
+		return ret;
+
+	data->vid_offset = (FIELD_GET(BIT(15), ret)) ? 19 : 49;
+
+	return i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+}
+
+static struct pmbus_driver_info mp9945_info = {
+	.pages = MP9945_PAGE_NUM,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.func[0] = MP9945_RAIL1_FUNC,
+	.read_word_data = mp9945_read_word_data,
+	.read_byte_data = mp9945_read_byte_data,
+	.identify = mp9945_identify,
+};
+
+static int mp9945_probe(struct i2c_client *client)
+{
+	struct mp9945_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp9945_info, sizeof(mp9945_info));
+
+	/*
+	 * Set page 0 before probe. The core reads paged registers which are
+	 * only on page 0 for this device.
+	 */
+	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	if (ret < 0)
+		return ret;
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+static const struct i2c_device_id mp9945_id[] = {
+	{"mp9945"},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp9945_id);
+
+static const struct of_device_id __maybe_unused mp9945_of_match[] = {
+	{.compatible = "mps,mp9945"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp9945_of_match);
+
+static struct i2c_driver mp9945_driver = {
+	.driver = {
+		.name = "mp9945",
+		.of_match_table = of_match_ptr(mp9945_of_match),
+	},
+	.probe = mp9945_probe,
+	.id_table = mp9945_id,
+};
+
+module_i2c_driver(mp9945_driver);
+
+MODULE_AUTHOR("Cosmo Chou <chou.cosmo@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP9945");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
-- 
2.43.0


