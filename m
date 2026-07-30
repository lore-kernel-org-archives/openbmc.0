Return-Path: <openbmc+bounces-2342-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194EAC55165
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 00:02:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hB5p90Txjz2yng;
	Fri, 31 Jul 2026 10:01:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785402511;
	cv=none; b=f0aNGbE0tt3vczr3hJ74Up0uuoIk0u0j+fXsJ4X9MM5AJUf9UqTqIZQ+nTqAC2+FOjJ4KDDyzhU1HtNmVM9WyfEkHAyVJ2nc1SUvpRjyzDwLu0P1WaZfD2XJWg6xpxFFE4TiR8RUFXkU3i1cbbE0zkiCPi4kle5kvVsM9hOVR7Qr0+n/QiUcVTB25gGPKXn9p62Gsu4BOO+OkIu8aV4T4lVcdyFAer+Ixdt7OcqsJnRBvejQ7sE8xzkhEsXFDzvZg/4RpVGkViecEJagJ/uI1bxQOWbXljSVqLOVbqccbLRyCtLnFqVKq1Mq+wz8KH7IAKUqly9gyfgi6VTga9eJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785402511; c=relaxed/relaxed;
	bh=nYL8fdzU90CDn+p8jDAUdctjh0FHqVXcoZNn6xsWEZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbmZaYmzxBhkckLzAfXrJr1smX50BSoP1fP1HxihgsY1zoMlBlXa4k1qOnocjSgJJRXvY/lf/w07YJdsWVuhQ3tupMWKZTm/XKyeaSe3qatQ6k50XVlbHiRV6ZeN43Nov2+P5hCJSVK+QmmrsKbxF5/JQrP6lJW5H9daUqm6JCpk7tmLdXuftq3JT3gTduu/ZMu2LO527dalwNVRCiaDUYvGeBchr2WHPVmGM3bM+1Wkj7USmDmvBtzzM4Yzy949l+ZadPbFeevH6F6IKWQBVaXxVQKguUjPgxuHD07XO9agFYFvF/qQTAliVp+Q671wUzxH7UV3bveEA3ql/5naYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKPhVaTS; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKPhVaTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=devnull+andy.chung.amd.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h9jzf2PNPz2yjv
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2026 19:08:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28D36600BC;
	Thu, 30 Jul 2026 09:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D48A3C2BCFA;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785402506;
	bh=g/WJBwuPTchXKGE0dvdAzPaxufBAEwlZSIRGaSI8eF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OKPhVaTSqovzkC3SEYMjeXAN75yOaz96Zw+/d7XU3q5P5WheYL5e9Y5FuOvX6ip4F
	 ZcxWfNTuA64J00EPE0x8+2syTijPSBCX7ijSBfkuSv8VF48HZc+sAoskvq8dXq4gE5
	 GFlESY68aRYfl2I21OqwfxTOKDTMpnSJmCH/61hsx97cyGRUVB33bGvpLxnUcXJbL1
	 tb7451mBefOfuPXGK5JlBe/qvBC5VgBHE8wkUbeGRBwBCUI2KuZWYo2+vVbN+9o2zZ
	 Pl2GBYbK3WokI1JpAjyk/UaXF6CKwBp+l01R8lkr+8hHSfYj+eahuavRCVKULYmFwM
	 wPp1/a58OG5qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C316FC55166;
	Thu, 30 Jul 2026 09:08:26 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Thu, 30 Jul 2026 17:07:59 +0800
Subject: [PATCH linux dev-6.18 4/4] hwmon: (kb9002) Add documentation
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
Message-Id: <20260730-kb9002-backport-v1-4-41f472e52215@amd.com>
References: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
In-Reply-To: <20260730-kb9002-backport-v1-0-41f472e52215@amd.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785402478; l=3238;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=Cs3I2lHt4yFot07JU10N1d1mkW1cQdIYWwy95kNiqTw=;
 b=+ZFFSx80+aocXw/dg2GHNRt+kCfz5VI2cMVgIFf1wIxUBUA55MzCUUKPGQf6sqU4QLyUfUUcn
 2m+Qd7ie9Z9AoqWoND47sMPx//RlZ0Q3R96c0LhdDAbBfTfphbk+x+y
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



