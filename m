Return-Path: <SRS0=YzSX=GV=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF551C433DB
	for <openbmc@archiver.kernel.org>; Mon, 18 Jan 2021 06:59:57 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A452231F
	for <openbmc@archiver.kernel.org>; Mon, 18 Jan 2021 06:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A452231F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2j65Yw6zDqJ7
	for <openbmc@archiver.kernel.org>; Mon, 18 Jan 2021 17:59:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK2XQ5Sf5zDqvw;
 Mon, 18 Jan 2021 17:52:22 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10I6jxbE030933;
 Mon, 18 Jan 2021 14:45:59 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 14:51:16 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v3 2/4] hwmon: Add Aspeed AST2600 support
Date: Mon, 18 Jan 2021 06:50:50 +0000
Message-ID: <20210118065059.2478078-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10I6jxbE030933
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: chiawei_wang@aspeedtech.com, troy_lee@aspeedtech.com,
 ryan_chen@aspeedtech.com, leetroy@gmail.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Updating index.rst and adding aspeed2600-pwm-tachometer.rst to address
the driver.

Changes since v1:
 - rename to aspeed2600-pwm-tachometer.rst
 - add license identifier

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 .../hwmon/aspeed2600-pwm-tachometer.rst       | 27 +++++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/hwmon/aspeed2600-pwm-tachometer.rst

diff --git a/Documentation/hwmon/aspeed2600-pwm-tachometer.rst b/Documentation/hwmon/aspeed2600-pwm-tachometer.rst
new file mode 100644
index 000000000000..cf0d31a19597
--- /dev/null
+++ b/Documentation/hwmon/aspeed2600-pwm-tachometer.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Kernel driver aspeed2600-pwm-tachometer
+===================================
+
+Supported chips:
+	ASPEED AST2600
+
+Authors:
+	Ryan Chen <ryan_chen@aspeedtech.com>
+
+Description:
+------------
+This driver implements support for ASPEED AST2600 PWM and Fan Tacho
+controller. The PWM controller supports upto 16 PWM outputs. The Fan tacho
+controller supports up to 16 tachometer inputs.
+
+The driver provides the following sensor accesses in sysfs:
+
+=============== ======= =====================================================
+fanX_input	ro	provide current fan rotation value in RPM as reported
+			by the fan to the device.
+
+pwmX		rw	get or set PWM fan control value. This is an integer
+			value between 0(off) and 255(full speed).
+=============== ======= =====================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fcb870ce6286..02020c282549 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -44,6 +44,7 @@ Hardware Monitoring Kernel Drivers
    asb100
    asc7621
    aspeed-pwm-tacho
+   aspeed2600-pwm-tachometer
    bcm54140
    bel-pfe
    bt1-pvt
-- 
2.25.1

