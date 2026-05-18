Return-Path: <openbmc+bounces-1957-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313ACD4F56
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 23:52:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKF2Q1fQFz2yD6;
	Tue, 19 May 2026 09:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779091732;
	cv=none; b=m2ZZABYQsDC9boQ2mdrgizpg1mIsdozApOed0Swr+OMtc+ZX9xtdIGALySQcrD9B9NTkGKpmJmuPudke+NUoWIBFJL9HdKUZpm1Sk1xtEL/1LFVHLEO1QEIC/QNiNht/AvhGnPsCYh6Y2YqMmf+jw6RiIKuq+ppchESn77NQU2r9yNgykr53Go6MH7aYd4L+dcIs3Iqw3SRFZl+ugtQz/hcT1Xld4Mln2a5A41zhyC+aR/95M3lT0XkXk0W8MY80/VO4BPpvCM9Ju2QDBfzVbB0bVGEUJKXzJMKLenkBNW838HZC6SV6rzkK9n9ta3laMDcSXQwf/zQXf7hWf2Yx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779091732; c=relaxed/relaxed;
	bh=b5M3weBMGnPryJYOG5zrOOfh/E+jftieh2z+UewB+T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBMi9htuLOwIFvK+axElE3KFWPgtrdoCEvI9o1l1CluHUMuiFAMulJ7fzQmgG/Jfk2Waj/y3xt9uK1oy1lQtYlLLTLhkfZOWPsGQ7pILV3jvnlzjpDst4W3tXE07z7ISZ5pldqTQGVFoc+fH5jlPjiWDUaFnlktRPqhDJjq03aZGExsEaTpLM38YPhtVIQHhQxggo+5JuQJM4FRF8D+Jr9d6nvZzCQ5uo9W1Fc/LfRNuGjGOK5xvi/Zawdaa9YlK0XJJYPznPdcajVFpied2D1mWNJKNwfmbtkUK5STgG2oMP021m2j7VIr/MAKGg2mADeqDpUb9eq0D7Q2YXSto2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dubLpLVQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dubLpLVQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJr6W5YCwz3bqy
	for <openbmc@lists.ozlabs.org>; Mon, 18 May 2026 18:08:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 934D84441E;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75A60C2BCF6;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091728;
	bh=r+KNlaAcYhXqvQQYeflB0MZPoMvyqiyx7ogMUCVUTXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dubLpLVQx9Ejia7VrHbHaAGzFTWF0P1BDSlrXHDwlYWLcVOhO5dN/f8yipFG4QoQl
	 L0KrvWAP4f6W1PZvuScXlf7er/uDXY9Y5IO64rkP46fKwsNl82RuHSHzTi8/xTZRs5
	 /MJcASYo96ZtYc8AD2mypLVueLO7iH8wwUdxsOGpO3QQQxhjdqUwnQEMk1Mh8nS0R+
	 v3Mbt6WNIXpLq3tYS3k7N3dSQa8d1Vki3BjdNxVN8AxtIEyQEqzZ8lVr9eMsKwufhS
	 Aggzv+SWoeOZxYxJjh1Zmgy8D+FXz4IhKmGySWZQ5rSm5ygsbVhcMfJi5Z7uwZuUEO
	 63FtgIDaFXo2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD1CCD4F52;
	Mon, 18 May 2026 08:08:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Mon, 18 May 2026 16:08:25 +0800
Subject: [PATCH linux dev-6.18 2/3] Documentation/hwmon: add Delta
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
Message-Id: <20260518-dev-6-18-e50sn12051-driver-v1-2-238e4e08a759@gmail.com>
References: <20260518-dev-6-18-e50sn12051-driver-v1-0-238e4e08a759@gmail.com>
In-Reply-To: <20260518-dev-6-18-e50sn12051-driver-v1-0-238e4e08a759@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779091725; l=4111;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=xjEAidCfi7PR5i6t8DhEmi1zJRFvWjEGKur60fPhlxY=;
 b=Lkey3rdFCWVMVzGwlxB95ogrZrN5LaOQ/USBzIbdfZTQA6CmaWnt3GKYDYee97Yote6Pezn9W
 wFoNb92M+6iC42xmWfiy66Yrrv6IMyLqebhZckc7YBy/mN18ubElhCa
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
index bd3394b8fed6..c5ab1aa5d416 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -68,6 +68,7 @@ Hardware Monitoring Kernel Drivers
    drivetemp
    ds1621
    ds620
+   e50sn12051
    emc1403
    emc2103
    emc2305

-- 
2.34.1



