Return-Path: <openbmc+bounces-1931-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B961ECD4F39
	for <openbmc@archiver.kernel.org>; Thu, 14 May 2026 23:52:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gGnDm6GRLz2yHT;
	Fri, 15 May 2026 09:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778755792;
	cv=none; b=oli1z/lnP5bdu9QmV+GDExGq0uOiIiyMeNXW6ZdWqj8F3A5vSstcFsudvoyfQhWmH7Nsfi40N6NpvYXR9h90/WVgpMgQcz6GuvNvxZLFBzaj1e1wIyY3ytPPwv7FBa3hbtmUoAZQc7EXPjS8rtDtmY1lU6XDdvwOTzd0SGZpwhQzfunxZlYKIo17r6ww8bTiiw1n0uQvjSPg9fwvDi/AcISTibfjxgEjwhN17SNLLVf1V5OWuQgmy7JiV4lRqyr/jPih6bwmIdErxE6Tu4Aj4tl+m67seezZ+wzYKRX6Vw1WfazwNQats2xBYDkkNauOkGghxGIkWo+wLq+Esn8LcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778755792; c=relaxed/relaxed;
	bh=WxfwxuUyJjYWU9h00n/B9xY2ogvpoaKhiqGpdQfp7wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3DAs7UJLsahBvsxsee+bS4Baz34w6IcRhp2074we3nPhX2fK+HNEx2O2ZH067mwnIUu5sZhqsewRNp63B3TM6yNKTaOMhEcjppThJTJBhLhZDwQJC8s6BNOd4rIJDsysi8KHnD1dR+xgJ5gCTA/0B32KwofmqrpAjU6k90BhFp54939MUAmY1fGGK/je9/l8ne67ad2Hk9Qxr5z1AIJFSROQhSWExG5RXlOaK+nVFNPDMYlbuyw2gPynOCtZvlsKxbdYOYXDe/mRCkClEJKY3QvrPY8ZdgL788V7Vds3Bl3aC691sz0WMeHgZU3F+IPbZJz521PAhgi7DBAYuxefQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EhGz/Jfy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EhGz/Jfy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+u8813345.gmail.com@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gGRt75Fdgz2yF1
	for <openbmc@lists.ozlabs.org>; Thu, 14 May 2026 20:49:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43C160121;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58F6DC2BCC9;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778755788;
	bh=PT+wU4CGmhGvqNfzHRNY7/CbTLVzhTofyOFU411q0G0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EhGz/JfyclxEC8XYswlv7ViG9KF8owTvXXtc0swvj0FVRhWJDMWRU9BzQ9hCQG7bS
	 3u4G6Q4ZW4mrL1HRPlcJFnsSAsaINKowyL6mCA76pxdRHM4rD+WTMd49lfdRvEm3de
	 0cYC1eFVlQPWjnaqrKb55t2S5b2GTVO6Dn8TLrNdbo0Avm+BIjNEi28ZRjAduTTjMk
	 MEhhK4pfoe2QUoHZYJt+6s4HaeiWxJyI8iGVUMQbAYPIQoweT4W7sfNjpcNxTwRGp+
	 D0oerb1XsBqdAq1yQ36v4wKit3c/XPejWG+AYyEZ7MKC8lvnZf/LP4wAsVmsH1grXi
	 uqem8KFYnw/dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51078CD4F3E;
	Thu, 14 May 2026 10:49:48 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 14 May 2026 18:49:42 +0800
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
Message-Id: <20260514-backport-dev-6-6-e50sn12051-driver-v1-2-44d2ef6c18dd@gmail.com>
References: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
In-Reply-To: <20260514-backport-dev-6-6-e50sn12051-driver-v1-0-44d2ef6c18dd@gmail.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@codeconstruct.com.au
Cc: Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778755785; l=4111;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Ej67JXCMI61DnuwfUwQZbBhhgaxfYaDiAMLiF/gPXT8=;
 b=mDZHBqRN0gC102mWuHGeNWnkg7mvLYetxmUcaegLW3BLHhPnm65uFnIPMSa+JhtOvQDz96zw5
 mtkH2EY3deMAu6nIRxFLhwxAP1p1miWJF7yzrq1HA9dgjp/Mos/xlZQ
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



