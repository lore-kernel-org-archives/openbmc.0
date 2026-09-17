Return-Path: <openbmc+bounces-2610-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE0FC982D0
	for <openbmc@archiver.kernel.org>; Thu, 17 Sep 2026 23:57:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hmCP94qBkz2yb9;
	Fri, 18 Sep 2026 09:57:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789638575;
	cv=none; b=XgSbdu4ZguOoNjq7cef/aHefmDepe9rVU/IR0WPNADwDPg/t9iz8ArsEBQIyyW63OEwSwpJ7Iv6j+9a0EzLMi08LzoWQI/Nsro54H1o/FXbCLNt29ZYwOEB4KYPVOQtODOHfZdJHGa52M5czh/SqVUtDd3jLHQLQvdbpKQCG5kV6uBDw11GlQgRYJ4rue+eTU3EI0jFaugxR6VtOUydLn/RuLWeAYRjHzQ3yMFQtAcE1cJOdW92WzV2zh6nEXkRVwG+Qs8A1tNji6FUkNN/gHTNVzDYP6cUvIR3psOwLjktOSXYYc7bB16aTT+KyMosylrRuRDghVxR+Ti0R62UIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789638575; c=relaxed/relaxed;
	bh=ZgwTGXShCe3AIyOuhsURGoGZR7g8bnSgl0XH92lkwt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mU7ynr74x/wt+9CliBhW2slwtcQN5mR3j6kSKkBT3GNnbv/mdqIGNAXRmU1sEdWnYVCoqRw8lT4DxclwZPIMAO4Z0kShjmfuMrIH0Y6qDbrYjvZ3MP6D+B3zucCB9soZ1ErIzMpU0oKAmhd0gzPQ28bwExH4loDIhoEo6Bbk9fnQRS33oCupaaMx2pi3Thkjye480F/8/b3b6sspn4+1ZuGNyW3o30qVHudsXr0W0fhAnSJvMxY7WZMbNzXxECDiEmHe2OrW4/WfdQnpqAxVQ4ddyzesi2bvYgy91bbMGDt6ULp7EjbbjXAzAfOtFXFALmcXesfb6DcfctdGVwOzyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+X0eHBO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J+X0eHBO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlrZQ4fsLz2y2Q
	for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2026 19:49:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E771543D8A;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4C57C2BCF7;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789638572;
	bh=QSNrmiz2UgFEYsCQo+2LuYkQCoNw21PfuYvKPSWTpJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J+X0eHBOLsTKEbAyJaok0xGOTXBaT1wCMwCVYYTbwRw1/xj5ejgkZE/LGNhWzDBwn
	 So8gQ8b9OoHRdiPysqz7sWTd8fXYcbajCoXGm0nyK4O9Z9mqrKSOO5xdTB3YgQo1h4
	 e+xvX8eAEWgGBG+9QpwZB6s1dWm4H8/jx1OW8VqPjHuAT3vw3Nf5ZWomQQ662fiMFc
	 ZZumkAK43uDgkgh2FZk6WWymURS/EbfIHhGD7DWKHwZp7VN+UwZWr2UySIpGCEEmQ4
	 nzFjr5MCikfngJlDUHDXKKSO1ltfJiUO1V2O/siGngIoIL/KX6P0q0MzWIr9Qoht0x
	 ANDQK0SgP91pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BC3C982D0;
	Thu, 17 Sep 2026 09:49:32 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 17 Sep 2026 17:49:24 +0800
Subject: [PATCH linux dev-6.18 v2 4/4] hwmon: (kb9002) Add documentation
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
Message-Id: <20260917-kb9002-backport-v2-4-71d46021f051@amd.com>
References: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
In-Reply-To: <20260917-kb9002-backport-v2-0-71d46021f051@amd.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, 
 tan.siewert@9elements.com
Cc: joel@jms.id.au
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789638570; l=3356;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=Cn+LXNU1gWYNEQxLBurVLc7ZPOgyecSyGUTpRrOhpaw=;
 b=+Vh5aeGk2uuUGRV1PHb8wi0FWBXy50EaN1pBWAMlKrpQu1E8+OZcJo7AbjToGriPqy7tWOmGo
 pLHmkkDDnM6BPX6NtldU++UrVOXGpinW8A1Vf4Klguit+rRC5B+h5Xb
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
driver.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
Link: https://lore.kernel.org/r/20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 20e95671a612b18382d930ddbe1ee45a5eb855ba)
Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/kb9002.rst | 64 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c5ab1aa5d416..f115f9f4c181 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -108,6 +108,7 @@ Hardware Monitoring Kernel Drivers
    jc42
    k10temp
    k8temp
+   kb9002
    kbatt
    kfan
    lan966x
diff --git a/Documentation/hwmon/kb9002.rst b/Documentation/hwmon/kb9002.rst
new file mode 100644
index 000000000000..6f8116dde918
--- /dev/null
+++ b/Documentation/hwmon/kb9002.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver kb9002
+====================
+
+Supported chips:
+
+  * Kandou KB9002
+
+    Prefix: 'kb9002'
+
+    Addresses scanned: -
+
+    Datasheet: KA-015171-PD (available from Kandou under NDA)
+
+Author: Andy Chung <andy.chung@amd.com>
+
+Description
+-----------
+
+The Kandou KB9002 is an 8-lane PCIe 5.0 retimer with an integrated
+microcontroller. It exposes an SMBus 3.0 target (with mandatory PEC)
+on its sideband interface. The internal firmware aggregates per-lane
+die temperatures and publishes the maximum value through a 16-bit
+addressed register window.
+
+This driver reports that aggregated maximum as the only hwmon
+temperature channel. The running firmware version and the firmware
+boot status are exposed under debugfs.
+
+sysfs interface
+---------------
+
+==================  ===============================================
+temp1_input         Aggregated maximum die temperature across all
+                    active lanes (millidegrees Celsius).
+==================  ===============================================
+
+debugfs interface
+-----------------
+
+Files live in the per-client debugfs directory created by the I2C
+core: ``/sys/kernel/debug/i2c/i2c-<bus>/<bus>-<addr>/``.
+
+==================  ===============================================
+fw_ver              Running firmware version in
+                    "major.minor.patch.suffix" format. Read-only.
+fw_load_status      Firmware boot status: "normal" once firmware has
+                    finished initialising, "abnormal" otherwise.
+                    Read-only.
+==================  ===============================================
+
+Notes
+-----
+
+The driver requires ``I2C_FUNC_SMBUS_BLOCK_DATA``,
+``I2C_FUNC_SMBUS_PEC`` and ``I2C_FUNC_I2C`` from the host adapter. The
+last is needed only during probe for the host-interface mode switch;
+runtime accesses use SMBus block transactions exclusively.
+
+The retimer's SMBus address is configurable on three strap pins and
+ranges from 0x20 to 0x27. The address is selected through device tree
+(or i2c board info) the same way as any other I2C device; the driver
+does not auto-detect.

-- 
2.34.1



