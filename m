Return-Path: <openbmc+bounces-1958-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D012CD343F
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:53:01 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2R2qcqz3bqW;
	Tue, 19 May 2026 09:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091833;
	cv=none; b=U3xknrJVbUQMZnypYN4KqE5TsTfs01EeVQWA8ptPt7gU4GP4bc9MAYuvdQTAQG2m7H9waXA/rVdXqxaNNDnoLwz2PbvuCN9kJg//tuCecNoN0M8eNAigovo+x1xV2WckpDzBzkhQAJJnU25qIzoavCwPuR8N8ULEQm34q/kk1nsAVsHJ7cCzsK36YjqZ0JRZdYrDBXZq4h1Tdf81xr6/JtvYj7vk61bujHuiHIUF++HSmF3dKrYFA8F9LBYfGbwqoG3W4m57OL8AdO9cMV3etAMSpXZnTIGehnfmpHQnpwi5+9TUyHswsGuV9BNOtKFdCp9goYk8x1rQZVtww90P6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091833; c=relaxed/relaxed;
	bh=WxfwxuUyJjYWU9h00n/B9xY2ogvpoaKhiqGpdQfp7wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn0rYEaUx7hkokRjRgMSY5Cs6wjRsHis1/uwP5TqxCu8dLVu+34IKtjy4bHmhNODLm4rUdi0VeilTsz4nKoFZChgN+mZ8rtd/SonFPvgRxhJ6i8hJhmCDnHjvzrKSEYpcA0BOfGc3XQYJhPJbNS0lkCeOOW3sOTEacKgNNnkMstDtQ/nVuO8FyDdXmAIo1ARdse0Sw7LwtNiCDfSvsTfrVrxqULty79Oa1d5ZDBA6mDIoDwUIUctiTqQT7hClorTAxdEN0UJzpfMubq8pDnpJOZ6Bx07sK2YNw29lZ6SeglHJg0Hgt5e61ewRubfePEP4sVzdQvOLMfjj9vpzikwEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gdT5Ktsa; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gdT5Ktsa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr8S06pcz2yF7
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:10:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 726BF4444D;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54F40C2BCB7;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091830;
	bh=PT+wU4CGmhGvqNfzHRNY7/CbTLVzhTofyOFU411q0G0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gdT5KtsaFl5uF0+Me55QP+VgBup/eJa9CiwC4U+AKPqLsOa8A6xku9gOW2Atl3XpE
	 lFPlwfvzsx7fdPC0jwpYNzaYosiYFlKkwrcWXpdXgqJ0xOGaEAVLKcWWlEAVma7Xqe
	 JjESirTksVhAtgB1ISAEQ0x7FVa+w7HEYY3M+NX/lBjB6yTu115RCaHU7fb7L7balf
	 WJ2UhdAyyuOqJYFasdlwediKkgKNC1i9PCAAMDTSfKVgZQyGc1daQ9CAh3761s98Fq
	 yrW0j/A8vDtFJI1lFf5SctQu4ERRAaaml80/gfgtsqjp9XtrULqX8Zr0tUOT2CtYZv
	 sPHrLNEqegPCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A154CD4F3C;
	Mon, 18 May 2026 08:10:30 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 18 May 2026 16:10:18 +0800
Subject: [PATCH linux dev-6.6 2/3] Documentation/hwmon: add Delta
 E50SN12051 documentation
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
Message-Id: <20260518-dev-6-6-e50sn12051-driver-v1-2-8025fb61706e@gmail.com>
References: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
In-Reply-To: <20260518-dev-6-6-e50sn12051-driver-v1-0-8025fb61706e@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091827; l=4111;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Ej67JXCMI61DnuwfUwQZbBhhgaxfYaDiAMLiF/gPXT8=;
 b=BPDYeY35kxTIV3wbhxBK9zgVSSokfEVC8Ua8I3h3W3u4vaxbnzwEFkKl4GzZz+rLtRIrz9HA3
 /B6FL20Q7a6B3i4UAktLOBIB4nV564hfJh0sjNhLfd9ZxBKZE1/nvmw
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Document the hardware monitoring support for the Delta E50SN12051
device.

The documentation describes the supported sensors exposed via the
hwmon subsystem, including voltage, current, and temperature measurements.

Signed-off-by: Colin Huang <u8813345@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20260508-add-e50sn12051-v5-2-abebdcc29665@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/e50sn12051.rst | 81 ++++++++++++++++++++++++++++++++++++++
 Documentation/hwmon/index.rst      |  1 +
 2 files changed, 82 insertions(+)

diff --git a/Documentation/hwmon/e50sn12051.rst b/Documentation/hwmon/e50sn12051.rst
new file mode 100644
index 000000000000..cbbfa7895d82
--- /dev/null
+++ b/Documentation/hwmon/e50sn12051.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver e50sn12051
+========================
+
+Supported chips:
+
+  * Delta E50SN12051
+
+    Prefix: 'e50sn12051'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Delta upon request and NDA
+
+Description
+-----------
+
+E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
+
+This driver supports the E50SN12051 PMBus compliant monitor device.
+
+The device provides measurements for:
+
+* Input voltage
+* Output current
+* Output voltage
+* Temperature
+
+The driver is based on the PMBus core and exposes standard hwmon
+sysfs attributes.
+
+Sysfs attributes
+----------------
+
+======================= =======================================================
+curr1_label             "iout1"
+curr1_crit              Critical maximum current.
+                        From IOUT_OC_FAULT_LIMIT register.
+curr1_crit_alarm        Current critical high alarm.
+                        From IOUT_OC_FAULT status.
+curr1_input             Measured current.
+                        From READ_IOUT register.
+curr1_max               Maximum current.
+                        From IOUT_OC_WARN_LIMIT register.
+curr1_max_alarm         Current high alarm.
+                        From IOUT_OC_WARN_LIMIT status.
+
+in1_label               "vin"
+in1_alarm               Input voltage alarm.
+in1_input               Measured voltage.
+                        From READ_VIN register.
+
+in2_label               "vout1"
+in2_crit                Critical maximum voltage.
+                        From VOUT_OV_FAULT_LIMIT register.
+in2_crit_alarm          Voltage critical high alarm.
+                        From VOLTAGE_OV_FAULT status.
+in2_input               Measured voltage.
+                        From READ_VOUT register.
+in2_max                 Maximum voltage.
+                        From VOUT_OV_WARN_LIMIT register.
+in2_max_alarm           Voltage high alarm.
+                        From VOLTAGE_OV_WARNING status.
+
+temp1_crit              Critical high temperature.
+                        From OT_FAULT_LIMIT register.
+temp1_crit_alarm        Module temperature critical high alarm.
+                        Set by comparing READ_TEMPERATURE_1 with OT_FAULT_LIMIT
+                        if TEMP_OT_FAULT status is set.
+temp1_input             Measured module's hot spot temperature.
+                        From READ_TEMPERATURE_1 register.
+temp1_max               Maximum temperature.
+                        From OT_WARN_LIMIT register.
+temp1_max_alarm         Module temperature high alarm.
+                        Set by comparing READ_TEMPERATURE_1 with OT_WARN_LIMIT if
+                        TEMP_OT_WARNING status is set.
+======================= =======================================================
+
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c89bd6063e88..e97dd2527dce 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -64,6 +64,7 @@ Hardware Monitoring Kernel Drivers
    drivetemp
    ds1621
    ds620
+   e50sn12051
    emc1403
    emc2103
    emc2305

-- 
2.34.1



